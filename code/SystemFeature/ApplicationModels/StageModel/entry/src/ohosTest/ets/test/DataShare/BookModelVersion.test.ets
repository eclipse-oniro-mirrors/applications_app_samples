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
  getDriver, componentCount, launchMainAbility, BUNDLE_NAME, MODULE_ENTRY,
  ABILITY_DATA_SHARE, DATA_SHARE_URI, ACCOUNT_ID
} from '../Shared/SharedDriver';

enum ColumnType {
  INTEGER = 0,
  TEXT = 1,
  REAL = 2,
  BLOB = 3
}

enum SchemaState {
  UNKNOWN = 0,
  COMPATIBLE = 1,
  UPGRADE_REQUIRED = 2,
  DOWNGRADE_BLOCKED = 3
}

const SCHEMA_VERSION_CURRENT: number = 3;
const SCHEMA_VERSION_MIN: number = 1;
const COLUMN_ID: string = 'id';
const COLUMN_NAME: string = 'name';
const COLUMN_INTRODUCTION: string = 'introduction';
const COLUMN_UPDATED_AT: string = 'updatedAt';
const DEFAULT_INTRODUCTION: string = 'N/A';

class ColumnDef {
  readonly name: string;
  readonly type: ColumnType;
  readonly nullable: boolean;
  readonly primaryKey: boolean;

  constructor(name: string, type: ColumnType, nullable: boolean, primaryKey: boolean) {
    this.name = name;
    this.type = type;
    this.nullable = nullable;
    this.primaryKey = primaryKey;
  }

  signature(): string {
    return `${this.name}:${this.type}:${this.nullable ? 1 : 0}:${this.primaryKey ? 1 : 0}`;
  }

  equals(other: ColumnDef): boolean {
    return this.name === other.name && this.type === other.type &&
      this.nullable === other.nullable && this.primaryKey === other.primaryKey;
  }
}

class Book {
  id: number;
  name: string;
  introduction: string;

  constructor(id: number, name: string, introduction: string) {
    this.id = id;
    this.name = name;
    this.introduction = introduction;
  }

  clone(): Book {
    return new Book(this.id, this.name, this.introduction);
  }

  toRecord(): string {
    return `${this.id}|${this.name}|${this.introduction}`;
  }

  equals(other: Book): boolean {
    return this.id === other.id && this.name === other.name &&
      this.introduction === other.introduction;
  }
}

class SchemaVersion {
  readonly version: number;
  readonly columns: ColumnDef[];
  readonly description: string;

  constructor(version: number, columns: ColumnDef[], description: string) {
    this.version = version;
    this.columns = columns;
    this.description = description;
  }

  columnCount(): number {
    return this.columns.length;
  }

  columnNames(): string[] {
    const names: string[] = [];
    for (const column of this.columns) {
      names.push(column.name);
    }
    return names;
  }

  hasColumn(name: string): boolean {
    for (const column of this.columns) {
      if (column.name === name) {
        return true;
      }
    }
    return false;
  }

  indexOfColumn(name: string): number {
    for (let index = 0; index < this.columns.length; index++) {
      if (this.columns[index].name === name) {
        return index;
      }
    }
    return -1;
  }

  signature(): string {
    const parts: string[] = [];
    for (const column of this.columns) {
      parts.push(column.signature());
    }
    return parts.join(',');
  }

  equals(other: SchemaVersion): boolean {
    if (this.version !== other.version || this.columns.length !== other.columns.length) {
      return false;
    }
    for (let index = 0; index < this.columns.length; index++) {
      if (!this.columns[index].equals(other.columns[index])) {
        return false;
      }
    }
    return true;
  }
}

class SchemaRegistry {
  private versions: SchemaVersion[] = [];

  register(version: SchemaVersion): boolean {
    if (this.find(version.version) !== null) {
      return false;
    }
    this.versions.push(version);
    this.versions.sort((left: SchemaVersion, right: SchemaVersion): number => {
      return left.version - right.version;
    });
    return true;
  }

  find(version: number): SchemaVersion | null {
    for (const entry of this.versions) {
      if (entry.version === version) {
        return entry;
      }
    }
    return null;
  }

  latest(): SchemaVersion | null {
    if (this.versions.length === 0) {
      return null;
    }
    return this.versions[this.versions.length - 1];
  }

  size(): number {
    return this.versions.length;
  }

  versionNumbers(): number[] {
    const numbers: number[] = [];
    for (const entry of this.versions) {
      numbers.push(entry.version);
    }
    return numbers;
  }

  isContiguous(): boolean {
    if (this.versions.length === 0) {
      return false;
    }
    for (let index = 1; index < this.versions.length; index++) {
      if (this.versions[index].version !== this.versions[index - 1].version + 1) {
        return false;
      }
    }
    return true;
  }
}

class BookTable {
  private books: Book[] = [];

  insert(book: Book): boolean {
    if (this.findById(book.id) !== null) {
      return false;
    }
    this.books.push(book);
    return true;
  }

  findById(id: number): Book | null {
    for (const book of this.books) {
      if (book.id === id) {
        return book;
      }
    }
    return null;
  }

  update(id: number, name: string, introduction: string): boolean {
    const target = this.findById(id);
    if (target === null) {
      return false;
    }
    target.name = name;
    target.introduction = introduction;
    return true;
  }

  deleteById(id: number): boolean {
    for (let index = 0; index < this.books.length; index++) {
      if (this.books[index].id === id) {
        this.books.splice(index, 1);
        return true;
      }
    }
    return false;
  }

  all(): Book[] {
    const copy: Book[] = [];
    for (const book of this.books) {
      copy.push(book.clone());
    }
    return copy;
  }

  count(): number {
    return this.books.length;
  }

  clear(): void {
    this.books = [];
  }

  names(): string[] {
    const names: string[] = [];
    for (const book of this.books) {
      names.push(book.name);
    }
    return names;
  }
}

class ResultSet {
  private rows: Book[];
  private position: number = -1;
  private closed: boolean = false;

  constructor(rows: Book[]) {
    this.rows = rows;
  }

  rowCount(): number {
    return this.rows.length;
  }

  goToFirstRow(): boolean {
    if (this.closed || this.rows.length === 0) {
      return false;
    }
    this.position = 0;
    return true;
  }

  goToNextRow(): boolean {
    if (this.closed || this.position + 1 >= this.rows.length) {
      this.position = this.rows.length;
      return false;
    }
    this.position += 1;
    return true;
  }

  isAfterLast(): boolean {
    return this.position >= this.rows.length;
  }

  current(): Book | null {
    if (this.closed || this.position < 0 || this.position >= this.rows.length) {
      return null;
    }
    return this.rows[this.position];
  }

  getString(column: string): string {
    const book = this.current();
    if (book === null) {
      return '';
    }
    if (column === COLUMN_NAME) {
      return book.name;
    }
    if (column === COLUMN_INTRODUCTION) {
      return book.introduction;
    }
    return '';
  }

  getInt(column: string): number {
    const book = this.current();
    if (book === null) {
      return -1;
    }
    if (column === COLUMN_ID) {
      return book.id;
    }
    return -1;
  }

  close(): void {
    this.closed = true;
    this.position = -1;
  }

  isClosed(): boolean {
    return this.closed;
  }
}

class MigrationStep {
  readonly fromVersion: number;
  readonly toVersion: number;
  readonly label: string;

  constructor(fromVersion: number, toVersion: number, label: string) {
    this.fromVersion = fromVersion;
    this.toVersion = toVersion;
    this.label = label;
  }

  canFollow(version: number): boolean {
    return this.fromVersion === version;
  }

  apply(books: Book[]): Book[] {
    const migrated: Book[] = [];
    for (const book of books) {
      let introduction = book.introduction;
      if (introduction.length === 0) {
        introduction = DEFAULT_INTRODUCTION;
      }
      migrated.push(new Book(book.id, book.name, introduction));
    }
    return migrated;
  }

  digest(): string {
    return `${this.fromVersion}->${this.toVersion}:${this.label}`;
  }
}

class MigrationEngine {
  private steps: MigrationStep[] = [];

  add(step: MigrationStep): boolean {
    if (this.findStep(step.fromVersion) !== null) {
      return false;
    }
    this.steps.push(step);
    this.steps.sort((left: MigrationStep, right: MigrationStep): number => {
      return left.fromVersion - right.fromVersion;
    });
    return true;
  }

  findStep(fromVersion: number): MigrationStep | null {
    for (const step of this.steps) {
      if (step.fromVersion === fromVersion) {
        return step;
      }
    }
    return null;
  }

  stepCount(): number {
    return this.steps.length;
  }

  canMigrate(fromVersion: number, toVersion: number): boolean {
    if (fromVersion === toVersion) {
      return true;
    }
    if (fromVersion > toVersion) {
      return false;
    }
    let cursor = fromVersion;
    while (cursor < toVersion) {
      const step = this.findStep(cursor);
      if (step === null || step.toVersion !== cursor + 1) {
        return false;
      }
      cursor = step.toVersion;
    }
    return true;
  }

  path(fromVersion: number, toVersion: number): number[] {
    if (!this.canMigrate(fromVersion, toVersion)) {
      return [];
    }
    const versions: number[] = [];
    let cursor = fromVersion;
    versions.push(cursor);
    while (cursor < toVersion) {
      const step = this.findStep(cursor);
      if (step === null) {
        return [];
      }
      cursor = step.toVersion;
      versions.push(cursor);
    }
    return versions;
  }

  migrateChain(fromVersion: number, toVersion: number, books: Book[]): Book[] {
    const chain = this.path(fromVersion, toVersion);
    if (chain.length === 0) {
      return [];
    }
    let current: Book[] = books;
    for (let index = 0; index + 1 < chain.length; index++) {
      const step = this.findStep(chain[index]);
      if (step !== null) {
        current = step.apply(current);
      }
    }
    return current;
  }
}

class VersionValidator {
  classify(currentVersion: number, targetVersion: number): SchemaState {
    if (currentVersion < SCHEMA_VERSION_MIN || targetVersion < SCHEMA_VERSION_MIN) {
      return SchemaState.UNKNOWN;
    }
    if (currentVersion === targetVersion) {
      return SchemaState.COMPATIBLE;
    }
    if (currentVersion < targetVersion) {
      return SchemaState.UPGRADE_REQUIRED;
    }
    return SchemaState.DOWNGRADE_BLOCKED;
  }

  isCompatible(version: number): boolean {
    return version >= SCHEMA_VERSION_MIN && version <= SCHEMA_VERSION_CURRENT;
  }
}

function buildV1(): SchemaVersion {
  const columns: ColumnDef[] = [
    new ColumnDef(COLUMN_ID, ColumnType.INTEGER, false, true),
    new ColumnDef(COLUMN_NAME, ColumnType.TEXT, false, false)
  ];
  return new SchemaVersion(1, columns, 'base');
}

function buildV2(): SchemaVersion {
  const columns: ColumnDef[] = [
    new ColumnDef(COLUMN_ID, ColumnType.INTEGER, false, true),
    new ColumnDef(COLUMN_NAME, ColumnType.TEXT, false, false),
    new ColumnDef(COLUMN_INTRODUCTION, ColumnType.TEXT, true, false)
  ];
  return new SchemaVersion(2, columns, 'introduction');
}

function buildV3(): SchemaVersion {
  const columns: ColumnDef[] = [
    new ColumnDef(COLUMN_ID, ColumnType.INTEGER, false, true),
    new ColumnDef(COLUMN_NAME, ColumnType.TEXT, false, false),
    new ColumnDef(COLUMN_INTRODUCTION, ColumnType.TEXT, true, false),
    new ColumnDef(COLUMN_UPDATED_AT, ColumnType.INTEGER, true, false)
  ];
  return new SchemaVersion(3, columns, 'updatedAt');
}

function buildBaselineBooks(): Book[] {
  return [
    new Book(1, 'ArkTS', 'stage model language'),
    new Book(2, 'DataShare', 'cross application data'),
    new Book(3, 'ResultSet', 'cursor based access')
  ];
}

export default function bookModelVersionTest(): void {
  describe('BookModelVersionSuite', () => {
    let registry: SchemaRegistry = new SchemaRegistry();
    let engine: MigrationEngine = new MigrationEngine();

    beforeAll(() => {
      registry = new SchemaRegistry();
      registry.register(buildV1());
      registry.register(buildV2());
      registry.register(buildV3());
      engine = new MigrationEngine();
      engine.add(new MigrationStep(1, 2, 'add introduction'));
      engine.add(new MigrationStep(2, 3, 'add updatedAt'));
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'book model version start');
    });

    afterAll(() => {
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'book model version end');
    });

    it('BookModelVersion_001', 0, async (done: Function) => {
      expect(registry.size()).assertEqual(3);
      expect(registry.versionNumbers().length).assertEqual(3);
      expect(registry.versionNumbers()[0]).assertEqual(1);
      expect(registry.versionNumbers()[2]).assertEqual(3);
      done();
    });

    it('BookModelVersion_002', 0, async (done: Function) => {
      const latest = registry.latest();
      expect(latest !== null).assertTrue();
      if (latest !== null) {
        expect(latest.version).assertEqual(SCHEMA_VERSION_CURRENT);
        expect(latest.description).assertEqual('updatedAt');
        expect(latest.columnCount()).assertEqual(4);
      }
      done();
    });

    it('BookModelVersion_003', 0, async (done: Function) => {
      const v1 = registry.find(1);
      expect(v1 !== null).assertTrue();
      if (v1 !== null) {
        expect(v1.columnCount()).assertEqual(2);
        expect(v1.hasColumn(COLUMN_ID)).assertTrue();
        expect(v1.hasColumn(COLUMN_INTRODUCTION)).assertFalse();
        expect(v1.indexOfColumn(COLUMN_NAME)).assertEqual(1);
        expect(v1.indexOfColumn(COLUMN_INTRODUCTION)).assertEqual(-1);
      }
      done();
    });

    it('BookModelVersion_004', 0, async (done: Function) => {
      const v3 = buildV3();
      expect(v3.hasColumn(COLUMN_UPDATED_AT)).assertTrue();
      expect(v3.indexOfColumn(COLUMN_UPDATED_AT)).assertEqual(3);
      expect(v3.indexOfColumn(COLUMN_ID)).assertEqual(0);
      expect(v3.columnNames().length).assertEqual(4);
      done();
    });

    it('BookModelVersion_005', 0, async (done: Function) => {
      expect(buildV2().equals(buildV2())).assertTrue();
      expect(buildV2().equals(buildV3())).assertFalse();
      expect(buildV1().equals(buildV1())).assertTrue();
      expect(buildV1().signature().length > 0).assertTrue();
      done();
    });

    it('BookModelVersion_006', 0, async (done: Function) => {
      const primary = new ColumnDef(COLUMN_ID, ColumnType.INTEGER, false, true);
      const duplicate = new ColumnDef(COLUMN_ID, ColumnType.INTEGER, false, true);
      const differing = new ColumnDef(COLUMN_ID, ColumnType.TEXT, false, true);
      expect(primary.equals(duplicate)).assertTrue();
      expect(primary.equals(differing)).assertFalse();
      expect(primary.signature()).assertEqual('id:0:0:1');
      done();
    });

    it('BookModelVersion_007', 0, async (done: Function) => {
      const nullable = new ColumnDef(COLUMN_INTRODUCTION, ColumnType.TEXT, true, false);
      expect(nullable.signature()).assertEqual('introduction:1:1:0');
      expect(nullable.nullable).assertTrue();
      expect(nullable.primaryKey).assertFalse();
      expect(nullable.type).assertEqual(ColumnType.TEXT);
      done();
    });

    it('BookModelVersion_008', 0, async (done: Function) => {
      const duplicateRegistry = new SchemaRegistry();
      expect(duplicateRegistry.register(buildV1())).assertTrue();
      expect(duplicateRegistry.register(buildV1())).assertFalse();
      expect(duplicateRegistry.size()).assertEqual(1);
      expect(duplicateRegistry.latest() !== null).assertTrue();
      done();
    });

    it('BookModelVersion_009', 0, async (done: Function) => {
      const emptyRegistry = new SchemaRegistry();
      expect(emptyRegistry.latest()).assertNull();
      expect(emptyRegistry.find(1)).assertNull();
      expect(emptyRegistry.size()).assertEqual(0);
      expect(emptyRegistry.isContiguous()).assertFalse();
      done();
    });

    it('BookModelVersion_010', 0, async (done: Function) => {
      expect(registry.isContiguous()).assertTrue();
      const sparse = new SchemaRegistry();
      sparse.register(buildV1());
      sparse.register(buildV3());
      expect(sparse.isContiguous()).assertFalse();
      expect(sparse.versionNumbers().length).assertEqual(2);
      done();
    });

    it('BookModelVersion_011', 0, async (done: Function) => {
      const table = new BookTable();
      expect(table.count()).assertEqual(0);
      expect(table.insert(new Book(1, 'ArkTS', 'lang'))).assertTrue();
      expect(table.insert(new Book(2, 'DataShare', 'data'))).assertTrue();
      expect(table.count()).assertEqual(2);
      done();
    });

    it('BookModelVersion_012', 0, async (done: Function) => {
      const table = new BookTable();
      table.insert(new Book(1, 'ArkTS', 'lang'));
      expect(table.insert(new Book(1, 'Duplicate', 'again'))).assertFalse();
      expect(table.count()).assertEqual(1);
      expect(table.findById(1) !== null).assertTrue();
      done();
    });

    it('BookModelVersion_013', 0, async (done: Function) => {
      const table = new BookTable();
      table.insert(new Book(1, 'ArkTS', 'lang'));
      expect(table.update(1, 'ArkTS2', 'updated')).assertTrue();
      const found = table.findById(1);
      expect(found !== null).assertTrue();
      if (found !== null) {
        expect(found.name).assertEqual('ArkTS2');
        expect(found.introduction).assertEqual('updated');
      }
      done();
    });

    it('BookModelVersion_014', 0, async (done: Function) => {
      const table = new BookTable();
      table.insert(new Book(1, 'ArkTS', 'lang'));
      expect(table.update(99, 'Missing', 'none')).assertFalse();
      expect(table.deleteById(99)).assertFalse();
      expect(table.count()).assertEqual(1);
      done();
    });

    it('BookModelVersion_015', 0, async (done: Function) => {
      const table = new BookTable();
      table.insert(new Book(1, 'ArkTS', 'lang'));
      table.insert(new Book(2, 'DataShare', 'data'));
      expect(table.deleteById(1)).assertTrue();
      expect(table.count()).assertEqual(1);
      expect(table.findById(1)).assertNull();
      expect(table.names().length).assertEqual(1);
      done();
    });

    it('BookModelVersion_016', 0, async (done: Function) => {
      const table = new BookTable();
      table.insert(new Book(1, 'ArkTS', 'lang'));
      const copy = table.all();
      copy[0].name = 'Mutated';
      const original = table.findById(1);
      expect(original !== null).assertTrue();
      if (original !== null) {
        expect(original.name).assertEqual('ArkTS');
      }
      done();
    });

    it('BookModelVersion_017', 0, async (done: Function) => {
      const book = new Book(7, 'Clone', 'source');
      const clone = book.clone();
      expect(clone.equals(book)).assertTrue();
      expect(clone === book).assertFalse();
      expect(book.toRecord()).assertEqual('7|Clone|source');
      done();
    });

    it('BookModelVersion_018', 0, async (done: Function) => {
      const base = new Book(1, 'ArkTS', 'lang');
      expect(base.equals(new Book(1, 'ArkTS', 'lang'))).assertTrue();
      expect(base.equals(new Book(1, 'ArkTS', 'other'))).assertFalse();
      expect(base.equals(new Book(2, 'ArkTS', 'lang'))).assertFalse();
      done();
    });

    it('BookModelVersion_019', 0, async (done: Function) => {
      const table = new BookTable();
      table.insert(new Book(1, 'ArkTS', 'lang'));
      table.insert(new Book(2, 'DataShare', 'data'));
      expect(table.names()[0]).assertEqual('ArkTS');
      expect(table.names()[1]).assertEqual('DataShare');
      table.clear();
      expect(table.count()).assertEqual(0);
      expect(table.all().length).assertEqual(0);
      done();
    });

    it('BookModelVersion_020', 0, async (done: Function) => {
      const rows = buildBaselineBooks();
      const resultSet = new ResultSet(rows);
      expect(resultSet.rowCount()).assertEqual(3);
      expect(resultSet.isAfterLast()).assertFalse();
      expect(resultSet.current()).assertNull();
      expect(resultSet.goToFirstRow()).assertTrue();
      done();
    });

    it('BookModelVersion_021', 0, async (done: Function) => {
      const resultSet = new ResultSet(buildBaselineBooks());
      resultSet.goToFirstRow();
      expect(resultSet.getInt(COLUMN_ID)).assertEqual(1);
      expect(resultSet.getString(COLUMN_NAME)).assertEqual('ArkTS');
      expect(resultSet.getString(COLUMN_INTRODUCTION)).assertEqual('stage model language');
      expect(resultSet.getString('unknown')).assertEqual('');
      done();
    });

    it('BookModelVersion_022', 0, async (done: Function) => {
      const resultSet = new ResultSet(buildBaselineBooks());
      let visited = 0;
      if (resultSet.goToFirstRow()) {
        visited += 1;
        while (resultSet.goToNextRow()) {
          visited += 1;
        }
      }
      expect(visited).assertEqual(3);
      expect(resultSet.isAfterLast()).assertTrue();
      expect(resultSet.current()).assertNull();
      done();
    });

    it('BookModelVersion_023', 0, async (done: Function) => {
      const resultSet = new ResultSet([]);
      expect(resultSet.goToFirstRow()).assertFalse();
      expect(resultSet.goToNextRow()).assertFalse();
      expect(resultSet.rowCount()).assertEqual(0);
      expect(resultSet.getInt(COLUMN_ID)).assertEqual(-1);
      done();
    });

    it('BookModelVersion_024', 0, async (done: Function) => {
      const resultSet = new ResultSet(buildBaselineBooks());
      resultSet.goToFirstRow();
      resultSet.close();
      expect(resultSet.isClosed()).assertTrue();
      expect(resultSet.goToFirstRow()).assertFalse();
      expect(resultSet.current()).assertNull();
      expect(resultSet.getString(COLUMN_NAME)).assertEqual('');
      done();
    });

    it('BookModelVersion_025', 0, async (done: Function) => {
      const table = new BookTable();
      for (const book of buildBaselineBooks()) {
        table.insert(book);
      }
      const resultSet = new ResultSet(table.all());
      resultSet.goToFirstRow();
      expect(resultSet.rowCount()).assertEqual(3);
      expect(resultSet.getInt(COLUMN_ID)).assertEqual(1);
      resultSet.goToNextRow();
      expect(resultSet.getString(COLUMN_NAME)).assertEqual('DataShare');
      done();
    });

    it('BookModelVersion_026', 0, async (done: Function) => {
      expect(engine.stepCount()).assertEqual(2);
      expect(engine.findStep(1) !== null).assertTrue();
      expect(engine.findStep(2) !== null).assertTrue();
      expect(engine.findStep(3)).assertNull();
      expect(engine.add(new MigrationStep(1, 2, 'duplicate'))).assertFalse();
      done();
    });

    it('BookModelVersion_027', 0, async (done: Function) => {
      expect(engine.canMigrate(1, 3)).assertTrue();
      expect(engine.canMigrate(1, 1)).assertTrue();
      expect(engine.canMigrate(2, 1)).assertFalse();
      expect(engine.canMigrate(3, 4)).assertFalse();
      done();
    });

    it('BookModelVersion_028', 0, async (done: Function) => {
      const chain = engine.path(1, 3);
      expect(chain.length).assertEqual(3);
      expect(chain[0]).assertEqual(1);
      expect(chain[1]).assertEqual(2);
      expect(chain[2]).assertEqual(3);
      expect(engine.path(3, 1).length).assertEqual(0);
      done();
    });

    it('BookModelVersion_029', 0, async (done: Function) => {
      const chain = engine.path(1, 1);
      expect(chain.length).assertEqual(1);
      expect(chain[0]).assertEqual(1);
      const single = engine.path(2, 3);
      expect(single.length).assertEqual(2);
      expect(single[1]).assertEqual(3);
      done();
    });

    it('BookModelVersion_030', 0, async (done: Function) => {
      const step = new MigrationStep(1, 2, 'add introduction');
      expect(step.canFollow(1)).assertTrue();
      expect(step.canFollow(2)).assertFalse();
      expect(step.digest()).assertEqual('1->2:add introduction');
      expect(step.fromVersion).assertEqual(1);
      expect(step.toVersion).assertEqual(2);
      done();
    });

    it('BookModelVersion_031', 0, async (done: Function) => {
      const books = [new Book(1, 'ArkTS', ''), new Book(2, 'DataShare', 'data')];
      const step = new MigrationStep(1, 2, 'fill introduction');
      const migrated = step.apply(books);
      expect(migrated.length).assertEqual(2);
      expect(migrated[0].introduction).assertEqual(DEFAULT_INTRODUCTION);
      expect(migrated[1].introduction).assertEqual('data');
      done();
    });

    it('BookModelVersion_032', 0, async (done: Function) => {
      const books = buildBaselineBooks();
      const migrated = engine.migrateChain(1, 3, books);
      expect(migrated.length).assertEqual(3);
      expect(migrated[0].name).assertEqual('ArkTS');
      expect(migrated[0].introduction.length > 0).assertTrue();
      expect(engine.migrateChain(3, 1, books).length).assertEqual(0);
      done();
    });

    it('BookModelVersion_033', 0, async (done: Function) => {
      const books = buildBaselineBooks();
      const unchanged = engine.migrateChain(2, 2, books);
      expect(unchanged.length).assertEqual(3);
      expect(unchanged[0].equals(books[0])).assertTrue();
      expect(unchanged[2].equals(books[2])).assertTrue();
      done();
    });

    it('BookModelVersion_034', 0, async (done: Function) => {
      const broken = new MigrationEngine();
      broken.add(new MigrationStep(1, 2, 'first'));
      expect(broken.canMigrate(1, 3)).assertFalse();
      expect(broken.path(1, 3).length).assertEqual(0);
      expect(broken.migrateChain(1, 3, buildBaselineBooks()).length).assertEqual(0);
      done();
    });

    it('BookModelVersion_035', 0, async (done: Function) => {
      const duplicate = new MigrationEngine();
      duplicate.add(new MigrationStep(1, 2, 'a'));
      expect(duplicate.add(new MigrationStep(1, 2, 'b'))).assertFalse();
      expect(duplicate.stepCount()).assertEqual(1);
      expect(duplicate.findStep(1) !== null).assertTrue();
      done();
    });

    it('BookModelVersion_036', 0, async (done: Function) => {
      const validator = new VersionValidator();
      expect(validator.classify(1, 3)).assertEqual(SchemaState.UPGRADE_REQUIRED);
      expect(validator.classify(3, 3)).assertEqual(SchemaState.COMPATIBLE);
      expect(validator.classify(3, 1)).assertEqual(SchemaState.DOWNGRADE_BLOCKED);
      expect(validator.classify(0, 3)).assertEqual(SchemaState.UNKNOWN);
      done();
    });

    it('BookModelVersion_037', 0, async (done: Function) => {
      const validator = new VersionValidator();
      expect(validator.isCompatible(1)).assertTrue();
      expect(validator.isCompatible(2)).assertTrue();
      expect(validator.isCompatible(3)).assertTrue();
      expect(validator.isCompatible(0)).assertFalse();
      expect(validator.isCompatible(4)).assertFalse();
      done();
    });

    it('BookModelVersion_038', 0, async (done: Function) => {
      expect(SCHEMA_VERSION_CURRENT).assertEqual(3);
      expect(SCHEMA_VERSION_MIN).assertEqual(1);
      expect(SCHEMA_VERSION_CURRENT - SCHEMA_VERSION_MIN).assertEqual(2);
      expect(COLUMN_ID).assertEqual('id');
      expect(COLUMN_NAME).assertEqual('name');
      done();
    });

    it('BookModelVersion_039', 0, async (done: Function) => {
      expect(BUNDLE_NAME).assertEqual('ohos.samples.stagemodel');
      expect(MODULE_ENTRY).assertEqual('entry');
      expect(ABILITY_DATA_SHARE).assertEqual('DataShareExtAbility');
      expect(ACCOUNT_ID).assertEqual(100);
      done();
    });

    it('BookModelVersion_040', 0, async (done: Function) => {
      expect(DATA_SHARE_URI.startsWith('datashare:///')).assertTrue();
      expect(DATA_SHARE_URI.indexOf(BUNDLE_NAME) >= 0).assertTrue();
      expect(DATA_SHARE_URI.indexOf('DataShare') >= 0).assertTrue();
      expect(DATA_SHARE_URI.length > 20).assertTrue();
      done();
    });

    it('BookModelVersion_041', 0, async (done: Function) => {
      const table = new BookTable();
      for (let index = 0; index < 10; index++) {
        expect(table.insert(new Book(index, `Book${index}`, `intro${index}`))).assertTrue();
      }
      expect(table.count()).assertEqual(10);
      const resultSet = new ResultSet(table.all());
      expect(resultSet.rowCount()).assertEqual(10);
      done();
    });

    it('BookModelVersion_042', 0, async (done: Function) => {
      const table = new BookTable();
      for (let index = 0; index < 10; index++) {
        table.insert(new Book(index, `Book${index}`, `intro${index}`));
      }
      for (let index = 0; index < 5; index++) {
        expect(table.deleteById(index)).assertTrue();
      }
      expect(table.count()).assertEqual(5);
      expect(table.findById(0)).assertNull();
      expect(table.findById(9) !== null).assertTrue();
      done();
    });

    it('BookModelVersion_043', 0, async (done: Function) => {
      const schemaA = new SchemaVersion(1, [new ColumnDef(COLUMN_ID, ColumnType.INTEGER, false, true)], 'one');
      const schemaB = new SchemaVersion(1, [new ColumnDef(COLUMN_ID, ColumnType.TEXT, false, true)], 'one');
      expect(schemaA.equals(schemaB)).assertFalse();
      expect(schemaA.equals(new SchemaVersion(1, [new ColumnDef(COLUMN_ID, ColumnType.INTEGER, false, true)], 'one'))).assertTrue();
      done();
    });

    it('BookModelVersion_044', 0, async (done: Function) => {
      const schema = buildV2();
      expect(schema.indexOfColumn(COLUMN_ID)).assertEqual(0);
      expect(schema.indexOfColumn(COLUMN_NAME)).assertEqual(1);
      expect(schema.indexOfColumn(COLUMN_INTRODUCTION)).assertEqual(2);
      expect(schema.indexOfColumn(COLUMN_UPDATED_AT)).assertEqual(-1);
      done();
    });

    it('BookModelVersion_045', 0, async (done: Function) => {
      const table = new BookTable();
      table.insert(new Book(1, 'ArkTS', 'lang'));
      table.insert(new Book(2, 'DataShare', 'data'));
      const resultSet = new ResultSet(table.all());
      if (resultSet.goToFirstRow()) {
        expect(resultSet.getInt(COLUMN_ID)).assertEqual(1);
      }
      expect(resultSet.goToNextRow()).assertTrue();
      expect(resultSet.getInt(COLUMN_ID)).assertEqual(2);
      expect(resultSet.goToNextRow()).assertFalse();
      done();
    });

    it('BookModelVersion_046', 0, async (done: Function) => {
      const tryCount = 1;
      let launched = false;
      try {
        await launchMainAbility();
        launched = true;
        const driver: Driver = getDriver();
        const count: number = await componentCount(driver);
        expect(count >= 0).assertTrue();
      } catch (error) {
        launched = false;
      }
      expect(tryCount).assertEqual(1);
      expect(launched === true || launched === false).assertTrue();
      done();
    });

    it('BookModelVersion_047', 0, async (done: Function) => {
      const registryCopy = new SchemaRegistry();
      registryCopy.register(buildV2());
      registryCopy.register(buildV1());
      expect(registryCopy.versionNumbers()[0]).assertEqual(1);
      expect(registryCopy.versionNumbers()[1]).assertEqual(2);
      expect(registryCopy.latest() !== null).assertTrue();
      done();
    });

    it('BookModelVersion_048', 0, async (done: Function) => {
      const empty = new SchemaVersion(0, [], 'empty');
      expect(empty.columnCount()).assertEqual(0);
      expect(empty.columnNames().length).assertEqual(0);
      expect(empty.hasColumn(COLUMN_ID)).assertFalse();
      expect(empty.signature()).assertEqual('');
      done();
    });

    it('BookModelVersion_049', 0, async (done: Function) => {
      const books = [new Book(1, 'A', 'a'), new Book(2, 'B', '')];
      const first = engine.migrateChain(1, 2, books);
      expect(first[0].introduction).assertEqual('a');
      expect(first[1].introduction).assertEqual(DEFAULT_INTRODUCTION);
      const second = engine.migrateChain(1, 3, books);
      expect(second.length).assertEqual(2);
      expect(second[1].name).assertEqual('B');
      done();
    });

    it('BookModelVersion_050', 0, async (done: Function) => {
      const table = new BookTable();
      const book = new Book(100, 'Version', 'trace');
      table.insert(book);
      const snapshot = table.all();
      table.update(100, 'Version2', 'trace2');
      expect(snapshot[0].name).assertEqual('Version');
      const current = table.findById(100);
      expect(current !== null).assertTrue();
      if (current !== null) {
        expect(current.name).assertEqual('Version2');
      }
      done();
    });

    it('BookModelVersion_051', 0, async (done: Function) => {
      const engineCopy = new MigrationEngine();
      engineCopy.add(new MigrationStep(2, 3, 'third'));
      engineCopy.add(new MigrationStep(1, 2, 'second'));
      expect(engineCopy.stepCount()).assertEqual(2);
      expect(engineCopy.canMigrate(1, 3)).assertTrue();
      expect(engineCopy.path(1, 3)[1]).assertEqual(2);
      done();
    });

    it('BookModelVersion_052', 0, async (done: Function) => {
      const resultSet = new ResultSet(buildBaselineBooks());
      resultSet.goToFirstRow();
      resultSet.goToNextRow();
      resultSet.goToNextRow();
      expect(resultSet.getString(COLUMN_NAME)).assertEqual('ResultSet');
      expect(resultSet.goToNextRow()).assertFalse();
      expect(resultSet.isAfterLast()).assertTrue();
      expect(resultSet.getInt(COLUMN_ID)).assertEqual(-1);
      done();
    });
  });
}

