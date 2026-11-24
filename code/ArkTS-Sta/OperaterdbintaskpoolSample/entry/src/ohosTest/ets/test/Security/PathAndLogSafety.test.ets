'use static';
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

/*
 * Path, identifier and log safety. Anchors:
 *   RdbConstant.ets:31-38       table "contact", file "contact.db", ability "EntryAbility"
 *   DatabaseConnection.ets:235  'DELETE FROM contact WHERE name = ?;'
 *   DatabaseConnection.ets:269  'UPDATE contact SET phone = ?, email = ?, address = ? WHERE name = ?;'
 *   Contact.ets:49-56           RouterParams carries only text and data
 *   AddressBookEdit.ets:96-110  toast text is a fixed literal, never user data
 *
 * The audit helpers below model the transport shape rather than capturing hilog.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { Contact, RouterParams } from '../../../../main/ets/pages/model/Contact';
import {
  TABLE_CONTACT,
  STORE_NAME,
  STORE_ABILITY,
  SQL_CREATE_CONTACT,
  BUCKET_KEYS,
  SchemaInfo,
  ContactMapper,
  ACTION_ADD,
  ACTION_EDIT,
  ACTION_DELETE,
  ROUTE_EDIT,
  ROUTE_LIST,
  DUPLICATE_NAME_TOAST,
  createSeedContacts,
  contactOf,
  textFingerprint,
  resetContactManager,
  RouteRequest,
  snapshotsOf
} from '../Shared/SharedDriver';
import { logSuite, logStep } from '../Shared/Support';

const DELETE_SQL: string = 'DELETE FROM contact WHERE name = ?;';
const UPDATE_SQL: string = 'UPDATE contact SET phone = ?, email = ?, address = ? WHERE name = ?;';

function isEnglishOnly(text: string): boolean {
  for (let index = 0; index < text.length; index++) {
    const code = text.charCodeAt(index);
    if (code < 32 || code > 126) {
      return false;
    }
  }
  return text.length > 0;
}

function longestDigitRun(text: string): number {
  let longest: number = 0;
  let current = 0;
  for (let index = 0; index < text.length; index++) {
    const code = text.charCodeAt(index);
    if (code >= 48 && code <= 57) {
      current = current + 1;
      if (current > longest) {
        longest = current;
      }
    } else {
      current = 0;
    }
  }
  return longest;
}

function containsMarker(text: string): boolean {
  const lowered = text.toLowerCase();
  return lowered.indexOf('password') >= 0 || lowered.indexOf('token') >= 0 ||
    lowered.indexOf('secret') >= 0 || lowered.indexOf('bearer') >= 0;
}

function placeholderCount(sql: string): number {
  let count = 0;
  for (let index = 0; index < sql.length; index++) {
    if (sql.substring(index, index + 1) === '?') {
      count = count + 1;
    }
  }
  return count;
}

function isSafeIdentifier(name: string): boolean {
  if (name.length === 0) {
    return false;
  }
  for (let index = 0; index < name.length; index++) {
    const code = name.charCodeAt(index);
    const digit = code >= 48 && code <= 57;
    const lower = code >= 97 && code <= 122;
    const upper = code >= 65 && code <= 90;
    const underscore = code === 95;
    const dot = code === 46;
    if (!digit && !lower && !upper && !underscore && !dot) {
      return false;
    }
  }
  return true;
}

function exposesSecret(params: RouterParams): boolean {
  if (params.text !== undefined && containsMarker(params.text!)) {
    return true;
  }
  if (params.data === undefined) {
    return false;
  }
  const contact = params.data as Contact;
  return containsMarker(contact.name) || containsMarker(contact.phone) ||
    containsMarker(contact.email) || containsMarker(contact.address) ||
    containsMarker(contact.avatar) || containsMarker(contact.category);
}

class AuditLog {
  public lines: string[] = [];
  public consoleCalls: number = 0;

  public suite(name: string, state: string): void {
    this.lines.push(name + ' ' + state);
  }

  public step(name: string, detail: string): void {
    this.lines.push(name + ' :: ' + detail);
  }

  public writeViaConsole(): void {
    this.consoleCalls = this.consoleCalls + 1;
  }

  public size(): number {
    return this.lines.length;
  }

  public clear(): void {
    this.lines = [];
  }

  public allEnglish(): boolean {
    for (let index = 0; index < this.lines.length; index++) {
      if (!isEnglishOnly(this.lines[index])) {
        return false;
      }
    }
    return true;
  }

  public maxDigitRun(): number {
    let longest: number = 0;
    for (let index = 0; index < this.lines.length; index++) {
      const run = longestDigitRun(this.lines[index]);
      if (run > longest) {
        longest = run;
      }
    }
    return longest;
  }

  public joined(separator: string): string {
    let text = '';
    for (let index = 0; index < this.lines.length; index++) {
      if (index > 0) {
        text = text + separator;
      }
      text = text + this.lines[index];
    }
    return text;
  }
}

export default function pathAndLogSafetyTest(): void {
  describe('PathAndLogSafety', () => {
    const audit: AuditLog = new AuditLog();

    beforeAll(() => {
      logSuite('PathAndLogSafety', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      audit.clear();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('PathAndLogSafety', 'end');
    });

    /**
     * @tc.name   logSafetyBufferStartsEmpty
     * @tc.desc   A fresh audit buffer holds no lines and has never used the console channel.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PathAndLogSafety scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('logSafetyBufferStartsEmpty', 0, () => {
      expect(audit.size()).assertEqual(0);
      expect(audit.consoleCalls).assertEqual(0);
      expect(audit.allEnglish()).assertTrue();
      expect(audit.joined(',')).assertEqual('');
      expect(audit.maxDigitRun()).assertEqual(0);
    });

    /**
     * @tc.name   logSafetySuiteLineRecordsNameAndState
     * @tc.desc   A suite boundary entry keeps the ASCII suite name and the state word on one line.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PathAndLogSafety scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('logSafetySuiteLineRecordsNameAndState', 0, () => {
      audit.suite('PathAndLogSafety', 'begin');
      expect(audit.size()).assertEqual(1);
      expect(audit.lines[0]).assertEqual('PathAndLogSafety begin');
      expect(audit.lines[0].startsWith('PathAndLogSafety')).assertTrue();
      expect(audit.lines[0].endsWith('begin')).assertTrue();
      expect(isEnglishOnly(audit.lines[0])).assertTrue();
    });

    /**
     * @tc.name   logSafetySuiteLineIsEnglishOnly
     * @tc.desc   Suite boundary text uses printable ASCII, so device logs stay in the English locale.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PathAndLogSafety scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('logSafetySuiteLineIsEnglishOnly', 0, () => {
      audit.suite('PathAndLogSafety', 'end');
      const line = audit.lines[0];
      expect(audit.allEnglish()).assertTrue();
      expect(isEnglishOnly(line)).assertTrue();
      expect(isEnglishOnly('边界')).assertFalse();
      expect(isEnglishOnly('line\nbreak')).assertFalse();
      expect(line.indexOf('\t')).assertEqual(-1);
    });

    /**
     * @tc.name   logSafetyStepLineAppendsOneDetail
     * @tc.desc   A step entry joins the step name and the detail with the double colon separator.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PathAndLogSafety scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('logSafetyStepLineAppendsOneDetail', 0, () => {
      const stepName = 'logSafetyStepLineAppendsOneDetail';
      audit.step(stepName, 'init-store');
      expect(audit.size()).assertEqual(1);
      expect(audit.lines[0]).assertEqual(stepName + ' :: init-store');
      expect(audit.lines[0].indexOf(' :: ')).assertEqual(stepName.length);
      expect(audit.lines[0].split('::').length).assertEqual(2);
      expect(audit.maxDigitRun()).assertEqual(0);
      expect(audit.allEnglish()).assertTrue();
    });

    /**
     * @tc.name   logSafetyBufferPreservesInsertionOrder
     * @tc.desc   Entries are appended in call order, so the joined trace matches the operation sequence.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PathAndLogSafety scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('logSafetyBufferPreservesInsertionOrder', 0, () => {
      audit.suite('PathAndLogSafety', 'begin');
      audit.step('stage', 'batch-insert');
      audit.step('stage', 'query-all');
      expect(audit.size()).assertEqual(3);
      expect(audit.lines[1]).assertEqual('stage :: batch-insert');
      expect(audit.lines[2]).assertEqual('stage :: query-all');
      expect(audit.joined('|')).assertEqual('PathAndLogSafety begin|stage :: batch-insert|stage :: query-all');
      expect(audit.lines[1].endsWith('batch-insert')).assertTrue();
    });

    /**
     * @tc.name   logSafetyClearEmptiesTheBuffer
     * @tc.desc   Clearing drops every recorded line while the console counter and helpers stay usable.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PathAndLogSafety scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('logSafetyClearEmptiesTheBuffer', 0, () => {
      audit.suite('PathAndLogSafety', 'begin');
      audit.step('stage', 'delete-one');
      expect(audit.size()).assertEqual(2);
      audit.clear();
      expect(audit.size()).assertEqual(0);
      expect(audit.joined(',')).assertEqual('');
      expect(audit.maxDigitRun()).assertEqual(0);
      expect(audit.consoleCalls).assertEqual(0);
      audit.step('stage', 'query-all');
      expect(audit.size()).assertEqual(1);
      expect(audit.lines[0]).assertEqual('stage :: query-all');
    });

    /**
     * @tc.name   logSafetyConsoleChannelStaysUnused
     * @tc.desc   The suite never routes a line through console; the forbidden counter must remain zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PathAndLogSafety scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('logSafetyConsoleChannelStaysUnused', 0, () => {
      audit.suite('PathAndLogSafety', 'begin');
      audit.step('stage', 'create-table');
      audit.step('stage', 'init-store');
      expect(audit.consoleCalls).assertEqual(0);
      expect(audit.size()).assertEqual(3);
      expect(audit.allEnglish()).assertTrue();
      expect(audit.maxDigitRun()).assertEqual(0);
      expect(audit.lines.length).assertEqual(3);
    });

    /**
     * @tc.name   logSafetyRejectsControlCharactersInDetails
     * @tc.desc   Tabs, newlines and carriage returns are not English printable text for log payloads.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PathAndLogSafety scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('logSafetyRejectsControlCharactersInDetails', 0, () => {
      expect(isEnglishOnly('batch insert')).assertTrue();
      expect(isEnglishOnly('batch\tinsert')).assertFalse();
      expect(isEnglishOnly('batch\ninsert')).assertFalse();
      expect(isEnglishOnly('batch\rinsert')).assertFalse();
      expect(isEnglishOnly('')).assertFalse();
      expect(isEnglishOnly('stage :: update-one')).assertTrue();
    });

    /**
     * @tc.name   logSafetyActionNamesCarryNoPhoneDigits
     * @tc.desc   The three action literals contain no digit run long enough to look like a phone number.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PathAndLogSafety scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('logSafetyActionNamesCarryNoPhoneDigits', 0, () => {
      expect(longestDigitRun(ACTION_ADD)).assertEqual(0);
      expect(longestDigitRun(ACTION_EDIT)).assertEqual(0);
      expect(longestDigitRun(ACTION_DELETE)).assertEqual(0);
      expect(longestDigitRun('13800138000')).assertEqual(11);
      expect(longestDigitRun('a1b22c333')).assertEqual(3);
      expect(longestDigitRun(DUPLICATE_NAME_TOAST)).assertEqual(0);
    });

    /**
     * @tc.name   logSafetyRouteNamesCarryNoAtSign
     * @tc.desc   Page routes contain no email separator, so they cannot smuggle a user address into logs.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PathAndLogSafety scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('logSafetyRouteNamesCarryNoAtSign', 0, () => {
      expect(ROUTE_EDIT.indexOf('@')).assertEqual(-1);
      expect(ROUTE_LIST.indexOf('@')).assertEqual(-1);
      expect(STORE_ABILITY.indexOf('@')).assertEqual(-1);
      expect(TABLE_CONTACT.indexOf('@')).assertEqual(-1);
      expect('shen@example.com'.indexOf('@') > 0).assertTrue();
      expect(ROUTE_EDIT.startsWith('pages/')).assertTrue();
    });

    /**
     * @tc.name   logSafetyFieldCatalogHasNoValues
     * @tc.desc   The six bucket names are plain lowercase identifiers with no digits, at signs or spaces.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PathAndLogSafety scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('logSafetyFieldCatalogHasNoValues', 0, () => {
      expect(BUCKET_KEYS.length).assertEqual(6);
      for (let index = 0; index < BUCKET_KEYS.length; index++) {
        expect(isSafeIdentifier(BUCKET_KEYS[index])).assertTrue();
        expect(BUCKET_KEYS[index].toLowerCase()).assertEqual(BUCKET_KEYS[index]);
        expect(longestDigitRun(BUCKET_KEYS[index])).assertEqual(0);
        expect(BUCKET_KEYS[index].indexOf('@')).assertEqual(-1);
      }
      expect(BUCKET_KEYS[0]).assertEqual('name');
      expect(BUCKET_KEYS[5]).assertEqual('category');
    });

    /**
     * @tc.name   logSafetyTableNameIsASafeIdentifier
     * @tc.desc   The table identifier is lowercase letters only, with no quoting or statement terminator.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PathAndLogSafety scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('logSafetyTableNameIsASafeIdentifier', 0, () => {
      expect(isSafeIdentifier(TABLE_CONTACT)).assertTrue();
      expect(TABLE_CONTACT).assertEqual('contact');
      expect(TABLE_CONTACT.indexOf(' ')).assertEqual(-1);
      expect(TABLE_CONTACT.indexOf(';')).assertEqual(-1);
      expect(TABLE_CONTACT.indexOf('\'')).assertEqual(-1);
      expect(TABLE_CONTACT.indexOf('/')).assertEqual(-1);
      expect(longestDigitRun(TABLE_CONTACT)).assertEqual(0);
    });

    /**
     * @tc.name   logSafetyStoreNameIsABareFileName
     * @tc.desc   The database file is a bare name ending in .db, with no directory or drive prefix.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PathAndLogSafety scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('logSafetyStoreNameIsABareFileName', 0, () => {
      expect(STORE_NAME).assertEqual('contact.db');
      expect(STORE_NAME.endsWith('.db')).assertTrue();
      expect(STORE_NAME.indexOf('/')).assertEqual(-1);
      expect(STORE_NAME.indexOf('\\')).assertEqual(-1);
      expect(STORE_NAME.indexOf(':')).assertEqual(-1);
      expect(STORE_NAME.indexOf('..')).assertEqual(-1);
      expect(isSafeIdentifier(STORE_NAME)).assertTrue();
    });

    /**
     * @tc.name   logSafetyAbilityNameIsABareIdentifier
     * @tc.desc   The ability literal is alphanumeric, so it cannot be interpreted as a path fragment.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PathAndLogSafety scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('logSafetyAbilityNameIsABareIdentifier', 0, () => {
      expect(STORE_ABILITY).assertEqual('EntryAbility');
      expect(isSafeIdentifier(STORE_ABILITY)).assertTrue();
      expect(STORE_ABILITY.indexOf('/')).assertEqual(-1);
      expect(STORE_ABILITY.indexOf('\\')).assertEqual(-1);
      expect(STORE_ABILITY.indexOf('.')).assertEqual(-1);
      expect(STORE_ABILITY.startsWith('Entry')).assertTrue();
      expect(longestDigitRun(STORE_ABILITY)).assertEqual(0);
    });

    /**
     * @tc.name   logSafetyCreateTableHasNoUserValues
     * @tc.desc   The schema statement contains no literal email, phone digits or quoted values.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PathAndLogSafety scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('logSafetyCreateTableHasNoUserValues', 0, () => {
      expect(SQL_CREATE_CONTACT.indexOf('@')).assertEqual(-1);
      expect(longestDigitRun(SQL_CREATE_CONTACT)).assertEqual(0);
      expect(SQL_CREATE_CONTACT.indexOf('\'')).assertEqual(-1);
      expect(SQL_CREATE_CONTACT.indexOf('INSERT')).assertEqual(-1);
      expect(SQL_CREATE_CONTACT.indexOf('IF NOT EXISTS')).assertLarger(0);
      expect(SQL_CREATE_CONTACT.endsWith(')')).assertTrue();
      expect(SQL_CREATE_CONTACT.indexOf('contact.db')).assertEqual(-1);
    });

    /**
     * @tc.name   logSafetyCreateTableColumnsMatchBucketKeys
     * @tc.desc   The parsed schema exposes exactly the six business identifiers used by the mapper.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PathAndLogSafety scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('logSafetyCreateTableColumnsMatchBucketKeys', 0, () => {
      const schema = new SchemaInfo(SQL_CREATE_CONTACT);
      expect(schema.columnCount()).assertEqual(7);
      expect(schema.columns[0]).assertEqual('id');
      for (let index = 0; index < BUCKET_KEYS.length; index++) {
        expect(schema.hasColumn(BUCKET_KEYS[index])).assertTrue();
        expect(isSafeIdentifier(schema.columns[index + 1])).assertTrue();
      }
      expect(schema.columns.length).assertEqual(7);
    });

    /**
     * @tc.name   logSafetyDeleteSqlBindsTheName
     * @tc.desc   The delete statement carries one bound placeholder and no literal name text.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PathAndLogSafety scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('logSafetyDeleteSqlBindsTheName', 0, () => {
      const sample = createSeedContacts()[0];
      expect(placeholderCount(DELETE_SQL)).assertEqual(1);
      expect(DELETE_SQL.indexOf('?')).assertLarger(0);
      expect(DELETE_SQL.indexOf(sample.name)).assertEqual(-1);
      expect(DELETE_SQL.indexOf(sample.phone)).assertEqual(-1);
      expect(DELETE_SQL.indexOf('DELETE FROM contact')).assertEqual(0);
      expect(longestDigitRun(DELETE_SQL)).assertEqual(0);
    });

    /**
     * @tc.name   logSafetyUpdateSqlBindsFourValues
     * @tc.desc   The update binds phone, email, address and the name key without embedding any value.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PathAndLogSafety scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('logSafetyUpdateSqlBindsFourValues', 0, () => {
      const sample = createSeedContacts()[1];
      expect(placeholderCount(UPDATE_SQL)).assertEqual(4);
      expect(UPDATE_SQL.indexOf('phone = ?')).assertLarger(0);
      expect(UPDATE_SQL.indexOf('email = ?')).assertLarger(0);
      expect(UPDATE_SQL.indexOf('address = ?')).assertLarger(0);
      expect(UPDATE_SQL.indexOf('name = ?')).assertLarger(0);
      expect(UPDATE_SQL.indexOf(sample.email)).assertEqual(-1);
      expect(UPDATE_SQL.indexOf(sample.phone)).assertEqual(-1);
    });

    /**
     * @tc.name   logSafetyPlaceholderCounterIgnoresQuotedText
     * @tc.desc   The counter only sees question marks, including two adjacent markers in a synthetic query.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PathAndLogSafety scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('logSafetyPlaceholderCounterIgnoresQuotedText', 0, () => {
      expect(placeholderCount('select * from contact')).assertEqual(0);
      expect(placeholderCount('select * from contact where name = ?')).assertEqual(1);
      expect(placeholderCount('update contact set phone = ?, email = ?')).assertEqual(2);
      expect(placeholderCount('???')).assertEqual(3);
      expect(placeholderCount('what?')).assertEqual(1);
      expect(placeholderCount(UPDATE_SQL) + placeholderCount(DELETE_SQL)).assertEqual(5);
    });

    /**
     * @tc.name   logSafetyRouterParamsExposeOnlyTheActionAndContact
     * @tc.desc   RouterParams has exactly two carriers; there is no token, path or session field.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PathAndLogSafety scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('logSafetyRouterParamsExposeOnlyTheActionAndContact', 0, () => {
      const params = new RouterParams(ACTION_ADD, new Contact());
      expect(params.text).assertEqual(ACTION_ADD);
      expect(params.data !== undefined).assertTrue();
      expect(exposesSecret(params)).assertFalse();
      expect(params.text === undefined).assertFalse();
      expect((params.data as Contact).name).assertEqual('');
      expect(ACTION_ADD.indexOf('password')).assertEqual(-1);
    });

    /**
     * @tc.name   logSafetyRouterParamsRejectSecretMarkers
     * @tc.desc   Any credential marker placed in the action or a contact field is detected by the audit.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PathAndLogSafety scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('logSafetyRouterParamsRejectSecretMarkers', 0, () => {
      expect(exposesSecret(new RouterParams(ACTION_EDIT, createSeedContacts()[0]))).assertFalse();
      expect(exposesSecret(new RouterParams('password reset', new Contact()))).assertTrue();
      expect(exposesSecret(new RouterParams('edit', contactOf('token-holder', '13500001111',
        'x@example.com', '某地')))).assertTrue();
      expect(exposesSecret(new RouterParams('edit', contactOf('普通', '13500001111',
        'x@example.com', 'Bearer 某地')))).assertTrue();
      expect(containsMarker('client-secret')).assertTrue();
      expect(containsMarker('ordinary text')).assertFalse();
    });

    /**
     * @tc.name   logSafetyRouteRequestDescribeCarriesNoPhone
     * @tc.desc   The request descriptor is action, name and url only, with no phone or email value.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PathAndLogSafety scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('logSafetyRouteRequestDescribeCarriesNoPhone', 0, () => {
      const selected = createSeedContacts()[0];
      const request = new RouteRequest(ACTION_DELETE, selected);
      expect(longestDigitRun(request.describe())).assertEqual(0);
      expect(request.describe().indexOf('@')).assertEqual(-1);
      expect(request.describe().indexOf(selected.phone)).assertEqual(-1);
      expect(request.describe().indexOf(selected.email)).assertEqual(-1);
      expect(request.describe().indexOf(selected.name)).assertLarger(0);
      expect(request.describe().endsWith(ROUTE_LIST)).assertTrue();
    });

    /**
     * @tc.name   logSafetySnapshotDescriptionWouldLeakThePhone
     * @tc.desc   A snapshot descriptor contains the phone and email, proving snapshots must never be logged.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PathAndLogSafety scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('logSafetySnapshotDescriptionWouldLeakThePhone', 0, () => {
      const snapshot = snapshotsOf(createSeedContacts())[0];
      const description = snapshot.describe();
      expect(longestDigitRun(description)).assertEqual(11);
      expect(description.indexOf('@')).assertLarger(0);
      expect(description.indexOf('13333333333')).assertLarger(0);
      expect(description.indexOf('aidelian@example.com')).assertLarger(0);
      expect(audit.allEnglish()).assertTrue();
      audit.step('blocked', 'snapshot');
      expect(audit.maxDigitRun()).assertEqual(0);
    });

    /**
     * @tc.name   logSafetySafeIdentifierRejectsPunctuation
     * @tc.desc   The identifier guard rejects spaces, quotes, semicolons and traversal fragments.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PathAndLogSafety scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('logSafetySafeIdentifierRejectsPunctuation', 0, () => {
      expect(isSafeIdentifier('contact')).assertTrue();
      expect(isSafeIdentifier('contact.db')).assertTrue();
      expect(isSafeIdentifier('EntryAbility')).assertTrue();
      expect(isSafeIdentifier('contact db')).assertFalse();
      expect(isSafeIdentifier('contact;drop')).assertFalse();
      expect(isSafeIdentifier('contact\'')).assertFalse();
      expect(isSafeIdentifier('../contact')).assertFalse();
      expect(isSafeIdentifier('')).assertFalse();
    });

    /**
     * @tc.name   logSafetySqlStringsAreAsciiOnly
     * @tc.desc   Both statement literals stay in printable ASCII, so log tooling can print them safely.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PathAndLogSafety scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('logSafetySqlStringsAreAsciiOnly', 0, () => {
      expect(isEnglishOnly(DELETE_SQL)).assertTrue();
      expect(isEnglishOnly(UPDATE_SQL)).assertTrue();
      expect(isEnglishOnly(SQL_CREATE_CONTACT)).assertTrue();
      expect(DELETE_SQL.endsWith(';')).assertTrue();
      expect(UPDATE_SQL.endsWith(';')).assertTrue();
      expect(DELETE_SQL.indexOf('contact')).assertLarger(0);
    });

    /**
     * @tc.name   logSafetySimulatedPhoneLineIsFlagged
     * @tc.desc   A line that embeds a phone number trips the digit-run guard, so the audit can block it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PathAndLogSafety scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('logSafetySimulatedPhoneLineIsFlagged', 0, () => {
      audit.step('blocked', 'call 13800138000');
      expect(audit.maxDigitRun()).assertEqual(11);
      expect(longestDigitRun(audit.lines[0])).assertEqual(11);
      audit.clear();
      audit.step('allowed', 'call finished');
      expect(audit.maxDigitRun()).assertEqual(0);
      expect(audit.allEnglish()).assertTrue();
      expect(audit.size()).assertEqual(1);
    });

    /**
     * @tc.name   logSafetySimulatedEmailLineIsFlagged
     * @tc.desc   Email text is detectable with the at-sign rule, while an operation name is clean.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PathAndLogSafety scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('logSafetySimulatedEmailLineIsFlagged', 0, () => {
      audit.step('blocked', 'mail shen@example.com');
      expect(audit.lines[0].indexOf('@')).assertLarger(0);
      expect(isEnglishOnly(audit.lines[0])).assertTrue();
      expect(audit.maxDigitRun()).assertEqual(0);
      audit.clear();
      audit.step('allowed', 'mail suppressed');
      expect(audit.lines[0].indexOf('@')).assertEqual(-1);
      expect(audit.maxDigitRun()).assertEqual(0);
    });

    /**
     * @tc.name   logSafetyLogNamesUseOnlyEnglishTokens
     * @tc.desc   Operation and route tokens logged by the suite contain no CJK and stay under eighty columns.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PathAndLogSafety scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('logSafetyLogNamesUseOnlyEnglishTokens', 0, () => {
      audit.suite('PathAndLogSafety', 'begin');
      audit.step('stage', 'create-table');
      audit.step('stage', 'batch-insert');
      audit.step('stage', 'query-all');
      audit.step('stage', 'update-one');
      for (let index = 0; index < audit.lines.length; index++) {
        expect(isEnglishOnly(audit.lines[index])).assertTrue();
        expect(audit.lines[index].length < 80).assertTrue();
        expect(longestDigitRun(audit.lines[index])).assertEqual(0);
      }
      expect(audit.size()).assertEqual(5);
      expect(audit.joined('|').indexOf('create-table')).assertLarger(0);
    });

    /**
     * @tc.name   logSafetyStoreContextIsNotInMemoryOrTemporary
     * @tc.desc   The configured database is a normal named file, not an in-memory or temp scratch store.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PathAndLogSafety scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('logSafetyStoreContextIsNotInMemoryOrTemporary', 0, () => {
      expect(STORE_NAME.indexOf(':memory:')).assertEqual(-1);
      expect(STORE_NAME.toLowerCase().indexOf('temp')).assertEqual(-1);
      expect(STORE_NAME.toLowerCase().indexOf('tmp')).assertEqual(-1);
      expect(STORE_NAME.startsWith('contact')).assertTrue();
      expect(STORE_NAME.split('.').length).assertEqual(2);
      expect(STORE_NAME.split('.')[1]).assertEqual('db');
    });

    /**
     * @tc.name   logSafetyFingerprintIsNumericNotUserText
     * @tc.desc   Fingerprints are byte-sized numbers, so logging them cannot expose a name or address.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PathAndLogSafety scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('logSafetyFingerprintIsNumericNotUserText', 0, () => {
      const sample = createSeedContacts()[0];
      const nameFingerprint = textFingerprint(sample.name);
      const emailFingerprint = textFingerprint(sample.email);
      expect(nameFingerprint >= 0).assertTrue();
      expect(nameFingerprint < 1000003).assertTrue();
      expect(String(nameFingerprint).indexOf('@')).assertEqual(-1);
      expect(String(nameFingerprint).indexOf(sample.phone)).assertEqual(-1);
      expect(nameFingerprint === emailFingerprint).assertFalse();
    });

    /**
     * @tc.name   logSafetyDuplicateToastIsAFixedLiteral
     * @tc.desc   The duplicate toast has no format placeholder, so the typed name never reaches the message.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PathAndLogSafety scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('logSafetyDuplicateToastIsAFixedLiteral', 0, () => {
      expect(DUPLICATE_NAME_TOAST).assertEqual('姓名已存在，请重新输入!');
      expect(DUPLICATE_NAME_TOAST.indexOf('%s')).assertEqual(-1);
      expect(DUPLICATE_NAME_TOAST.indexOf('{')).assertEqual(-1);
      expect(longestDigitRun(DUPLICATE_NAME_TOAST)).assertEqual(0);
      expect(DUPLICATE_NAME_TOAST.indexOf('@')).assertEqual(-1);
      expect(DUPLICATE_NAME_TOAST.endsWith('!')).assertTrue();
    });

    /**
     * @tc.name   logSafetyLongSequenceStaysEnglishAndDigitFree
     * @tc.desc   Twenty step writes keep the buffer English, ordered and free of phone-length digit runs.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PathAndLogSafety scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('logSafetyLongSequenceStaysEnglishAndDigitFree', 0, () => {
      const operations: string[] = ['create-table', 'init-store', 'batch-insert', 'query-all',
        'insert-one', 'update-one', 'delete-one', 'dedupe-rows'];
      for (let index = 0; index < 20; index++) {
        audit.step('journey', operations[index % operations.length]);
      }
      expect(audit.size()).assertEqual(20);
      expect(audit.allEnglish()).assertTrue();
      expect(audit.maxDigitRun()).assertEqual(0);
      expect(audit.lines[19]).assertEqual('journey :: query-all');
      expect(audit.lines[0]).assertEqual('journey :: create-table');
    });

    /**
     * @tc.name   logSafetyBlankContactParamHasNoSecrets
     * @tc.desc   The add route's blank Contact exposes six empty fields and no credential marker.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PathAndLogSafety scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('logSafetyBlankContactParamHasNoSecrets', 0, () => {
      const params = new RouterParams(ACTION_ADD, new Contact());
      const blank = params.data as Contact;
      expect(exposesSecret(params)).assertFalse();
      expect(blank.name).assertEqual('');
      expect(blank.phone).assertEqual('');
      expect(blank.email).assertEqual('');
      expect(blank.address).assertEqual('');
      expect(blank.avatar).assertEqual('');
      expect(blank.category).assertEqual('');
    });

    /**
     * @tc.name   logSafetySqlCarriesNoSeedFieldValues
     * @tc.desc   No seed name, phone, email or address substring appears in either statement literal.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PathAndLogSafety scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('logSafetySqlCarriesNoSeedFieldValues', 0, () => {
      const seed = createSeedContacts();
      let leaked = 0;
      for (let index = 0; index < seed.length; index++) {
        if (DELETE_SQL.indexOf(seed[index].name) >= 0 || DELETE_SQL.indexOf(seed[index].phone) >= 0) {
          leaked = leaked + 1;
        }
        if (UPDATE_SQL.indexOf(seed[index].email) >= 0 || UPDATE_SQL.indexOf(seed[index].address) >= 0) {
          leaked = leaked + 1;
        }
      }
      expect(leaked).assertEqual(0);
      expect(DELETE_SQL.indexOf('name')).assertLarger(0);
      expect(UPDATE_SQL.indexOf('address')).assertLarger(0);
      expect(placeholderCount(DELETE_SQL)).assertEqual(1);
    });

    /**
     * @tc.name   logSafetyBucketDescriptionWouldLeakValues
     * @tc.desc   A bucket descriptor embeds the phone and email, so it must not be logged as-is.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PathAndLogSafety scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('logSafetyBucketDescriptionWouldLeakValues', 0, () => {
      const bucket = ContactMapper.toBucket(createSeedContacts()[2]);
      const description = bucket.describe();
      expect(description.indexOf('11111111111')).assertLarger(0);
      expect(description.indexOf('bella@example.com')).assertLarger(0);
      expect(longestDigitRun(description)).assertEqual(11);
      audit.step('blocked', 'bucket');
      expect(audit.maxDigitRun()).assertEqual(0);
      expect(bucket.keys.length).assertEqual(6);
    });

    /**
     * @tc.name   logSafetyClearingTwiceIsIdempotent
     * @tc.desc   Repeated clears leave the buffer empty and do not disturb the console counter.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PathAndLogSafety scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('logSafetyClearingTwiceIsIdempotent', 0, () => {
      audit.step('stage', 'delete-one');
      audit.clear();
      audit.clear();
      expect(audit.size()).assertEqual(0);
      expect(audit.joined('|')).assertEqual('');
      audit.suite('PathAndLogSafety', 'begin');
      audit.clear();
      expect(audit.size()).assertEqual(0);
      expect(audit.consoleCalls).assertEqual(0);
      expect(audit.allEnglish()).assertTrue();
    });

    /**
     * @tc.name   logSafetyRouteParamTextIsAnActionNotAPath
     * @tc.desc   RouterParams.text holds a business action word, never a file path or sql fragment.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PathAndLogSafety scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('logSafetyRouteParamTextIsAnActionNotAPath', 0, () => {
      const actions: string[] = [ACTION_ADD, ACTION_EDIT, ACTION_DELETE];
      for (let index = 0; index < actions.length; index++) {
        expect(actions[index].indexOf('/')).assertEqual(-1);
        expect(actions[index].indexOf('\\')).assertEqual(-1);
        expect(actions[index].indexOf(';')).assertEqual(-1);
        expect(longestDigitRun(actions[index])).assertEqual(0);
      }
      expect(actions[0]).assertEqual('新增联系人');
      expect(actions[2]).assertEqual('删除联系人');
    });

    /**
     * @tc.name   logSafetyTableAndAbilityNamesAreDistinct
     * @tc.desc   The table, file and ability identifiers occupy different namespaces and never alias.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PathAndLogSafety scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('logSafetyTableAndAbilityNamesAreDistinct', 0, () => {
      expect(TABLE_CONTACT === STORE_NAME).assertFalse();
      expect(TABLE_CONTACT === STORE_ABILITY).assertFalse();
      expect(STORE_NAME === STORE_ABILITY).assertFalse();
      expect(TABLE_CONTACT.indexOf(STORE_ABILITY)).assertEqual(-1);
      expect(STORE_NAME.startsWith(TABLE_CONTACT)).assertTrue();
      expect(STORE_NAME.endsWith('.db')).assertTrue();
      expect(STORE_ABILITY.toUpperCase()).assertEqual('ENTRYABILITY');
      expect(STORE_ABILITY.length).assertEqual(12);
    });

    /**
     * @tc.name   logSafetyShortNumbersStayBelowThePhoneThreshold
     * @tc.desc   A four digit year or counter is not phone shaped, so the six digit threshold still passes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PathAndLogSafety scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('logSafetyShortNumbersStayBelowThePhoneThreshold', 0, () => {
      audit.step('stage', 'run 2026');
      audit.step('stage', 'attempt 3');
      expect(audit.maxDigitRun()).assertEqual(4);
      expect(audit.maxDigitRun() < 6).assertTrue();
      expect(audit.size()).assertEqual(2);
      audit.step('blocked', 'run 13800138000');
      expect(audit.maxDigitRun() >= 6).assertTrue();
      expect(longestDigitRun('2026-11-21')).assertEqual(4);
    });
  });
}