"""
This script converts HTML content from a URL to Markdown and saves it to a file.

Usage:
```bash
python link-to-markdown.py <url> <output-file>
```
"""
import sys

import html2text
import requests
from rich import print

BLUE = "turquoise2"
RED = "deep_pink2"
GREEN = "spring_green1"

def display_info(message):
    print(f"[{BLUE}]{message}")

def display_error(message):
    print(f"[{RED}]{message}")

def convert_html_to_markdown(url):
    response = requests.get(url)
    response.raise_for_status()  # Check if the request was successful
    html_content = response.text

    # Convert HTML to Markdown
    markdown_converter = html2text.HTML2Text()
    markdown_converter.ignore_links = False
    markdown_content = markdown_converter.handle(html_content)

    return markdown_content



if __name__ == '__main__':
    if (len(sys.argv) < 3):
        display_error('Run command in the following format:')
        display_info('link-to-markdown <url> <output-file>')
        sys.exit(1)

    url = sys.argv[1]
    output_file = sys.argv[2]
    markdown_content = convert_html_to_markdown(url)

    with open(output_file, 'w') as file:
        file.write(markdown_content)
