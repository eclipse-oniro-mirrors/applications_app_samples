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

/**
 * ResultSetMappingValidation pins the result set walk of the sample.
 *
 * Production anchors:
 *   DatabaseConnection.ets:277-283  goToFirstRow then a while over goToNextRow, so the
 *                                   first row is skipped
 *   DatabaseConnection.ets:285-292  six getString calls addressed through getColumnIndex
 *   DatabaseConnection.ets:294-301  duplicate check on name plus phone
 *   DatabaseConnection.ets:303-306  a second goToNextRow inside the loop body advances
 *                                   an extra row per iteration
 *   DatabaseConnection.ets:306      close is always called before returning
 *   RdbConstant.ets:31-34           the six contact columns and their order
 *
 * CursorResultSet and readContactsFromResultSet reproduce that behaviour, and
 * expectedVisibleRows is the independent oracle for the first-row skip plus dedupe.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import {
  CursorResultSet,
  readContactsFromResultSet,
  expectedVisibleRows,
  expectedVisibleCount,
  createSeedContacts,
  contactOf,
  cloneContact,
  sameContact,
  contactNames,
  sameStringArray,
  joined,
  countOf,
  uniqueStrings,
  snapshotsOf,
  sameSnapshotArray,
  BUCKET_KEYS,
  FIELD_NAME,
  FIELD_PHONE,
  FIELD_EMAIL,
  FIELD_ADDRESS,
  FIELD_AVATAR,
  FIELD_CATEGORY,
  resetContactManager
} from '../Shared/SharedDriver';

export default function resultSetMappingValidationTest(): void {
  describe('ResultSetMappingValidation', () => {
    beforeAll(() => {
      logSuite('ResultSetMappingValidation', 'begin');
    });

    beforeEach(async () => {
      resetContactManager();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });

    afterAll(() => {
      resetContactManager();
      logSuite('ResultSetMappingValidation', 'end');
    });

    /**
     * @tc.name   cursorStartsBeforeFirstRow
     * @tc.desc   A new cursor sits at index -1, is not after the last row and has not been closed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResultSetMappingValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('cursorStartsBeforeFirstRow', 0, () => {
      const cursor: CursorResultSet = new CursorResultSet(createSeedContacts().slice(0, 3));
      expect(cursor.index).assertEqual(-1);
      expect(cursor.isAfterLast()).assertFalse();
      expect(cursor.closed).assertFalse();
      expect(cursor.rowCount()).assertEqual(3);
      expect(cursor.getString(0)).assertEqual('');
      expect(cursor.rows.length).assertEqual(3);
      expect(cursor.columnNames.length).assertEqual(6);
      expect(cursor.isAfterLast() === false).assertTrue();
    });

    /**
     * @tc.name   goToFirstRowReturnsTrueForRows
     * @tc.desc   Moving to the first row succeeds when rows exist and points the cursor at index
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResultSetMappingValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            zero.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('goToFirstRowReturnsTrueForRows', 0, () => {
      const cursor: CursorResultSet = new CursorResultSet(createSeedContacts().slice(0, 2));
      expect(cursor.goToFirstRow()).assertTrue();
      expect(cursor.index).assertEqual(0);
      expect(cursor.isAfterLast()).assertFalse();
      expect(cursor.getString(cursor.getColumnIndex(FIELD_NAME))).assertEqual('艾德里安');
      expect(cursor.getString(cursor.getColumnIndex(FIELD_PHONE))).assertEqual('13333333333');
      expect(cursor.closed).assertFalse();
      expect(cursor.getString(1)).assertEqual('13333333333');
      expect(cursor.getString(5)).assertEqual('A');
      expect(cursor.rowCount()).assertEqual(2);
    });

    /**
     * @tc.name   goToFirstRowReturnsFalseForEmptyCursor
     * @tc.desc   An empty result set cannot move to a first row, but the cursor index still resets
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResultSetMappingValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            to zero and is treated as after the last row.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('goToFirstRowReturnsFalseForEmptyCursor', 0, () => {
      const cursor: CursorResultSet = new CursorResultSet([]);
      expect(cursor.goToFirstRow()).assertFalse();
      expect(cursor.index).assertEqual(0);
      expect(cursor.isAfterLast()).assertTrue();
      expect(cursor.getString(0)).assertEqual('');
      expect(cursor.rowCount()).assertEqual(0);
      expect(cursor.closed).assertFalse();
      expect(cursor.rows.length).assertEqual(0);
      expect(cursor.getString(cursor.getColumnIndex(FIELD_NAME))).assertEqual('');
      expect(cursor.columnNames.length).assertEqual(6);
    });

    /**
     * @tc.name   goToNextRowAdvancesIndex
     * @tc.desc   Each successful goToNextRow moves the index by one and keeps isAfterLast false
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResultSetMappingValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            while rows remain.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('goToNextRowAdvancesIndex', 0, () => {
      const cursor: CursorResultSet = new CursorResultSet(createSeedContacts().slice(0, 3));
      cursor.goToFirstRow();
      expect(cursor.index).assertEqual(0);
      expect(cursor.goToNextRow()).assertTrue();
      expect(cursor.index).assertEqual(1);
      expect(cursor.isAfterLast()).assertFalse();
      expect(cursor.goToNextRow()).assertTrue();
      expect(cursor.index).assertEqual(2);
      expect(cursor.getString(cursor.getColumnIndex(FIELD_NAME))).assertEqual('贝拉');
    });

    /**
     * @tc.name   goToNextRowStopsAfterLastRow
     * @tc.desc   On a two row cursor the third advance reports false, leaves the index at two and
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResultSetMappingValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            marks the cursor after the last row.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('goToNextRowStopsAfterLastRow', 0, () => {
      const cursor: CursorResultSet = new CursorResultSet(createSeedContacts().slice(0, 2));
      cursor.goToFirstRow();
      expect(cursor.goToNextRow()).assertTrue();
      expect(cursor.index).assertEqual(1);
      expect(cursor.goToNextRow()).assertFalse();
      expect(cursor.index).assertEqual(2);
      expect(cursor.isAfterLast()).assertTrue();
      expect(cursor.getString(0)).assertEqual('');
      expect(cursor.rowCount()).assertEqual(2);
    });

    /**
     * @tc.name   isAfterLastBecomesTrueOnlyPastTheLastRow
     * @tc.desc   For a three row cursor isAfterLast stays false at the final row and flips only
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResultSetMappingValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            after one more advance.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('isAfterLastBecomesTrueOnlyPastTheLastRow', 0, () => {
      const cursor: CursorResultSet = new CursorResultSet(createSeedContacts().slice(0, 3));
      cursor.goToFirstRow();
      expect(cursor.isAfterLast()).assertFalse();
      cursor.goToNextRow();
      expect(cursor.isAfterLast()).assertFalse();
      cursor.goToNextRow();
      expect(cursor.index).assertEqual(2);
      expect(cursor.isAfterLast()).assertFalse();
      cursor.goToNextRow();
      expect(cursor.isAfterLast()).assertTrue();
      expect(cursor.index).assertEqual(3);
    });

    /**
     * @tc.name   getColumnIndexReturnsDeclarationOrder
     * @tc.desc   The six production columns resolve to indexes zero through five in declaration
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResultSetMappingValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            order.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('getColumnIndexReturnsDeclarationOrder', 0, () => {
      const cursor: CursorResultSet = new CursorResultSet([]);
      expect(cursor.getColumnIndex(FIELD_NAME)).assertEqual(0);
      expect(cursor.getColumnIndex(FIELD_PHONE)).assertEqual(1);
      expect(cursor.getColumnIndex(FIELD_EMAIL)).assertEqual(2);
      expect(cursor.getColumnIndex(FIELD_ADDRESS)).assertEqual(3);
      expect(cursor.getColumnIndex(FIELD_AVATAR)).assertEqual(4);
      expect(cursor.getColumnIndex(FIELD_CATEGORY)).assertEqual(5);
      expect(cursor.columnNames.length).assertEqual(6);
      expect(sameStringArray(cursor.columnNames, BUCKET_KEYS)).assertTrue();
    });

    /**
     * @tc.name   getColumnIndexUnknownIsMinusOne
     * @tc.desc   Unknown or differently cased column names resolve to -1, which the read path
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResultSetMappingValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            would turn into an empty string.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('getColumnIndexUnknownIsMinusOne', 0, () => {
      const cursor: CursorResultSet = new CursorResultSet([]);
      expect(cursor.getColumnIndex('identifier')).assertEqual(-1);
      expect(cursor.getColumnIndex('Name')).assertEqual(-1);
      expect(cursor.getColumnIndex('')).assertEqual(-1);
      expect(cursor.getColumnIndex('phone ')).assertEqual(-1);
      expect(cursor.getColumnIndex(FIELD_NAME)).assertEqual(0);
      expect(cursor.getColumnIndex(FIELD_CATEGORY)).assertEqual(5);
      for (let index = 0; index < BUCKET_KEYS.length; index++) {
        expect(cursor.getColumnIndex(BUCKET_KEYS[index])).assertEqual(index);
      }
    });

    /**
     * @tc.name   getStringReadsSixColumns
     * @tc.desc   Every column index returns the value of the matching field, including the avatar
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResultSetMappingValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            and category columns.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('getStringReadsSixColumns', 0, () => {
      const row: Contact = contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road',
        'ada.png', 'F');
      const cursor: CursorResultSet = new CursorResultSet([row]);
      cursor.goToFirstRow();
      expect(cursor.getString(0)).assertEqual('Ada Lovelace');
      expect(cursor.getString(1)).assertEqual('13800138000');
      expect(cursor.getString(2)).assertEqual('ada@example.com');
      expect(cursor.getString(3)).assertEqual('River Road');
      expect(cursor.getString(4)).assertEqual('ada.png');
      expect(cursor.getString(5)).assertEqual('F');
      expect(cursor.getString(6)).assertEqual('');
    });

    /**
     * @tc.name   getStringBeforeFirstRowIsEmpty
     * @tc.desc   Before any navigation every column read returns an empty string, which is how the
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResultSetMappingValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            cursor behaves outside a row.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('getStringBeforeFirstRowIsEmpty', 0, () => {
      const cursor: CursorResultSet = new CursorResultSet(createSeedContacts().slice(0, 2));
      for (let index = 0; index < BUCKET_KEYS.length; index++) {
        expect(cursor.getString(index)).assertEqual('');
      }
      expect(cursor.index).assertEqual(-1);
      expect(cursor.getString(cursor.getColumnIndex(FIELD_NAME))).assertEqual('');
      expect(cursor.isAfterLast()).assertFalse();
      cursor.goToFirstRow();
      expect(cursor.getString(0) === '').assertFalse();
    });

    /**
     * @tc.name   getStringAfterLastRowIsEmpty
     * @tc.desc   Past the final row the column reads are all empty even though the row array is
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResultSetMappingValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            still populated.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('getStringAfterLastRowIsEmpty', 0, () => {
      const cursor: CursorResultSet = new CursorResultSet(createSeedContacts().slice(0, 1));
      cursor.goToFirstRow();
      cursor.goToNextRow();
      expect(cursor.isAfterLast()).assertTrue();
      for (let index = 0; index < BUCKET_KEYS.length; index++) {
        expect(cursor.getString(index)).assertEqual('');
      }
      expect(cursor.rows.length).assertEqual(1);
      expect(cursor.rowCount()).assertEqual(1);
      expect(cursor.getString(cursor.getColumnIndex(FIELD_EMAIL))).assertEqual('');
    });

    /**
     * @tc.name   readSkipsTheFirstRow
     * @tc.desc   The read helper skips the first row because goToFirstRow is followed by
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResultSetMappingValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            goToNextRow before the payload is read.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('readSkipsTheFirstRow', 0, () => {
      const rows: Contact[] = createSeedContacts().slice(0, 3);
      const cursor: CursorResultSet = new CursorResultSet(rows);
      const visible: Contact[] = readContactsFromResultSet(cursor);
      expect(visible.length).assertEqual(2);
      expect(visible[0].name).assertEqual('阿诺德');
      expect(visible[1].name).assertEqual('贝拉');
      expect(countOf(contactNames(visible), rows[0].name)).assertEqual(0);
      expect(sameContact(visible[0], rows[1])).assertTrue();
      expect(sameContact(visible[1], rows[2])).assertTrue();
      expect(joined(contactNames(visible), ',')).assertEqual('阿诺德,贝拉');
      expect(visible[0].phone).assertEqual('16666666666');
      expect(visible[1].email).assertEqual('bella@example.com');
      expect(visible.length).assertEqual(expectedVisibleCount(rows));
    });

    /**
     * @tc.name   readSingleRowYieldsNoContacts
     * @tc.desc   A one row cursor yields no contact at all, so a page relying on this walk shows
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResultSetMappingValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            an empty list for a single match.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('readSingleRowYieldsNoContacts', 0, () => {
      const cursor: CursorResultSet = new CursorResultSet(createSeedContacts().slice(0, 1));
      const visible: Contact[] = readContactsFromResultSet(cursor);
      expect(visible.length).assertEqual(0);
      expect(cursor.closed).assertTrue();
      expect(expectedVisibleCount(createSeedContacts().slice(0, 1))).assertEqual(0);
      expect(cursor.rowCount()).assertEqual(1);
      expect(cursor.isAfterLast()).assertTrue();
    });

    /**
     * @tc.name   readEmptyCursorClosesWithoutContacts
     * @tc.desc   An empty cursor produces no contacts and is still closed by the helper.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResultSetMappingValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('readEmptyCursorClosesWithoutContacts', 0, () => {
      const cursor: CursorResultSet = new CursorResultSet([]);
      const visible: Contact[] = readContactsFromResultSet(cursor);
      expect(visible.length).assertEqual(0);
      expect(cursor.closed).assertTrue();
      expect(cursor.isAfterLast()).assertTrue();
      expect(cursor.rowCount()).assertEqual(0);
      expect(sameStringArray(contactNames(visible), [])).assertTrue();
      expect(visible.length).assertEqual(expectedVisibleCount([]));
      expect(cursor.index).assertEqual(0);
      expect(cursor.rows.length).assertEqual(0);
      expect(cursor.getColumnIndex(FIELD_NAME)).assertEqual(0);
    });

    /**
     * @tc.name   readDedupesNamePhonePair
     * @tc.desc   Two visible rows with the same name and phone collapse into one, keeping the
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResultSetMappingValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            first payload.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('readDedupesNamePhonePair', 0, () => {
      const cursor: CursorResultSet = new CursorResultSet([
        createSeedContacts()[0],
        contactOf('Ada Lovelace', '13800138000', 'first@example.com', 'River Road', '', 'A'),
        contactOf('Ada Lovelace', '13800138000', 'second@example.com', 'Other Road', '', 'B')
      ]);
      const visible: Contact[] = readContactsFromResultSet(cursor);
      expect(visible.length).assertEqual(1);
      expect(visible[0].name).assertEqual('Ada Lovelace');
      expect(visible[0].email).assertEqual('first@example.com');
      expect(visible[0].category).assertEqual('A');
      expect(visible[0].address).assertEqual('River Road');
      expect(cursor.closed).assertTrue();
    });

    /**
     * @tc.name   readKeepsSameNameDifferentPhone
     * @tc.desc   The dedupe key includes the phone, so two rows with the same name but different
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResultSetMappingValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            phones both survive.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('readKeepsSameNameDifferentPhone', 0, () => {
      const cursor: CursorResultSet = new CursorResultSet([
        createSeedContacts()[0],
        contactOf('Ada Lovelace', '13800138000', 'one@example.com', 'First Road'),
        contactOf('Ada Lovelace', '13800138001', 'two@example.com', 'Second Road')
      ]);
      const visible: Contact[] = readContactsFromResultSet(cursor);
      expect(visible.length).assertEqual(2);
      expect(countOf(contactNames(visible), 'Ada Lovelace')).assertEqual(2);
      expect(visible[0].phone).assertEqual('13800138000');
      expect(visible[1].phone).assertEqual('13800138001');
      expect(uniqueStrings(contactNames(visible)).length).assertEqual(1);
      expect(visible.length).assertEqual(expectedVisibleCount([
        createSeedContacts()[0],
        contactOf('Ada Lovelace', '13800138000', 'one@example.com', 'First Road'),
        contactOf('Ada Lovelace', '13800138001', 'two@example.com', 'Second Road')
      ]));
      expect(joined(contactNames(visible), ',')).assertEqual('Ada Lovelace,Ada Lovelace');
      expect(visible[0].phone === visible[1].phone).assertFalse();
    });

    /**
     * @tc.name   readKeepsSamePhoneDifferentName
     * @tc.desc   Two rows sharing a phone but not a name are both kept, because the name is part
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResultSetMappingValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            of the duplicate key.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('readKeepsSamePhoneDifferentName', 0, () => {
      const cursor: CursorResultSet = new CursorResultSet([
        createSeedContacts()[0],
        contactOf('Ada Lovelace', '13800138000', 'one@example.com', 'First Road'),
        contactOf('Grace Hopper', '13800138000', 'two@example.com', 'Second Road')
      ]);
      const visible: Contact[] = readContactsFromResultSet(cursor);
      expect(visible.length).assertEqual(2);
      expect(visible[0].name).assertEqual('Ada Lovelace');
      expect(visible[1].name).assertEqual('Grace Hopper');
      expect(visible[0].phone === visible[1].phone).assertTrue();
      expect(uniqueStrings(contactNames(visible)).length).assertEqual(2);
      expect(sameStringArray(contactNames(visible), ['Ada Lovelace', 'Grace Hopper'])).assertTrue();
    });

    /**
     * @tc.name   readDedupesNonAdjacentRows
     * @tc.desc   A duplicate separated by unrelated rows is still detected, so the duplicate scan
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResultSetMappingValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            covers the whole accumulated list.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('readDedupesNonAdjacentRows', 0, () => {
      const cursor: CursorResultSet = new CursorResultSet([
        createSeedContacts()[0],
        contactOf('Ada Lovelace', '13800138000', 'first@example.com', 'First Road'),
        contactOf('Grace Hopper', '13900139000', 'grace@example.com', 'Compiler Lane'),
        contactOf('Ada Lovelace', '13800138000', 'late@example.com', 'Late Road')
      ]);
      const visible: Contact[] = readContactsFromResultSet(cursor);
      expect(visible.length).assertEqual(2);
      expect(visible[0].email).assertEqual('first@example.com');
      expect(visible[1].name).assertEqual('Grace Hopper');
      expect(countOf(contactNames(visible), 'Ada Lovelace')).assertEqual(1);
      expect(countOf(contactNames(visible), 'Grace Hopper')).assertEqual(1);
    });

    /**
     * @tc.name   readMatchesExpectedVisibleRowsOracle
     * @tc.desc   For a mixed result set the helper output matches the independent oracle in both
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResultSetMappingValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            order and payload.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('readMatchesExpectedVisibleRowsOracle', 0, () => {
      const rows: Contact[] = [
        createSeedContacts()[0],
        contactOf('Ada Lovelace', '13800138000', 'one@example.com', 'First Road'),
        contactOf('Ada Lovelace', '13800138000', 'dup@example.com', 'Duplicate Road'),
        contactOf('Grace Hopper', '13900139000', 'grace@example.com', 'Compiler Lane')
      ];
      const visible: Contact[] = readContactsFromResultSet(new CursorResultSet(rows));
      const oracle: Contact[] = expectedVisibleRows(rows);
      expect(sameSnapshotArray(snapshotsOf(visible), snapshotsOf(oracle))).assertTrue();
      expect(visible.length).assertEqual(oracle.length);
      expect(visible.length).assertEqual(2);
      expect(visible[0].email).assertEqual('one@example.com');
      expect(oracle[0].email).assertEqual('one@example.com');
    });

    /**
     * @tc.name   expectedVisibleCountMatchesReadCount
     * @tc.desc   The oracle count equals the number of rows the helper returns for sizes zero
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResultSetMappingValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            through three and for the fifteen row seed.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('expectedVisibleCountMatchesReadCount', 0, () => {
      const sizes: int[] = [0, 1, 2, 3];
      const seed: Contact[] = createSeedContacts();
      const expectedForSize: number[] = [0, 0, 1, 2];
      for (let index = 0; index < sizes.length; index++) {
        const slice: Contact[] = seed.slice(0, sizes[index]);
        const visible: Contact[] = readContactsFromResultSet(new CursorResultSet(slice));
        expect(visible.length).assertEqual(expectedForSize[index]);
        expect(visible.length).assertEqual(expectedVisibleCount(slice));
        expect(visible.length).assertEqual(expectedVisibleRows(slice).length);
      }
      expect(expectedVisibleCount(seed)).assertEqual(14);
      expect(readContactsFromResultSet(new CursorResultSet(seed)).length).assertEqual(14);
    });

    /**
     * @tc.name   readClosesTheCursorAtTheEnd
     * @tc.desc   The helper always closes the cursor, leaves the index past the last row and does
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResultSetMappingValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            not alter the underlying row array.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('readClosesTheCursorAtTheEnd', 0, () => {
      const rows: Contact[] = createSeedContacts().slice(0, 4);
      const cursor: CursorResultSet = new CursorResultSet(rows);
      const visible: Contact[] = readContactsFromResultSet(cursor);
      expect(cursor.closed).assertTrue();
      expect(cursor.isAfterLast()).assertTrue();
      expect(cursor.index).assertEqual(4);
      expect(cursor.rowCount()).assertEqual(4);
      expect(cursor.rows.length).assertEqual(rows.length);
      expect(visible.length).assertEqual(3);
      expect(cursor.closed === false).assertFalse();
      expect(cursor.isAfterLast() === true).assertTrue();
      expect(cursor.rowCount()).assertEqual(rows.length);
      expect(cursor.rows[0].name).assertEqual('艾德里安');
      expect(visible[0].name).assertEqual('阿诺德');
    });

    /**
     * @tc.name   readPreservesVisibleOrder
     * @tc.desc   Five cursor rows produce four contacts in the original order, skipping only the
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResultSetMappingValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            leading row.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('readPreservesVisibleOrder', 0, () => {
      const rows: Contact[] = createSeedContacts().slice(0, 5);
      const visible: Contact[] = readContactsFromResultSet(new CursorResultSet(rows));
      expect(visible.length).assertEqual(4);
      expect(sameStringArray(contactNames(visible), ['阿诺德', '贝拉', '本', '本杰明'])).assertTrue();
      expect(joined(contactNames(visible), '>')).assertEqual('阿诺德>贝拉>本>本杰明');
      expect(visible[0] === rows[1]).assertFalse();
      expect(sameContact(visible[3], rows[4])).assertTrue();
    });

    /**
     * @tc.name   readSeedYieldsFourteenRows
     * @tc.desc   The fifteen seeded rows contain no name and phone duplicate, so the visible count
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResultSetMappingValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            drops by exactly the skipped leading row.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('readSeedYieldsFourteenRows', 0, () => {
      const seed: Contact[] = createSeedContacts();
      const visible: Contact[] = readContactsFromResultSet(new CursorResultSet(seed));
      expect(visible.length).assertEqual(14);
      expect(visible.length).assertEqual(seed.length - 1);
      expect(visible[0].name).assertEqual('阿诺德');
      expect(visible[13].name).assertEqual('法里');
      expect(countOf(contactNames(visible), seed[0].name)).assertEqual(0);
      expect(uniqueStrings(contactNames(visible)).length).assertEqual(14);
      logStep('ResultSetMappingValidation', 'seed visible rows: ' + String(visible.length));
    });

    /**
     * @tc.name   readKeepsFirstDuplicatePayload
     * @tc.desc   The duplicate key ignores avatar and category, so a duplicate row keeps the first
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResultSetMappingValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            payload even when the later row differs in those columns.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('readKeepsFirstDuplicatePayload', 0, () => {
      const cursor: CursorResultSet = new CursorResultSet([
        createSeedContacts()[0],
        contactOf('Ada Lovelace', '13800138000', 'first@example.com', 'First Road', 'first.png', 'A'),
        contactOf('Ada Lovelace', '13800138000', 'second@example.com', 'Second Road', 'second.png', 'F')
      ]);
      const visible: Contact[] = readContactsFromResultSet(cursor);
      expect(visible.length).assertEqual(1);
      expect(visible[0].avatar).assertEqual('first.png');
      expect(visible[0].category).assertEqual('A');
      expect(visible[0].address).assertEqual('First Road');
      expect(visible[0].email).assertEqual('first@example.com');
      expect(visible[0].avatar === 'second.png').assertFalse();
    });

    /**
     * @tc.name   cursorClosedFlagStartsFalsePerInstance
     * @tc.desc   Two independently constructed cursors both start open, so closing one does not
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResultSetMappingValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            affect the other.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cursorClosedFlagStartsFalsePerInstance', 0, () => {
      const first: CursorResultSet = new CursorResultSet(createSeedContacts().slice(0, 2));
      const second: CursorResultSet = new CursorResultSet(createSeedContacts().slice(0, 2));
      expect(first.closed).assertFalse();
      expect(second.closed).assertFalse();
      readContactsFromResultSet(first);
      expect(first.closed).assertTrue();
      expect(second.closed).assertFalse();
      expect(first.rows.length).assertEqual(2);
      expect(second.rows.length).assertEqual(2);
    });

    /**
     * @tc.name   repeatReadOnSameCursorIsStable
     * @tc.desc   Because the helper rewinds with goToFirstRow, a second read on the same cursor
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResultSetMappingValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            returns the same visible sequence again.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('repeatReadOnSameCursorIsStable', 0, () => {
      const cursor: CursorResultSet = new CursorResultSet(createSeedContacts().slice(0, 4));
      const firstPass: Contact[] = readContactsFromResultSet(cursor);
      expect(cursor.closed).assertTrue();
      const secondPass: Contact[] = readContactsFromResultSet(cursor);
      expect(firstPass.length).assertEqual(3);
      expect(secondPass.length).assertEqual(3);
      expect(sameStringArray(contactNames(firstPass), contactNames(secondPass))).assertTrue();
      expect(sameSnapshotArray(snapshotsOf(firstPass), snapshotsOf(secondPass))).assertTrue();
      expect(firstPass[0] === secondPass[0]).assertFalse();
      expect(cursor.rowCount()).assertEqual(4);
    });

    /**
     * @tc.name   readDedupeIgnoresEmailDifference
     * @tc.desc   Rows that differ only in email are treated as duplicates, so only the first email
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResultSetMappingValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            reaches the page.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('readDedupeIgnoresEmailDifference', 0, () => {
      const cursor: CursorResultSet = new CursorResultSet([
        createSeedContacts()[0],
        contactOf('Ada Lovelace', '13800138000', 'work@example.com', 'Road'),
        contactOf('Ada Lovelace', '13800138000', 'home@example.com', 'Road'),
        contactOf('Ada Lovelace', '13800138000', 'other@example.com', 'Road')
      ]);
      const visible: Contact[] = readContactsFromResultSet(cursor);
      expect(visible.length).assertEqual(1);
      expect(visible[0].email).assertEqual('work@example.com');
      expect(countOf(contactNames(visible), 'Ada Lovelace')).assertEqual(1);
      expect(visible[0].phone).assertEqual('13800138000');
      expect(visible[0].email === 'home@example.com').assertFalse();
    });

    /**
     * @tc.name   expectedVisibleRowsAlwaysSkipsTheLeadingRow
     * @tc.desc   The oracle ignores index zero for every input, so one row yields an empty result
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResultSetMappingValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            and two rows yield one contact.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('expectedVisibleRowsAlwaysSkipsTheLeadingRow', 0, () => {
      const seed: Contact[] = createSeedContacts();
      expect(expectedVisibleRows([]).length).assertEqual(0);
      expect(expectedVisibleRows(seed.slice(0, 1)).length).assertEqual(0);
      expect(expectedVisibleRows(seed.slice(0, 2)).length).assertEqual(1);
      expect(expectedVisibleRows(seed.slice(0, 2))[0].name).assertEqual(seed[1].name);
      expect(expectedVisibleRows(seed.slice(0, 3)).length).assertEqual(2);
      expect(expectedVisibleRows(seed.slice(0, 3))[0].name).assertEqual(seed[1].name);
      expect(expectedVisibleRows(seed)[0].name === seed[0].name).assertFalse();
    });

    /**
     * @tc.name   expectedVisibleRowsReturnsClones
     * @tc.desc   The oracle copies every returned row, so editing the oracle output never mutates
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResultSetMappingValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            the input array.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('expectedVisibleRowsReturnsClones', 0, () => {
      const rows: Contact[] = createSeedContacts().slice(0, 3);
      const oracle: Contact[] = expectedVisibleRows(rows);
      expect(oracle.length).assertEqual(2);
      expect(oracle[0] === rows[1]).assertFalse();
      oracle[0].phone = '10000000000';
      oracle[0].name = 'Renamed';
      expect(rows[1].phone).assertEqual('16666666666');
      expect(rows[1].name).assertEqual('阿诺德');
      expect(sameContact(oracle[1], rows[2])).assertTrue();
      expect(sameSnapshotArray(snapshotsOf(oracle), snapshotsOf(expectedVisibleRows(rows)))).assertFalse();
    });

    /**
     * @tc.name   readResultRowsAreFreshObjects
     * @tc.desc   Every contact built by the helper is a new object, so no visible row aliases the
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResultSetMappingValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            cursor row array.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('readResultRowsAreFreshObjects', 0, () => {
      const rows: Contact[] = createSeedContacts().slice(0, 4);
      const cursor: CursorResultSet = new CursorResultSet(rows);
      const visible: Contact[] = readContactsFromResultSet(cursor);
      for (let index = 0; index < visible.length; index++) {
        expect(visible[index] === rows[index + 1]).assertFalse();
        expect(visible[index] === cursor.rows[index + 1]).assertFalse();
        expect(sameContact(visible[index], rows[index + 1])).assertTrue();
      }
      expect(visible.length).assertEqual(3);
      expect(visible[0].name).assertEqual('阿诺德');
    });

    /**
     * @tc.name   readAllDuplicateRowsCollapseToOne
     * @tc.desc   Four visible rows that share one name and phone collapse into a single contact
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResultSetMappingValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            with the leading payload.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('readAllDuplicateRowsCollapseToOne', 0, () => {
      const rows: Contact[] = [createSeedContacts()[0]];
      for (let index = 0; index < 4; index++) {
        rows.push(contactOf('Twin Row', '13800138000', 'twin' + String(index) + '@example.com', 'Twin Road'));
      }
      const visible: Contact[] = readContactsFromResultSet(new CursorResultSet(rows));
      expect(visible.length).assertEqual(1);
      expect(visible[0].name).assertEqual('Twin Row');
      expect(visible[0].email).assertEqual('twin0@example.com');
      expect(countOf(contactNames(visible), 'Twin Row')).assertEqual(1);
      expect(expectedVisibleRows(rows).length).assertEqual(1);
      expect(expectedVisibleCount(rows)).assertEqual(1);
    });

    /**
     * @tc.name   cursorRowCountUnaffectedByNavigation
     * @tc.desc   Moving through the cursor never changes the row count, whether the cursor sits
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResultSetMappingValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            before the first row, on a row or past the last row.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cursorRowCountUnaffectedByNavigation', 0, () => {
      const cursor: CursorResultSet = new CursorResultSet(createSeedContacts().slice(0, 5));
      expect(cursor.rowCount()).assertEqual(5);
      cursor.goToFirstRow();
      expect(cursor.rowCount()).assertEqual(5);
      cursor.goToNextRow();
      cursor.goToNextRow();
      expect(cursor.rowCount()).assertEqual(5);
      while (cursor.goToNextRow()) {
        expect(cursor.rowCount()).assertEqual(5);
      }
      expect(cursor.rowCount()).assertEqual(5);
      expect(cursor.isAfterLast()).assertTrue();
      expect(cursor.rows.length).assertEqual(5);
    });

    /**
     * @tc.name   readLeavesLeadingDuplicateOutOfTheResult
     * @tc.desc   When the skipped leading row repeats later, the later copy is still visible
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResultSetMappingValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            because the skip happens before the duplicate scan.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('readLeavesLeadingDuplicateOutOfTheResult', 0, () => {
      const shared: Contact = contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road');
      const rows: Contact[] = [shared, contactOf('Grace Hopper', '13900139000', 'grace@example.com', 'Compiler Lane'),
        cloneContact(shared)];
      const visible: Contact[] = readContactsFromResultSet(new CursorResultSet(rows));
      expect(visible.length).assertEqual(2);
      expect(visible[0].name).assertEqual('Grace Hopper');
      expect(visible[1].name).assertEqual('Ada Lovelace');
      expect(countOf(contactNames(visible), 'Ada Lovelace')).assertEqual(1);
      expect(visible.length).assertEqual(expectedVisibleRows(rows).length);
    });

    /**
     * @tc.name   readCategorySequenceMatchesSourceRows
     * @tc.desc   The categories of the visible rows follow the source order after the leading row
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResultSetMappingValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            has been skipped.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('readCategorySequenceMatchesSourceRows', 0, () => {
      const rows: Contact[] = [
        contactOf('Lead Row', '13000130000', 'lead@example.com', 'Lead Road', '', 'A'),
        contactOf('Second Row', '13000130001', 'second@example.com', 'Second Road', '', 'B'),
        contactOf('Third Row', '13000130002', 'third@example.com', 'Third Road', '', 'C'),
        contactOf('Fourth Row', '13000130003', 'fourth@example.com', 'Fourth Road', '', 'D')
      ];
      const visible: Contact[] = readContactsFromResultSet(new CursorResultSet(rows));
      expect(visible.length).assertEqual(3);
      const categories: string[] = [];
      for (let index = 0; index < visible.length; index++) {
        categories.push(visible[index].category);
      }
      expect(joined(categories, ',')).assertEqual('B,C,D');
      expect(visible[0].category).assertEqual('B');
      expect(visible[2].category).assertEqual('D');
      expect(visible[0].name).assertEqual('Second Row');
      expect(countOf(contactNames(visible), 'Lead Row')).assertEqual(0);
    });

    /**
     * @tc.name   cursorIndexAfterReadEqualsRowCount
     * @tc.desc   After the helper finishes, the cursor index equals the number of source rows for
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResultSetMappingValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            every input size, which is the after-last position.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cursorIndexAfterReadEqualsRowCount', 0, () => {
      const seed: Contact[] = createSeedContacts();
      for (let size = 1; size <= 4; size++) {
        const cursor: CursorResultSet = new CursorResultSet(seed.slice(0, size));
        readContactsFromResultSet(cursor);
        expect(cursor.index).assertEqual(size);
        expect(cursor.index).assertEqual(cursor.rowCount());
        expect(cursor.isAfterLast()).assertTrue();
        expect(cursor.closed).assertTrue();
      }
      expect(seed.length).assertEqual(15);
    });

    /**
     * @tc.name   getColumnIndexComposesFullRow
     * @tc.desc   Reading a row through getColumnIndex plus getString reconstructs all six fields,
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResultSetMappingValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            which is exactly the production mapping loop.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('getColumnIndexComposesFullRow', 0, () => {
      const row: Contact = contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road',
        'ada.png', 'F');
      const cursor: CursorResultSet = new CursorResultSet([row]);
      cursor.goToFirstRow();
      const rebuilt: Contact = new Contact(
        cursor.getString(cursor.getColumnIndex(FIELD_NAME)),
        cursor.getString(cursor.getColumnIndex(FIELD_PHONE)),
        cursor.getString(cursor.getColumnIndex(FIELD_EMAIL)),
        cursor.getString(cursor.getColumnIndex(FIELD_ADDRESS)),
        cursor.getString(cursor.getColumnIndex(FIELD_AVATAR)),
        cursor.getString(cursor.getColumnIndex(FIELD_CATEGORY))
      );
      expect(sameContact(rebuilt, row)).assertTrue();
      expect(rebuilt.category).assertEqual('F');
      expect(rebuilt.avatar).assertEqual('ada.png');
      expect(cursor.getColumnIndex(FIELD_NAME)).assertEqual(0);
    });

    /**
     * @tc.name   readUniqueRowsLoseExactlyOneElement
     * @tc.desc   With five distinct name and phone pairs the helper returns four rows, so the only
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResultSetMappingValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            loss is the skipped leading row.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('readUniqueRowsLoseExactlyOneElement', 0, () => {
      const rows: Contact[] = createSeedContacts().slice(0, 5);
      const visible: Contact[] = readContactsFromResultSet(new CursorResultSet(rows));
      expect(rows.length - visible.length).assertEqual(1);
      expect(visible.length).assertEqual(4);
      expect(uniqueStrings(contactNames(rows)).length).assertEqual(5);
      expect(uniqueStrings(contactNames(visible)).length).assertEqual(4);
      expect(visible.length).assertEqual(expectedVisibleCount(rows));
      expect(sameSnapshotArray(snapshotsOf(visible), snapshotsOf(expectedVisibleRows(rows)))).assertTrue();
    });
  });
}
