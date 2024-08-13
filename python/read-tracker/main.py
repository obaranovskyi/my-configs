import asyncio
import sys
import tempfile

import clipboard
from gtts import gTTS
from playsound import playsound
from util.logger import error

lang = 'en'

async def handle_clipboard_change() -> None:
    """
    Handle the clipboard change event.
    """
    text = clipboard.paste()
    if not text:
        return
    tts = gTTS(text=text, lang=lang, slow=False)

    # Create a temporary file to hold the audio data
    with tempfile.NamedTemporaryFile(delete=True, suffix=".mp3") as temp_audio_file:
        # Save the gTTS object to the temporary file
        tts.save(temp_audio_file.name)
        # Play the audio
        playsound(temp_audio_file.name)



async def wait_for_update(value) -> None:
    """
    Wait for the clipboard to change.
    """
    while True:
        if clipboard.paste() != value:
            return

async def main() -> None:
    """
    The main function.
    """
    value = clipboard.paste()
    while True :
        update = asyncio.create_task(wait_for_update(value))
        await update
        value = clipboard.paste()
        asyncio.create_task(handle_clipboard_change())

if __name__ == "__main__":
    if len(sys.argv) > 1:
        lang = sys.argv[1]


    try:
        asyncio.run(main())
    except KeyboardInterrupt:
        sys.exit(0)
    except Exception as e:
        error(f"An error occurred: {e}")
        sys.exit(0)
