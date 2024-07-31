import os

dependencies = [
    # link-to-markdown
    "html2text",
    "requests",
    # clipboard-tracker
    # TODO: under construction
    # nato-alphabet
    "rich"

]
os.system(f"pip install {' '.join(dependencies)} --break-system-packages")
