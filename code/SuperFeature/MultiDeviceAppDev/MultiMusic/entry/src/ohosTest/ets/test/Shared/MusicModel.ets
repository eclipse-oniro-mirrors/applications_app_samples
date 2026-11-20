
export interface MusicPlaylistItem {
  index: number;
  title: string;
}

export interface MusicOffset {
  x: number;
  y: number;
}

export interface MusicPadding {
  left: number;
  right: number;
}

export const MUSIC_PLAYLIST_COUNT: number = 12;
export const MUSIC_TITLE_PREFIX: string = 'list';

export class MusicModel {
  private playlists: MusicPlaylistItem[] = [];

  constructor() {
    for (let i = 0; i < MUSIC_PLAYLIST_COUNT; i++) {
      this.playlists.push({ index: i, title: MUSIC_TITLE_PREFIX + String(i + 1) });
    }
  }

  public getPlaylistCount(): number {
    return this.playlists.length;
  }

  public getPlaylists(): MusicPlaylistItem[] {
    return this.playlists;
  }

  public getPlaylistByIndex(index: number): MusicPlaylistItem | undefined {
    if (index < 0 || index >= this.playlists.length) {
      return undefined;
    }
    return this.playlists[index];
  }

  public makeOffset(x: number, y: number): MusicOffset {
    return { x: x, y: y };
  }

  public accumulateOffset(a: MusicOffset, b: MusicOffset): MusicOffset {
    return { x: a.x + b.x, y: a.y + b.y };
  }

  public makePadding(left: number, right: number): MusicPadding {
    return { left: left, right: right };
  }

  public horizontalPadding(padding: MusicPadding): number {
    return padding.left + padding.right;
  }

  public isValidPadding(padding: MusicPadding): boolean {
    return padding.left >= 0 && padding.right >= 0;
  }

  public clampOffset(offset: MusicOffset, maxX: number, maxY: number): MusicOffset {
    let x = offset.x < 0 ? 0 : offset.x;
    let y = offset.y < 0 ? 0 : offset.y;
    if (x > maxX) {
      x = maxX;
    }
    if (y > maxY) {
      y = maxY;
    }
    return { x: x, y: y };
  }

  public hasUniqueTitles(): boolean {
    const seen = new Set<string>();
    for (let i = 0; i < this.playlists.length; i++) {
      if (seen.has(this.playlists[i].title)) {
        return false;
      }
      seen.add(this.playlists[i].title);
    }
    return true;
  }

  public slicePage(page: number, pageSize: number): MusicPlaylistItem[] {
    const start = page * pageSize;
    if (start >= this.playlists.length) {
      return [];
    }
    return this.playlists.slice(start, start + pageSize);
  }

  public totalPages(pageSize: number): number {
    if (pageSize <= 0) {
      return 0;
    }
    return Math.ceil(this.playlists.length / pageSize);
  }

  public searchTitle(keyword: string): number {
    let hits = 0;
    for (let i = 0; i < this.playlists.length; i++) {
      if (this.playlists[i].title.indexOf(keyword) >= 0) {
        hits++;
      }
    }
    return hits;
  }
}
