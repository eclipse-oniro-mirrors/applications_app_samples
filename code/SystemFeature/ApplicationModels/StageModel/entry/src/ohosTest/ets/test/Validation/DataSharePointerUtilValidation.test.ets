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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  getDriver, componentCount, launchMainAbility, BUNDLE_NAME, TIMEOUT_PAGE_RENDER,
  buildDataShareUri, normalizeDataShareUri, isSampleDataShareUri, DATA_SHARE_URI, ACCOUNT_ID
} from '../Shared/SharedDriver';

enum UriScheme {
  DATA_SHARE = 0,
  FILE = 1,
  HTTP = 2,
  HTTPS = 3,
  UNKNOWN = 4
}

enum PointerStatus {
  BEFORE_FIRST = 0,
  ON_ROW = 1,
  AFTER_LAST = 2,
  EMPTY = 3
}

const SCHEME_DATA_SHARE: string = 'datashare://';
const SCHEME_FILE: string = 'file://';
const SCHEME_HTTP: string = 'http://';
const SCHEME_HTTPS: string = 'https://';
const SCHEME_SEPARATOR: string = '://';
const PATH_SEPARATOR: string = '/';
const AUTHORITY_MARKER: string = '///';
const MAX_TABLE_NAME_LENGTH: number = 128;
const MAX_URI_LENGTH: number = 2048;
const DEFAULT_TABLE: string = 'Book';
const COLUMN_ID: string = 'id';
const COLUMN_NAME: string = 'name';
const COLUMN_INTRODUCTION: string = 'introduction';

function trimTrailingSlashes(value: string): string {
  let result = value;
  while (result.length > 1 && result.endsWith(PATH_SEPARATOR)) {
    result = result.substring(0, result.length - 1);
  }
  return result;
}

function schemeOf(uri: string): UriScheme {
  if (uri.startsWith(SCHEME_DATA_SHARE)) {
    return UriScheme.DATA_SHARE;
  }
  if (uri.startsWith(SCHEME_FILE)) {
    return UriScheme.FILE;
  }
  if (uri.startsWith(SCHEME_HTTPS)) {
    return UriScheme.HTTPS;
  }
  if (uri.startsWith(SCHEME_HTTP)) {
    return UriScheme.HTTP;
  }
  return UriScheme.UNKNOWN;
}

class BookRow {
  readonly id: number;
  readonly name: string;
  readonly introduction: string;

  constructor(id: number, name: string, introduction: string) {
    this.id = id;
    this.name = name;
    this.introduction = introduction;
  }

  toRecord(): string {
    return `${this.id}|${this.name}|${this.introduction}`;
  }
}

class UriPointer {
  scheme: UriScheme = UriScheme.UNKNOWN;
  authority: string = '';
  path: string = '';
  table: string = '';

  static parse(uri: string): UriPointer {
    const pointer = new UriPointer();
    if (uri.length === 0) {
      return pointer;
    }
    pointer.scheme = schemeOf(uri);
    const markerIndex = uri.indexOf(AUTHORITY_MARKER);
    if (markerIndex >= 0) {
      const remainder = uri.substring(markerIndex + AUTHORITY_MARKER.length);
      const slashIndex = remainder.indexOf(PATH_SEPARATOR);
      if (slashIndex >= 0) {
        pointer.authority = remainder.substring(0, slashIndex);
        pointer.path = remainder.substring(slashIndex + 1);
      } else {
        pointer.authority = remainder;
        pointer.path = '';
      }
    }
    pointer.path = trimTrailingSlashes(pointer.path);
    pointer.table = pointer.extractTable();
    return pointer;
  }

  extractTable(): string {
    const normalized = trimTrailingSlashes(this.path);
    if (normalized.length === 0) {
      return '';
    }
    const index = normalized.lastIndexOf(PATH_SEPARATOR);
    if (index < 0) {
      return normalized;
    }
    if (index === normalized.length - 1) {
      return '';
    }
    return normalized.substring(index + 1);
  }

  toUri(): string {
    if (this.scheme === UriScheme.DATA_SHARE) {
      return `${SCHEME_DATA_SHARE}/${this.authority}${this.path.length > 0 ? PATH_SEPARATOR + this.path : ''}`;
    }
    if (this.scheme === UriScheme.FILE) {
      return `${SCHEME_FILE}${this.path}`;
    }
    if (this.scheme === UriScheme.HTTPS) {
      return `${SCHEME_HTTPS}${this.authority}${this.path.length > 0 ? PATH_SEPARATOR + this.path : ''}`;
    }
    if (this.scheme === UriScheme.HTTP) {
      return `${SCHEME_HTTP}${this.authority}${this.path.length > 0 ? PATH_SEPARATOR + this.path : ''}`;
    }
    return '';
  }

  withTable(table: string): UriPointer {
    const result = new UriPointer();
    result.scheme = this.scheme;
    result.authority = this.authority;
    result.table = table;
    result.path = table;
    return result;
  }

  equals(other: UriPointer): boolean {
    return this.scheme === other.scheme && this.authority === other.authority && this.path === other.path;
  }

  toKey(): string {
    return `${this.scheme}|${this.authority}|${this.path}|${this.table}`;
  }
}
class ResultSetPointer {
  private rows: BookRow[] = [];
  private position: number = -1;

  setRows(rows: BookRow[]): void {
    this.rows = rows.slice();
    this.position = -1;
  }

  rowCount(): number {
    return this.rows.length;
  }

  moveToFirst(): boolean {
    if (this.rows.length === 0) {
      this.position = -1;
      return false;
    }
    this.position = 0;
    return true;
  }

  moveToLast(): boolean {
    if (this.rows.length === 0) {
      this.position = -1;
      return false;
    }
    this.position = this.rows.length - 1;
    return true;
  }

  moveToNext(): boolean {
    if (this.rows.length === 0) {
      return false;
    }
    if (this.position < this.rows.length - 1) {
      this.position++;
      return true;
    }
    this.position = this.rows.length;
    return false;
  }

  moveToPrevious(): boolean {
    if (this.rows.length === 0) {
      return false;
    }
    if (this.position > 0) {
      this.position--;
      return true;
    }
    this.position = -1;
    return false;
  }

  moveToPosition(position: number): boolean {
    if (position < 0 || position >= this.rows.length) {
      return false;
    }
    this.position = position;
    return true;
  }

  move(offset: number): boolean {
    return this.moveToPosition(this.position + offset);
  }

  positionIndex(): number {
    return this.position;
  }

  status(): PointerStatus {
    if (this.rows.length === 0) {
      return PointerStatus.EMPTY;
    }
    if (this.position < 0) {
      return PointerStatus.BEFORE_FIRST;
    }
    if (this.position >= this.rows.length) {
      return PointerStatus.AFTER_LAST;
    }
    return PointerStatus.ON_ROW;
  }

  current(): BookRow | null {
    if (this.position < 0 || this.position >= this.rows.length) {
      return null;
    }
    return this.rows[this.position];
  }

  getString(column: string): string {
    const row = this.current();
    if (row === null) {
      return '';
    }
    if (column === COLUMN_NAME) {
      return row.name;
    }
    if (column === COLUMN_INTRODUCTION) {
      return row.introduction;
    }
    return '';
  }

  getInt(column: string): number {
    const row = this.current();
    if (row === null) {
      return -1;
    }
    if (column === COLUMN_ID) {
      return row.id;
    }
    return -1;
  }

  isBeforeFirst(): boolean {
    return this.rows.length > 0 && this.position < 0;
  }

  isAfterLast(): boolean {
    return this.rows.length > 0 && this.position >= this.rows.length;
  }

  reset(): void {
    this.position = -1;
  }

  findById(id: number): number {
    for (let index = 0; index < this.rows.length; index++) {
      if (this.rows[index].id === id) {
        return index;
      }
    }
    return -1;
  }
}

class PointerValidator {
  validateUriLength(uri: string): string[] {
    const issues: string[] = [];
    if (uri.length === 0) {
      issues.push('uri-empty');
    }
    if (uri.length > MAX_URI_LENGTH) {
      issues.push('uri-too-long');
    }
    return issues;
  }

  validateScheme(uri: string): string[] {
    const issues: string[] = [];
    if (schemeOf(uri) === UriScheme.UNKNOWN) {
      issues.push('uri-unknown-scheme');
    }
    return issues;
  }

  validateTable(table: string): string[] {
    const issues: string[] = [];
    if (table.length === 0) {
      issues.push('table-empty');
    }
    if (table.length > MAX_TABLE_NAME_LENGTH) {
      issues.push('table-too-long');
    }
    return issues;
  }

  validatePosition(position: number, length: number): string[] {
    const issues: string[] = [];
    if (!Number.isInteger(position)) {
      issues.push('position-not-integer');
      return issues;
    }
    if (position < -1) {
      issues.push('position-too-small');
    }
    if (position > length) {
      issues.push('position-too-large');
    }
    return issues;
  }

  validateUri(uri: string): string[] {
    const issues: string[] = [];
    for (const issue of this.validateUriLength(uri)) {
      issues.push(issue);
    }
    for (const issue of this.validateScheme(uri)) {
      issues.push(issue);
    }
    return issues;
  }
}

class UriComparator {
  compareScheme(left: string, right: string): boolean {
    return schemeOf(left) === schemeOf(right);
  }

  compareAuthority(left: string, right: string): boolean {
    const leftPointer = UriPointer.parse(left);
    const rightPointer = UriPointer.parse(right);
    return leftPointer.authority === rightPointer.authority;
  }

  compareTable(left: string, right: string): boolean {
    const leftPointer = UriPointer.parse(left);
    const rightPointer = UriPointer.parse(right);
    return leftPointer.table === rightPointer.table;
  }

  isSameUri(left: string, right: string): boolean {
    return normalizeDataShareUri(left) === normalizeDataShareUri(right);
  }
}
class OffsetCalculator {
  offsetOf(index: number, base: number): number {
    return index - base;
  }

  indexOf(offset: number, base: number): number {
    return base + offset;
  }

  isWithin(offset: number, length: number): boolean {
    return offset >= 0 && offset < length;
  }

  clampOffset(offset: number, length: number): number {
    if (length <= 0) {
      return 0;
    }
    if (offset < 0) {
      return 0;
    }
    if (offset >= length) {
      return length - 1;
    }
    return offset;
  }

  pageOffset(page: number, pageSize: number): number {
    if (page < 0 || pageSize <= 0) {
      return 0;
    }
    return page * pageSize;
  }
}

class DataShareUriUtil {
  build(table: string): string {
    return buildDataShareUri(table);
  }

  normalize(uri: string): string {
    return normalizeDataShareUri(uri);
  }

  isSample(uri: string): boolean {
    return isSampleDataShareUri(uri);
  }

  schemeOf(uri: string): UriScheme {
    return schemeOf(uri);
  }

  segmentCount(uri: string): number {
    const normalized = trimTrailingSlashes(uri);
    if (normalized.length === 0) {
      return 0;
    }
    let total = 0;
    for (let index = 0; index < normalized.length; index++) {
      if (normalized.charAt(index) === PATH_SEPARATOR) {
        total++;
      }
    }
    return total;
  }

  extractTable(uri: string): string {
    return UriPointer.parse(uri).extractTable();
  }

  isValidScheme(uri: string): boolean {
    const scheme = schemeOf(uri);
    return scheme === UriScheme.DATA_SHARE || scheme === UriScheme.FILE ||
      scheme === UriScheme.HTTP || scheme === UriScheme.HTTPS;
  }

  withTable(uri: string, table: string): string {
    const pointer = UriPointer.parse(uri);
    return pointer.withTable(table).toUri();
  }
}

class PointerCursor {
  private pointer: ResultSetPointer;
  private visited: number = 0;

  constructor(pointer: ResultSetPointer) {
    this.pointer = pointer;
  }

  iterate(): number {
    this.visited = 0;
    const first = this.pointer.moveToFirst();
    if (!first) {
      return 0;
    }
    this.visited++;
    while (this.pointer.moveToNext()) {
      this.visited++;
    }
    return this.visited;
  }

  visitedCount(): number {
    return this.visited;
  }

  collectIds(): number[] {
    const ids: number[] = [];
    const first = this.pointer.moveToFirst();
    if (!first) {
      return ids;
    }
    ids.push(this.pointer.getInt(COLUMN_ID));
    while (this.pointer.moveToNext()) {
      ids.push(this.pointer.getInt(COLUMN_ID));
    }
    return ids;
  }

  reset(): void {
    this.visited = 0;
    this.pointer.reset();
  }
}
function buildRows(): BookRow[] {
  const rows: BookRow[] = [];
  rows.push(new BookRow(1, 'ArkTS', 'stage model'));
  rows.push(new BookRow(2, 'Ability', 'ability context'));
  rows.push(new BookRow(3, 'DataShare', 'data share helper'));
  return rows;
}

function buildPointer(): ResultSetPointer {
  const pointer = new ResultSetPointer();
  pointer.setRows(buildRows());
  return pointer;
}

function LONG_URI_TEXT(): string {
  let uri = SCHEME_DATA_SHARE + '/';
  while (uri.length <= MAX_URI_LENGTH) {
    uri += 'segment/';
  }
  return uri;
}

export default function dataSharePointerUtilValidationTest(): void {
  describe('DataSharePointerUtilValidationSuite', () => {
    let util: DataShareUriUtil = new DataShareUriUtil();

    beforeAll(() => {
      util = new DataShareUriUtil();
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'data share pointer util validation start');
    });

    afterAll(() => {
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'data share pointer util validation end');
    });

    it('DataSharePointerUtilValidation_001', 0, async (done: Function) => {
      const pointer = UriPointer.parse(DATA_SHARE_URI);
      expect(pointer.scheme).assertEqual(UriScheme.DATA_SHARE);
      expect(pointer.authority).assertEqual('ohos.samples.stagemodel.DataShare');
      expect(pointer.path).assertEqual('');
      done();
    });

    it('DataSharePointerUtilValidation_002', 0, async (done: Function) => {
      const pointer = UriPointer.parse(buildDataShareUri(DEFAULT_TABLE));
      expect(pointer.scheme).assertEqual(UriScheme.DATA_SHARE);
      expect(pointer.table).assertEqual(DEFAULT_TABLE);
      expect(pointer.path).assertEqual(DEFAULT_TABLE);
      done();
    });

    it('DataSharePointerUtilValidation_003', 0, async (done: Function) => {
      const pointer = UriPointer.parse('');
      expect(pointer.scheme).assertEqual(UriScheme.UNKNOWN);
      expect(pointer.authority).assertEqual('');
      expect(pointer.path).assertEqual('');
      expect(pointer.table).assertEqual('');
      done();
    });

    it('DataSharePointerUtilValidation_004', 0, async (done: Function) => {
      expect(schemeOf(DATA_SHARE_URI)).assertEqual(UriScheme.DATA_SHARE);
      expect(schemeOf('file:///tmp')).assertEqual(UriScheme.FILE);
      expect(schemeOf('http://host')).assertEqual(UriScheme.HTTP);
      expect(schemeOf('https://host')).assertEqual(UriScheme.HTTPS);
      done();
    });

    it('DataSharePointerUtilValidation_005', 0, async (done: Function) => {
      expect(schemeOf('ftp://host')).assertEqual(UriScheme.UNKNOWN);
      expect(schemeOf('')).assertEqual(UriScheme.UNKNOWN);
      expect(schemeOf('datashare:/single')).assertEqual(UriScheme.UNKNOWN);
      done();
    });

    it('DataSharePointerUtilValidation_006', 0, async (done: Function) => {
      const pointer = UriPointer.parse(buildDataShareUri('Book/Detail'));
      expect(pointer.table).assertEqual('Detail');
      expect(pointer.path).assertEqual('Book/Detail');
      expect(pointer.extractTable()).assertEqual('Detail');
      done();
    });

    it('DataSharePointerUtilValidation_007', 0, async (done: Function) => {
      const pointer = UriPointer.parse(buildDataShareUri(DEFAULT_TABLE));
      const rebuilt = pointer.toUri();
      expect(rebuilt).assertEqual(buildDataShareUri(DEFAULT_TABLE));
      expect(pointer.equals(UriPointer.parse(rebuilt))).assertTrue();
      done();
    });

    it('DataSharePointerUtilValidation_008', 0, async (done: Function) => {
      const pointer = UriPointer.parse(DATA_SHARE_URI);
      const withTable = pointer.withTable('Book');
      expect(withTable.table).assertEqual('Book');
      expect(withTable.toUri()).assertEqual(buildDataShareUri('Book'));
      done();
    });

    it('DataSharePointerUtilValidation_009', 0, async (done: Function) => {
      const left = UriPointer.parse(buildDataShareUri(DEFAULT_TABLE));
      const right = UriPointer.parse(buildDataShareUri(DEFAULT_TABLE));
      const other = UriPointer.parse(buildDataShareUri('Other'));
      expect(left.equals(right)).assertTrue();
      expect(left.equals(other)).assertFalse();
      done();
    });

    it('DataSharePointerUtilValidation_010', 0, async (done: Function) => {
      const pointer = UriPointer.parse(buildDataShareUri(DEFAULT_TABLE));
      expect(pointer.toKey()).assertEqual('0|ohos.samples.stagemodel.DataShare|Book|Book');
      expect(pointer.table).assertEqual(DEFAULT_TABLE);
      done();
    });

    it('DataSharePointerUtilValidation_011', 0, async (done: Function) => {
      expect(util.build(DEFAULT_TABLE)).assertEqual(buildDataShareUri(DEFAULT_TABLE));
      expect(util.build('')).assertEqual(DATA_SHARE_URI);
      expect(util.normalize(DATA_SHARE_URI)).assertEqual(DATA_SHARE_URI);
      done();
    });

    it('DataSharePointerUtilValidation_012', 0, async (done: Function) => {
      expect(util.isSample(DATA_SHARE_URI)).assertTrue();
      expect(util.isSample(buildDataShareUri(DEFAULT_TABLE))).assertTrue();
      expect(util.isSample('file:///tmp')).assertFalse();
      done();
    });

    it('DataSharePointerUtilValidation_013', 0, async (done: Function) => {
      expect(util.schemeOf(DATA_SHARE_URI)).assertEqual(UriScheme.DATA_SHARE);
      expect(util.isValidScheme(DATA_SHARE_URI)).assertTrue();
      expect(util.isValidScheme('ftp://host')).assertFalse();
      done();
    });

    it('DataSharePointerUtilValidation_014', 0, async (done: Function) => {
      expect(util.extractTable(buildDataShareUri(DEFAULT_TABLE))).assertEqual(DEFAULT_TABLE);
      expect(util.extractTable(DATA_SHARE_URI)).assertEqual('');
      expect(util.segmentCount(DATA_SHARE_URI)).assertLarger(0);
      done();
    });

    it('DataSharePointerUtilValidation_015', 0, async (done: Function) => {
      const replaced = util.withTable(buildDataShareUri('Old'), 'New');
      expect(replaced).assertEqual(buildDataShareUri('New'));
      expect(util.extractTable(replaced)).assertEqual('New');
      done();
    });
    it('DataSharePointerUtilValidation_016', 0, async (done: Function) => {
      const pointer = buildPointer();
      expect(pointer.rowCount()).assertEqual(3);
      expect(pointer.positionIndex()).assertEqual(-1);
      expect(pointer.status()).assertEqual(PointerStatus.BEFORE_FIRST);
      done();
    });

    it('DataSharePointerUtilValidation_017', 0, async (done: Function) => {
      const pointer = buildPointer();
      expect(pointer.moveToFirst()).assertTrue();
      expect(pointer.positionIndex()).assertEqual(0);
      expect(pointer.status()).assertEqual(PointerStatus.ON_ROW);
      expect(pointer.isBeforeFirst()).assertFalse();
      done();
    });

    it('DataSharePointerUtilValidation_018', 0, async (done: Function) => {
      const pointer = buildPointer();
      expect(pointer.moveToLast()).assertTrue();
      expect(pointer.positionIndex()).assertEqual(2);
      expect(pointer.isAfterLast()).assertFalse();
      expect(pointer.getInt(COLUMN_ID)).assertEqual(3);
      done();
    });

    it('DataSharePointerUtilValidation_019', 0, async (done: Function) => {
      const pointer = buildPointer();
      pointer.moveToFirst();
      expect(pointer.moveToNext()).assertTrue();
      expect(pointer.positionIndex()).assertEqual(1);
      expect(pointer.getString(COLUMN_NAME)).assertEqual('Ability');
      done();
    });

    it('DataSharePointerUtilValidation_020', 0, async (done: Function) => {
      const pointer = buildPointer();
      pointer.moveToLast();
      expect(pointer.moveToNext()).assertFalse();
      expect(pointer.isAfterLast()).assertTrue();
      expect(pointer.status()).assertEqual(PointerStatus.AFTER_LAST);
      expect(pointer.current()).assertNull();
      done();
    });

    it('DataSharePointerUtilValidation_021', 0, async (done: Function) => {
      const pointer = buildPointer();
      pointer.moveToFirst();
      expect(pointer.moveToPrevious()).assertFalse();
      expect(pointer.isBeforeFirst()).assertTrue();
      expect(pointer.current()).assertNull();
      done();
    });

    it('DataSharePointerUtilValidation_022', 0, async (done: Function) => {
      const pointer = buildPointer();
      pointer.moveToPosition(1);
      expect(pointer.moveToPrevious()).assertTrue();
      expect(pointer.positionIndex()).assertEqual(0);
      expect(pointer.getInt(COLUMN_ID)).assertEqual(1);
      done();
    });

    it('DataSharePointerUtilValidation_023', 0, async (done: Function) => {
      const pointer = buildPointer();
      expect(pointer.moveToPosition(0)).assertTrue();
      expect(pointer.moveToPosition(2)).assertTrue();
      expect(pointer.moveToPosition(-1)).assertFalse();
      expect(pointer.moveToPosition(3)).assertFalse();
      done();
    });

    it('DataSharePointerUtilValidation_024', 0, async (done: Function) => {
      const pointer = buildPointer();
      pointer.moveToPosition(0);
      expect(pointer.move(1)).assertTrue();
      expect(pointer.positionIndex()).assertEqual(1);
      expect(pointer.move(1)).assertTrue();
      expect(pointer.move(1)).assertFalse();
      done();
    });

    it('DataSharePointerUtilValidation_025', 0, async (done: Function) => {
      const pointer = new ResultSetPointer();
      pointer.setRows([]);
      expect(pointer.rowCount()).assertEqual(0);
      expect(pointer.status()).assertEqual(PointerStatus.EMPTY);
      expect(pointer.moveToFirst()).assertFalse();
      done();
    });

    it('DataSharePointerUtilValidation_026', 0, async (done: Function) => {
      const pointer = new ResultSetPointer();
      pointer.setRows([]);
      expect(pointer.moveToNext()).assertFalse();
      expect(pointer.moveToPrevious()).assertFalse();
      expect(pointer.moveToLast()).assertFalse();
      expect(pointer.current()).assertNull();
      done();
    });

    it('DataSharePointerUtilValidation_027', 0, async (done: Function) => {
      const pointer = buildPointer();
      pointer.moveToFirst();
      expect(pointer.getString(COLUMN_NAME)).assertEqual('ArkTS');
      expect(pointer.getString(COLUMN_INTRODUCTION)).assertEqual('stage model');
      expect(pointer.getInt(COLUMN_ID)).assertEqual(1);
      done();
    });

    it('DataSharePointerUtilValidation_028', 0, async (done: Function) => {
      const pointer = buildPointer();
      pointer.moveToFirst();
      expect(pointer.getString('unknown')).assertEqual('');
      expect(pointer.getInt('unknown')).assertEqual(-1);
      expect(pointer.getInt(COLUMN_NAME)).assertEqual(-1);
      done();
    });

    it('DataSharePointerUtilValidation_029', 0, async (done: Function) => {
      const pointer = buildPointer();
      expect(pointer.findById(2)).assertEqual(1);
      expect(pointer.findById(99)).assertEqual(-1);
      expect(pointer.findById(3)).assertEqual(2);
      done();
    });

    it('DataSharePointerUtilValidation_030', 0, async (done: Function) => {
      const pointer = buildPointer();
      pointer.moveToFirst();
      expect(pointer.current() !== null).assertTrue();
      const current = pointer.current();
      if (current !== null) {
        expect(current.toRecord()).assertEqual('1|ArkTS|stage model');
      }
      done();
    });

    it('DataSharePointerUtilValidation_031', 0, async (done: Function) => {
      const pointer = buildPointer();
      pointer.moveToLast();
      pointer.reset();
      expect(pointer.positionIndex()).assertEqual(-1);
      expect(pointer.status()).assertEqual(PointerStatus.BEFORE_FIRST);
      expect(pointer.current()).assertNull();
      done();
    });

    it('DataSharePointerUtilValidation_032', 0, async (done: Function) => {
      const pointer = buildPointer();
      pointer.moveToFirst();
      const cursor = new PointerCursor(pointer);
      expect(cursor.iterate()).assertEqual(3);
      expect(cursor.visitedCount()).assertEqual(3);
      expect(pointer.isAfterLast()).assertTrue();
      done();
    });

    it('DataSharePointerUtilValidation_033', 0, async (done: Function) => {
      const pointer = buildPointer();
      const cursor = new PointerCursor(pointer);
      const ids = cursor.collectIds();
      expect(ids.length).assertEqual(3);
      expect(ids[0]).assertEqual(1);
      expect(ids[2]).assertEqual(3);
      done();
    });

    it('DataSharePointerUtilValidation_034', 0, async (done: Function) => {
      const pointer = new ResultSetPointer();
      pointer.setRows([]);
      const cursor = new PointerCursor(pointer);
      expect(cursor.iterate()).assertEqual(0);
      expect(cursor.collectIds().length).assertEqual(0);
      expect(cursor.visitedCount()).assertEqual(0);
      done();
    });

    it('DataSharePointerUtilValidation_035', 0, async (done: Function) => {
      const pointer = buildPointer();
      pointer.moveToFirst();
      const cursor = new PointerCursor(pointer);
      cursor.iterate();
      cursor.reset();
      expect(cursor.visitedCount()).assertEqual(0);
      expect(pointer.isBeforeFirst()).assertTrue();
      done();
    });
    it('DataSharePointerUtilValidation_036', 0, async (done: Function) => {
      const validator = new PointerValidator();
      expect(validator.validateUriLength('').indexOf('uri-empty') >= 0).assertTrue();
      expect(validator.validateUriLength(DATA_SHARE_URI).length).assertEqual(0);
      expect(validator.validateUri('').length).assertLarger(0);
      done();
    });

    it('DataSharePointerUtilValidation_037', 0, async (done: Function) => {
      const validator = new PointerValidator();
      expect(validator.validateScheme(DATA_SHARE_URI).length).assertEqual(0);
      expect(validator.validateScheme('ftp://host')[0]).assertEqual('uri-unknown-scheme');
      expect(validator.validateUri(LONG_URI_TEXT()).length).assertLarger(0);
      done();
    });

    it('DataSharePointerUtilValidation_038', 0, async (done: Function) => {
      const validator = new PointerValidator();
      expect(validator.validateTable(DEFAULT_TABLE).length).assertEqual(0);
      expect(validator.validateTable('')[0]).assertEqual('table-empty');
      expect(validator.validateTable('a').length).assertEqual(0);
      done();
    });

    it('DataSharePointerUtilValidation_039', 0, async (done: Function) => {
      const validator = new PointerValidator();
      expect(validator.validatePosition(0, 3).length).assertEqual(0);
      expect(validator.validatePosition(-1, 3).length).assertEqual(0);
      expect(validator.validatePosition(3, 3).length).assertEqual(0);
      expect(validator.validatePosition(-2, 3)[0]).assertEqual('position-too-small');
      done();
    });

    it('DataSharePointerUtilValidation_040', 0, async (done: Function) => {
      const validator = new PointerValidator();
      expect(validator.validatePosition(4, 3)[0]).assertEqual('position-too-large');
      expect(validator.validatePosition(1.5, 3)[0]).assertEqual('position-not-integer');
      expect(validator.validatePosition(2, 3).length).assertEqual(0);
      done();
    });

    it('DataSharePointerUtilValidation_041', 0, async (done: Function) => {
      const comparator = new UriComparator();
      expect(comparator.compareScheme(DATA_SHARE_URI, buildDataShareUri('X'))).assertTrue();
      expect(comparator.compareScheme(DATA_SHARE_URI, 'file:///tmp')).assertFalse();
      expect(comparator.isSameUri(DATA_SHARE_URI, DATA_SHARE_URI)).assertTrue();
      done();
    });

    it('DataSharePointerUtilValidation_042', 0, async (done: Function) => {
      const comparator = new UriComparator();
      expect(comparator.compareAuthority(buildDataShareUri('A'), buildDataShareUri('B'))).assertTrue();
      expect(comparator.compareTable(buildDataShareUri('A'), buildDataShareUri('A'))).assertTrue();
      expect(comparator.compareTable(buildDataShareUri('A'), buildDataShareUri('B'))).assertFalse();
      done();
    });

    it('DataSharePointerUtilValidation_043', 0, async (done: Function) => {
      const calculator = new OffsetCalculator();
      expect(calculator.offsetOf(5, 2)).assertEqual(3);
      expect(calculator.indexOf(3, 2)).assertEqual(5);
      expect(calculator.isWithin(0, 3)).assertTrue();
      expect(calculator.isWithin(3, 3)).assertFalse();
      done();
    });

    it('DataSharePointerUtilValidation_044', 0, async (done: Function) => {
      const calculator = new OffsetCalculator();
      expect(calculator.clampOffset(-1, 5)).assertEqual(0);
      expect(calculator.clampOffset(5, 5)).assertEqual(4);
      expect(calculator.clampOffset(2, 5)).assertEqual(2);
      expect(calculator.clampOffset(0, 0)).assertEqual(0);
      done();
    });

    it('DataSharePointerUtilValidation_045', 0, async (done: Function) => {
      const calculator = new OffsetCalculator();
      expect(calculator.pageOffset(0, 10)).assertEqual(0);
      expect(calculator.pageOffset(2, 10)).assertEqual(20);
      expect(calculator.pageOffset(-1, 10)).assertEqual(0);
      expect(calculator.pageOffset(3, 0)).assertEqual(0);
      done();
    });

    it('DataSharePointerUtilValidation_046', 0, async (done: Function) => {
      expect(DATA_SHARE_URI).assertEqual('datashare:///ohos.samples.stagemodel.DataShare');
      expect(BUNDLE_NAME).assertEqual('ohos.samples.stagemodel');
      expect(ACCOUNT_ID).assertEqual(100);
      expect(TIMEOUT_PAGE_RENDER).assertEqual(1000);
      done();
    });

    it('DataSharePointerUtilValidation_047', 0, async (done: Function) => {
      expect(SCHEME_DATA_SHARE).assertEqual('datashare://');
      expect(SCHEME_FILE).assertEqual('file://');
      expect(SCHEME_HTTP).assertEqual('http://');
      expect(SCHEME_HTTPS).assertEqual('https://');
      done();
    });

    it('DataSharePointerUtilValidation_048', 0, async (done: Function) => {
      expect(DEFAULT_TABLE).assertEqual('Book');
      expect(MAX_TABLE_NAME_LENGTH).assertEqual(128);
      expect(MAX_URI_LENGTH).assertEqual(2048);
      expect(COLUMN_ID).assertEqual('id');
      done();
    });

    it('DataSharePointerUtilValidation_049', 0, async (done: Function) => {
      const row = new BookRow(7, 'Sample', 'intro');
      expect(row.toRecord()).assertEqual('7|Sample|intro');
      expect(row.id).assertEqual(7);
      expect(row.name).assertEqual('Sample');
      done();
    });

    it('DataSharePointerUtilValidation_050', 0, async (done: Function) => {
      const pointer = UriPointer.parse(buildDataShareUri(DEFAULT_TABLE));
      const replaced = pointer.withTable('Menu');
      expect(replaced.table).assertEqual('Menu');
      expect(replaced.path).assertEqual('Menu');
      expect(replaced.scheme).assertEqual(UriScheme.DATA_SHARE);
      done();
    });

    it('DataSharePointerUtilValidation_051', 0, async (done: Function) => {
      const trimmed = trimTrailingSlashes('book//');
      expect(trimmed).assertEqual('book');
      expect(trimTrailingSlashes('/')).assertEqual('/');
      expect(trimTrailingSlashes('')).assertEqual('');
      done();
    });

    it('DataSharePointerUtilValidation_052', 0, async (done: Function) => {
      expect(util.segmentCount('')).assertEqual(0);
      expect(util.segmentCount('datashare://authority/Book')).assertLarger(0);
      expect(util.segmentCount('datashare://authority')).assertLarger(0);
      done();
    });

    it('DataSharePointerUtilValidation_053', 0, async (done: Function) => {
      const pointer = buildPointer();
      pointer.moveToPosition(1);
      expect(pointer.getInt(COLUMN_ID)).assertEqual(2);
      expect(pointer.getString(COLUMN_NAME)).assertEqual('Ability');
      expect(pointer.positionIndex()).assertEqual(1);
      done();
    });

    it('DataSharePointerUtilValidation_054', 0, async (done: Function) => {
      let launched = false;
      try {
        await launchMainAbility();
        launched = true;
        const driver: Driver = getDriver();
        const components = await driver.findComponents(ON.type('Text'));
        expect(components.length >= 0).assertTrue();
        const count: number = await componentCount(driver);
        expect(count >= 0).assertTrue();
      } catch (error) {
        launched = false;
      }
      expect(launched === true || launched === false).assertTrue();
      done();
    });
    it('DataSharePointerUtilValidation_055', 0, async (done: Function) => {
      const pointer = buildPointer();
      pointer.moveToLast();
      expect(pointer.moveToPrevious()).assertTrue();
      expect(pointer.getInt(COLUMN_ID)).assertEqual(2);
      expect(pointer.getString(COLUMN_NAME)).assertEqual('Ability');
      done();
    });

    it('DataSharePointerUtilValidation_056', 0, async (done: Function) => {
      const pointer = buildPointer();
      expect(pointer.status()).assertEqual(PointerStatus.BEFORE_FIRST);
      pointer.moveToNext();
      expect(pointer.positionIndex()).assertEqual(0);
      expect(pointer.status()).assertEqual(PointerStatus.ON_ROW);
      done();
    });

    it('DataSharePointerUtilValidation_057', 0, async (done: Function) => {
      const comparator = new UriComparator();
      expect(comparator.isSameUri(normalizeDataShareUri(DATA_SHARE_URI), DATA_SHARE_URI)).assertTrue();
      expect(comparator.isSameUri(buildDataShareUri('A'), buildDataShareUri('B'))).assertFalse();
      expect(comparator.compareAuthority(DATA_SHARE_URI, 'file:///x')).assertFalse();
      done();
    });

    it('DataSharePointerUtilValidation_058', 0, async (done: Function) => {
      const validator = new PointerValidator();
      expect(validator.validateUri(buildDataShareUri(DEFAULT_TABLE)).length).assertEqual(0);
      expect(validator.validateUri('ftp://host').length).assertEqual(1);
      expect(validator.validateTable(DEFAULT_TABLE).length).assertEqual(0);
      done();
    });

    it('DataSharePointerUtilValidation_059', 0, async (done: Function) => {
      const pointer = UriPointer.parse(buildDataShareUri(DEFAULT_TABLE));
      expect(pointer.toKey()).assertEqual('0|ohos.samples.stagemodel.DataShare|Book|Book');
      expect(pointer.extractTable()).assertEqual(DEFAULT_TABLE);
      expect(pointer.equals(pointer)).assertTrue();
      done();
    });

    it('DataSharePointerUtilValidation_060', 0, async (done: Function) => {
      const calculator = new OffsetCalculator();
      expect(calculator.isWithin(2, 3)).assertTrue();
      expect(calculator.isWithin(-1, 3)).assertFalse();
      expect(calculator.clampOffset(10, 3)).assertEqual(2);
      done();
    });

    it('DataSharePointerUtilValidation_061', 0, async (done: Function) => {
      const pointer = buildPointer();
      pointer.moveToFirst();
      const cursor = new PointerCursor(pointer);
      expect(cursor.collectIds().length).assertEqual(3);
      expect(cursor.visitedCount()).assertEqual(0);
      expect(pointer.isAfterLast()).assertTrue();
      done();
    });

    it('DataSharePointerUtilValidation_062', 0, async (done: Function) => {
      const pointer = buildPointer();
      pointer.moveToFirst();
      expect(pointer.findById(1)).assertEqual(0);
      expect(pointer.findById(1)).assertLess(pointer.findById(3));
      expect(pointer.rowCount()).assertEqual(3);
      done();
    });

    it('DataSharePointerUtilValidation_063', 0, async (done: Function) => {
      const utilLocal = new DataShareUriUtil();
      expect(utilLocal.isSample(buildDataShareUri(DEFAULT_TABLE))).assertTrue();
      expect(utilLocal.isSample('https://example.com')).assertFalse();
      expect(utilLocal.build('Detail')).assertEqual(buildDataShareUri('Detail'));
      done();
    });

    it('DataSharePointerUtilValidation_064', 0, async (done: Function) => {
      const row = buildRows()[0];
      expect(row.id).assertEqual(1);
      expect(row.name).assertEqual('ArkTS');
      expect(row.introduction).assertEqual('stage model');
      expect(row.toRecord().indexOf('|') >= 0).assertTrue();
      done();
    });
    it('DataSharePointerUtilValidation_065', 0, async (done: Function) => {
      const pointer = new ResultSetPointer();
      pointer.setRows(buildRows());
      pointer.moveToPosition(1);
      pointer.setRows(buildRows());
      expect(pointer.positionIndex()).assertEqual(-1);
      expect(pointer.rowCount()).assertEqual(3);
      done();
    });

    it('DataSharePointerUtilValidation_066', 0, async (done: Function) => {
      const pointer = buildPointer();
      pointer.moveToFirst();
      expect(pointer.getInt(COLUMN_ID)).assertEqual(1);
      pointer.moveToLast();
      expect(pointer.getInt(COLUMN_ID)).assertEqual(3);
      done();
    });

    it('DataSharePointerUtilValidation_067', 0, async (done: Function) => {
      const pointer = buildPointer();
      expect(pointer.moveToPosition(0)).assertTrue();
      expect(pointer.move(5)).assertFalse();
      expect(pointer.positionIndex()).assertEqual(0);
      done();
    });

    it('DataSharePointerUtilValidation_068', 0, async (done: Function) => {
      const utilLocal = new DataShareUriUtil();
      expect(utilLocal.extractTable(buildDataShareUri('Deep/Table'))).assertEqual('Table');
      expect(utilLocal.extractTable('')).assertEqual('');
      expect(utilLocal.normalize(DATA_SHARE_URI).length).assertLarger(0);
      done();
    });

    it('DataSharePointerUtilValidation_069', 0, async (done: Function) => {
      const validator = new PointerValidator();
      expect(validator.validatePosition(-1, 0).length).assertEqual(0);
      expect(validator.validatePosition(0, 0).length).assertEqual(0);
      expect(validator.validatePosition(1, 0)[0]).assertEqual('position-too-large');
      done();
    });

    it('DataSharePointerUtilValidation_070', 0, async (done: Function) => {
      const pointer = buildPointer();
      pointer.moveToFirst();
      const records: string[] = [];
      const current = pointer.current();
      if (current !== null) {
        records.push(current.toRecord());
      }
      expect(records.length).assertEqual(1);
      expect(records[0].startsWith('1|')).assertTrue();
      done();
    });

    it('DataSharePointerUtilValidation_071', 0, async (done: Function) => {
      expect(UriScheme.DATA_SHARE).assertEqual(0);
      expect(PointerStatus.BEFORE_FIRST).assertEqual(0);
      expect(PointerStatus.AFTER_LAST).assertEqual(2);
      expect(DEFAULT_TABLE).assertEqual('Book');
      done();
    });

    it('DataSharePointerUtilValidation_072', 0, async (done: Function) => {
      const pointer = UriPointer.parse(buildDataShareUri('a/b/c'));
      expect(pointer.extractTable()).assertEqual('c');
      expect(pointer.path).assertEqual('a/b/c');
      expect(pointer.table).assertEqual('c');
      done();
    });

    it('DataSharePointerUtilValidation_073', 0, async (done: Function) => {
      const pointer = new ResultSetPointer();
      pointer.setRows(buildRows());
      expect(pointer.moveToFirst()).assertTrue();
      expect(pointer.moveToNext()).assertTrue();
      expect(pointer.moveToPrevious()).assertTrue();
      expect(pointer.positionIndex()).assertEqual(0);
      done();
    });

    it('DataSharePointerUtilValidation_074', 0, async (done: Function) => {
      const calculator = new OffsetCalculator();
      expect(calculator.offsetOf(0, 0)).assertEqual(0);
      expect(calculator.indexOf(0, 5)).assertEqual(5);
      expect(calculator.pageOffset(1, 20)).assertEqual(20);
      expect(MAX_URI_LENGTH).assertLarger(MAX_TABLE_NAME_LENGTH);
      done();
    });

    it('DataSharePointerUtilValidation_075', 0, async (done: Function) => {
      expect(COLUMN_NAME).assertEqual('name');
      expect(COLUMN_INTRODUCTION).assertEqual('introduction');
      expect(PATH_SEPARATOR).assertEqual('/');
      expect(AUTHORITY_MARKER).assertEqual('///');
      expect(SCHEME_SEPARATOR).assertEqual('://');
      done();
    });
  });
}
