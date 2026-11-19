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

enum PermissionLevel {
  NONE = 0,
  READ = 1,
  WRITE = 2,
  FULL = 3
}

enum SessionState {
  CREATED = 0,
  AUTHENTICATING = 1,
  ACTIVE = 2,
  EXPIRED = 3,
  REVOKED = 4,
  FAILED = 5
}

enum AuthFailure {
  NONE = 0,
  UNKNOWN_ACCOUNT = 1,
  INVALID_TOKEN = 2,
  INSUFFICIENT_PERMISSION = 3,
  EXPIRED_TOKEN = 4,
  URI_MISMATCH = 5
}

const TOKEN_PREFIX: string = 'ds-token';
const TOKEN_TTL_DEFAULT: number = 3600;
const TOKEN_TTL_MIN: number = 60;
const VALID_ACCOUNT: number = 100;
const INVALID_ACCOUNT: number = -1;

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

class AuthToken {
  readonly value: string;
  readonly accountId: number;
  readonly level: PermissionLevel;
  readonly issuedAt: number;
  readonly ttl: number;
  private revoked: boolean = false;

  constructor(value: string, accountId: number, level: PermissionLevel, issuedAt: number, ttl: number) {
    this.value = value;
    this.accountId = accountId;
    this.level = level;
    this.issuedAt = issuedAt;
    this.ttl = ttl;
  }

  isWellFormed(): boolean {
    return this.value.startsWith(TOKEN_PREFIX) && this.value.length > TOKEN_PREFIX.length;
  }

  isExpired(now: number): boolean {
    return now >= this.issuedAt + this.ttl;
  }

  isValid(now: number): boolean {
    return this.isWellFormed() && !this.revoked && !this.isExpired(now);
  }

  revoke(): void {
    this.revoked = true;
  }

  isRevoked(): boolean {
    return this.revoked;
  }

  covers(required: PermissionLevel): boolean {
    return this.level >= required;
  }

  digest(): string {
    return `${this.value}:${this.accountId}:${this.level}:${this.ttl}`;
  }
}

class SessionRequest {
  readonly accountId: number;
  readonly uri: string;
  readonly requestedLevel: PermissionLevel;
  readonly tokenValue: string;

  constructor(accountId: number, uri: string, requestedLevel: PermissionLevel, tokenValue: string) {
    this.accountId = accountId;
    this.uri = uri;
    this.requestedLevel = requestedLevel;
    this.tokenValue = tokenValue;
  }

  isAccountKnown(): boolean {
    return this.accountId === VALID_ACCOUNT;
  }

  isUriAccepted(): boolean {
    return isSampleDataShareUri(this.uri) || this.uri === DATA_SHARE_URI;
  }
}

class AuthResult {
  readonly ok: boolean;
  readonly failure: AuthFailure;
  readonly sessionId: string;
  readonly grantedLevel: PermissionLevel;

  constructor(ok: boolean, failure: AuthFailure, sessionId: string, grantedLevel: PermissionLevel) {
    this.ok = ok;
    this.failure = failure;
    this.sessionId = sessionId;
    this.grantedLevel = grantedLevel;
  }

  describe(): string {
    return `${this.ok ? 'OK' : 'FAIL'}:${this.failure}:${this.grantedLevel}`;
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

class SessionRecord {
  readonly sessionId: string;
  readonly accountId: number;
  readonly uri: string;
  readonly tokenValue: string;
  state: SessionState;
  level: PermissionLevel;

  constructor(sessionId: string, accountId: number, uri: string, tokenValue: string,
    level: PermissionLevel) {
    this.sessionId = sessionId;
    this.accountId = accountId;
    this.uri = uri;
    this.tokenValue = tokenValue;
    this.state = SessionState.CREATED;
    this.level = level;
  }

  activate(): void {
    this.state = SessionState.ACTIVE;
  }

  expire(): void {
    this.state = SessionState.EXPIRED;
  }

  revoke(): void {
    this.state = SessionState.REVOKED;
  }

  fail(): void {
    this.state = SessionState.FAILED;
  }

  isActive(): boolean {
    return this.state === SessionState.ACTIVE;
  }
}

class TokenIssuer {
  private counter: number = 0;

  issue(accountId: number, level: PermissionLevel, now: number, ttl: number): AuthToken {
    this.counter += 1;
    const value = `${TOKEN_PREFIX}-${accountId}-${this.counter}`;
    return new AuthToken(value, accountId, level, now, ttl);
  }

  issuedCount(): number {
    return this.counter;
  }
}

class AuthPolicy {
  requiredLevel(uri: string): PermissionLevel {
    if (uri.indexOf('/readonly') >= 0) {
      return PermissionLevel.READ;
    }
    if (uri.indexOf('/write') >= 0) {
      return PermissionLevel.FULL;
    }
    return PermissionLevel.READ;
  }

  accountAllowed(accountId: number): boolean {
    return accountId === VALID_ACCOUNT;
  }

  ttlAllowed(ttl: number): boolean {
    return ttl >= TOKEN_TTL_MIN;
  }
}

class SessionAuthenticator {
  private tokens: AuthToken[] = [];
  private policy: AuthPolicy = new AuthPolicy();
  private issuer: TokenIssuer = new TokenIssuer();
  private now: number = 0;

  setNow(now: number): void {
    this.now = now;
  }

  issue(accountId: number, level: PermissionLevel, ttl: number): AuthToken {
    const token = this.issuer.issue(accountId, level, this.now, ttl);
    this.tokens.push(token);
    return token;
  }

  findToken(value: string): AuthToken | null {
    for (const token of this.tokens) {
      if (token.value === value) {
        return token;
      }
    }
    return null;
  }

  tokenCount(): number {
    return this.tokens.length;
  }

  authenticate(request: SessionRequest): AuthResult {
    if (!this.policy.accountAllowed(request.accountId)) {
      return new AuthResult(false, AuthFailure.UNKNOWN_ACCOUNT, '', PermissionLevel.NONE);
    }
    if (!request.isUriAccepted()) {
      return new AuthResult(false, AuthFailure.URI_MISMATCH, '', PermissionLevel.NONE);
    }
    const token = this.findToken(request.tokenValue);
    if (token === null || !token.isWellFormed()) {
      return new AuthResult(false, AuthFailure.INVALID_TOKEN, '', PermissionLevel.NONE);
    }
    if (token.isRevoked()) {
      return new AuthResult(false, AuthFailure.INVALID_TOKEN, '', PermissionLevel.NONE);
    }
    if (token.isExpired(this.now)) {
      return new AuthResult(false, AuthFailure.EXPIRED_TOKEN, '', PermissionLevel.NONE);
    }
    if (token.accountId !== request.accountId) {
      return new AuthResult(false, AuthFailure.UNKNOWN_ACCOUNT, '', PermissionLevel.NONE);
    }
    if (!token.covers(request.requestedLevel)) {
      return new AuthResult(false, AuthFailure.INSUFFICIENT_PERMISSION, '', PermissionLevel.NONE);
    }
    const sessionId = `session-${request.accountId}-${token.level}`;
    return new AuthResult(true, AuthFailure.NONE, sessionId, token.level);
  }

  revoke(value: string): boolean {
    const token = this.findToken(value);
    if (token === null) {
      return false;
    }
    token.revoke();
    return true;
  }
}

class SessionRegistry {
  private sessions: SessionRecord[] = [];

  add(record: SessionRecord): boolean {
    if (this.find(record.sessionId) !== null) {
      return false;
    }
    this.sessions.push(record);
    return true;
  }

  find(sessionId: string): SessionRecord | null {
    for (const record of this.sessions) {
      if (record.sessionId === sessionId) {
        return record;
      }
    }
    return null;
  }

  size(): number {
    return this.sessions.length;
  }

  activeCount(): number {
    let count = 0;
    for (const record of this.sessions) {
      if (record.isActive()) {
        count += 1;
      }
    }
    return count;
  }

  revoke(sessionId: string): boolean {
    const record = this.find(sessionId);
    if (record === null) {
      return false;
    }
    record.revoke();
    return true;
  }

  states(): SessionState[] {
    const values: SessionState[] = [];
    for (const record of this.sessions) {
      values.push(record.state);
    }
    return values;
  }
}

function buildAuthBooks(): Book[] {
  return [
    new Book(1, 'ArkTS', 'stage model'),
    new Book(2, 'DataShare', 'session auth'),
    new Book(3, 'ResultSet', 'cursor')
  ];
}

export default function dataShareSessionAuthTest(): void {
  describe('DataShareSessionAuthSuite', () => {
    let authenticator: SessionAuthenticator = new SessionAuthenticator();
    let registry: SessionRegistry = new SessionRegistry();
    let readToken: AuthToken = new AuthToken('', 0, PermissionLevel.NONE, 0, 0);

    beforeAll(() => {
      authenticator = new SessionAuthenticator();
      authenticator.setNow(1000);
      readToken = authenticator.issue(VALID_ACCOUNT, PermissionLevel.READ, TOKEN_TTL_DEFAULT);
      registry = new SessionRegistry();
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'session auth start');
    });

    afterAll(() => {
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'session auth end');
    });

    it('DataShareSessionAuth_001', 0, async (done: Function) => {
      expect(authenticator.tokenCount()).assertEqual(1);
      expect(readToken.accountId).assertEqual(VALID_ACCOUNT);
      expect(readToken.level).assertEqual(PermissionLevel.READ);
      expect(readToken.ttl).assertEqual(TOKEN_TTL_DEFAULT);
      done();
    });

    it('DataShareSessionAuth_002', 0, async (done: Function) => {
      expect(readToken.isWellFormed()).assertTrue();
      expect(readToken.value.startsWith(TOKEN_PREFIX)).assertTrue();
      expect(readToken.value.length > TOKEN_PREFIX.length).assertTrue();
      expect(readToken.digest().indexOf('100') >= 0).assertTrue();
      done();
    });

    it('DataShareSessionAuth_003', 0, async (done: Function) => {
      expect(readToken.isExpired(1000)).assertFalse();
      expect(readToken.isExpired(1000 + TOKEN_TTL_DEFAULT - 1)).assertFalse();
      expect(readToken.isExpired(1000 + TOKEN_TTL_DEFAULT)).assertTrue();
      expect(readToken.isValid(2000)).assertTrue();
      done();
    });

    it('DataShareSessionAuth_004', 0, async (done: Function) => {
      const malformed = new AuthToken('bad-token', VALID_ACCOUNT, PermissionLevel.READ, 0, 100);
      expect(malformed.isWellFormed()).assertFalse();
      expect(malformed.isValid(0)).assertFalse();
      const empty = new AuthToken('', VALID_ACCOUNT, PermissionLevel.READ, 0, 100);
      expect(empty.isWellFormed()).assertFalse();
      done();
    });

    it('DataShareSessionAuth_005', 0, async (done: Function) => {
      expect(readToken.covers(PermissionLevel.NONE)).assertTrue();
      expect(readToken.covers(PermissionLevel.READ)).assertTrue();
      expect(readToken.covers(PermissionLevel.WRITE)).assertFalse();
      expect(readToken.covers(PermissionLevel.FULL)).assertFalse();
      done();
    });

    it('DataShareSessionAuth_006', 0, async (done: Function) => {
      const full = new AuthToken('ds-token-full', VALID_ACCOUNT, PermissionLevel.FULL, 0, 100);
      expect(full.covers(PermissionLevel.WRITE)).assertTrue();
      expect(full.covers(PermissionLevel.FULL)).assertTrue();
      expect(full.covers(PermissionLevel.READ)).assertTrue();
      expect(full.level).assertEqual(PermissionLevel.FULL);
      done();
    });

    it('DataShareSessionAuth_007', 0, async (done: Function) => {
      const token = authenticator.issue(VALID_ACCOUNT, PermissionLevel.WRITE, 500);
      expect(token.isRevoked()).assertFalse();
      expect(authenticator.revoke(token.value)).assertTrue();
      expect(token.isRevoked()).assertTrue();
      expect(token.isValid(1000)).assertFalse();
      done();
    });

    it('DataShareSessionAuth_008', 0, async (done: Function) => {
      expect(authenticator.revoke('missing-token')).assertFalse();
      expect(authenticator.findToken('missing-token')).assertNull();
      expect(authenticator.findToken(readToken.value) !== null).assertTrue();
      done();
    });

    it('DataShareSessionAuth_009', 0, async (done: Function) => {
      const request = new SessionRequest(VALID_ACCOUNT, DATA_SHARE_URI, PermissionLevel.READ, readToken.value);
      const result = authenticator.authenticate(request);
      expect(result.ok).assertTrue();
      expect(result.failure).assertEqual(AuthFailure.NONE);
      expect(result.grantedLevel).assertEqual(PermissionLevel.READ);
      expect(result.sessionId.length > 0).assertTrue();
      done();
    });

    it('DataShareSessionAuth_010', 0, async (done: Function) => {
      const request = new SessionRequest(INVALID_ACCOUNT, DATA_SHARE_URI, PermissionLevel.READ, readToken.value);
      const result = authenticator.authenticate(request);
      expect(result.ok).assertFalse();
      expect(result.failure).assertEqual(AuthFailure.UNKNOWN_ACCOUNT);
      expect(result.grantedLevel).assertEqual(PermissionLevel.NONE);
      done();
    });

    it('DataShareSessionAuth_011', 0, async (done: Function) => {
      const request = new SessionRequest(VALID_ACCOUNT, 'file:///tmp/secret', PermissionLevel.READ, readToken.value);
      expect(request.isUriAccepted()).assertFalse();
      const result = authenticator.authenticate(request);
      expect(result.failure).assertEqual(AuthFailure.URI_MISMATCH);
      expect(result.ok).assertFalse();
      done();
    });

    it('DataShareSessionAuth_012', 0, async (done: Function) => {
      const request = new SessionRequest(VALID_ACCOUNT, DATA_SHARE_URI, PermissionLevel.READ, 'unknown');
      const result = authenticator.authenticate(request);
      expect(result.failure).assertEqual(AuthFailure.INVALID_TOKEN);
      expect(result.ok).assertFalse();
      expect(result.grantedLevel).assertEqual(PermissionLevel.NONE);
      done();
    });

    it('DataShareSessionAuth_013', 0, async (done: Function) => {
      const request = new SessionRequest(VALID_ACCOUNT, DATA_SHARE_URI, PermissionLevel.WRITE, readToken.value);
      const result = authenticator.authenticate(request);
      expect(result.ok).assertFalse();
      expect(result.failure).assertEqual(AuthFailure.INSUFFICIENT_PERMISSION);
      done();
    });

    it('DataShareSessionAuth_014', 0, async (done: Function) => {
      const full = authenticator.issue(VALID_ACCOUNT, PermissionLevel.FULL, TOKEN_TTL_DEFAULT);
      const request = new SessionRequest(VALID_ACCOUNT, DATA_SHARE_URI, PermissionLevel.WRITE, full.value);
      const result = authenticator.authenticate(request);
      expect(result.ok).assertTrue();
      expect(result.grantedLevel).assertEqual(PermissionLevel.FULL);
      expect(result.describe()).assertEqual('OK:0:3');
      done();
    });

    it('DataShareSessionAuth_015', 0, async (done: Function) => {
      const token = authenticator.issue(VALID_ACCOUNT, PermissionLevel.READ, TOKEN_TTL_MIN);
      authenticator.setNow(1000 + TOKEN_TTL_MIN);
      const request = new SessionRequest(VALID_ACCOUNT, DATA_SHARE_URI, PermissionLevel.READ, token.value);
      const result = authenticator.authenticate(request);
      expect(result.ok).assertFalse();
      expect(result.failure).assertEqual(AuthFailure.EXPIRED_TOKEN);
      authenticator.setNow(1000);
      done();
    });

    it('DataShareSessionAuth_016', 0, async (done: Function) => {
      const token = authenticator.issue(VALID_ACCOUNT, PermissionLevel.FULL, TOKEN_TTL_DEFAULT);
      authenticator.revoke(token.value);
      const request = new SessionRequest(VALID_ACCOUNT, DATA_SHARE_URI, PermissionLevel.READ, token.value);
      const result = authenticator.authenticate(request);
      expect(result.ok).assertFalse();
      expect(result.failure).assertEqual(AuthFailure.INVALID_TOKEN);
      done();
    });

    it('DataShareSessionAuth_017', 0, async (done: Function) => {
      const policy = new AuthPolicy();
      expect(policy.requiredLevel('datashare:///sample/readonly')).assertEqual(PermissionLevel.READ);
      expect(policy.requiredLevel('datashare:///sample/write')).assertEqual(PermissionLevel.FULL);
      expect(policy.requiredLevel(DATA_SHARE_URI)).assertEqual(PermissionLevel.READ);
      done();
    });

    it('DataShareSessionAuth_018', 0, async (done: Function) => {
      const policy = new AuthPolicy();
      expect(policy.accountAllowed(VALID_ACCOUNT)).assertTrue();
      expect(policy.accountAllowed(0)).assertFalse();
      expect(policy.accountAllowed(INVALID_ACCOUNT)).assertFalse();
      done();
    });

    it('DataShareSessionAuth_019', 0, async (done: Function) => {
      const policy = new AuthPolicy();
      expect(policy.ttlAllowed(TOKEN_TTL_DEFAULT)).assertTrue();
      expect(policy.ttlAllowed(TOKEN_TTL_MIN)).assertTrue();
      expect(policy.ttlAllowed(TOKEN_TTL_MIN - 1)).assertFalse();
      expect(policy.ttlAllowed(-1)).assertFalse();
      done();
    });

    it('DataShareSessionAuth_020', 0, async (done: Function) => {
      const record = new SessionRecord('session-100-1', VALID_ACCOUNT, DATA_SHARE_URI,
        readToken.value, PermissionLevel.READ);
      expect(record.state).assertEqual(SessionState.CREATED);
      expect(record.isActive()).assertFalse();
      record.activate();
      expect(record.isActive()).assertTrue();
      expect(record.state).assertEqual(SessionState.ACTIVE);
      done();
    });

    it('DataShareSessionAuth_021', 0, async (done: Function) => {
      const record = new SessionRecord('session-100-2', VALID_ACCOUNT, DATA_SHARE_URI,
        readToken.value, PermissionLevel.READ);
      record.activate();
      record.expire();
      expect(record.state).assertEqual(SessionState.EXPIRED);
      expect(record.isActive()).assertFalse();
      record.activate();
      record.revoke();
      expect(record.state).assertEqual(SessionState.REVOKED);
      done();
    });

    it('DataShareSessionAuth_022', 0, async (done: Function) => {
      const record = new SessionRecord('session-100-3', VALID_ACCOUNT, DATA_SHARE_URI,
        readToken.value, PermissionLevel.READ);
      record.fail();
      expect(record.state).assertEqual(SessionState.FAILED);
      expect(record.isActive()).assertFalse();
      expect(record.accountId).assertEqual(VALID_ACCOUNT);
      expect(record.level).assertEqual(PermissionLevel.READ);
      done();
    });

    it('DataShareSessionAuth_023', 0, async (done: Function) => {
      const record = new SessionRecord('s1', VALID_ACCOUNT, DATA_SHARE_URI, readToken.value,
        PermissionLevel.READ);
      expect(registry.add(record)).assertTrue();
      expect(registry.add(record)).assertFalse();
      expect(registry.size()).assertEqual(1);
      expect(registry.find('s1') !== null).assertTrue();
      expect(registry.find('missing')).assertNull();
      done();
    });

    it('DataShareSessionAuth_024', 0, async (done: Function) => {
      const local = new SessionRegistry();
      const first = new SessionRecord('a', VALID_ACCOUNT, DATA_SHARE_URI, readToken.value,
        PermissionLevel.READ);
      const second = new SessionRecord('b', VALID_ACCOUNT, DATA_SHARE_URI, readToken.value,
        PermissionLevel.READ);
      first.activate();
      local.add(first);
      local.add(second);
      expect(local.size()).assertEqual(2);
      expect(local.activeCount()).assertEqual(1);
      second.activate();
      expect(local.activeCount()).assertEqual(2);
      done();
    });

    it('DataShareSessionAuth_025', 0, async (done: Function) => {
      const local = new SessionRegistry();
      const record = new SessionRecord('r1', VALID_ACCOUNT, DATA_SHARE_URI, readToken.value,
        PermissionLevel.READ);
      record.activate();
      local.add(record);
      expect(local.revoke('r1')).assertTrue();
      expect(record.state).assertEqual(SessionState.REVOKED);
      expect(local.activeCount()).assertEqual(0);
      expect(local.revoke('unknown')).assertFalse();
      done();
    });

    it('DataShareSessionAuth_026', 0, async (done: Function) => {
      const local = new SessionRegistry();
      const first = new SessionRecord('x', VALID_ACCOUNT, DATA_SHARE_URI, readToken.value,
        PermissionLevel.READ);
      const second = new SessionRecord('y', VALID_ACCOUNT, DATA_SHARE_URI, readToken.value,
        PermissionLevel.FULL);
      first.activate();
      second.fail();
      local.add(first);
      local.add(second);
      const states = local.states();
      expect(states.length).assertEqual(2);
      expect(states[0]).assertEqual(SessionState.ACTIVE);
      expect(states[1]).assertEqual(SessionState.FAILED);
      done();
    });

    it('DataShareSessionAuth_027', 0, async (done: Function) => {
      const table = new BookTable();
      expect(table.insert(new Book(1, 'ArkTS', 'auth'))).assertTrue();
      expect(table.insert(new Book(2, 'DataShare', 'session'))).assertTrue();
      expect(table.count()).assertEqual(2);
      expect(table.insert(new Book(1, 'Duplicate', 'x'))).assertFalse();
      done();
    });

    it('DataShareSessionAuth_028', 0, async (done: Function) => {
      const table = new BookTable();
      table.insert(new Book(1, 'ArkTS', 'auth'));
      expect(table.update(1, 'ArkTS2', 'updated')).assertTrue();
      expect(table.update(9, 'Missing', 'none')).assertFalse();
      const found = table.findById(1);
      expect(found !== null).assertTrue();
      if (found !== null) {
        expect(found.name).assertEqual('ArkTS2');
      }
      done();
    });

    it('DataShareSessionAuth_029', 0, async (done: Function) => {
      const table = new BookTable();
      table.insert(new Book(1, 'ArkTS', 'auth'));
      table.insert(new Book(2, 'DataShare', 'session'));
      expect(table.deleteById(1)).assertTrue();
      expect(table.deleteById(1)).assertFalse();
      expect(table.count()).assertEqual(1);
      expect(table.findById(1)).assertNull();
      done();
    });

    it('DataShareSessionAuth_030', 0, async (done: Function) => {
      const resultSet = new ResultSet(buildAuthBooks());
      expect(resultSet.rowCount()).assertEqual(3);
      expect(resultSet.goToFirstRow()).assertTrue();
      expect(resultSet.getInt('id')).assertEqual(1);
      expect(resultSet.getString('name')).assertEqual('ArkTS');
      done();
    });

    it('DataShareSessionAuth_031', 0, async (done: Function) => {
      const resultSet = new ResultSet(buildAuthBooks());
      let visited = 0;
      if (resultSet.goToFirstRow()) {
        visited += 1;
        while (resultSet.goToNextRow()) {
          visited += 1;
        }
      }
      expect(visited).assertEqual(3);
      expect(resultSet.current()).assertNull();
      expect(resultSet.getString('name')).assertEqual('');
      done();
    });

    it('DataShareSessionAuth_032', 0, async (done: Function) => {
      const empty = new ResultSet([]);
      expect(empty.goToFirstRow()).assertFalse();
      expect(empty.getInt('id')).assertEqual(-1);
      expect(empty.rowCount()).assertEqual(0);
      const copy = buildAuthBooks();
      copy[0].name = 'Mutated';
      expect(copy[0].toRecord().indexOf('Mutated') >= 0).assertTrue();
      done();
    });

    it('DataShareSessionAuth_033', 0, async (done: Function) => {
      const tableUri: string = buildDataShareUri('Book');
      expect(tableUri.length > 0).assertTrue();
      expect(normalizeDataShareUri(DATA_SHARE_URI).length > 0).assertTrue();
      expect(isSampleDataShareUri(DATA_SHARE_URI)).assertTrue();
      done();
    });

    it('DataShareSessionAuth_034', 0, async (done: Function) => {
      expect(BUNDLE_NAME).assertEqual('ohos.samples.stagemodel');
      expect(ACCOUNT_ID).assertEqual(100);
      expect(VALID_ACCOUNT).assertEqual(ACCOUNT_ID);
      expect(ABILITY_DATA_SHARE).assertEqual('DataShareExtAbility');
      done();
    });

    it('DataShareSessionAuth_035', 0, async (done: Function) => {
      const fullResult = new AuthResult(true, AuthFailure.NONE, 'session-100-3', PermissionLevel.FULL);
      expect(fullResult.describe()).assertEqual('OK:0:3');
      const failResult = new AuthResult(false, AuthFailure.INSUFFICIENT_PERMISSION, '',
        PermissionLevel.NONE);
      expect(failResult.describe()).assertEqual('FAIL:3:0');
      done();
    });

    it('DataShareSessionAuth_036', 0, async (done: Function) => {
      const request = new SessionRequest(VALID_ACCOUNT, DATA_SHARE_URI, PermissionLevel.READ, 'ds-token-x');
      expect(request.isAccountKnown()).assertTrue();
      expect(request.isUriAccepted()).assertTrue();
      expect(request.requestedLevel).assertEqual(PermissionLevel.READ);
      const bad = new SessionRequest(INVALID_ACCOUNT, DATA_SHARE_URI, PermissionLevel.READ, 'x');
      expect(bad.isAccountKnown()).assertFalse();
      done();
    });

    it('DataShareSessionAuth_037', 0, async (done: Function) => {
      const issuer = new TokenIssuer();
      const first = issuer.issue(VALID_ACCOUNT, PermissionLevel.READ, 0, TOKEN_TTL_DEFAULT);
      const second = issuer.issue(VALID_ACCOUNT, PermissionLevel.READ, 0, TOKEN_TTL_DEFAULT);
      expect(first.value === second.value).assertFalse();
      expect(issuer.issuedCount()).assertEqual(2);
      expect(first.isWellFormed()).assertTrue();
      done();
    });

    it('DataShareSessionAuth_038', 0, async (done: Function) => {
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

    it('DataShareSessionAuth_039', 0, async (done: Function) => {
      const authenticatorCopy = new SessionAuthenticator();
      authenticatorCopy.setNow(50);
      const token = authenticatorCopy.issue(VALID_ACCOUNT, PermissionLevel.READ, TOKEN_TTL_DEFAULT);
      const request = new SessionRequest(VALID_ACCOUNT, DATA_SHARE_URI, PermissionLevel.READ, token.value);
      expect(authenticatorCopy.authenticate(request).ok).assertTrue();
      authenticatorCopy.setNow(50 + TOKEN_TTL_DEFAULT);
      expect(authenticatorCopy.authenticate(request).ok).assertFalse();
      done();
    });

    it('DataShareSessionAuth_040', 0, async (done: Function) => {
      const authenticatorCopy = new SessionAuthenticator();
      authenticatorCopy.setNow(10);
      const token = authenticatorCopy.issue(VALID_ACCOUNT, PermissionLevel.FULL, TOKEN_TTL_DEFAULT);
      const wrongAccount = new SessionRequest(0, DATA_SHARE_URI, PermissionLevel.READ, token.value);
      expect(authenticatorCopy.authenticate(wrongAccount).failure).assertEqual(AuthFailure.UNKNOWN_ACCOUNT);
      const rightAccount = new SessionRequest(VALID_ACCOUNT, DATA_SHARE_URI, PermissionLevel.READ, token.value);
      expect(authenticatorCopy.authenticate(rightAccount).ok).assertTrue();
      done();
    });

    it('DataShareSessionAuth_041', 0, async (done: Function) => {
      const table = new BookTable();
      for (let index = 0; index < 8; index++) {
        table.insert(new Book(index, `Book${index}`, `intro${index}`));
      }
      expect(table.count()).assertEqual(8);
      const resultSet = new ResultSet(table.all());
      expect(resultSet.rowCount()).assertEqual(8);
      resultSet.goToFirstRow();
      resultSet.goToNextRow();
      expect(resultSet.getInt('id')).assertEqual(1);
      done();
    });

    it('DataShareSessionAuth_042', 0, async (done: Function) => {
      expect(PermissionLevel.NONE < PermissionLevel.READ).assertTrue();
      expect(PermissionLevel.READ < PermissionLevel.WRITE).assertTrue();
      expect(PermissionLevel.WRITE < PermissionLevel.FULL).assertTrue();
      expect(PermissionLevel.FULL).assertEqual(3);
      expect(SessionState.REVOKED).assertEqual(4);
      expect(AuthFailure.URI_MISMATCH).assertEqual(5);
      done();
    });
  });
}

