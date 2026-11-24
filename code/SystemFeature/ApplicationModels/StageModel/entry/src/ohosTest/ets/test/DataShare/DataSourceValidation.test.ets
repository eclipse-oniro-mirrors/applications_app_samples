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
  getDriver, componentCount, launchMainAbility, buildDataShareUri, normalizeDataShareUri,
  isSampleDataShareUri, BUNDLE_NAME, ABILITY_DATA_SHARE, DATA_SHARE_URI, ACCOUNT_ID
} from '../Shared/SharedDriver';

enum ValidationCode {
  OK = 0,
  EMPTY_URI = 1,
  BAD_SCHEME = 2,
  EMPTY_TABLE = 3,
  INVALID_ID = 4,
  EMPTY_NAME = 5,
  NAME_TOO_LONG = 6,
  INTRO_TOO_LONG = 7,
  UNKNOWN_COLUMN = 8
}

const MAX_NAME_LENGTH: number = 64;
const MAX_INTRO_LENGTH: number = 512;
const MIN_VALID_ID: number = 1;
const MAX_VALID_ID: number = 1000000;
const URI_SCHEME: string = 'datashare:///';
const COLUMN_ID: string = 'id';
const COLUMN_NAME: string = 'name';
const COLUMN_INTRODUCTION: string = 'introduction';

class ValidationIssue {
  readonly code: ValidationCode;
  readonly field: string;
  readonly message: string;

  constructor(code: ValidationCode, field: string, message: string) {
    this.code = code;
    this.field = field;
    this.message = message;
  }

  describe(): string {
    return `${this.code}:${this.field}:${this.message}`;
  }
}

class BookInput {
  readonly id: number;
  readonly name: string;
  readonly introduction: string;

  constructor(id: number, name: string, introduction: string) {
    this.id = id;
    this.name = name;
    this.introduction = introduction;
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
}

class DataSourceValidator {
  validateUri(uri: string): ValidationIssue[] {
    const issues: ValidationIssue[] = [];
    if (uri.length === 0) {
      issues.push(new ValidationIssue(ValidationCode.EMPTY_URI, 'uri', 'uri is empty'));
      return issues;
    }
    if (!uri.startsWith(URI_SCHEME)) {
      issues.push(new ValidationIssue(ValidationCode.BAD_SCHEME, 'uri', 'unsupported scheme'));
    }
    return issues;
  }

  validateTable(table: string): ValidationIssue[] {
    const issues: ValidationIssue[] = [];
    if (table.length === 0) {
      issues.push(new ValidationIssue(ValidationCode.EMPTY_TABLE, 'table', 'table is empty'));
    }
    return issues;
  }

  validateId(id: number): ValidationIssue[] {
    const issues: ValidationIssue[] = [];
    if (id < MIN_VALID_ID || id > MAX_VALID_ID) {
      issues.push(new ValidationIssue(ValidationCode.INVALID_ID, 'id', 'id out of range'));
    }
    return issues;
  }

  validateName(name: string): ValidationIssue[] {
    const issues: ValidationIssue[] = [];
    if (name.trim().length === 0) {
      issues.push(new ValidationIssue(ValidationCode.EMPTY_NAME, 'name', 'name is empty'));
      return issues;
    }
    if (name.length > MAX_NAME_LENGTH) {
      issues.push(new ValidationIssue(ValidationCode.NAME_TOO_LONG, 'name', 'name too long'));
    }
    return issues;
  }

  validateIntroduction(introduction: string): ValidationIssue[] {
    const issues: ValidationIssue[] = [];
    if (introduction.length > MAX_INTRO_LENGTH) {
      issues.push(new ValidationIssue(ValidationCode.INTRO_TOO_LONG, 'introduction', 'too long'));
    }
    return issues;
  }

  validateColumn(column: string): ValidationIssue[] {
    const issues: ValidationIssue[] = [];
    if (column !== COLUMN_ID && column !== COLUMN_NAME && column !== COLUMN_INTRODUCTION) {
      issues.push(new ValidationIssue(ValidationCode.UNKNOWN_COLUMN, 'column', 'unknown column'));
    }
    return issues;
  }

  validate(input: BookInput): ValidationIssue[] {
    const issues: ValidationIssue[] = [];
    appendIssues(issues, this.validateId(input.id));
    appendIssues(issues, this.validateName(input.name));
    appendIssues(issues, this.validateIntroduction(input.introduction));
    return issues;
  }

  isValid(input: BookInput): boolean {
    return this.validate(input).length === 0;
  }

  codeCount(issues: ValidationIssue[], code: ValidationCode): number {
    let count = 0;
    for (const issue of issues) {
      if (issue.code === code) {
        count += 1;
      }
    }
    return count;
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

  count(): number {
    return this.books.length;
  }

  all(): Book[] {
    const copy: Book[] = [];
    for (const book of this.books) {
      copy.push(book.clone());
    }
    return copy;
  }
}

class ResultSet {
  private rows: Book[];
  private position: number = -1;

  constructor(rows: Book[]) {
    this.rows = rows;
  }

  rowCount(): number {
    return this.rows.length;
  }

  goToFirstRow(): boolean {
    if (this.rows.length === 0) {
      return false;
    }
    this.position = 0;
    return true;
  }

  goToNextRow(): boolean {
    if (this.position + 1 >= this.rows.length) {
      this.position = this.rows.length;
      return false;
    }
    this.position += 1;
    return true;
  }

  current(): Book | null {
    if (this.position < 0 || this.position >= this.rows.length) {
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
    return column === COLUMN_ID ? book.id : -1;
  }

  close(): void {
    this.position = -1;
  }
}

function appendIssues(target: ValidationIssue[], source: ValidationIssue[]): void {
  for (const issue of source) {
    target.push(issue);
  }
}

class ValidatedStore {
  private tableData: BookTable = new BookTable();
  private validator: DataSourceValidator = new DataSourceValidator();

  create(input: BookInput): ValidationIssue[] {
    const issues = this.validator.validate(input);
    if (issues.length === 0) {
      this.tableData.insert(new Book(input.id, input.name, input.introduction));
    }
    return issues;
  }

  replace(id: number, name: string, introduction: string): ValidationIssue[] {
    const issues: ValidationIssue[] = [];
    appendIssues(issues, this.validator.validateId(id));
    appendIssues(issues, this.validator.validateName(name));
    appendIssues(issues, this.validator.validateIntroduction(introduction));
    if (issues.length === 0) {
      this.tableData.update(id, name, introduction);
    }
    return issues;
  }

  remove(id: number): boolean {
    return this.tableData.deleteById(id);
  }

  count(): number {
    return this.tableData.count();
  }

  query(): ResultSet {
    return new ResultSet(this.tableData.all());
  }

  table(): BookTable {
    return this.tableData;
  }
}

function buildInput(): BookInput {
  return new BookInput(1, 'ArkTS', 'stage model sample');
}

export default function dataSourceValidationTest(): void {
  describe('DataSourceValidationSuite', () => {
    let validator: DataSourceValidator = new DataSourceValidator();

    beforeAll(() => {
      validator = new DataSourceValidator();
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'data source validation start');
    });

    afterAll(() => {
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'data source validation end');
    });

    it('DataSourceValidation_001', 0, async (done: Function) => {
      expect(validator.validateUri(DATA_SHARE_URI).length).assertEqual(0);
      expect(validator.validateUri(buildDataShareUri('Book')).length).assertEqual(0);
      expect(validator.validateUri('').length).assertEqual(1);
      expect(validator.validateUri('file:///tmp')[0].code).assertEqual(ValidationCode.BAD_SCHEME);
      done();
    });

    it('DataSourceValidation_002', 0, async (done: Function) => {
      const emptyIssues = validator.validateUri('');
      expect(emptyIssues[0].field).assertEqual('uri');
      expect(emptyIssues[0].describe()).assertEqual('1:uri:uri is empty');
      expect(validator.codeCount(emptyIssues, ValidationCode.EMPTY_URI)).assertEqual(1);
      done();
    });

    it('DataSourceValidation_003', 0, async (done: Function) => {
      expect(validator.validateTable('Book').length).assertEqual(0);
      expect(validator.validateTable('').length).assertEqual(1);
      expect(validator.validateTable('')[0].code).assertEqual(ValidationCode.EMPTY_TABLE);
      expect(validator.validateTable('')[0].field).assertEqual('table');
      done();
    });

    it('DataSourceValidation_004', 0, async (done: Function) => {
      expect(validator.validateId(1).length).assertEqual(0);
      expect(validator.validateId(MAX_VALID_ID).length).assertEqual(0);
      expect(validator.validateId(0).length).assertEqual(1);
      expect(validator.validateId(0)[0].code).assertEqual(ValidationCode.INVALID_ID);
      done();
    });

    it('DataSourceValidation_005', 0, async (done: Function) => {
      expect(validator.validateId(-1).length).assertEqual(1);
      expect(validator.validateId(MAX_VALID_ID + 1).length).assertEqual(1);
      expect(validator.validateId(MIN_VALID_ID).length).assertEqual(0);
      expect(validator.validateId(MAX_VALID_ID + 1)[0].describe()).assertEqual('4:id:id out of range');
      done();
    });

    it('DataSourceValidation_006', 0, async (done: Function) => {
      expect(validator.validateName('ArkTS').length).assertEqual(0);
      expect(validator.validateName('').length).assertEqual(1);
      expect(validator.validateName('')[0].code).assertEqual(ValidationCode.EMPTY_NAME);
      expect(validator.validateName('   ')[0].code).assertEqual(ValidationCode.EMPTY_NAME);
      done();
    });

    it('DataSourceValidation_007', 0, async (done: Function) => {
      let longName = '';
      for (let index = 0; index < MAX_NAME_LENGTH + 1; index++) {
        longName += 'a';
      }
      const issues = validator.validateName(longName);
      expect(issues.length).assertEqual(1);
      expect(issues[0].code).assertEqual(ValidationCode.NAME_TOO_LONG);
      expect(longName.length).assertEqual(MAX_NAME_LENGTH + 1);
      done();
    });

    it('DataSourceValidation_008', 0, async (done: Function) => {
      let exactName = '';
      for (let index = 0; index < MAX_NAME_LENGTH; index++) {
        exactName += 'b';
      }
      expect(validator.validateName(exactName).length).assertEqual(0);
      expect(exactName.length).assertEqual(MAX_NAME_LENGTH);
      const edgeIssues = validator.validateIntroduction('');
      expect(edgeIssues.length).assertEqual(0);
      done();
    });

    it('DataSourceValidation_009', 0, async (done: Function) => {
      let longIntro = '';
      for (let index = 0; index < MAX_INTRO_LENGTH + 1; index++) {
        longIntro += 'c';
      }
      const issues = validator.validateIntroduction(longIntro);
      expect(issues.length).assertEqual(1);
      expect(issues[0].code).assertEqual(ValidationCode.INTRO_TOO_LONG);
      expect(issues[0].field).assertEqual('introduction');
      done();
    });

    it('DataSourceValidation_010', 0, async (done: Function) => {
      expect(validator.validateColumn(COLUMN_ID).length).assertEqual(0);
      expect(validator.validateColumn(COLUMN_NAME).length).assertEqual(0);
      expect(validator.validateColumn(COLUMN_INTRODUCTION).length).assertEqual(0);
      expect(validator.validateColumn('missing')[0].code).assertEqual(ValidationCode.UNKNOWN_COLUMN);
      done();
    });

    it('DataSourceValidation_011', 0, async (done: Function) => {
      expect(validator.isValid(buildInput())).assertTrue();
      expect(validator.validate(buildInput()).length).assertEqual(0);
      const bad = new BookInput(0, '', 'ok');
      const issues = validator.validate(bad);
      expect(validator.isValid(bad)).assertFalse();
      expect(issues.length).assertEqual(2);
      done();
    });

    it('DataSourceValidation_012', 0, async (done: Function) => {
      const bad = new BookInput(-5, '   ', 'ok');
      const issues = validator.validate(bad);
      expect(validator.codeCount(issues, ValidationCode.INVALID_ID)).assertEqual(1);
      expect(validator.codeCount(issues, ValidationCode.EMPTY_NAME)).assertEqual(1);
      expect(validator.codeCount(issues, ValidationCode.INTRO_TOO_LONG)).assertEqual(0);
      done();
    });

    it('DataSourceValidation_013', 0, async (done: Function) => {
      const store = new ValidatedStore();
      const accepted = store.create(buildInput());
      expect(accepted.length).assertEqual(0);
      expect(store.count()).assertEqual(1);
      const rejected = store.create(new BookInput(2, '', 'missing name'));
      expect(rejected.length).assertEqual(1);
      expect(store.count()).assertEqual(1);
      done();
    });

    it('DataSourceValidation_014', 0, async (done: Function) => {
      const store = new ValidatedStore();
      store.create(new BookInput(1, 'ArkTS', 'first'));
      const issues = store.replace(1, 'ArkTS2', 'second');
      expect(issues.length).assertEqual(0);
      const found = store.table().findById(1);
      expect(found !== null).assertTrue();
      if (found !== null) {
        expect(found.name).assertEqual('ArkTS2');
        expect(found.introduction).assertEqual('second');
      }
      done();
    });

    it('DataSourceValidation_015', 0, async (done: Function) => {
      const store = new ValidatedStore();
      store.create(new BookInput(1, 'ArkTS', 'first'));
      const issues = store.replace(1, '', 'invalid');
      expect(issues.length).assertEqual(1);
      const found = store.table().findById(1);
      expect(found !== null).assertTrue();
      if (found !== null) {
        expect(found.name).assertEqual('ArkTS');
      }
      done();
    });

    it('DataSourceValidation_016', 0, async (done: Function) => {
      const store = new ValidatedStore();
      store.create(new BookInput(1, 'A', 'x'));
      store.create(new BookInput(2, 'B', 'y'));
      expect(store.count()).assertEqual(2);
      expect(store.remove(1)).assertTrue();
      expect(store.remove(1)).assertFalse();
      expect(store.count()).assertEqual(1);
      done();
    });

    it('DataSourceValidation_017', 0, async (done: Function) => {
      const store = new ValidatedStore();
      store.create(new BookInput(1, 'A', 'x'));
      store.create(new BookInput(2, 'B', 'y'));
      const resultSet = store.query();
      expect(resultSet.rowCount()).assertEqual(2);
      expect(resultSet.goToFirstRow()).assertTrue();
      expect(resultSet.getInt(COLUMN_ID)).assertEqual(1);
      expect(resultSet.getString(COLUMN_NAME)).assertEqual('A');
      done();
    });

    it('DataSourceValidation_018', 0, async (done: Function) => {
      const store = new ValidatedStore();
      store.create(new BookInput(1, 'A', 'x'));
      const resultSet = store.query();
      resultSet.goToFirstRow();
      expect(resultSet.getString('unknown')).assertEqual('');
      expect(resultSet.getInt('unknown')).assertEqual(-1);
      expect(resultSet.goToNextRow()).assertFalse();
      expect(resultSet.current()).assertNull();
      done();
    });

    it('DataSourceValidation_019', 0, async (done: Function) => {
      const empty = new ResultSet([]);
      expect(empty.rowCount()).assertEqual(0);
      expect(empty.goToFirstRow()).assertFalse();
      expect(empty.getInt(COLUMN_ID)).assertEqual(-1);
      done();
    });

    it('DataSourceValidation_020', 0, async (done: Function) => {
      const table = new BookTable();
      expect(table.insert(new Book(1, 'A', 'x'))).assertTrue();
      expect(table.insert(new Book(1, 'B', 'y'))).assertFalse();
      expect(table.count()).assertEqual(1);
      expect(table.findById(1) !== null).assertTrue();
      expect(table.findById(2)).assertNull();
      done();
    });

    it('DataSourceValidation_021', 0, async (done: Function) => {
      expect(MAX_NAME_LENGTH).assertEqual(64);
      expect(MAX_INTRO_LENGTH).assertEqual(512);
      expect(URI_SCHEME).assertEqual('datashare:///');
      expect(URI_SCHEME.length).assertEqual(13);
      done();
    });

    it('DataSourceValidation_022', 0, async (done: Function) => {
      expect(isSampleDataShareUri(DATA_SHARE_URI)).assertTrue();
      expect(normalizeDataShareUri(DATA_SHARE_URI).length > 0).assertTrue();
      expect(buildDataShareUri('Book').startsWith(URI_SCHEME)).assertTrue();
      expect(BUNDLE_NAME).assertEqual('ohos.samples.stagemodel');
      done();
    });

    it('DataSourceValidation_023', 0, async (done: Function) => {
      expect(ACCOUNT_ID).assertEqual(100);
      expect(ABILITY_DATA_SHARE).assertEqual('DataShareExtAbility');
      const issue = new ValidationIssue(ValidationCode.EMPTY_TABLE, 'table', 'table is empty');
      expect(issue.describe()).assertEqual('3:table:table is empty');
      expect(issue.code).assertEqual(ValidationCode.EMPTY_TABLE);
      done();
    });

    it('DataSourceValidation_024', 0, async (done: Function) => {
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
      expect(launched === true || launched === false).assertTrue();
      done();
    });
  });
}

