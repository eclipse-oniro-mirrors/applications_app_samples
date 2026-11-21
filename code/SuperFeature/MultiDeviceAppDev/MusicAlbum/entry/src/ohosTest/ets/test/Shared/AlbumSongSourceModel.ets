
export interface AlbumSongRecord {
  id: number;
  title: string;
  singer: string;
  isVip: boolean;
}

export interface AlbumDataListener {
  onDataReloaded(): void;
  onDataAdd(index: number): void;
  onDataChange(index: number): void;
  onDataDelete(index: number): void;
  onDataMove(from: number, to: number): void;
}

/**
 * Song ids mirrored from model/SongList.ets: 1..21, 23, 24, 25. Id 22 is absent
 * on purpose, the real album list skips it.
 */
export const ALBUM_SONG_IDS: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21,
  23, 24, 25];

export const ALBUM_VIP_IDS: number[] = [1, 12];

export const ALBUM_SONG_COUNT: number = 24;

export const ALBUM_PLAY_MODES: string[] = ['order', 'random', 'single'];

export const ALBUM_MODE_ORDER: string = 'order';

export const ALBUM_MODE_RANDOM: string = 'random';

export const ALBUM_MODE_SINGLE: string = 'single';

export const ALBUM_LANES_COMPACT: number = 1;

export const ALBUM_LANES_EXPANDED: number = 2;

export const ALBUM_SINGER_FONT_OFFSET: number = 4;

export function albumListenerState(): AlbumDataListener {
  return new AlbumRecordingListener();
}

/**
 * Listener that records every dispatched notification so ordering and payloads
 * can be asserted from a single place.
 */
export class AlbumRecordingListener implements AlbumDataListener {
  reloads: number = 0;
  adds: number = 0;
  changes: number = 0;
  deletes: number = 0;
  moves: number = 0;
  lastIndex: number = -1;
  lastFrom: number = -1;
  lastTo: number = -1;
  sequence: string = '';

  public onDataReloaded(): void {
    this.reloads++;
    this.sequence += 'R';
  }

  public onDataAdd(index: number): void {
    this.adds++;
    this.lastIndex = index;
    this.sequence += 'A' + String(index) + ';';
  }

  public onDataChange(index: number): void {
    this.changes++;
    this.lastIndex = index;
    this.sequence += 'C' + String(index) + ';';
  }

  public onDataDelete(index: number): void {
    this.deletes++;
    this.lastIndex = index;
    this.sequence += 'D' + String(index) + ';';
  }

  public onDataMove(from: number, to: number): void {
    this.moves++;
    this.lastFrom = from;
    this.lastTo = to;
    this.sequence += 'M' + String(from) + '>' + String(to) + ';';
  }
}

/**
 * Mirrors the LazyForEach data source of model/SongModule.ets plus the layout
 * rules applied by common/PlayList.ets.
 */
export class AlbumSongSourceModel {
  private dataArray: AlbumSongRecord[] = [];
  private listeners: AlbumDataListener[] = [];

  constructor(records: AlbumSongRecord[]) {
    for (let i = 0; i < records.length; i++) {
      this.dataArray.push(records[i]);
    }
  }

  public static realAlbum(): AlbumSongSourceModel {
    const records: AlbumSongRecord[] = [];
    for (let i = 0; i < ALBUM_SONG_IDS.length; i++) {
      const id: number = ALBUM_SONG_IDS[i];
      records.push({ id: id, title: 'song' + String(id), singer: 'singer' + String(id % 5),
        isVip: ALBUM_VIP_IDS.indexOf(id) >= 0 });
    }
    return new AlbumSongSourceModel(records);
  }

  public totalCount(): number {
    return this.dataArray.length;
  }

  public getData(index: number): AlbumSongRecord | undefined {
    if (index < 0 || index >= this.dataArray.length) {
      return undefined;
    }
    return this.dataArray[index];
  }

  public addData(index: number, record: AlbumSongRecord): void {
    this.dataArray.splice(index, 0, record);
    this.notifyDataAdd(index);
  }

  public pushData(record: AlbumSongRecord): void {
    this.dataArray.push(record);
    this.notifyDataAdd(this.dataArray.length - 1);
  }

  public deleteData(index: number): AlbumSongRecord | undefined {
    if (index < 0 || index >= this.dataArray.length) {
      return undefined;
    }
    const removed: AlbumSongRecord[] = this.dataArray.splice(index, 1);
    this.notifyDataDelete(index);
    return removed[0];
  }

  public registerDataChangeListener(listener: AlbumDataListener): boolean {
    if (this.listeners.indexOf(listener) >= 0) {
      return false;
    }
    this.listeners.push(listener);
    return true;
  }

  public unregisterDataChangeListener(listener: AlbumDataListener): boolean {
    const pos: number = this.listeners.indexOf(listener);
    if (pos < 0) {
      return false;
    }
    this.listeners.splice(pos, 1);
    return true;
  }

  public getListenerCount(): number {
    return this.listeners.length;
  }

  public notifyDataReload(): void {
    for (let i = 0; i < this.listeners.length; i++) {
      this.listeners[i].onDataReloaded();
    }
  }

  public notifyDataAdd(index: number): void {
    for (let i = 0; i < this.listeners.length; i++) {
      this.listeners[i].onDataAdd(index);
    }
  }

  public notifyDataChange(index: number): void {
    for (let i = 0; i < this.listeners.length; i++) {
      this.listeners[i].onDataChange(index);
    }
  }

  public notifyDataDelete(index: number): void {
    for (let i = 0; i < this.listeners.length; i++) {
      this.listeners[i].onDataDelete(index);
    }
  }

  public notifyDataMove(from: number, to: number): void {
    for (let i = 0; i < this.listeners.length; i++) {
      this.listeners[i].onDataMove(from, to);
    }
  }

  public lanesOf(currentBreakpoint: string): number {
    return currentBreakpoint === 'lg' ? ALBUM_LANES_EXPANDED : ALBUM_LANES_COMPACT;
  }

  public singerFontSize(songFontSize: number): number {
    return songFontSize - ALBUM_SINGER_FONT_OFFSET;
  }

  public vipCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.dataArray.length; i++) {
      if (this.dataArray[i].isVip) {
        count++;
      }
    }
    return count;
  }

  public indexOfId(id: number): number {
    for (let i = 0; i < this.dataArray.length; i++) {
      if (this.dataArray[i].id === id) {
        return i;
      }
    }
    return -1;
  }

  public hasUniqueIds(): boolean {
    const seen: Set<number> = new Set<number>();
    for (let i = 0; i < this.dataArray.length; i++) {
      if (seen.has(this.dataArray[i].id)) {
        return false;
      }
      seen.add(this.dataArray[i].id);
    }
    return true;
  }
}

export class AlbumPlayModeModel {
  public static nextMode(current: string): string {
    const pos: number = ALBUM_PLAY_MODES.indexOf(current);
    if (pos < 0) {
      return ALBUM_MODE_ORDER;
    }
    return ALBUM_PLAY_MODES[(pos + 1) % ALBUM_PLAY_MODES.length];
  }

  public static isKnownMode(mode: string): boolean {
    return ALBUM_PLAY_MODES.indexOf(mode) >= 0;
  }

  public static cycleFrom(mode: string, steps: number): string {
    let current: string = AlbumPlayModeModel.isKnownMode(mode) ? mode : ALBUM_MODE_ORDER;
    for (let i = 0; i < steps; i++) {
      current = AlbumPlayModeModel.nextMode(current);
    }
    return current;
  }
}
