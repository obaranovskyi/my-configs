"""
Create a new PDF from a page range of an existing PDF, with optional skip ranges.

Usage:
    pdf-split <input.pdf> [--from PAGE] [--to PAGE] [--skip RANGE ...] [--output FILE]

Examples:
    pdf-split doc.pdf --from 5 --to 18 --skip 7-14
    pdf-split doc.pdf --from 3 --to 20 --skip 7-9 --skip 15
    pdf-split doc.pdf --from 1 --to 10
"""
import argparse
import sys
from pathlib import Path

from pypdf import PdfReader, PdfWriter
from rich import print


def parse_skip_range(value):
    parts = value.split('-')
    if len(parts) == 1:
        page = int(parts[0])
        return (page, page)
    if len(parts) == 2:
        return (int(parts[0]), int(parts[1]))
    raise argparse.ArgumentTypeError(f"Invalid skip range: '{value}'. Use N or N-M.")


def build_page_set(from_page, to_page, skip_ranges):
    pages = set(range(from_page, to_page + 1))
    for start, end in skip_ranges:
        pages -= set(range(start, end + 1))
    return sorted(pages)


def default_output_name(input_path, from_page, to_page):
    stem = Path(input_path).stem
    return f"{stem}_p{from_page}-{to_page}.pdf"


def main():
    parser = argparse.ArgumentParser(
        description="Split a PDF by page range with optional skip ranges.",
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )
    parser.add_argument("input", help="Input PDF file")
    parser.add_argument("--from", dest="from_page", type=int, required=True, metavar="PAGE", help="Start page (1-based)")
    parser.add_argument("--to", dest="to_page", type=int, required=True, metavar="PAGE", help="End page (1-based, inclusive)")
    parser.add_argument("--skip", dest="skips", type=parse_skip_range, action="append", default=[], metavar="RANGE", help="Page range to skip, e.g. 7-14 or 9. Can be repeated.")
    parser.add_argument("--output", "-o", default=None, help="Output PDF filename")

    if len(sys.argv) == 1:
        parser.print_help()
        sys.exit(0)

    args = parser.parse_args()

    input_path = Path(args.input)
    if not input_path.exists():
        print(f"[deep_pink2]Error: file not found: {args.input}")
        sys.exit(1)

    reader = PdfReader(str(input_path))
    total_pages = len(reader.pages)

    if args.from_page < 1 or args.to_page > total_pages or args.from_page > args.to_page:
        print(f"[deep_pink2]Error: invalid range {args.from_page}-{args.to_page} (PDF has {total_pages} pages)")
        sys.exit(1)

    pages = build_page_set(args.from_page, args.to_page, args.skips)
    if not pages:
        print("[yellow]Warning: no pages selected after applying skip ranges.")
        sys.exit(0)

    output_name = args.output or default_output_name(args.input, args.from_page, args.to_page)
    output_path = Path(output_name)

    writer = PdfWriter()
    for page_num in pages:
        writer.add_page(reader.pages[page_num - 1])

    with open(output_path, "wb") as f:
        writer.write(f)

    skipped = (args.to_page - args.from_page + 1) - len(pages)
    print(f"[spring_green1]Done: {len(pages)} pages written to [turquoise2]{output_path}[/turquoise2] ({skipped} skipped)")


if __name__ == "__main__":
    main()
