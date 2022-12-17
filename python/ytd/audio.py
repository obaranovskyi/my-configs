import os
import moviepy.editor as mp
from logger import info, error


def convert_video_to_mp3(video_name, filename):
    try:
        info('Converting to audio ...')
        clip = mp.VideoFileClip(filename)
        new_name = video_name.replace('/', '', len(video_name))
        clip.audio.write_audiofile(f"{new_name}.mp3")
    except Exception as e:
        error(e) 


def remove_temp_video_file(filename_to_remove):
    info('Cleaning ...')
    if os.path.exists(filename_to_remove):
          os.remove(filename_to_remove) 
