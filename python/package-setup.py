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
    "rich"

]
os.system(f"pip install {' '.join(dependencies)} --break-system-packages")
