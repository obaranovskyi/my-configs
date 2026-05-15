import yt_dlp
from pathlib import Path
from rich import print
from shared.logger import blue, green, red, yellow

from .consts import youtube_url

_FORMAT = 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio/best'
_ARCHIVE = str(Path.home() / '.ytd_archive')


def _friendly_error(raw):
    msg = str(raw).lower()
    if 'bytes read' in msg or 'connection' in msg or 'timeout' in msg or 'network' in msg:
        return 'Network error — connection dropped during download.'
    if 'unavailable' in msg or 'not available' in msg:
        return 'Video is unavailable (deleted or region-locked).'
    if 'private' in msg:
        return 'Video is private.'
    if 'age' in msg:
        return 'Video is age-restricted.'
    if 'copyright' in msg or 'blocked' in msg:
        return 'Video is blocked due to copyright.'
    if 'does not exist' in msg or '404' in msg:
        return 'Video not found.'
    return f'Unexpected error: {raw}'


class _SilentLogger:
    def debug(self, msg): pass
    def info(self, msg): pass
    def warning(self, msg): pass
    def error(self, msg): pass


def _progress_hook(d):
    if d['status'] != 'downloading':
        return
    total = d.get('total_bytes') or d.get('total_bytes_estimate', 0)
    downloaded = d.get('downloaded_bytes', 0)
    if not total:
        return
    pct = round(downloaded / total * 100, 2)
    total_mb = round(total / 1024 / 1024, 1)
    downloaded_mb = round(downloaded / 1024 / 1024, 1)
    remaining_mb = round((total - downloaded) / 1024 / 1024, 1)
    print(
        f'[{blue}]Download Progress: [{yellow}]{pct}% | '
        f'[{blue}]Total Size: [{yellow}]{total_mb}MB | '
        f'[{green}]Downloaded: [{yellow}]{downloaded_mb}MB | '
        f'[{red}]Remaining: [{yellow}]{remaining_mb}MB  ',
        end='\r',
    )

def _ydl_opts(extra=None):
    opts = {
        'format': _FORMAT,
        'merge_output_format': 'mp4',
        'progress_hooks': [_progress_hook],
        'logger': _SilentLogger(),
        'noprogress': True,
        'retries': 10,
        'fragment_retries': 10,
        'socket_timeout': 30,
        'download_archive': _ARCHIVE,
    }
    if extra:
        opts.update(extra)
    return opts

def _get_video_ids(url):
    with yt_dlp.YoutubeDL({'quiet': True, 'extract_flat': True}) as ydl:
        info = ydl.extract_info(url, download=False)
        return [e['id'] for e in info.get('entries', []) if e.get('id')]

def download_channel(channel_id):
    video_ids = _get_video_ids(f"{youtube_url}{channel_id}/videos")
    _download_video_ids(video_ids)

def download_playlist(playlist_id):
    video_ids = _get_video_ids(f"https://www.youtube.com/playlist?list={playlist_id}")
    _download_video_ids(video_ids)

def _download_video_ids(video_ids):
    total_count = len(video_ids)
    for index, video_id in enumerate(video_ids, start=1):
        print(f"\n[{blue}]Downloading video [[{yellow}]{index}[{blue}]/[{green}]{total_count}[{blue}]]")
        try:
            download_video_using_url(video_id)
        except Exception as e:
            print(f'\n[{red}]Skipping: {_friendly_error(e)}')

def download_video_using_url(video_id):
    url = f"{youtube_url}watch?v={video_id}"
    with yt_dlp.YoutubeDL(_ydl_opts()) as ydl:
        info = ydl.extract_info(url, download=True)
        return info.get('title', '') if info else ''

def temp_download_video_using_url(url, filename):
    with yt_dlp.YoutubeDL(_ydl_opts({'outtmpl': filename})) as ydl:
        info = ydl.extract_info(url, download=True)
        return info.get('title', '') if info else ''
