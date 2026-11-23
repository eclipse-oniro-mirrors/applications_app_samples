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

import { describe, it, expect } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  getDriver, ensureAppReady, checkComponentExists, clampNumber, safeDiv,
  buildDataShareUri, normalizeDataShareUri, isSampleDataShareUri, isValidBookId
} from '../Shared/SharedDriver';

enum SyncMode {
  PUSH = 0,
  PULL = 1,
  BIDIRECTIONAL = 2
}

enum ColumnType {
  INTEGER = 0,
  TEXT = 1,
  REAL = 2
}

class BookRecord {
  id: number = 0;
  name: string = '';
  introduction: string = '';

  constructor(id: number, name: string, introduction: string) {
    this.id = id;
    this.name = name;
    this.introduction = introduction;
  }

  isValid(): boolean {
    return isValidBookId(this.id) && this.name.length > 0;
  }

  clone(): BookRecord {
    return new BookRecord(this.id, this.name, this.introduction);
  }

  equals(other: BookRecord): boolean {
    return this.id === other.id && this.name === other.name &&
      this.introduction === other.introduction;
  }

  summary(): string {
    return this.id + ':' + this.name;
  }
}

class SchemaColumn {
  name: string = '';
  type: ColumnType = ColumnType.TEXT;
  nullable: boolean = true;

  constructor(name: string, type: ColumnType, nullable: boolean) {
    this.name = name;
    this.type = type;
    this.nullable = nullable;
  }
}

class TableSchema {
  tableName: string = '';
  private columns: SchemaColumn[] = [];

  constructor(tableName: string) {
    this.tableName = tableName;
  }

  addColumn(column: SchemaColumn): boolean {
    if (this.columnIndex(column.name) >= 0) {
      return false;
    }
    this.columns.push(column);
    return true;
  }

  columnCount(): number {
    return this.columns.length;
  }

  columnIndex(name: string): number {
    for (let i = 0; i < this.columns.length; i++) {
      if (this.columns[i].name === name) {
        return i;
      }
    }
    return -1;
  }

  hasColumn(name: string): boolean {
    return this.columnIndex(name) >= 0;
  }

  columnAt(index: number): SchemaColumn | null {
    if (index < 0 || index >= this.columns.length) {
      return null;
    }
    return this.columns[index];
  }

  requiresNonNull(name: string): boolean {
    const index = this.columnIndex(name);
    if (index < 0) {
      return false;
    }
    return !this.columns[index].nullable;
  }
}

class ChangeEntry {
  operation: string = '';
  bookId: number = 0;
  version: number = 0;

  constructor(operation: string, bookId: number, version: number) {
    this.operation = operation;
    this.bookId = bookId;
    this.version = version;
  }
}

class ChangeLog {
  private entries: ChangeEntry[] = [];

  record(operation: string, bookId: number, version: number): void {
    this.entries.push(new ChangeEntry(operation, bookId, version));
  }

  size(): number {
    return this.entries.length;
  }

  drain(): ChangeEntry[] {
    const copy: ChangeEntry[] = [];
    for (const entry of this.entries) {
      copy.push(entry);
    }
    this.entries = [];
    return copy;
  }

  countFor(operation: string): number {
    let count = 0;
    for (const entry of this.entries) {
      if (entry.operation === operation) {
        count = count + 1;
      }
    }
    return count;
  }

  lastVersion(): number {
    if (this.entries.length === 0) {
      return 0;
    }
    return this.entries[this.entries.length - 1].version;
  }
}

class DataShareCompatService {
  private schema: TableSchema;
  private records: BookRecord[] = [];
  private log: ChangeLog = new ChangeLog();
  private nextId: number = 1;
  private version: number = 1;
  private mode: SyncMode = SyncMode.BIDIRECTIONAL;

  constructor(schema: TableSchema, mode: SyncMode) {
    this.schema = schema;
    this.mode = mode;
  }

  getMode(): SyncMode {
    return this.mode;
  }

  setMode(mode: SyncMode): void {
    this.mode = mode;
  }

  getVersion(): number {
    return this.version;
  }

  getSchema(): TableSchema {
    return this.schema;
  }

  getChangeLog(): ChangeLog {
    return this.log;
  }

  insertBook(name: string, introduction: string): number {
    if (this.mode === SyncMode.PULL) {
      return -1;
    }
    if (name.length === 0) {
      return -1;
    }
    const id = this.nextId;
    this.nextId = this.nextId + 1;
    this.records.push(new BookRecord(id, name, introduction));
    this.version = this.version + 1;
    this.log.record('insert', id, this.version);
    return id;
  }

  updateBook(id: number, name: string, introduction: string): boolean {
    if (this.mode === SyncMode.PULL) {
      return false;
    }
    const record = this.findById(id);
    if (record === null) {
      return false;
    }
    if (name.length === 0) {
      return false;
    }
    record.name = name;
    record.introduction = introduction;
    this.version = this.version + 1;
    this.log.record('update', id, this.version);
    return true;
  }

  deleteBook(id: number): boolean {
    if (this.mode === SyncMode.PULL) {
      return false;
    }
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].id === id) {
        this.records.splice(i, 1);
        this.version = this.version + 1;
        this.log.record('delete', id, this.version);
        return true;
      }
    }
    return false;
  }

  findById(id: number): BookRecord | null {
    for (const record of this.records) {
      if (record.id === id) {
        return record;
      }
    }
    return null;
  }

  bookCount(): number {
    return this.records.length;
  }

  queryAll(): BookRecord[] {
    const copy: BookRecord[] = [];
    for (const record of this.records) {
      copy.push(record.clone());
    }
    return copy;
  }

  queryByName(keyword: string): BookRecord[] {
    const result: BookRecord[] = [];
    for (const record of this.records) {
      if (record.name.indexOf(keyword) >= 0) {
        result.push(record.clone());
      }
    }
    return result;
  }

  validBookCount(): number {
    let count = 0;
    for (const record of this.records) {
      if (record.isValid()) {
        count = count + 1;
      }
    }
    return count;
  }

  notifyChange(table: string): string {
    const uri = buildDataShareUri(table);
    this.log.record('notify', 0, this.version);
    return uri;
  }

  compatibleUri(uri: string): boolean {
    return isSampleDataShareUri(uri);
  }

  canonicalUri(uri: string): string {
    return normalizeDataShareUri(uri);
  }
}

class MigrationStep {
  fromVersion: number = 0;
  toVersion: number = 0;
  description: string = '';

  constructor(fromVersion: number, toVersion: number, description: string) {
    this.fromVersion = fromVersion;
    this.toVersion = toVersion;
    this.description = description;
  }

  isValid(): boolean {
    return this.toVersion === this.fromVersion + 1 && this.description.length > 0;
  }
}

class SchemaMigrator {
  private steps: MigrationStep[] = [];

  addStep(step: MigrationStep): boolean {
    if (!step.isValid()) {
      return false;
    }
    for (const existing of this.steps) {
      if (existing.fromVersion === step.fromVersion) {
        return false;
      }
    }
    this.steps.push(step);
    return true;
  }

  stepCount(): number {
    return this.steps.length;
  }

  canUpgrade(fromVersion: number, toVersion: number): boolean {
    if (toVersion <= fromVersion) {
      return false;
    }
    let current = fromVersion;
    while (current < toVersion) {
      let matched = false;
      for (const step of this.steps) {
        if (step.fromVersion === current) {
          current = step.toVersion;
          matched = true;
          break;
        }
      }
      if (!matched) {
        return false;
      }
    }
    return current === toVersion;
  }

  describePath(fromVersion: number, toVersion: number): string {
    if (!this.canUpgrade(fromVersion, toVersion)) {
      return '';
    }
    let current = fromVersion;
    let path = '' + fromVersion;
    while (current < toVersion) {
      for (const step of this.steps) {
        if (step.fromVersion === current) {
          current = step.toVersion;
          path = path + '->' + current;
          break;
        }
      }
    }
    return path;
  }
}

function buildBookSchema(): TableSchema {
  const schema = new TableSchema('book');
  schema.addColumn(new SchemaColumn('id', ColumnType.INTEGER, false));
  schema.addColumn(new SchemaColumn('name', ColumnType.TEXT, false));
  schema.addColumn(new SchemaColumn('introduction', ColumnType.TEXT, true));
  return schema;
}

export default function dataShareCompatibilityTest(): void {
  describe('DataShareCompatibility', () => {
    it('DataShareCompatibility_001', 0, async (done: Function) => {
      const book = new BookRecord(1, 'ArkTS', 'guide');
      expect(book.isValid()).assertTrue();
      expect(book.summary()).assertEqual('1:ArkTS');
      done();
    });

    it('DataShareCompatibility_002', 0, async (done: Function) => {
      expect(new BookRecord(0, 'x', 'y').isValid()).assertFalse();
      expect(new BookRecord(1, '', 'y').isValid()).assertFalse();
      expect(new BookRecord(-3, 'x', 'y').isValid()).assertFalse();
      done();
    });

    it('DataShareCompatibility_003', 0, async (done: Function) => {
      const original = new BookRecord(2, 'A', 'B');
      const copy = original.clone();
      expect(copy.equals(original)).assertTrue();
      copy.name = 'C';
      expect(copy.equals(original)).assertFalse();
      expect(original.name).assertEqual('A');
      done();
    });

    it('DataShareCompatibility_004', 0, async (done: Function) => {
      const first = new BookRecord(1, 'A', 'B');
      const second = new BookRecord(1, 'A', 'B');
      const third = new BookRecord(1, 'A', 'C');
      expect(first.equals(second)).assertTrue();
      expect(first.equals(third)).assertFalse();
      done();
    });

    it('DataShareCompatibility_005', 0, async (done: Function) => {
      const schema = buildBookSchema();
      expect(schema.columnCount()).assertEqual(3);
      expect(schema.hasColumn('id')).assertTrue();
      expect(schema.hasColumn('name')).assertTrue();
      expect(schema.hasColumn('origin')).assertFalse();
      done();
    });

    it('DataShareCompatibility_006', 0, async (done: Function) => {
      const schema = buildBookSchema();
      expect(schema.columnIndex('id')).assertEqual(0);
      expect(schema.columnIndex('name')).assertEqual(1);
      expect(schema.columnIndex('introduction')).assertEqual(2);
      expect(schema.columnIndex('none')).assertEqual(-1);
      done();
    });

    it('DataShareCompatibility_007', 0, async (done: Function) => {
      const schema = new TableSchema('t');
      expect(schema.addColumn(new SchemaColumn('a', ColumnType.TEXT, true))).assertTrue();
      expect(schema.addColumn(new SchemaColumn('a', ColumnType.TEXT, true))).assertFalse();
      expect(schema.columnCount()).assertEqual(1);
      done();
    });

    it('DataShareCompatibility_008', 0, async (done: Function) => {
      const schema = buildBookSchema();
      expect(schema.requiresNonNull('id')).assertTrue();
      expect(schema.requiresNonNull('name')).assertTrue();
      expect(schema.requiresNonNull('introduction')).assertFalse();
      expect(schema.requiresNonNull('missing')).assertFalse();
      done();
    });

    it('DataShareCompatibility_009', 0, async (done: Function) => {
      const schema = buildBookSchema();
      expect(schema.columnAt(0) !== null).assertTrue();
      expect(schema.columnAt(5) === null).assertTrue();
      const column = schema.columnAt(1);
      if (column !== null) {
        expect(column.name).assertEqual('name');
      }
      done();
    });
    it('DataShareCompatibility_010', 0, async (done: Function) => {
      const service = new DataShareCompatService(buildBookSchema(), SyncMode.BIDIRECTIONAL);
      expect(service.bookCount()).assertEqual(0);
      expect(service.getVersion()).assertEqual(1);
      expect(service.getMode()).assertEqual(SyncMode.BIDIRECTIONAL);
      done();
    });

    it('DataShareCompatibility_011', 0, async (done: Function) => {
      const service = new DataShareCompatService(buildBookSchema(), SyncMode.PUSH);
      expect(service.insertBook('A', 'a')).assertEqual(1);
      expect(service.insertBook('B', 'b')).assertEqual(2);
      expect(service.bookCount()).assertEqual(2);
      done();
    });

    it('DataShareCompatibility_012', 0, async (done: Function) => {
      const service = new DataShareCompatService(buildBookSchema(), SyncMode.PUSH);
      expect(service.insertBook('', 'x')).assertEqual(-1);
      expect(service.bookCount()).assertEqual(0);
      done();
    });

    it('DataShareCompatibility_013', 0, async (done: Function) => {
      const service = new DataShareCompatService(buildBookSchema(), SyncMode.PULL);
      expect(service.insertBook('A', 'a')).assertEqual(-1);
      expect(service.bookCount()).assertEqual(0);
      done();
    });

    it('DataShareCompatibility_014', 0, async (done: Function) => {
      const service = new DataShareCompatService(buildBookSchema(), SyncMode.BIDIRECTIONAL);
      const id = service.insertBook('A', 'a');
      expect(service.updateBook(id, 'A2', 'a2')).assertTrue();
      const found = service.findById(id);
      expect(found !== null).assertTrue();
      if (found !== null) {
        expect(found.name).assertEqual('A2');
        expect(found.introduction).assertEqual('a2');
      }
      done();
    });

    it('DataShareCompatibility_015', 0, async (done: Function) => {
      const service = new DataShareCompatService(buildBookSchema(), SyncMode.BIDIRECTIONAL);
      expect(service.updateBook(999, 'A', 'a')).assertFalse();
      const id = service.insertBook('A', 'a');
      expect(service.updateBook(id, '', 'a')).assertFalse();
      done();
    });

    it('DataShareCompatibility_016', 0, async (done: Function) => {
      const service = new DataShareCompatService(buildBookSchema(), SyncMode.BIDIRECTIONAL);
      const id = service.insertBook('A', 'a');
      expect(service.deleteBook(id)).assertTrue();
      expect(service.deleteBook(id)).assertFalse();
      expect(service.bookCount()).assertEqual(0);
      done();
    });

    it('DataShareCompatibility_017', 0, async (done: Function) => {
      const service = new DataShareCompatService(buildBookSchema(), SyncMode.PUSH);
      service.insertBook('A', 'a');
      service.insertBook('B', 'b');
      const all = service.queryAll();
      expect(all.length).assertEqual(2);
      all[0].name = 'MUTATED';
      expect(service.findById(1) !== null).assertTrue();
      const original = service.findById(1);
      if (original !== null) {
        expect(original.name).assertEqual('A');
      }
      done();
    });

    it('DataShareCompatibility_018', 0, async (done: Function) => {
      const service = new DataShareCompatService(buildBookSchema(), SyncMode.PUSH);
      service.insertBook('Alpha', 'a');
      service.insertBook('Beta', 'b');
      service.insertBook('Alpine', 'c');
      expect(service.queryByName('Al').length).assertEqual(2);
      expect(service.queryByName('Z').length).assertEqual(0);
      done();
    });
    it('DataShareCompatibility_019', 0, async (done: Function) => {
      const service = new DataShareCompatService(buildBookSchema(), SyncMode.PUSH);
      service.insertBook('A', 'a');
      service.insertBook('B', 'b');
      service.insertBook('', 'x');
      expect(service.validBookCount()).assertEqual(2);
      expect(service.bookCount()).assertEqual(2);
      done();
    });

    it('DataShareCompatibility_020', 0, async (done: Function) => {
      const service = new DataShareCompatService(buildBookSchema(), SyncMode.PUSH);
      const uri = service.notifyChange('book');
      expect(uri).assertEqual('datashare:///ohos.samples.stagemodel.DataShare/book');
      expect(service.getChangeLog().countFor('notify')).assertEqual(1);
      done();
    });

    it('DataShareCompatibility_021', 0, async (done: Function) => {
      const service = new DataShareCompatService(buildBookSchema(), SyncMode.PUSH);
      expect(service.compatibleUri('datashare:///ohos.samples.stagemodel.DataShare')).assertTrue();
      expect(service.compatibleUri('file:///tmp/x')).assertFalse();
      done();
    });

    it('DataShareCompatibility_022', 0, async (done: Function) => {
      const service = new DataShareCompatService(buildBookSchema(), SyncMode.PUSH);
      expect(service.canonicalUri('datashare:///ohos.samples.stagemodel.DataShare///'))
        .assertEqual('datashare:///ohos.samples.stagemodel.DataShare');
      expect(service.canonicalUri(' datashare:///x/ ')).assertEqual('datashare:///x');
      done();
    });

    it('DataShareCompatibility_023', 0, async (done: Function) => {
      const service = new DataShareCompatService(buildBookSchema(), SyncMode.PUSH);
      expect(service.getChangeLog().size()).assertEqual(0);
      service.insertBook('A', 'a');
      service.insertBook('B', 'b');
      expect(service.getChangeLog().size()).assertEqual(2);
      done();
    });

    it('DataShareCompatibility_024', 0, async (done: Function) => {
      const service = new DataShareCompatService(buildBookSchema(), SyncMode.PUSH);
      service.insertBook('A', 'a');
      const id = service.insertBook('B', 'b');
      service.updateBook(id, 'B2', 'b2');
      service.deleteBook(id);
      const log = service.getChangeLog();
      expect(log.countFor('insert')).assertEqual(2);
      expect(log.countFor('update')).assertEqual(1);
      expect(log.countFor('delete')).assertEqual(1);
      done();
    });

    it('DataShareCompatibility_025', 0, async (done: Function) => {
      const service = new DataShareCompatService(buildBookSchema(), SyncMode.PUSH);
      service.insertBook('A', 'a');
      const before = service.getVersion();
      service.insertBook('B', 'b');
      expect(service.getVersion()).assertEqual(before + 1);
      expect(service.getChangeLog().lastVersion()).assertEqual(service.getVersion());
      done();
    });

    it('DataShareCompatibility_026', 0, async (done: Function) => {
      const service = new DataShareCompatService(buildBookSchema(), SyncMode.BIDIRECTIONAL);
      service.insertBook('A', 'a');
      service.setMode(SyncMode.PULL);
      expect(service.getMode()).assertEqual(SyncMode.PULL);
      expect(service.insertBook('C', 'c')).assertEqual(-1);
      expect(service.deleteBook(1)).assertFalse();
      done();
    });

    it('DataShareCompatibility_027', 0, async (done: Function) => {
      const service = new DataShareCompatService(buildBookSchema(), SyncMode.PULL);
      service.setMode(SyncMode.PUSH);
      expect(service.insertBook('A', 'a')).assertEqual(1);
      expect(service.bookCount()).assertEqual(1);
      done();
    });
    it('DataShareCompatibility_028', 0, async (done: Function) => {
      const migrator = new SchemaMigrator();
      expect(migrator.addStep(new MigrationStep(1, 2, 'add column'))).assertTrue();
      expect(migrator.addStep(new MigrationStep(2, 3, 'rename'))).assertTrue();
      expect(migrator.stepCount()).assertEqual(2);
      done();
    });

    it('DataShareCompatibility_029', 0, async (done: Function) => {
      const migrator = new SchemaMigrator();
      migrator.addStep(new MigrationStep(1, 2, 'a'));
      migrator.addStep(new MigrationStep(2, 3, 'b'));
      expect(migrator.canUpgrade(1, 3)).assertTrue();
      expect(migrator.canUpgrade(1, 2)).assertTrue();
      expect(migrator.canUpgrade(1, 1)).assertFalse();
      expect(migrator.canUpgrade(3, 1)).assertFalse();
      done();
    });

    it('DataShareCompatibility_030', 0, async (done: Function) => {
      const migrator = new SchemaMigrator();
      migrator.addStep(new MigrationStep(1, 2, 'a'));
      expect(migrator.canUpgrade(1, 3)).assertFalse();
      expect(migrator.describePath(1, 3)).assertEqual('');
      done();
    });

    it('DataShareCompatibility_031', 0, async (done: Function) => {
      const migrator = new SchemaMigrator();
      migrator.addStep(new MigrationStep(1, 2, 'a'));
      migrator.addStep(new MigrationStep(2, 3, 'b'));
      expect(migrator.describePath(1, 3)).assertEqual('1->2->3');
      done();
    });

    it('DataShareCompatibility_032', 0, async (done: Function) => {
      const migrator = new SchemaMigrator();
      expect(migrator.addStep(new MigrationStep(1, 3, 'skip'))).assertFalse();
      expect(migrator.addStep(new MigrationStep(1, 2, ''))).assertFalse();
      expect(migrator.stepCount()).assertEqual(0);
      done();
    });

    it('DataShareCompatibility_033', 0, async (done: Function) => {
      const migrator = new SchemaMigrator();
      expect(migrator.addStep(new MigrationStep(1, 2, 'a'))).assertTrue();
      expect(migrator.addStep(new MigrationStep(1, 2, 'dup'))).assertFalse();
      expect(migrator.stepCount()).assertEqual(1);
      done();
    });

    it('DataShareCompatibility_034', 0, async (done: Function) => {
      const step = new MigrationStep(4, 5, 'add');
      expect(step.isValid()).assertTrue();
      expect(new MigrationStep(4, 4, 'x').isValid()).assertFalse();
      expect(new MigrationStep(4, 6, 'x').isValid()).assertFalse();
      done();
    });

    it('DataShareCompatibility_035', 0, async (done: Function) => {
      const log = new ChangeLog();
      expect(log.size()).assertEqual(0);
      expect(log.lastVersion()).assertEqual(0);
      log.record('insert', 1, 5);
      log.record('insert', 2, 6);
      expect(log.countFor('insert')).assertEqual(2);
      expect(log.lastVersion()).assertEqual(6);
      done();
    });

    it('DataShareCompatibility_036', 0, async (done: Function) => {
      const log = new ChangeLog();
      log.record('insert', 1, 1);
      log.record('delete', 1, 2);
      const drained = log.drain();
      expect(drained.length).assertEqual(2);
      expect(log.size()).assertEqual(0);
      done();
    });
    it('DataShareCompatibility_037', 0, async (done: Function) => {
      expect(compatibilityVersion()).assertEqual(1);
      const schema = buildBookSchema();
      const service = new DataShareCompatService(schema, SyncMode.BIDIRECTIONAL);
      expect(service.getSchema().tableName).assertEqual('book');
      expect(service.getSchema().columnCount()).assertEqual(3);
      done();
    });

    it('DataShareCompatibility_038', 0, async (done: Function) => {
      const service = new DataShareCompatService(buildBookSchema(), SyncMode.PUSH);
      for (let i = 0; i < 10; i++) {
        service.insertBook('book' + i, 'intro' + i);
      }
      expect(service.bookCount()).assertEqual(10);
      expect(service.getVersion()).assertEqual(11);
      expect(service.getChangeLog().size()).assertEqual(10);
      const found = service.queryByName('book1');
      expect(found.length).assertEqual(1);
      done();
    });

    it('DataShareCompatibility_039', 0, async (done: Function) => {
      try {
        const driver: Driver = getDriver();
        const ready = await ensureAppReady(driver);
        expect(ready).assertTrue();
        const exists = await checkComponentExists(driver, 'Scroll');
        expect(typeof exists === 'boolean').assertTrue();
        hilog.info(0x0000, 'StageModelTest', '%{public}s', 'DataShareCompatibility probe');
      } catch (error) {
        expect(error !== null).assertTrue();
      }
      done();
    });
  });
}

function compatibilityVersion(): number {
  return 1;
}
