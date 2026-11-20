
export class ColumnsBreakpoint<T> {
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

export interface ColumnsMailFolder {
  name: string;
  count: number;
}

export interface ColumnsPhotoGroup {
  name: string;
  count: number;
}

/**
 * Folder counters rendered by common/MailSideBar.ets.
 */
export const COLUMNS_MAIL_COUNTS: number[] = [3, 5, 9, 0];

export const COLUMNS_MAIL_TOTAL: number = 17;

/**
 * Photo group counters rendered by common/PhotoSideBar.ets.
 */
export const COLUMNS_PHOTO_COUNTS: number[] = [1234, 12, 7, 11, 223, 125, 234, 22, 1];

export const COLUMNS_PHOTO_TOTAL: number = 1869;

export const COLUMNS_ACCOUNTS: string[] = ['jiaozi@xxx.com', 'jiaozi@163.com'];

export const COLUMNS_NAV_BAR_WIDTH: number[] = [321, 321, 390];

export const COLUMNS_BREAKPOINTS: string[] = ['sm', 'md', 'lg'];

export class ColumnsSideBarModel {
  private mailFolders: ColumnsMailFolder[] = [];
  private photoGroups: ColumnsPhotoGroup[] = [];

  constructor() {
    for (let i = 0; i < COLUMNS_MAIL_COUNTS.length; i++) {
      this.mailFolders.push({ name: 'mail' + String(i), count: COLUMNS_MAIL_COUNTS[i] });
    }
    for (let i = 0; i < COLUMNS_PHOTO_COUNTS.length; i++) {
      this.photoGroups.push({ name: 'photo' + String(i), count: COLUMNS_PHOTO_COUNTS[i] });
    }
  }

  public mailKinds(): number {
    return this.mailFolders.length;
  }

  public photoKinds(): number {
    return this.photoGroups.length;
  }

  public mailCountOf(index: number): number {
    if (index < 0 || index >= this.mailFolders.length) {
      return -1;
    }
    return this.mailFolders[index].count;
  }

  public photoCountOf(index: number): number {
    if (index < 0 || index >= this.photoGroups.length) {
      return -1;
    }
    return this.photoGroups[index].count;
  }

  public mailNameOf(index: number): string {
    if (index < 0 || index >= this.mailFolders.length) {
      return '';
    }
    return this.mailFolders[index].name;
  }

  public photoNameOf(index: number): string {
    if (index < 0 || index >= this.photoGroups.length) {
      return '';
    }
    return this.photoGroups[index].name;
  }

  public totalMailNum(): number {
    let sum: number = 0;
    for (let i = 0; i < this.mailFolders.length; i++) {
      sum += this.mailFolders[i].count;
    }
    return sum;
  }

  public totalPhotoCount(): number {
    let sum: number = 0;
    for (let i = 0; i < this.photoGroups.length; i++) {
      sum += this.photoGroups[i].count;
    }
    return sum;
  }

  public nonEmptyMailKinds(): number {
    let count: number = 0;
    for (let i = 0; i < this.mailFolders.length; i++) {
      if (this.mailFolders[i].count > 0) {
        count++;
      }
    }
    return count;
  }

  public largestMailIndex(): number {
    let best: number = 0;
    for (let i = 1; i < this.mailFolders.length; i++) {
      if (this.mailFolders[i].count > this.mailFolders[best].count) {
        best = i;
      }
    }
    return best;
  }

  public smallestMailIndex(): number {
    let best: number = 0;
    for (let i = 1; i < this.mailFolders.length; i++) {
      if (this.mailFolders[i].count < this.mailFolders[best].count) {
        best = i;
      }
    }
    return best;
  }

  public largestPhotoIndex(): number {
    let best: number = 0;
    for (let i = 1; i < this.photoGroups.length; i++) {
      if (this.photoGroups[i].count > this.photoGroups[best].count) {
        best = i;
      }
    }
    return best;
  }

  public smallestPhotoIndex(): number {
    let best: number = 0;
    for (let i = 1; i < this.photoGroups.length; i++) {
      if (this.photoGroups[i].count < this.photoGroups[best].count) {
        best = i;
      }
    }
    return best;
  }

  public photoCountAbove(limit: number): number {
    let count: number = 0;
    for (let i = 0; i < this.photoGroups.length; i++) {
      if (this.photoGroups[i].count > limit) {
        count++;
      }
    }
    return count;
  }

  public averagePhotoCount(): number {
    if (this.photoGroups.length === 0) {
      return 0;
    }
    return this.totalPhotoCount() / this.photoGroups.length;
  }

  public averageMailCount(): number {
    if (this.mailFolders.length === 0) {
      return 0;
    }
    return this.totalMailNum() / this.mailFolders.length;
  }

  public prefixPhotoCount(kinds: number): number {
    const limit: number = kinds > this.photoGroups.length ? this.photoGroups.length : kinds;
    let sum: number = 0;
    for (let i = 0; i < limit; i++) {
      sum += this.photoGroups[i].count;
    }
    return sum;
  }

  public orderPhotoDesc(): number[] {
    return this.orderPhoto(true);
  }

  public orderPhotoAsc(): number[] {
    return this.orderPhoto(false);
  }

  private orderPhoto(desc: boolean): number[] {
    const indexes: number[] = [];
    for (let i = 0; i < this.photoGroups.length; i++) {
      indexes.push(i);
    }
    for (let i = 0; i < indexes.length; i++) {
      for (let j = i + 1; j < indexes.length; j++) {
        const left: number = this.photoGroups[indexes[i]].count;
        const right: number = this.photoGroups[indexes[j]].count;
        const swap: boolean = desc ? right > left : right < left;
        if (swap) {
          const tmp: number = indexes[i];
          indexes[i] = indexes[j];
          indexes[j] = tmp;
        }
      }
    }
    return indexes;
  }

  public isCountValid(count: number): boolean {
    return count > 0;
  }

  public hasUniqueCounts(): boolean {
    const seen: Set<number> = new Set<number>();
    for (let i = 0; i < this.photoGroups.length; i++) {
      if (seen.has(this.photoGroups[i].count)) {
        return false;
      }
      seen.add(this.photoGroups[i].count);
    }
    return true;
  }

  public static navBarWidthOf(currentBreakpoint: string): number {
    const widths: ColumnsBreakpoint<number> = new ColumnsBreakpoint<number>(
      COLUMNS_NAV_BAR_WIDTH[0], COLUMNS_NAV_BAR_WIDTH[1], COLUMNS_NAV_BAR_WIDTH[2]);
    const width: number | undefined = widths.getValue(currentBreakpoint);
    return width === undefined ? -1 : width;
  }

  public static shouldShowSideBar(currentBreakpoint: string): boolean {
    return currentBreakpoint === 'lg';
  }
}
