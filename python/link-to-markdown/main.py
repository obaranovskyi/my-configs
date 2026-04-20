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
from util.logger import error, info


def convert_html_to_markdown(url):
    response = requests.get(url)
    response.raise_for_status()  # Check if the request was successful
    response.encoding = 'utf-8'
    html_content = response.text

    # Convert HTML to Markdown
    markdown_converter = html2text.HTML2Text()
    markdown_converter.ignore_links = False
    markdown_content = markdown_converter.handle(html_content)

    return markdown_content


if __name__ == '__main__':
    if (len(sys.argv) < 3):
        error('Run command in the following format:')
        info('link-to-markdown <url> <output-file>')
        sys.exit(1)

    url = sys.argv[1]
    output_file = sys.argv[2]
    markdown_content = convert_html_to_markdown(url)

    with open(output_file, 'w') as file:
        file.write(markdown_content)
