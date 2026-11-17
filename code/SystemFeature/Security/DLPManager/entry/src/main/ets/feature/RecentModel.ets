/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { encodeComponent, decodeComponent, UriDecodeResult } from '../core/UriCore';

export const RECENT_CAPACITY: number = 20;

export class RecentItem {
  public readonly id: string;
  public readonly name: string;
  public readonly uri: string;
  public readonly isDlp: boolean;
  public readonly lastOpenedSec: number;
  public readonly favorite: boolean;

  constructor(id: string, name: string, uri: string, isDlp: boolean, lastOpenedSec: number, favorite: boolean) {
    this.id = id;
    this.name = name;
    this.uri = uri;
    this.isDlp = isDlp;
    this.lastOpenedSec = lastOpenedSec;
    this.favorite = favorite;
  }
}

export class RecentModel {
  private items: RecentItem[] = [];
  private capacity: number = RECENT_CAPACITY;

  setCapacity(capacity: number): void {
    if (capacity < 1) {
      this.capacity = 1;
    } else if (capacity > 100) {
      this.capacity = 100;
    } else {
      this.capacity = capacity;
    }
    this.trim();
  }

  getCapacity(): number {
    return this.capacity;
  }

  setItems(items: RecentItem[]): void {
    this.items = [];
    for (let index = 0; index < items.length; index++) {
      this.items.push(items[index]);
    }
    this.trim();
  }

  addRecent(item: RecentItem): void {
    let favorite: boolean = item.favorite;
    const existing: RecentItem | null = this.find(item.id);
    if (existing !== null) {
      favorite = existing.favorite || item.favorite;
    }
    const merged: RecentItem = new RecentItem(item.id, item.name, item.uri, item.isDlp, item.lastOpenedSec,
      favorite);
    this.removeSilent(item.id);
    this.items.unshift(merged);
    this.trim();
  }

  addOpen(name: string, uri: string, isDlp: boolean, nowSec: number): RecentItem {
    const item: RecentItem = new RecentItem(buildId(name, uri), name, uri, isDlp, nowSec, false);
    this.addRecent(item);
    return item;
  }

  updateOpened(id: string, lastOpenedSec: number): boolean {
    const existing: RecentItem | null = this.find(id);
    if (existing === null) {
      return false;
    }
    const updated: RecentItem = new RecentItem(existing.id, existing.name, existing.uri, existing.isDlp,
      lastOpenedSec, existing.favorite);
    this.removeSilent(id);
    this.items.unshift(updated);
    return true;
  }

  remove(id: string): boolean {
    const index: number = this.indexOf(id);
    if (index < 0) {
      return false;
    }
    this.items.splice(index, 1);
    return true;
  }

  toggleFavorite(id: string): boolean {
    const index: number = this.indexOf(id);
    if (index < 0) {
      return false;
    }
    const existing: RecentItem = this.items[index];
    this.items[index] = new RecentItem(existing.id, existing.name, existing.uri, existing.isDlp,
      existing.lastOpenedSec, !existing.favorite);
    return true;
  }

  find(id: string): RecentItem | null {
    const index: number = this.indexOf(id);
    if (index < 0) {
      return null;
    }
    return this.items[index];
  }

  recents(): RecentItem[] {
    return this.items;
  }

  favorites(): RecentItem[] {
    const result: RecentItem[] = [];
    for (let index = 0; index < this.items.length; index++) {
      if (this.items[index].favorite) {
        result.push(this.items[index]);
      }
    }
    return result;
  }

  nonFavorites(): RecentItem[] {
    const result: RecentItem[] = [];
    for (let index = 0; index < this.items.length; index++) {
      if (!this.items[index].favorite) {
        result.push(this.items[index]);
      }
    }
    return result;
  }

  clearRecents(): number {
    const kept: RecentItem[] = this.favorites();
    const removed: number = this.items.length - kept.length;
    this.items = kept;
    return removed;
  }

  clearAll(): void {
    this.items = [];
  }

  count(): number {
    return this.items.length;
  }

  favoriteCount(): number {
    return this.favorites().length;
  }

  isEmpty(): boolean {
    return this.items.length === 0;
  }

  serialize(): string {
    const lines: string[] = [];
    for (let index = 0; index < this.items.length; index++) {
      const item: RecentItem = this.items[index];
      lines.push(encodeComponent(item.id, false) + '|' + encodeComponent(item.name, false) + '|' +
        encodeComponent(item.uri, false) + '|' + (item.isDlp ? '1' : '0') + '|' +
        item.lastOpenedSec.toString() + '|' + (item.favorite ? '1' : '0'));
    }
    return lines.join('\n');
  }

  private trim(): void {
    while (this.items.length > this.capacity) {
      this.items.pop();
    }
  }

  private indexOf(id: string): number {
    for (let index = 0; index < this.items.length; index++) {
      if (this.items[index].id === id) {
        return index;
      }
    }
    return -1;
  }

  private removeSilent(id: string): void {
    const index: number = this.indexOf(id);
    if (index >= 0) {
      this.items.splice(index, 1);
    }
  }
}

export function buildId(name: string, uri: string): string {
  return uri.length > 0 ? uri : 'name:' + name;
}

export function parseRecentText(text: string, capacity: number): RecentModel {
  const model: RecentModel = new RecentModel();
  model.setCapacity(capacity);
  if (text.length === 0) {
    return model;
  }
  const lines: string[] = text.split('\n');
  const items: RecentItem[] = [];
  for (let index = 0; index < lines.length; index++) {
    const fields: string[] = lines[index].split('|');
    if (fields.length !== 6) {
      continue;
    }
    const idResult: UriDecodeResult = decodeComponent(fields[0], false);
    const nameResult: UriDecodeResult = decodeComponent(fields[1], false);
    const uriResult: UriDecodeResult = decodeComponent(fields[2], false);
    const opened: number = Number.parseInt(fields[4], 10);
    if (idResult.text.length === 0 || nameResult.text.length === 0 || !Number.isFinite(opened)) {
      continue;
    }
    items.push(new RecentItem(idResult.text, nameResult.text, uriResult.text, fields[3] === '1', opened,
      fields[5] === '1'));
  }
  model.setItems(items);
  return model;
}
