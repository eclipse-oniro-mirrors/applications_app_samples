
export interface ColumnsMailType {
  type: string;
  num: number;
}

export interface ColumnsPhotoType {
  name: string;
  count: number;
}

export const COLUMNS_NAVBAR_RATIO: number = 0.4;
export const COLUMNS_MAIL_KINDS: number = 3;
export const COLUMNS_PHOTO_KINDS: number = 4;

export class ColumnsModel {
  private mails: ColumnsMailType[] = [];
  private photos: ColumnsPhotoType[] = [];

  constructor() {
    this.mails.push({ type: 'inbox', num: 12 });
    this.mails.push({ type: 'sent', num: 8 });
    this.mails.push({ type: 'draft', num: 3 });
    this.photos.push({ name: 'album', count: 48 });
    this.photos.push({ name: 'camera', count: 21 });
    this.photos.push({ name: 'video', count: 7 });
    this.photos.push({ name: 'favorite', count: 15 });
  }

  public getMailKinds(): number {
    return this.mails.length;
  }

  public getPhotoKinds(): number {
    return this.photos.length;
  }

  public getMails(): ColumnsMailType[] {
    return this.mails;
  }

  public getPhotos(): ColumnsPhotoType[] {
    return this.photos;
  }

  public navbarWidth(windowWidth: number): number {
    return COLUMNS_NAVBAR_RATIO * windowWidth;
  }

  public contentWidth(windowWidth: number): number {
    return windowWidth - this.navbarWidth(windowWidth);
  }

  public isRatioValid(): boolean {
    return COLUMNS_NAVBAR_RATIO > 0 && COLUMNS_NAVBAR_RATIO < 1;
  }

  public isSplitMode(windowWidth: number): boolean {
    return windowWidth >= 600;
  }

  public getTotalMailNum(): number {
    let sum = 0;
    for (let i = 0; i < this.mails.length; i++) {
      sum += this.mails[i].num;
    }
    return sum;
  }

  public getTotalPhotoCount(): number {
    let sum = 0;
    for (let i = 0; i < this.photos.length; i++) {
      sum += this.photos[i].count;
    }
    return sum;
  }

  public getMailByType(type: string): ColumnsMailType | undefined {
    for (let i = 0; i < this.mails.length; i++) {
      if (type === this.mails[i].type) {
        return this.mails[i];
      }
    }
    return undefined;
  }

  public hasValidMailNums(): boolean {
    for (let i = 0; i < this.mails.length; i++) {
      if (this.mails[i].num < 0) {
        return false;
      }
    }
    return true;
  }

  public hasPositivePhotoCounts(): boolean {
    for (let i = 0; i < this.photos.length; i++) {
      if (this.photos[i].count <= 0) {
        return false;
      }
    }
    return true;
  }
}
