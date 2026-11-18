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

import { FileKind, kindPriority } from './FileKindCore';

export class FileEntry {
  public readonly id: string;
  public readonly name: string;
  public readonly uri: string;
  public readonly kind: FileKind;
  public readonly sizeBytes: number;
  public readonly modifiedAtSec: number;
  public readonly isDlp: boolean;
  public readonly isFavorite: boolean;

  constructor(id: string, name: string, uri: string, kind: FileKind, sizeBytes: number, modifiedAtSec: number,
    isDlp: boolean, isFavorite: boolean) {
    this.id = id;
    this.name = name;
    this.uri = uri;
    this.kind = kind;
    this.sizeBytes = sizeBytes;
    this.modifiedAtSec = modifiedAtSec;
    this.isDlp = isDlp;
    this.isFavorite = isFavorite;
  }
}

export enum SortField {
  NAME = 'name',
  SIZE = 'size',
  MODIFIED = 'modified',
  KIND = 'kind'
}

export class QueryOptions {
  public keyword: string = '';
  public kinds: FileKind[] = [];
  public onlyDlp: boolean = false;
  public onlyFavorite: boolean = false;
  public minSize: number = -1;
  public maxSize: number = -1;
  public fromSec: number = -1;
  public toSec: number = -1;
  public sortField: SortField = SortField.NAME;
  public descending: boolean = false;
  public offset: number = 0;
  public limit: number = 0;
}

export class QueryResult {
  public readonly items: FileEntry[];
  public readonly total: number;
  public readonly offset: number;
  public readonly hasMore: boolean;

  constructor(items: FileEntry[], total: number, offset: number, hasMore: boolean) {
    this.items = items;
    this.total = total;
    this.offset = offset;
    this.hasMore = hasMore;
  }
}

export class KindCount {
  public readonly kind: FileKind;
  public readonly count: number;

  constructor(kind: FileKind, count: number) {
    this.kind = kind;
    this.count = count;
  }
}

export class TextSpan {
  public readonly text: string;
  public readonly matched: boolean;

  constructor(text: string, matched: boolean) {
    this.text = text;
    this.matched = matched;
  }
}

class TextRange {
  public readonly start: number;
  public readonly end: number;

  constructor(start: number, end: number) {
    this.start = start;
    this.end = end;
  }
}

export function normalizeKeyword(keyword: string): string {
  const parts: string[] = keyword.toLowerCase().split(' ');
  const tokens: string[] = [];
  for (let index = 0; index < parts.length; index++) {
    if (parts[index].length > 0) {
      tokens.push(parts[index]);
    }
  }
  return tokens.join(' ');
}

export function tokenizeKeyword(keyword: string): string[] {
  const normalized: string = normalizeKeyword(keyword);
  if (normalized.length === 0) {
    return [];
  }
  return normalized.split(' ');
}

function containsIgnoreCase(text: string, token: string): boolean {
  return text.toLowerCase().indexOf(token) >= 0;
}

export function matchesKeyword(entry: FileEntry, keyword: string): boolean {
  const tokens: string[] = tokenizeKeyword(keyword);
  if (tokens.length === 0) {
    return true;
  }
  for (let index = 0; index < tokens.length; index++) {
    if (!containsIgnoreCase(entry.name, tokens[index])) {
      return false;
    }
  }
  return true;
}

function matchesKinds(entry: FileEntry, kinds: FileKind[]): boolean {
  if (kinds.length === 0) {
    return true;
  }
  for (let index = 0; index < kinds.length; index++) {
    if (kinds[index] === entry.kind) {
      return true;
    }
  }
  return false;
}

function matchesSizeRange(sizeBytes: number, minSize: number, maxSize: number): boolean {
  if (minSize >= 0 && sizeBytes < minSize) {
    return false;
  }
  if (maxSize >= 0 && sizeBytes > maxSize) {
    return false;
  }
  return true;
}

function matchesTimeRange(modifiedAtSec: number, fromSec: number, toSec: number): boolean {
  if (fromSec >= 0 && modifiedAtSec < fromSec) {
    return false;
  }
  if (toSec >= 0 && modifiedAtSec > toSec) {
    return false;
  }
  return true;
}

export function matchesOptions(entry: FileEntry, options: QueryOptions): boolean {
  if (!matchesKeyword(entry, options.keyword)) {
    return false;
  }
  if (!matchesKinds(entry, options.kinds)) {
    return false;
  }
  if (options.onlyDlp && !entry.isDlp) {
    return false;
  }
  if (options.onlyFavorite && !entry.isFavorite) {
    return false;
  }
  if (!matchesSizeRange(entry.sizeBytes, options.minSize, options.maxSize)) {
    return false;
  }
  return matchesTimeRange(entry.modifiedAtSec, options.fromSec, options.toSec);
}

export function filterEntries(entries: FileEntry[], options: QueryOptions): FileEntry[] {
  const result: FileEntry[] = [];
  for (let index = 0; index < entries.length; index++) {
    const entry: FileEntry = entries[index];
    if (matchesOptions(entry, options)) {
      result.push(entry);
    }
  }
  return result;
}

function compareStrings(left: string, right: string): number {
  if (left < right) {
    return -1;
  }
  if (left > right) {
    return 1;
  }
  return 0;
}

function compareNumbers(left: number, right: number): number {
  if (left < right) {
    return -1;
  }
  if (left > right) {
    return 1;
  }
  return 0;
}

function compareByField(left: FileEntry, right: FileEntry, field: SortField): number {
  if (field === SortField.SIZE) {
    return compareNumbers(left.sizeBytes, right.sizeBytes);
  }
  if (field === SortField.MODIFIED) {
    return compareNumbers(left.modifiedAtSec, right.modifiedAtSec);
  }
  if (field === SortField.KIND) {
    const kindOrder: number = compareNumbers(kindPriority(left.kind), kindPriority(right.kind));
    if (kindOrder !== 0) {
      return kindOrder;
    }
    return compareStrings(left.name.toLowerCase(), right.name.toLowerCase());
  }
  const nameOrder: number = compareStrings(left.name.toLowerCase(), right.name.toLowerCase());
  if (nameOrder !== 0) {
    return nameOrder;
  }
  return compareStrings(left.id, right.id);
}

export function sortEntries(entries: FileEntry[], field: SortField, descending: boolean): FileEntry[] {
  const result: FileEntry[] = [];
  for (let index = 0; index < entries.length; index++) {
    result.push(entries[index]);
  }
  result.sort((left: FileEntry, right: FileEntry) => {
    const order: number = compareByField(left, right, field);
    if (order !== 0) {
      return descending ? -order : order;
    }
    return compareStrings(left.id, right.id);
  });
  return result;
}

export function queryEntries(entries: FileEntry[], options: QueryOptions): QueryResult {
  const filtered: FileEntry[] = filterEntries(entries, options);
  const sorted: FileEntry[] = sortEntries(filtered, options.sortField, options.descending);
  const total: number = sorted.length;
  const offset: number = options.offset > 0 ? options.offset : 0;
  const items: FileEntry[] = [];
  if (offset < total) {
    const end: number = options.limit > 0 ? Math.min(total, offset + options.limit) : total;
    for (let index = offset; index < end; index++) {
      items.push(sorted[index]);
    }
  }
  return new QueryResult(items, total, offset, offset + items.length < total);
}

export function countByKind(entries: FileEntry[]): KindCount[] {
  const counts: KindCount[] = [];
  for (let index = 0; index < entries.length; index++) {
    const entry: FileEntry = entries[index];
    let found: number = -1;
    for (let countIndex = 0; countIndex < counts.length; countIndex++) {
      if (counts[countIndex].kind === entry.kind) {
        found = countIndex;
        break;
      }
    }
    if (found < 0) {
      counts.push(new KindCount(entry.kind, 1));
    } else {
      const previous: KindCount = counts[found];
      counts[found] = new KindCount(previous.kind, previous.count + 1);
    }
  }
  counts.sort((left: KindCount, right: KindCount) => {
    return compareNumbers(kindPriority(left.kind), kindPriority(right.kind));
  });
  return counts;
}

export function distinctKinds(entries: FileEntry[]): FileKind[] {
  const counts: KindCount[] = countByKind(entries);
  const kinds: FileKind[] = [];
  for (let index = 0; index < counts.length; index++) {
    kinds.push(counts[index].kind);
  }
  return kinds;
}

function findOccurrences(lowerText: string, token: string): TextRange[] {
  const ranges: TextRange[] = [];
  if (token.length === 0) {
    return ranges;
  }
  let start: number = lowerText.indexOf(token);
  while (start >= 0) {
    ranges.push(new TextRange(start, start + token.length));
    start = lowerText.indexOf(token, start + token.length);
  }
  return ranges;
}

function mergeRanges(ranges: TextRange[]): TextRange[] {
  if (ranges.length === 0) {
    return ranges;
  }
  ranges.sort((left: TextRange, right: TextRange) => {
    return compareNumbers(left.start, right.start);
  });
  const merged: TextRange[] = [];
  let current: TextRange = ranges[0];
  for (let index = 1; index < ranges.length; index++) {
    const next: TextRange = ranges[index];
    if (next.start <= current.end) {
      current = new TextRange(current.start, Math.max(current.end, next.end));
    } else {
      merged.push(current);
      current = next;
    }
  }
  merged.push(current);
  return merged;
}

export function highlight(text: string, keyword: string): TextSpan[] {
  const tokens: string[] = tokenizeKeyword(keyword);
  const lowerText: string = text.toLowerCase();
  let ranges: TextRange[] = [];
  for (let index = 0; index < tokens.length; index++) {
    const found: TextRange[] = findOccurrences(lowerText, tokens[index]);
    for (let foundIndex = 0; foundIndex < found.length; foundIndex++) {
      ranges.push(found[foundIndex]);
    }
  }
  ranges = mergeRanges(ranges);
  const spans: TextSpan[] = [];
  if (ranges.length === 0) {
    spans.push(new TextSpan(text, false));
    return spans;
  }
  let cursor: number = 0;
  for (let index = 0; index < ranges.length; index++) {
    const range: TextRange = ranges[index];
    if (range.start > cursor) {
      spans.push(new TextSpan(text.substring(cursor, range.start), false));
    }
    spans.push(new TextSpan(text.substring(range.start, range.end), true));
    cursor = range.end;
  }
  if (cursor < text.length) {
    spans.push(new TextSpan(text.substring(cursor), false));
  }
  return spans;
}

export function findEntryById(entries: FileEntry[], id: string): FileEntry | null {
  for (let index = 0; index < entries.length; index++) {
    if (entries[index].id === id) {
      return entries[index];
    }
  }
  return null;
}
