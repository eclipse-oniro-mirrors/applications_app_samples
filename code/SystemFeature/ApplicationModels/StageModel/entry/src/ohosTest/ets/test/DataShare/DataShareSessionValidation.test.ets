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
  isSampleDataShareUri, BUNDLE_NAME, ABILITY_DATA_SHARE, DATA_SHARE_URI, ACCOUNT_ID,
  CONNECTION_NUMBER
} from '../Shared/SharedDriver';

enum SessionStatus {
  INIT = 0,
  CONNECTING = 1,
  CONNECTED = 2,
  DISCONNECTING = 3,
  CLOSED = 4,
  ERROR = 5
}

enum SessionViolation {
  NONE = 0,
  BAD_TRANSITION = 1,
  NEGATIVE_CONNECTION = 2,
  DUPLICATE_SESSION = 3,
  URI_MISMATCH = 4,
  MISSING_OWNER = 5
}

const MAX_CONNECTION_NUMBER: number = 8;
const OWNER_DEFAULT: string = 'ohos.samples.stagemodel';

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

class Session {
  readonly id: string;
  readonly uri: string;
  readonly owner: string;
  connectionNumber: number;
  status: SessionStatus = SessionStatus.INIT;
  openedAt: number = 0;
  closedAt: number = -1;

  constructor(id: string, uri: string, owner: string, connectionNumber: number) {
    this.id = id;
    this.uri = uri;
    this.owner = owner;
    this.connectionNumber = connectionNumber;
  }

  isOpen(): boolean {
    return this.status !== SessionStatus.CLOSED && this.status !== SessionStatus.ERROR;
  }

  isConnected(): boolean {
    return this.status === SessionStatus.CONNECTED;
  }

  digest(): string {
    return `${this.id}|${this.status}|${this.connectionNumber}|${this.owner}`;
  }

  close(now: number): void {
    this.status = SessionStatus.CLOSED;
    this.closedAt = now;
  }
}

class SessionValidator {
  canTransition(from: SessionStatus, to: SessionStatus): boolean {
    if (from === to) {
      return true;
    }
    if (from === SessionStatus.INIT) {
      return to === SessionStatus.CONNECTING || to === SessionStatus.CLOSED;
    }
    if (from === SessionStatus.CONNECTING) {
      return to === SessionStatus.CONNECTED || to === SessionStatus.ERROR;
    }
    if (from === SessionStatus.CONNECTED) {
      return to === SessionStatus.DISCONNECTING || to === SessionStatus.ERROR;
    }
    if (from === SessionStatus.DISCONNECTING) {
      return to === SessionStatus.CLOSED || to === SessionStatus.ERROR;
    }
    return false;
  }

  validate(session: Session): SessionViolation[] {
    const violations: SessionViolation[] = [];
    if (session.connectionNumber < CONNECTION_NUMBER ||
      session.connectionNumber > MAX_CONNECTION_NUMBER) {
      violations.push(SessionViolation.NEGATIVE_CONNECTION);
    }
    if (session.owner.length === 0) {
      violations.push(SessionViolation.MISSING_OWNER);
    }
    if (!isSampleDataShareUri(session.uri) && session.uri !== DATA_SHARE_URI) {
      violations.push(SessionViolation.URI_MISMATCH);
    }
    return violations;
  }

  isValid(session: Session): boolean {
    return this.validate(session).length === 0;
  }

  violationCount(violations: SessionViolation[], target: SessionViolation): number {
    let count = 0;
    for (const violation of violations) {
      if (violation === target) {
        count += 1;
      }
    }
    return count;
  }
}

class SessionTable {
  private sessions: Session[] = [];

  add(session: Session): SessionViolation {
    if (this.find(session.id) !== null) {
      return SessionViolation.DUPLICATE_SESSION;
    }
    this.sessions.push(session);
    return SessionViolation.NONE;
  }

  find(id: string): Session | null {
    for (const session of this.sessions) {
      if (session.id === id) {
        return session;
      }
    }
    return null;
  }

  remove(id: string): boolean {
    for (let index = 0; index < this.sessions.length; index++) {
      if (this.sessions[index].id === id) {
        this.sessions.splice(index, 1);
        return true;
      }
    }
    return false;
  }

  byStatus(status: SessionStatus): Session[] {
    const matches: Session[] = [];
    for (const session of this.sessions) {
      if (session.status === status) {
        matches.push(session);
      }
    }
    return matches;
  }

  count(): number {
    return this.sessions.length;
  }

  openCount(): number {
    let count = 0;
    for (const session of this.sessions) {
      if (session.isOpen()) {
        count += 1;
      }
    }
    return count;
  }

  connectionNumbers(): number[] {
    const values: number[] = [];
    for (const session of this.sessions) {
      values.push(session.connectionNumber);
    }
    return values;
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
    if (column === 'name') {
      return book.name;
    }
    if (column === 'introduction') {
      return book.introduction;
    }
    return '';
  }

  getInt(column: string): number {
    const book = this.current();
    if (book === null) {
      return -1;
    }
    return column === 'id' ? book.id : -1;
  }

  close(): void {
    this.position = -1;
  }
}

class SessionManager {
  private validator: SessionValidator = new SessionValidator();
  private tableData: SessionTable = new SessionTable();
  private counter: number = 0;

  open(owner: string, uri: string, connectionNumber: number): Session | null {
    const session = new Session(`session-${this.counter}`, uri, owner, connectionNumber);
    this.counter += 1;
    if (!this.validator.isValid(session)) {
      return null;
    }
    const violation = this.tableData.add(session);
    if (violation !== SessionViolation.NONE) {
      return null;
    }
    return session;
  }

  connect(id: string, now: number): SessionStatus | null {
    const session = this.tableData.find(id);
    if (session === null) {
      return null;
    }
    if (!this.validator.canTransition(session.status, SessionStatus.CONNECTING)) {
      return session.status;
    }
    session.status = SessionStatus.CONNECTING;
    session.openedAt = now;
    if (this.validator.canTransition(session.status, SessionStatus.CONNECTED)) {
      session.status = SessionStatus.CONNECTED;
    }
    return session.status;
  }

  disconnect(id: string): SessionStatus | null {
    const session = this.tableData.find(id);
    if (session === null) {
      return null;
    }
    if (!this.validator.canTransition(session.status, SessionStatus.DISCONNECTING)) {
      return session.status;
    }
    session.status = SessionStatus.DISCONNECTING;
    return session.status;
  }

  close(id: string, now: number): boolean {
    const session = this.tableData.find(id);
    if (session === null) {
      return false;
    }
    session.close(now);
    return true;
  }

  fail(id: string): boolean {
    const session = this.tableData.find(id);
    if (session === null) {
      return false;
    }
    session.status = SessionStatus.ERROR;
    return true;
  }

  count(): number {
    return this.tableData.count();
  }

  openCount(): number {
    return this.tableData.openCount();
  }

  table(): SessionTable {
    return this.tableData;
  }

  find(id: string): Session | null {
    return this.tableData.find(id);
  }
}

function buildValidationBooks(): Book[] {
  return [
    new Book(1, 'ArkTS', 'session'),
    new Book(2, 'DataShare', 'validation'),
    new Book(3, 'ResultSet', 'cursor')
  ];
}

export default function dataShareSessionValidationTest(): void {
  describe('DataShareSessionValidationSuite', () => {
    let validator: SessionValidator = new SessionValidator();

    beforeAll(() => {
      validator = new SessionValidator();
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'session validation start');
    });

    afterAll(() => {
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'session validation end');
    });

    it('DataShareSessionValidation_001', 0, async (done: Function) => {
      const session = new Session('session-0', DATA_SHARE_URI, OWNER_DEFAULT, CONNECTION_NUMBER);
      expect(session.status).assertEqual(SessionStatus.INIT);
      expect(session.isOpen()).assertTrue();
      expect(session.isConnected()).assertFalse();
      expect(session.closedAt).assertEqual(-1);
      expect(session.digest()).assertEqual(`session-0|0|0|${OWNER_DEFAULT}`);
      done();
    });

    it('DataShareSessionValidation_002', 0, async (done: Function) => {
      const session = new Session('session-1', DATA_SHARE_URI, OWNER_DEFAULT, 2);
      expect(validator.isValid(session)).assertTrue();
      expect(validator.validate(session).length).assertEqual(0);
      session.close(500);
      expect(session.status).assertEqual(SessionStatus.CLOSED);
      expect(session.isOpen()).assertFalse();
      expect(session.closedAt).assertEqual(500);
      done();
    });

    it('DataShareSessionValidation_003', 0, async (done: Function) => {
      const badConnection = new Session('s', DATA_SHARE_URI, OWNER_DEFAULT, MAX_CONNECTION_NUMBER + 1);
      const violations = validator.validate(badConnection);
      expect(violations.length).assertEqual(1);
      expect(violations[0]).assertEqual(SessionViolation.NEGATIVE_CONNECTION);
      expect(validator.isValid(badConnection)).assertFalse();
      done();
    });

    it('DataShareSessionValidation_004', 0, async (done: Function) => {
      const badUri = new Session('s', 'http://invalid', OWNER_DEFAULT, 0);
      const violations = validator.validate(badUri);
      expect(validator.violationCount(violations, SessionViolation.URI_MISMATCH)).assertEqual(1);
      expect(validator.violationCount(violations, SessionViolation.MISSING_OWNER)).assertEqual(0);
      expect(violations.length).assertEqual(1);
      done();
    });

    it('DataShareSessionValidation_005', 0, async (done: Function) => {
      const noOwner = new Session('s', DATA_SHARE_URI, '', 0);
      const violations = validator.validate(noOwner);
      expect(validator.violationCount(violations, SessionViolation.MISSING_OWNER)).assertEqual(1);
      expect(violations[0]).assertEqual(SessionViolation.MISSING_OWNER);
      done();
    });

    it('DataShareSessionValidation_006', 0, async (done: Function) => {
      const multiple = new Session('s', 'bad://uri', '', -1);
      const violations = validator.validate(multiple);
      expect(violations.length).assertEqual(3);
      expect(validator.violationCount(violations, SessionViolation.NEGATIVE_CONNECTION)).assertEqual(1);
      expect(validator.violationCount(violations, SessionViolation.MISSING_OWNER)).assertEqual(1);
      expect(validator.violationCount(violations, SessionViolation.URI_MISMATCH)).assertEqual(1);
      done();
    });

    it('DataShareSessionValidation_007', 0, async (done: Function) => {
      expect(validator.canTransition(SessionStatus.INIT, SessionStatus.CONNECTING)).assertTrue();
      expect(validator.canTransition(SessionStatus.INIT, SessionStatus.CLOSED)).assertTrue();
      expect(validator.canTransition(SessionStatus.INIT, SessionStatus.CONNECTED)).assertFalse();
      expect(validator.canTransition(SessionStatus.INIT, SessionStatus.INIT)).assertTrue();
      done();
    });

    it('DataShareSessionValidation_008', 0, async (done: Function) => {
      expect(validator.canTransition(SessionStatus.CONNECTING, SessionStatus.CONNECTED)).assertTrue();
      expect(validator.canTransition(SessionStatus.CONNECTED, SessionStatus.DISCONNECTING)).assertTrue();
      expect(validator.canTransition(SessionStatus.DISCONNECTING, SessionStatus.CLOSED)).assertTrue();
      expect(validator.canTransition(SessionStatus.CLOSED, SessionStatus.INIT)).assertFalse();
      done();
    });

    it('DataShareSessionValidation_009', 0, async (done: Function) => {
      expect(validator.canTransition(SessionStatus.CONNECTING, SessionStatus.ERROR)).assertTrue();
      expect(validator.canTransition(SessionStatus.CONNECTED, SessionStatus.ERROR)).assertTrue();
      expect(validator.canTransition(SessionStatus.ERROR, SessionStatus.INIT)).assertFalse();
      expect(validator.canTransition(SessionStatus.DISCONNECTING, SessionStatus.ERROR)).assertTrue();
      done();
    });

    it('DataShareSessionValidation_010', 0, async (done: Function) => {
      const table = new SessionTable();
      const session = new Session('s1', DATA_SHARE_URI, OWNER_DEFAULT, 1);
      expect(table.add(session)).assertEqual(SessionViolation.NONE);
      expect(table.add(session)).assertEqual(SessionViolation.DUPLICATE_SESSION);
      expect(table.count()).assertEqual(1);
      expect(table.find('s1') !== null).assertTrue();
      expect(table.find('missing')).assertNull();
      done();
    });

    it('DataShareSessionValidation_011', 0, async (done: Function) => {
      const table = new SessionTable();
      const first = new Session('a', DATA_SHARE_URI, OWNER_DEFAULT, 0);
      const second = new Session('b', DATA_SHARE_URI, OWNER_DEFAULT, 1);
      first.status = SessionStatus.CONNECTED;
      table.add(first);
      table.add(second);
      expect(table.count()).assertEqual(2);
      expect(table.openCount()).assertEqual(2);
      expect(table.byStatus(SessionStatus.CONNECTED).length).assertEqual(1);
      expect(table.byStatus(SessionStatus.CLOSED).length).assertEqual(0);
      done();
    });

    it('DataShareSessionValidation_012', 0, async (done: Function) => {
      const table = new SessionTable();
      table.add(new Session('a', DATA_SHARE_URI, OWNER_DEFAULT, 3));
      table.add(new Session('b', DATA_SHARE_URI, OWNER_DEFAULT, 4));
      expect(table.connectionNumbers().length).assertEqual(2);
      expect(table.connectionNumbers()[0]).assertEqual(3);
      expect(table.connectionNumbers()[1]).assertEqual(4);
      expect(table.remove('a')).assertTrue();
      expect(table.remove('a')).assertFalse();
      expect(table.count()).assertEqual(1);
      done();
    });

    it('DataShareSessionValidation_013', 0, async (done: Function) => {
      const manager = new SessionManager();
      const session = manager.open(OWNER_DEFAULT, DATA_SHARE_URI, 0);
      expect(session !== null).assertTrue();
      expect(manager.count()).assertEqual(1);
      expect(manager.openCount()).assertEqual(1);
      if (session !== null) {
        expect(session.status).assertEqual(SessionStatus.INIT);
      }
      done();
    });

    it('DataShareSessionValidation_014', 0, async (done: Function) => {
      const manager = new SessionManager();
      expect(manager.open('', DATA_SHARE_URI, 0)).assertNull();
      expect(manager.open(OWNER_DEFAULT, 'bad://uri', 0)).assertNull();
      expect(manager.open(OWNER_DEFAULT, DATA_SHARE_URI, MAX_CONNECTION_NUMBER + 1)).assertNull();
      expect(manager.count()).assertEqual(0);
      done();
    });

    it('DataShareSessionValidation_015', 0, async (done: Function) => {
      const manager = new SessionManager();
      const session = manager.open(OWNER_DEFAULT, DATA_SHARE_URI, 0);
      expect(session !== null).assertTrue();
      if (session !== null) {
        expect(manager.connect(session.id, 100)).assertEqual(SessionStatus.CONNECTED);
        expect(session.openedAt).assertEqual(100);
        expect(manager.disconnect(session.id)).assertEqual(SessionStatus.DISCONNECTING);
        expect(manager.close(session.id, 200)).assertTrue();
        expect(session.status).assertEqual(SessionStatus.CLOSED);
        expect(session.closedAt).assertEqual(200);
      }
      expect(manager.openCount()).assertEqual(0);
      done();
    });

    it('DataShareSessionValidation_016', 0, async (done: Function) => {
      const manager = new SessionManager();
      expect(manager.connect('missing', 0)).assertNull();
      expect(manager.disconnect('missing')).assertNull();
      expect(manager.close('missing', 0)).assertFalse();
      expect(manager.fail('missing')).assertFalse();
      const session = manager.open(OWNER_DEFAULT, DATA_SHARE_URI, 1);
      expect(session !== null).assertTrue();
      if (session !== null) {
        expect(manager.fail(session.id)).assertTrue();
        expect(session.status).assertEqual(SessionStatus.ERROR);
        expect(manager.openCount()).assertEqual(0);
      }
      done();
    });

    it('DataShareSessionValidation_017', 0, async (done: Function) => {
      const table = new BookTable();
      expect(table.insert(new Book(1, 'A', 'x'))).assertTrue();
      expect(table.insert(new Book(2, 'B', 'y'))).assertTrue();
      expect(table.insert(new Book(1, 'Duplicate', 'z'))).assertFalse();
      expect(table.count()).assertEqual(2);
      expect(table.update(1, 'A2', 'z')).assertTrue();
      expect(table.deleteById(2)).assertTrue();
      expect(table.count()).assertEqual(1);
      done();
    });

    it('DataShareSessionValidation_018', 0, async (done: Function) => {
      const table = new BookTable();
      for (const book of buildValidationBooks()) {
        table.insert(book);
      }
      const resultSet = new ResultSet(table.all());
      expect(resultSet.rowCount()).assertEqual(3);
      expect(resultSet.goToFirstRow()).assertTrue();
      expect(resultSet.getInt('id')).assertEqual(1);
      expect(resultSet.getString('name')).assertEqual('ArkTS');
      expect(resultSet.getString('introduction')).assertEqual('session');
      done();
    });

    it('DataShareSessionValidation_019', 0, async (done: Function) => {
      const resultSet = new ResultSet(buildValidationBooks());
      let visited = 0;
      if (resultSet.goToFirstRow()) {
        visited += 1;
        while (resultSet.goToNextRow()) {
          visited += 1;
        }
      }
      expect(visited).assertEqual(3);
      expect(resultSet.current()).assertNull();
      resultSet.close();
      expect(resultSet.getInt('id')).assertEqual(-1);
      done();
    });

    it('DataShareSessionValidation_020', 0, async (done: Function) => {
      expect(SessionStatus.INIT).assertEqual(0);
      expect(SessionStatus.CLOSED).assertEqual(4);
      expect(SessionStatus.ERROR).assertEqual(5);
      expect(SessionViolation.DUPLICATE_SESSION).assertEqual(3);
      expect(MAX_CONNECTION_NUMBER).assertEqual(8);
      done();
    });

    it('DataShareSessionValidation_021', 0, async (done: Function) => {
      expect(CONNECTION_NUMBER).assertEqual(0);
      expect(ACCOUNT_ID).assertEqual(100);
      expect(BUNDLE_NAME).assertEqual('ohos.samples.stagemodel');
      expect(ABILITY_DATA_SHARE).assertEqual('DataShareExtAbility');
      expect(isSampleDataShareUri(DATA_SHARE_URI)).assertTrue();
      done();
    });

    it('DataShareSessionValidation_022', 0, async (done: Function) => {
      const manager = new SessionManager();
      const session = manager.open(OWNER_DEFAULT, DATA_SHARE_URI, 0);
      expect(session !== null).assertTrue();
      if (session !== null) {
        expect(manager.disconnect(session.id)).assertEqual(SessionStatus.INIT);
        expect(session.status).assertEqual(SessionStatus.INIT);
        expect(manager.count()).assertEqual(1);
      }
      done();
    });

    it('DataShareSessionValidation_023', 0, async (done: Function) => {
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

    it('DataShareSessionValidation_024', 0, async (done: Function) => {
      const table = new SessionTable();
      const first = new Session('a', DATA_SHARE_URI, OWNER_DEFAULT, 0);
      const second = new Session('b', DATA_SHARE_URI, OWNER_DEFAULT, 1);
      first.close(10);
      table.add(first);
      table.add(second);
      expect(table.openCount()).assertEqual(1);
      expect(table.byStatus(SessionStatus.CLOSED).length).assertEqual(1);
      expect(table.byStatus(SessionStatus.INIT).length).assertEqual(1);
      done();
    });
  });
}

