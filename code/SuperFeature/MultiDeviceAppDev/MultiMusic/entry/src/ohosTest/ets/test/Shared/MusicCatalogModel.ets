/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

export class MusicBreakpoint<T> {
  private smValue: T;
  private mdValue: T;
  private lgValue: T;

  constructor(sm: T, md: T, lg: T) {
    this.smValue = sm;
    this.mdValue = md;
    this.lgValue = lg;
  }

  public getValue(currentBreakpoint: string): T | undefined {
    if (currentBreakpoint === 'sm') {
      return this.smValue;
    }
    if (currentBreakpoint === 'md') {
      return this.mdValue;
    }
    if (currentBreakpoint === 'lg') {
      return this.lgValue;
    }
    return undefined;
  }
}

export class MusicCatalogPadding {
  left: number = 0;
  right: number = 0;

  constructor(left: number, right: number) {
    this.left = left;
    this.right = right;
  }
}

export class MusicCatalogOffset {
  x: number = 0;
  y: number = 0;

  constructor(x: number, y: number) {
    this.x = x;
    this.y = y;
  }
}

export interface MusicGenre {
  index: number;
  name: string;
  pages: number;
}

export interface MusicCatalogSong {
  index: number;
  cover: string;
  title: string;
}

/**
 * Page counts of the thirteen genre cards rendered by common/UserSongList.ets.
 */
export const MUSIC_GENRE_PAGES: number[] = [16, 16, 16, 16, 16, 24, 30, 16, 18, 25, 30, 48, 16];

export const MUSIC_GENRE_COUNT: number = 13;

export const MUSIC_CATALOG_SONG_COUNT: number = 12;

export const MUSIC_PADDING_SM: MusicCatalogPadding = new MusicCatalogPadding(16, 16);

export const MUSIC_PADDING_MD: MusicCatalogPadding = new MusicCatalogPadding(16, 16);

export const MUSIC_PADDING_LG: MusicCatalogPadding = new MusicCatalogPadding(24, 24);

export const MUSIC_OFFSET_SM: MusicCatalogOffset = new MusicCatalogOffset(0, 0);

export const MUSIC_OFFSET_MD: MusicCatalogOffset = new MusicCatalogOffset(11, -11);

export const MUSIC_OFFSET_LG: MusicCatalogOffset = new MusicCatalogOffset(11, -11);

export const MUSIC_BREAKPOINTS: string[] = ['sm', 'md', 'lg'];

export class MusicCatalogModel {
  private songItems: MusicCatalogSong[] = [];
  private genreItems: MusicGenre[] = [];

  constructor() {
    for (let i = 0; i < MUSIC_CATALOG_SONG_COUNT; i++) {
      this.songItems.push({ index: i, cover: 'list' + String(MUSIC_CATALOG_SONG_COUNT - i),
        title: 'song' + String(i + 1) });
    }
    for (let i = 0; i < MUSIC_GENRE_COUNT; i++) {
      this.genreItems.push({ index: i, name: 'genre' + String(i), pages: MUSIC_GENRE_PAGES[i] });
    }
  }

  public songCount(): number {
    return this.songItems.length;
  }

  public songs(): MusicCatalogSong[] {
    return this.songItems;
  }

  public songAt(index: number): MusicCatalogSong | undefined {
    if (index < 0 || index >= this.songItems.length) {
      return undefined;
    }
    return this.songItems[index];
  }

  public genreCount(): number {
    return this.genreItems.length;
  }

  public genreAt(index: number): MusicGenre | undefined {
    if (index < 0 || index >= this.genreItems.length) {
      return undefined;
    }
    return this.genreItems[index];
  }

  public pagesOf(index: number): number {
    const genre: MusicGenre | undefined = this.genreAt(index);
    return genre === undefined ? -1 : genre.pages;
  }

  public totalGenrePages(): number {
    let sum: number = 0;
    for (let i = 0; i < this.genreItems.length; i++) {
      sum += this.genreItems[i].pages;
    }
    return sum;
  }

  public prefixPages(count: number): number {
    let sum: number = 0;
    const limit: number = count > this.genreItems.length ? this.genreItems.length : count;
    for (let i = 0; i < limit; i++) {
      sum += this.genreItems[i].pages;
    }
    return sum;
  }

  public maxPagesIndex(): number {
    let best: number = 0;
    for (let i = 1; i < this.genreItems.length; i++) {
      if (this.genreItems[i].pages > this.genreItems[best].pages) {
        best = i;
      }
    }
    return best;
  }

  public minPagesIndex(): number {
    let best: number = 0;
    for (let i = 1; i < this.genreItems.length; i++) {
      if (this.genreItems[i].pages < this.genreItems[best].pages) {
        best = i;
      }
    }
    return best;
  }

  public countWithPages(pages: number): number {
    let count: number = 0;
    for (let i = 0; i < this.genreItems.length; i++) {
      if (this.genreItems[i].pages === pages) {
        count++;
      }
    }
    return count;
  }

  public averagePages(): number {
    if (this.genreItems.length === 0) {
      return 0;
    }
    return this.totalGenrePages() / this.genreItems.length;
  }

  public pageSpan(): number {
    return this.genreItems[this.maxPagesIndex()].pages - this.genreItems[this.minPagesIndex()].pages;
  }

  public orderByPagesDesc(): number[] {
    const indexes: number[] = [];
    for (let i = 0; i < this.genreItems.length; i++) {
      indexes.push(i);
    }
    for (let i = 0; i < indexes.length; i++) {
      for (let j = i + 1; j < indexes.length; j++) {
        if (this.genreItems[indexes[j]].pages > this.genreItems[indexes[i]].pages) {
          const tmp: number = indexes[i];
          indexes[i] = indexes[j];
          indexes[j] = tmp;
        }
      }
    }
    return indexes;
  }

  public pagesFor(pageSize: number): number {
    if (pageSize <= 0) {
      return 0;
    }
    return Math.ceil(this.genreItems.length / pageSize);
  }

  public isPagesValid(pages: number): boolean {
    return pages > 0 && pages <= 48;
  }
}
