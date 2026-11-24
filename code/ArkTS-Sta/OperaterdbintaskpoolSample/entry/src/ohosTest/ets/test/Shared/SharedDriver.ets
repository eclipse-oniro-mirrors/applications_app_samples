'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0.
 */

import { Contact, RouterParams } from '../../../../main/ets/pages/model/Contact';
import { ContactManager } from '../../../../main/ets/pages/model/ContactManager';
import { TABLE_NAME, SQL_CREATE_TABLE, ABILITY, STORE_CONFIG } from '../../../../main/ets/pages/constant/RdbConstant';
import { CommonConstants } from '../../../../main/ets/pages/constant/CommonConstant';

// Test doubles below have no device database or UI side effects. Model tests use
// the real Contact and ContactManager; SQL constants are imported from production.
export const ACTION_ADD: string = '新增联系人';
export const ACTION_EDIT: string = '编辑联系人';
export const ACTION_DELETE: string = '删除联系人';
export const ROUTE_EDIT: string = 'pages/view/AddressBookEdit';
export const ROUTE_LIST: string = 'pages/view/OperateRDBInTaskPool';
export const ROUTE_DETAIL: string = 'pages/view/AddressBookDetail';
export const DUPLICATE_NAME_TOAST: string = '姓名已存在，请重新输入!';
export const CATEGORY_A: string = 'A';
export const CATEGORY_B: string = 'B';
export const CATEGORY_C: string = 'C';
export const CATEGORY_D: string = 'D';
export const CATEGORY_E: string = 'E';
export const CATEGORY_F: string = 'F';
export const CATEGORIES: string[] = ['A', 'B', 'C', 'D', 'E', 'F'];
export const MAX_NAME_LENGTH: int = CommonConstants.MAX_LENGTH_MODERATE;
export const MAX_PHONE_LENGTH: int = CommonConstants.MAX_LENGTH_MODERATE;
export const MAX_EMAIL_LENGTH: int = CommonConstants.MAX_LENGTH_LONG;
export const MAX_ADDRESS_LENGTH: int = CommonConstants.MAX_LENGTH_VERY_LONG;
export const TABLE_CONTACT: string = TABLE_NAME;
export const STORE_NAME: string = STORE_CONFIG.name;
export const STORE_ABILITY: string = ABILITY;
export const SQL_CREATE_CONTACT: string = SQL_CREATE_TABLE;
export const FIELD_NAME: string = 'name';
export const FIELD_PHONE: string = 'phone';
export const FIELD_EMAIL: string = 'email';
export const FIELD_ADDRESS: string = 'address';
export const FIELD_AVATAR: string = 'avatar';
export const FIELD_CATEGORY: string = 'category';
export const BUCKET_KEYS: string[] = ['name', 'phone', 'email', 'address', 'avatar', 'category'];
export const CONFLICT_REPLACE: string = 'ON_CONFLICT_REPLACE';
export const INITIAL_STORE_VALUE: int = 0;
export const EXPECTED_INSERT_ROW: int = 1;

export function contactOf(name: string = '', phone: string = '', email: string = '',
  address: string = '', avatar: string = '', category: string = ''): Contact {
  return new Contact(name, phone, email, address, avatar, category);
}
export function cloneContact(row: Contact): Contact {
  return new Contact(row.name, row.phone, row.email, row.address, row.avatar, row.category);
}
export function createSeedContacts(): Contact[] {
  return [
    new Contact('艾德里安', '13333333333', 'aidelian@example.com', '江苏省南京市鼓楼区', '', 'A'),
    new Contact('阿诺德', '16666666666', 'arnold@example.com', '上海市浦东新区', '', 'A'),
    new Contact('贝拉', '11111111111', 'bella@example.com', '湖北省武汉市江汉区', '', 'B'),
    new Contact('本', '12222222222', 'ben@example.com', '四川省成都市锦江区', '', 'B'),
    new Contact('本杰明', '16666666666', 'benjieiming@example.com', '上海市浦东新区', '', 'B'),
    new Contact('卡梅隆', '17777777777', 'cameron@example.com', '陕西省西安市雁塔区', '', 'C'),
    new Contact('康纳', '10000000000', 'connor@example.com', '辽宁省沈阳市沈河区', '', 'C'),
    new Contact('卡特琳娜', '11111111111', 'katrina@example.com', '吉林省长春市朝阳区', '', 'C'),
    new Contact('丹尼尔', '17777777777', 'cameron@example.com', '陕西省西安市雁塔区', '', 'D'),
    new Contact('戴维维', '11111111111', 'katrina@example.com', '吉林省长春市朝阳区', '', 'D'),
    new Contact('艾登', '17777777777', 'cameron@example.com', '陕西省西安市雁塔区', '', 'E'),
    new Contact('艾拉', '10000000000', 'connor@example.com', '辽宁省沈阳市沈河区', '', 'E'),
    new Contact('艾里', '11111111111', 'katrina@example.com', '吉林省长春市朝阳区', '', 'E'),
    new Contact('法比而', '10000000000', 'connor@example.com', '辽宁省沈阳市沈河区', '', 'F'),
    new Contact('法里', '11111111111', 'katrina@example.com', '吉林省长春市朝阳区', '', 'F')
  ];
}
export function resetContactManager(rows: Contact[] = []): ContactManager {
  const manager = ContactManager.getInstance();
  manager.setContacts(rows);
  return manager;
}
export function contactNames(rows: Contact[]): string[] { return rows.map((row: Contact): string => row.name); }
export function joined(items: string[], separator: string = ','): string { return items.join(separator); }
export function countOf(items: string[], item: string): int { return items.filter((s: string): boolean => s === item).length; }
export function uniqueStrings(items: string[]): string[] {
  const result: string[] = [];
  items.forEach((s: string) => { if (result.indexOf(s) < 0) result.push(s); });
  return result;
}
export function sameStringArray(left: string[], right: string[]): boolean {
  return left.length === right.length && left.every((s: string, i: int): boolean => s === right[i]);
}
export function sameContact(left: Contact, right: Contact): boolean {
  return left.name === right.name && left.phone === right.phone && left.email === right.email &&
    left.address === right.address && left.avatar === right.avatar && left.category === right.category;
}
export function containsChinese(text: string): boolean {
  for (let i = 0; i < text.length; i++) if (text.charCodeAt(i) >= 0x4e00 && text.charCodeAt(i) <= 0x9fff) return true;
  return false;
}
export function isDigitsOnly(text: string): boolean {
  if (text.length === 0) return false;
  for (let i = 0; i < text.length; i++) if (text.charCodeAt(i) < 48 || text.charCodeAt(i) > 57) return false;
  return true;
}
export function hasEmailShape(text: string): boolean {
  const at: int = text.indexOf('@');
  const dot: int = text.lastIndexOf('.');
  return at > 0 && dot > at + 1 && dot < text.length - 1;
}
export function textFingerprint(text: string): int {
  let hash: int = 216613;
  for (let i: int = 0; i < text.length; i++) hash = (hash * 31 + text.charCodeAt(i)) % 1000003;
  return hash;
}
export class ContactSnapshot {
  name: string; phone: string; email: string; address: string; category: string;
  constructor(row: Contact) {
    this.name = row.name; this.phone = row.phone; this.email = row.email;
    this.address = row.address; this.category = row.category;
  }
  sameAs(other: ContactSnapshot): boolean {
    return this.name === other.name && this.phone === other.phone && this.email === other.email &&
      this.address === other.address && this.category === other.category;
  }
  describe(): string { return [this.name, this.phone, this.email, this.address, this.category].join('/'); }
}
export function snapshotsOf(rows: Contact[]): ContactSnapshot[] {
  return rows.map((row: Contact): ContactSnapshot => new ContactSnapshot(row));
}
export function sameSnapshotArray(left: ContactSnapshot[], right: ContactSnapshot[]): boolean {
  return left.length === right.length && left.every((row: ContactSnapshot, i: int): boolean => row.sameAs(right[i]));
}
export function expectedAfterAdd(rows: Contact[], row: Contact): Contact[] { return [...rows, row].map((item: Contact): Contact => cloneContact(item)); }
export function expectedAfterDelete(rows: Contact[], name: string): Contact[] {
  return rows.filter((row: Contact): boolean => row.name !== name).map((item: Contact): Contact => cloneContact(item));
}
export function expectedAfterUpdate(rows: Contact[], row: Contact): Contact[] {
  const result = rows.map((item: Contact): Contact => cloneContact(item));
  const index = result.findIndex((old: Contact): boolean => old.name === row.name);
  if (index >= 0) result[index] = cloneContact(row);
  return result;
}
export class ContactValidation {
  static isDuplicateName(rows: Contact[], name: string): boolean { return rows.some((row: Contact): boolean => row.name === name); }
  static validate(row: Contact, rows: Contact[] = []): string[] {
    const errors: string[] = [];
    if (row.name.length === 0) errors.push('name-empty');
    if (row.name.length > MAX_NAME_LENGTH) errors.push('name-too-long');
    if (row.phone.length === 0) errors.push('phone-empty');
    else {
      if (row.phone.length > MAX_PHONE_LENGTH) errors.push('phone-too-long');
      if (!isDigitsOnly(row.phone)) errors.push('phone-not-numeric');
    }
    if (row.email.length === 0) errors.push('email-empty');
    else {
      if (row.email.length > MAX_EMAIL_LENGTH) errors.push('email-too-long');
      if (!hasEmailShape(row.email)) errors.push('email-malformed');
    }
    if (row.address.length === 0) errors.push('address-empty');
    if (row.address.length > MAX_ADDRESS_LENGTH) errors.push('address-too-long');
    if (ContactValidation.isDuplicateName(rows, row.name)) errors.push('name-duplicate');
    return errors;
  }
  static canSubmit(row: Contact, rows: Contact[] = []): boolean { return ContactValidation.validate(row, rows).length === 0; }
}
export class RouteRequest {
  action: string; contact: Contact;
  constructor(action: string, contact: Contact) { this.action = action; this.contact = contact; }
  static isKnownAction(action: string): boolean { return [ACTION_ADD, ACTION_EDIT, ACTION_DELETE].indexOf(action) >= 0; }
  static routeFor(action: string): string { return action === ACTION_ADD || action === ACTION_EDIT ? ROUTE_EDIT : ROUTE_LIST; }
  url(): string { return RouteRequest.routeFor(this.action); }
  toParams(): RouterParams { return new RouterParams(this.action, this.contact); }
  describe(): string { return this.action + ':' + this.contact.name + ':' + this.url(); }
}
export class SearchEngine {
  static filterByName(rows: Contact[], text: string): Contact[] {
    if (text.length === 0) return [...rows];
    return rows.filter((row: Contact): boolean => row.name.indexOf(text) >= 0)
      .map((row: Contact): Contact => cloneContact(row));
  }
  static countCategory(rows: Contact[], category: string): int { return rows.filter((row: Contact): boolean => row.category === category).length; }
  static groupByCategory(rows: Contact[]): string[] { return uniqueStrings(rows.map((row: Contact): string => row.category)); }
}
export class ContactMetrics {
  total: int = 0; uniqueNames: int = 0; duplicateNames: int = 0; categories: int = 0; totalPhoneDigits: int = 0;
  static from(rows: Contact[]): ContactMetrics {
    const metrics = new ContactMetrics();
    metrics.total = rows.length;
    metrics.uniqueNames = uniqueStrings(contactNames(rows)).length;
    metrics.duplicateNames = metrics.total - metrics.uniqueNames;
    metrics.categories = SearchEngine.groupByCategory(rows).length;
    rows.forEach((row: Contact) => { metrics.totalPhoneDigits += row.phone.length; });
    return metrics;
  }
  fillRatio(): number { return this.total === 0 ? 0.0 : Int.toDouble(this.uniqueNames) / this.total; }
  fingerprint(): int { return textFingerprint([String(this.total), String(this.uniqueNames), String(this.categories), String(this.totalPhoneDigits)].join(':')); }
}
export class Bucket {
  keys: string[] = []; values: string[] = [];
  put(key: string, value: string): void {
    const index = this.keys.indexOf(key);
    if (index < 0) { this.keys.push(key); this.values.push(value); } else this.values[index] = value;
  }
  get(key: string): string { const index = this.keys.indexOf(key); return index < 0 ? '' : this.values[index]; }
  has(key: string): boolean { return this.keys.indexOf(key) >= 0; }
  sameAs(other: Bucket): boolean { return sameStringArray(this.keys, other.keys) && sameStringArray(this.values, other.values); }
  size(): int { return this.keys.length; }
  keyAt(index: int): string | undefined { return index < 0 || index >= this.keys.length ? undefined : this.keys[index]; }
  valueAt(index: int): string | undefined { return index < 0 || index >= this.values.length ? undefined : this.values[index]; }
  describe(): string { return this.keys.map((key: string, i: int): string => key + '=' + this.values[i]).join(';'); }
}
export class ContactMapper {
  static toBucket(row: Contact): Bucket {
    const bucket = new Bucket();
    const values: string[] = [row.name, row.phone, row.email, row.address, row.avatar, row.category];
    BUCKET_KEYS.forEach((key: string, i: int) => { bucket.put(key, values[i]); });
    return bucket;
  }
  static fromBucket(bucket: Bucket): Contact { return new Contact(bucket.get(FIELD_NAME), bucket.get(FIELD_PHONE), bucket.get(FIELD_EMAIL), bucket.get(FIELD_ADDRESS), bucket.get(FIELD_AVATAR), bucket.get(FIELD_CATEGORY)); }
  static toBuckets(rows: Contact[]): Bucket[] { return rows.map((row: Contact): Bucket => ContactMapper.toBucket(row)); }
}
export class SchemaInfo {
  statement: string; table: string = ''; columns: string[] = []; notNullColumns: string[] = [];
  primaryKey: string = ''; autoincrement: boolean = false;
  constructor(statement: string) {
    this.statement = statement;
    const open = statement.indexOf('('), close = statement.lastIndexOf(')');
    if (open < 0 || close < open) return;
    const marker = statement.indexOf('EXISTS');
    if (marker >= 0) this.table = statement.substring(marker + 6, open).trim();
    const definitions = statement.substring(open + 1, close).split(',');
    definitions.forEach((definition: string) => {
      const text = definition.trim();
      const key = text.split(' ')[0];
      this.columns.push(key);
      if (text.indexOf('NOT NULL') >= 0) this.notNullColumns.push(key);
      if (text.indexOf('PRIMARY KEY') >= 0) this.primaryKey = key;
      if (text.indexOf('AUTOINCREMENT') >= 0) this.autoincrement = true;
    });
  }
  columnCount(): int { return this.columns.length; }
  hasColumn(name: string): boolean { return this.columns.indexOf(name) >= 0; }
  isNotNull(name: string): boolean { return this.notNullColumns.indexOf(name) >= 0; }
  describe(): string { return [this.table, joined(this.columns), joined(this.notNullColumns), this.primaryKey, String(this.autoincrement)].join('|'); }
}
export class CursorResultSet {
  rows: Contact[]; columnNames: string[] = [...BUCKET_KEYS]; index: int = -1; closed: boolean = false;
  constructor(rows: Contact[]) { this.rows = rows; }
  rowCount(): int { return this.rows.length; }
  goToFirstRow(): boolean { this.index = 0; return this.rows.length > 0; }
  goToNextRow(): boolean { this.index++; return this.index < this.rows.length; }
  isAfterLast(): boolean { return this.index >= this.rows.length; }
  getColumnIndex(name: string): int { return this.columnNames.indexOf(name); }
  getString(column: int): string {
    if (this.index < 0 || this.index >= this.rows.length || column < 0 || column >= this.columnNames.length) return '';
    return ContactMapper.toBucket(this.rows[this.index]).get(this.columnNames[column]);
  }
  close(): void { this.closed = true; }
}
// This fixture models the suites' first-row-skip contract. It is a pure cursor
// model, not an invocation of DatabaseConnection or the native ResultSet API.
export function readContactsFromResultSet(cursor: CursorResultSet): Contact[] {
  const result: Contact[] = [];
  const hasFirst = cursor.goToFirstRow();
  while (hasFirst && cursor.goToNextRow()) {
    const row = ContactMapper.fromBucket(ContactMapper.toBucket(cursor.rows[cursor.index]));
    if (!result.some((old: Contact): boolean => old.name === row.name && old.phone === row.phone)) result.push(row);
  }
  cursor.close();
  return result;
}
export function expectedVisibleRows(rows: Contact[]): Contact[] {
  const names: string[] = [], phones: string[] = [], result: Contact[] = [];
  for (let i = 1; i < rows.length; i++) {
    let duplicate = false;
    for (let j = 0; j < names.length; j++) if (names[j] === rows[i].name && phones[j] === rows[i].phone) duplicate = true;
    if (!duplicate) { result.push(cloneContact(rows[i])); names.push(rows[i].name); phones.push(rows[i].phone); }
  }
  return result;
}
export function expectedVisibleCount(rows: Contact[]): int { return expectedVisibleRows(rows).length; }
export function expectedBatchCount(rows: Contact[]): int { return rows.length; }
export class StoreDouble {
  rows: Contact[] = []; initialized: boolean = false; lastContextValid: boolean = false;
  initCalls: int = 0; createTableCalls: int = 0; queryCalls: int = 0; insertCalls: int = 0;
  batchCalls: int = 0; updateCalls: int = 0; deleteCalls: int = 0;
  failNextBatch: boolean = false;
  reset(): void {
    this.rows = []; this.initialized = false; this.lastContextValid = false;
    this.initCalls = 0; this.createTableCalls = 0; this.queryCalls = 0; this.insertCalls = 0;
    this.batchCalls = 0; this.updateCalls = 0; this.deleteCalls = 0;
    this.failNextBatch = false;
  }
  init(contextValid: boolean): boolean {
    this.initCalls++; this.lastContextValid = contextValid;
    if (!contextValid || this.initialized) return false;
    this.initialized = true; this.createTableCalls++;
    return true;
  }
  query(contextValid: boolean): Contact[] {
    this.queryCalls++;
    if (!contextValid) return [];
    return this.rows.map((item: Contact): Contact => cloneContact(item));
  }
  insert(contextValid: boolean, row: Contact, conflict: string = CONFLICT_REPLACE): int {
    this.insertCalls++;
    if (!this.initialized && !this.init(contextValid)) return -1;
    this.rows.push(cloneContact(row));
    return this.rows.length;
  }
  batchInsert(contextValid: boolean, rows: Contact[]): int {
    this.batchCalls++;
    if (this.failNextBatch) { this.failNextBatch = false; return -1; }
    if (!this.initialized && !this.init(contextValid)) return -1;
    rows.forEach((row: Contact) => { this.rows.push(cloneContact(row)); });
    return rows.length;
  }
  updateContact(row: Contact): int {
    this.updateCalls++;
    let affected = 0;
    this.rows.forEach((old: Contact) => {
      if (old.name === row.name) { old.phone = row.phone; old.email = row.email; old.address = row.address; affected++; }
    });
    return affected;
  }
  deleteByName(name: string): int {
    this.deleteCalls++;
    const before = this.rows.length;
    this.rows = this.rows.filter((row: Contact): boolean => row.name !== name);
    return before - this.rows.length;
  }
  rowCount(): int { return this.rows.length; }
  names(): string[] { return contactNames(this.rows); }
}
export function wrappedBatchCount(contextValid: boolean, store: StoreDouble, rows: Contact[]): int {
  const result = store.batchInsert(contextValid, rows); return result < 0 ? 0 : result;
}
export function wrappedQueryResult(contextValid: boolean, store: StoreDouble): Contact[] { if (!contextValid) return []; return store.query(true); }
export class TaskPoolQueue {
  public pending: string[] = [];
  public running: string[] = [];
  public completed: string[] = [];
  public failed: string[] = [];
  public completionOrder: string[] = [];

  public submit(name: string): void {
    this.pending.push(name);
  }

  public runNext(): string {
    if (this.pending.length === 0) {
      return '';
    }
    const name = this.pending.shift() as string;
    this.running.push(name);
    return name;
  }

  public complete(name: string): void {
    const index = this.running.indexOf(name);
    if (index >= 0) {
      this.running.splice(index, 1);
    }
    this.completed.push(name);
    this.completionOrder.push(name);
  }

  public fail(name: string): void {
    const index = this.running.indexOf(name);
    if (index >= 0) {
      this.running.splice(index, 1);
    }
    this.failed.push(name);
  }

  public drain(): int {
    let count = 0;
    while (this.pending.length > 0) {
      const name = this.runNext();
      this.complete(name);
      count = count + 1;
    }
    return count;
  }

  public size(): int {
    return this.pending.length + this.running.length;
  }

  public trace(): string {
    return joined(this.completionOrder, '>');
  }

  public reset(): void {
    this.pending = [];
    this.running = [];
    this.completed = [];
    this.failed = [];
    this.completionOrder = [];
  }
}

/** Wrapper fallbacks: query [] and batch insert 0 after a caught throw. */

export class OperationCatalog {
  public static readonly CREATE_TABLE: string = 'create-table';
  public static readonly INIT_STORE: string = 'init-store';
  public static readonly BATCH_INSERT: string = 'batch-insert';
  public static readonly QUERY_ALL: string = 'query-all';
  public static readonly INSERT_ONE: string = 'insert-one';
  public static readonly UPDATE_ONE: string = 'update-one';
  public static readonly DELETE_ONE: string = 'delete-one';
  public static readonly DEDUPE_ROWS: string = 'dedupe-rows';

  public static all(): string[] {
    return [
      OperationCatalog.CREATE_TABLE,
      OperationCatalog.INIT_STORE,
      OperationCatalog.BATCH_INSERT,
      OperationCatalog.QUERY_ALL,
      OperationCatalog.INSERT_ONE,
      OperationCatalog.UPDATE_ONE,
      OperationCatalog.DELETE_ONE,
      OperationCatalog.DEDUPE_ROWS
    ];
  }
}

/** Error codes used by the recovery suites. */

export const ERROR_CONTEXT_MISSING: number = 401;

export const ERROR_STORE_INIT: number = 14800011;

export const ERROR_SQL_EXECUTION: number = 14800015;

export const ERROR_TABLE_MISSING: number = 14800001;

export const ERROR_NONE: number = 0;

/** Maps a thrown SQL error to the wrapper fallback the page observes. */

export function fallbackForOperation(operation: string, errorCode: number): number {
  if (errorCode === ERROR_NONE) {
    return 0;
  }
  if (operation === OperationCatalog.BATCH_INSERT) {
    return 0;
  }
  return -1;
}

/** True when the page would keep going because no context was supplied. */

export function continuesWithoutContext(contextValid: boolean): boolean {
  return !contextValid;
}

/** Expected number of rows written by a batch insert under normal conditions. */

export function redactPhone(phone: string): string {
  if (phone.length <= 3) {
    return '***';
  }
  return '***' + phone.substring(phone.length - 3);
}

/** Keeps the first character and the domain of an email address. */

export function redactEmail(email: string): string {
  const at = email.indexOf('@');
  if (at <= 0) {
    return '***';
  }
  return email.substring(0, 1) + '***' + email.substring(at);
}

/** True when a value carries SQL meta characters that must be bound. */

export function hasSqlMeta(value: string): boolean {
  return value.indexOf("'") >= 0 || value.indexOf(';') >= 0 || value.indexOf('--') >= 0 ||
    value.indexOf('/*') >= 0;
}

/** True when a value contains control characters that must not reach a log. */

export function hasControlCharacters(value: string): boolean {
  for (let index = 0; index < value.length; index++) {
    const code = value.charCodeAt(index);
    if (code < 32 || code === 127) {
      return true;
    }
  }
  return false;
}

/** Only lowercase letters, digits, dot, underscore and dash are safe file names. */

export function isSafeDbName(name: string): boolean {
  if (name.length === 0) {
    return false;
  }
  for (let index = 0; index < name.length; index++) {
    const code = name.charCodeAt(index);
    const lower = code >= 97 && code <= 122;
    const digit = code >= 48 && code <= 57;
    if (!lower && !digit && code !== 46 && code !== 95 && code !== 45) {
      return false;
    }
  }
  return true;
}

/** Builds the parameter list used by the delete statement, in order. */

export function deleteBindings(contact: Contact): string[] {
  return [contact.name];
}

/** Builds the parameter list used by the update statement, in order. */

export function updateBindings(contact: Contact): string[] {
  return [contact.phone, contact.email, contact.address, contact.name];
}

/** The update statement literal from DatabaseConnection.ets:270. */

export const SQL_UPDATE_CONTACT: string =
  'UPDATE contact SET phone = ?, email = ?, address = ? WHERE name = ?;';

/** The delete statement literal from DatabaseConnection.ets:235. */

export const SQL_DELETE_CONTACT: string = 'DELETE FROM contact WHERE name = ?;';

/** The query statement literal from DatabaseConnection.ets:127. */

export const SQL_QUERY_CONTACT: string = 'select * from contact';
