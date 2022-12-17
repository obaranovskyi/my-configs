import os
import uuid
from pytube import YouTube
import scrapetube
from logger import print_download_progress, yellow, blue, green
from terminal import replace_terminal_encoding
from consts import youtube_url
from audio import convert_video_to_mp3, remove_temp_video_file
from rich import print

def download_audio(video_id):
    temp_video_name = f"temp-{uuid.uuid4()}.mp4"
    video_name = temp_download_video_using_url(f"{youtube_url}watch?v={video_id}", temp_video_name)
    convert_video_to_mp3(video_name, temp_video_name)
    remove_temp_video_file(temp_video_name)
    # TODO: Under construction
    # yt = YouTube(f"{youtube_url}watch?v={video_id}", on_progress_callback=print_download_progress)
    # audio = yt.streams.filter(only_audio=True).first()
    # base, ext = os.path.splitext(audio)
    # new_file = base + '.mp3'
    # os.rename(audio, new_file)

def download_channel(channel_id): 
    download_url = f"{youtube_url}{channel_id}"
    videos = scrapetube.get_channel(channel_url=download_url)
    total_count = sum(1 for _ in scrapetube.get_channel(channel_url=download_url))
    download_list_of_videos(videos, total_count)

def download_playlist(playlist_id):
    videos = scrapetube.get_playlist(playlist_id=playlist_id)
    total_count = sum(1 for _ in scrapetube.get_playlist(playlist_id=playlist_id))
    download_list_of_videos(videos, total_count)

def download_list_of_videos(videos, total_count):
    index = 1
    for video in videos:
        print(f"\n[{blue}]Downloading video [[{yellow}]{index}[{blue}]/[{green}]{total_count}[{blue}]]")
        download_video_using_url(video['videoId'])
        index = index + 1

def download_video_using_url(video_id):
    download_url = f"{youtube_url}watch?v={video_id}"
    yt = YouTube(replace_terminal_encoding(download_url), on_progress_callback=print_download_progress)
    yt.streams.filter(progressive=True, file_extension='mp4') \
              .order_by('resolution') \
              .desc() \
              .first() \
              .download()

    return yt.streams[0].title

def temp_download_video_using_url(youtube_url, filename):
    yt = YouTube(replace_terminal_encoding(youtube_url), on_progress_callback=print_download_progress)
    yt.streams.filter(progressive=True, file_extension='mp4') \
              .order_by('resolution') \
              .desc() \
              .first() \
              .download(filename=filename)

    return yt.streams[0].title
