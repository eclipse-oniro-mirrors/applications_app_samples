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

export interface AlbumTrack {
  id: number;
  title: string;
  singer: string;
  label: string;
}

export interface AlbumOption {
  key: string;
  text: string;
}

export const ALBUM_TRACK_COUNT: number = 24;
export const ALBUM_OPTION_COUNT: number = 4;

export const ALBUM_MISSING_ID: number = 22;

export const ALBUM_FONT_SM: number = 14;
export const ALBUM_FONT_MD: number = 16;
export const ALBUM_FONT_LG: number = 18;
export const ALBUM_MARGIN_SM: number = 10;
export const ALBUM_MARGIN_MD: number = 30;
export const ALBUM_MARGIN_LG: number = 40;

export class AlbumModel {
  private tracks: AlbumTrack[] = [];
  private options: AlbumOption[] = [];

  constructor() {
    for (let i = 0; i < ALBUM_TRACK_COUNT; i++) {
      const rawId = i + 1;
      const id = rawId >= ALBUM_MISSING_ID ? rawId + 1 : rawId;
      this.tracks.push({
        id: id,
        title: 'track' + String(rawId),
        singer: 'singer' + String(rawId % 5),
        label: rawId % 6 === 0 ? 'ic_vip' : 'ic_SQ'
      });
    }
    this.options.push({ key: 'collect', text: '999+' });
    this.options.push({ key: 'download', text: 'download' });
    this.options.push({ key: 'comment', text: 'comment' });
    this.options.push({ key: 'share', text: 'share' });
  }

  public getTrackCount(): number {
    return this.tracks.length;
  }

  public getTracks(): AlbumTrack[] {
    return this.tracks;
  }

  public getOptions(): AlbumOption[] {
    return this.options;
  }

  public getOptionCount(): number {
    return this.options.length;
  }

  public getTrackById(id: number): AlbumTrack | undefined {
    for (let i = 0; i < this.tracks.length; i++) {
      if (id === this.tracks[i].id) {
        return this.tracks[i];
      }
    }
    return undefined;
  }

  public hasMissingId(): boolean {
    return this.getTrackById(ALBUM_MISSING_ID) === undefined;
  }

  public hasUniqueIds(): boolean {
    const seen = new Set<number>();
    for (let i = 0; i < this.tracks.length; i++) {
      if (seen.has(this.tracks[i].id)) {
        return false;
      }
      seen.add(this.tracks[i].id);
    }
    return true;
  }

  public fontOf(breakpoint: string): number {
    if (breakpoint === 'sm') {
      return ALBUM_FONT_SM;
    } else if (breakpoint === 'md') {
      return ALBUM_FONT_MD;
    } else if (breakpoint === 'lg') {
      return ALBUM_FONT_LG;
    }
    return ALBUM_FONT_MD;
  }

  public marginOf(breakpoint: string): number {
    if (breakpoint === 'sm') {
      return ALBUM_MARGIN_SM;
    } else if (breakpoint === 'md') {
      return ALBUM_MARGIN_MD;
    } else if (breakpoint === 'lg') {
      return ALBUM_MARGIN_LG;
    }
    return ALBUM_MARGIN_MD;
  }

  public isFontMonotonic(): boolean {
    return ALBUM_FONT_SM <= ALBUM_FONT_MD && ALBUM_FONT_MD <= ALBUM_FONT_LG;
  }

  public isMarginMonotonic(): boolean {
    return ALBUM_MARGIN_SM <= ALBUM_MARGIN_MD && ALBUM_MARGIN_MD <= ALBUM_MARGIN_LG;
  }

  public countVip(): number {
    let count = 0;
    for (let i = 0; i < this.tracks.length; i++) {
      if (this.tracks[i].label === 'ic_vip') {
        count++;
      }
    }
    return count;
  }

  public singerCount(): number {
    const singers = new Set<string>();
    for (let i = 0; i < this.tracks.length; i++) {
      singers.add(this.tracks[i].singer);
    }
    return singers.size;
  }

  public slicePage(page: number, pageSize: number): AlbumTrack[] {
    const start = page * pageSize;
    if (start >= this.tracks.length) {
      return [];
    }
    return this.tracks.slice(start, start + pageSize);
  }

  public totalPages(pageSize: number): number {
    if (pageSize <= 0) {
      return 0;
    }
    return Math.ceil(this.tracks.length / pageSize);
  }
}
