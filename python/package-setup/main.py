import os

dependencies = [
    # link-to-markdown
    "html2text",
    "requests",
    # clipboard-tracker
    "clipboard==0.0.4",
    "pillow==10.3.0",
    "pyperclip==1.9.0",
    # nato-alphabet
    "rich",
    # youtube-downloader
    "certifi",
    "charset-normalizer",
    "decorator",
    "idna",
    "imageio",
    "imageio-ffmpeg",
    "markdown-it-py",
    "mdurl",
    "moviepy",
    "numpy",
    "Pillow",
    "proglog",
    "Pygments",
    "pytube", # has issue: https://github.com/pytube/pytube/issues/1973
    "pytubefix", # alternative
    "requests",
    "scrapetube",
    "tqdm",
    "typing_extensions",
    "urllib3",
    "uuid",
    "rich",
    # english-assist
    "googletrans==3.1.0a0",
    "uuid",
    "rich",
    "reportlab",
    "pydub",
    "gtts",
    "genanki",
    "markdown",
]

os.system(f"pip install {' '.join(dependencies)} --break-system-packages")
