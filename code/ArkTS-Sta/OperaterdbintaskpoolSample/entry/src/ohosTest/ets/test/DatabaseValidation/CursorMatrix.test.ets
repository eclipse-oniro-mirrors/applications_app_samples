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
 * CursorMatrix pins every observable cursor edge of the result-set walk.
 *
 * Production anchors:
 *   DatabaseConnection.ets:277-283  goToFirstRow then a while over goToNextRow,
 *                                   so the first stored row is never emitted
 *   DatabaseConnection.ets:285-292  six getString calls through getColumnIndex
 *   DatabaseConnection.ets:294-301  duplicate test on name plus phone
 *   DatabaseConnection.ets:303-306  a second goToNextRow advances an extra row
 *   DatabaseConnection.ets:306      close is always called before returning
 *   RdbConstant.ets:31-34           the six contact columns and their order
 *
 * The suite drives CursorResultSet directly and compares every walk with the
 * independent expectedVisibleRows oracle. StoreDouble supplies realistic
 * sources so the matrix also covers the query path that feeds the cursor.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import {
  CursorResultSet,
  readContactsFromResultSet,
  expectedVisibleRows,
  expectedVisibleCount,
  StoreDouble,
  TaskPoolQueue,
  wrappedQueryResult,
  wrappedBatchCount,
  createSeedContacts,
  contactOf,
  cloneContact,
  sameContact,
  contactNames,
  sameStringArray,
  joined,
  countOf,
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

/** Five distinct rows; the head row is the one the walk always skips. */
function matrixSeed(): Contact[] {
  const rows: Contact[] = [];
  rows.push(contactOf('安然', '13601000001', 'anran@example.com', '北京市东城区', '', 'A'));
  rows.push(contactOf('柏舟', '13601000002', 'baizhou@example.com', '北京市西城区', '', 'B'));
  rows.push(contactOf('长庚', '13601000003', 'changeng@example.com', '北京市朝阳区', '', 'C'));
  rows.push(contactOf('棣华', '13601000004', 'dihua@example.com', '北京市丰台区', '', 'D'));
  rows.push(contactOf('尔雅', '13601000005', 'erya@example.com', '北京市石景山区', '', 'E'));
  return rows;
}

/** Builds count unique rows sharing one prefix for the larger matrices. */
function matrixBulk(count: number): Contact[] {
  const rows: Contact[] = [];
  for (let index = 0; index < count; index++) {
    const suffix: string = String(300 + index);
    rows.push(contactOf('matrix' + suffix, '1361000' + suffix, 'matrix' + suffix + '@example.com',
      '上海市徐汇区' + suffix, '', 'A'));
  }
  return rows;
}

/** A cursor over a defensive copy of the supplied rows. */
function cursorOf(rows: Contact[]): CursorResultSet {
  const copy: Contact[] = [];
  for (let index = 0; index < rows.length; index++) {
    copy.push(cloneContact(rows[index]));
  }
  return new CursorResultSet(copy);
}

/** Walks the rows through the production-shaped reader. */
function visibleRows(rows: Contact[]): Contact[] {
  return readContactsFromResultSet(cursorOf(rows));
}

/** Visible names after the first-row skip plus dedupe. */
function visibleNames(rows: Contact[]): string[] {
  return contactNames(visibleRows(rows));
}

/** Asserts that the walk emits exactly the expected names in order. */
function assertVisible(rows: Contact[], expected: string[]): void {
  const actual: string[] = visibleNames(rows);
  expect(actual.length).assertEqual(expected.length);
  expect(sameStringArray(actual, expected)).assertTrue();
  expect(joined(actual)).assertEqual(joined(expected));
}

/** Seeds a store and returns it for the query-path cases. */
function seededStore(store: StoreDouble, rows: Contact[]): StoreDouble {
  store.batchInsert(true, rows);
  return store;
}

export default function cursorMatrixTest(): void {
  describe('CursorMatrix', () => {
    const store: StoreDouble = new StoreDouble();
    const queue: TaskPoolQueue = new TaskPoolQueue();

    beforeAll(() => {
      logSuite('CursorMatrix', 'begin');
    });

    beforeEach(async () => {
      resetContactManager();
      store.reset();
      queue.reset();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });

    afterAll(() => {
      resetContactManager();
      store.reset();
      queue.reset();
      logSuite('CursorMatrix', 'end');
    });

    /**
     * @tc.name   cursorMatrixNewCursorBeforeFirstRow
     * @tc.desc   A fresh cursor sits before row zero, is not after the last row and is open.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Build a cursor over three rows.
     *                   2. Read the index, the after-last flag and the closed flag.
     *                   3. Read a column value before any positioning.
     * @tc.expected      Index is minus one, both flags are false and the value is empty.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('cursorMatrixNewCursorBeforeFirstRow', 0, () => {
      const cursor: CursorResultSet = cursorOf(matrixSeed().slice(0, 3));
      expect(cursor.index).assertEqual(-1);
      expect(cursor.isAfterLast()).assertFalse();
      expect(cursor.closed).assertFalse();
      expect(cursor.rowCount()).assertEqual(3);
      expect(cursor.getString(cursor.getColumnIndex(FIELD_NAME))).assertEqual('');
      expect(cursor.rows.length).assertEqual(3);
      expect(cursor.columnNames.length).assertEqual(6);
    });

    /**
     * @tc.name   cursorMatrixFirstRowSkippedByWalker
     * @tc.desc   The stored head row 安然 never reaches the visible list.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Walk the five-row matrix seed.
     *                   2. Collect the visible names.
     *                   3. Compare with the four expected tail names.
     * @tc.expected      Only the four rows after the head are emitted.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('cursorMatrixFirstRowSkippedByWalker', 0, () => {
      const rows: Contact[] = visibleRows(matrixSeed());
      expect(rows.length).assertEqual(4);
      expect(countOf(contactNames(rows), '安然')).assertEqual(0);
      expect(rows[0].name).assertEqual('柏舟');
      expect(rows[3].name).assertEqual('尔雅');
      assertVisible(matrixSeed(), ['柏舟', '长庚', '棣华', '尔雅']);
      expect(joined(visibleNames(matrixSeed()))).assertEqual('柏舟,长庚,棣华,尔雅');
    });

    /**
     * @tc.name   cursorMatrixSingleRowYieldsNothing
     * @tc.desc   A one-row source is consumed entirely by the first-row skip.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Build a one-row source.
     *                   2. Walk it through the reader.
     *                   3. Read the result length and the closed flag.
     * @tc.expected      The walk emits no rows and still closes the cursor.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('cursorMatrixSingleRowYieldsNothing', 0, () => {
      const single: Contact[] = matrixSeed().slice(0, 1);
      const cursor: CursorResultSet = cursorOf(single);
      const rows: Contact[] = readContactsFromResultSet(cursor);
      expect(rows.length).assertEqual(0);
      expect(cursor.closed).assertTrue();
      expect(cursor.rowCount()).assertEqual(1);
      expect(cursor.index).assertEqual(1);
      expect(visibleNames(single).length).assertEqual(0);
      expect(joined(visibleNames(single))).assertEqual('');
    });

    /**
     * @tc.name   cursorMatrixTwoRowsYieldSecondRow
     * @tc.desc   The smallest non-empty output is the second stored row.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Build a two-row source from the seed head and tail.
     *                   2. Walk it through the reader.
     *                   3. Compare the emitted row with the second source row.
     * @tc.expected      Exactly one row is emitted and it is the second source row.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('cursorMatrixTwoRowsYieldSecondRow', 0, () => {
      const seed: Contact[] = matrixSeed();
      const pair: Contact[] = [];
      pair.push(seed[0]);
      pair.push(seed[1]);
      const rows: Contact[] = visibleRows(pair);
      expect(rows.length).assertEqual(1);
      expect(rows[0].name).assertEqual('柏舟');
      expect(sameContact(rows[0], seed[1])).assertTrue();
      expect(rows[0].phone).assertEqual('13601000002');
      expect(rows[0].category).assertEqual('B');
    });

    /**
     * @tc.name   cursorMatrixEmptyRowsYieldEmpty
     * @tc.desc   An empty source positions at row zero, reports after-last and emits nothing.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Build an empty cursor.
     *                   2. Move to the first row.
     *                   3. Walk it through the reader.
     * @tc.expected      goToFirstRow is false, the index is zero, the walk is empty and closed.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('cursorMatrixEmptyRowsYieldEmpty', 0, () => {
      const cursor: CursorResultSet = new CursorResultSet([]);
      expect(cursor.goToFirstRow()).assertFalse();
      expect(cursor.index).assertEqual(0);
      expect(cursor.isAfterLast()).assertTrue();
      expect(cursor.rowCount()).assertEqual(0);
      const rows: Contact[] = readContactsFromResultSet(cursor);
      expect(rows.length).assertEqual(0);
      expect(cursor.closed).assertTrue();
      expect(cursor.getString(0)).assertEqual('');
    });

    /**
     * @tc.name   cursorMatrixDedupeByNameAndPhone
     * @tc.desc   Two rows with the same name and phone collapse to one visible row.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Build a source with the head row and two identical tail rows.
     *                   2. Walk it through the reader.
     *                   3. Count the emitted rows and names.
     * @tc.expected      Only one 柏舟 row is emitted and the duplicate is dropped.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('cursorMatrixDedupeByNameAndPhone', 0, () => {
      const seed: Contact[] = matrixSeed();
      const rows: Contact[] = [];
      rows.push(seed[0]);
      rows.push(contactOf('柏舟', '13601000002', 'first@example.com', '北京市西城区', '', 'B'));
      rows.push(contactOf('柏舟', '13601000002', 'second@example.com', '北京市西城区', '', 'B'));
      const emitted: Contact[] = visibleRows(rows);
      expect(emitted.length).assertEqual(1);
      expect(emitted[0].name).assertEqual('柏舟');
      expect(countOf(visibleNames(rows), '柏舟')).assertEqual(1);
      expect(emitted[0].email).assertEqual('first@example.com');
    });

    /**
     * @tc.name   cursorMatrixSameNameDifferentPhoneKept
     * @tc.desc   Name equality alone is not enough to drop a row.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Build a source with 柏舟 at two different phones.
     *                   2. Walk it through the reader.
     *                   3. Compare both phones in the output.
     * @tc.expected      Both 柏舟 rows are emitted because the phone differs.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('cursorMatrixSameNameDifferentPhoneKept', 0, () => {
      const seed: Contact[] = matrixSeed();
      const rows: Contact[] = [];
      rows.push(seed[0]);
      rows.push(contactOf('柏舟', '13601000002', 'one@example.com', '北京市西城区', '', 'B'));
      rows.push(contactOf('柏舟', '13601000009', 'two@example.com', '北京市海淀区', '', 'C'));
      const emitted: Contact[] = visibleRows(rows);
      expect(emitted.length).assertEqual(2);
      expect(emitted[0].phone).assertEqual('13601000002');
      expect(emitted[1].phone).assertEqual('13601000009');
      expect(countOf(contactNames(emitted), '柏舟')).assertEqual(2);
      expect(contactNames(emitted).length).assertEqual(2);
    });

    /**
     * @tc.name   cursorMatrixSamePhoneDifferentNameKept
     * @tc.desc   Phone equality alone is not enough to drop a row.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Build a source with two names sharing one phone.
     *                   2. Walk it through the reader.
     *                   3. Compare the emitted names.
     * @tc.expected      Both names survive and the shared phone is not treated as a key by itself.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('cursorMatrixSamePhoneDifferentNameKept', 0, () => {
      const seed: Contact[] = matrixSeed();
      const rows: Contact[] = [];
      rows.push(seed[0]);
      rows.push(contactOf('柏舟', '13601000007', 'shared@example.com', '北京市西城区', '', 'B'));
      rows.push(contactOf('长庚', '13601000007', 'shared@example.com', '北京市朝阳区', '', 'C'));
      const emitted: Contact[] = visibleRows(rows);
      expect(emitted.length).assertEqual(2);
      expect(emitted[0].name).assertEqual('柏舟');
      expect(emitted[1].name).assertEqual('长庚');
      expect(emitted[0].phone).assertEqual(emitted[1].phone);
      expect(countOf(contactNames(emitted), '长庚')).assertEqual(1);
    });

    /**
     * @tc.name   cursorMatrixDedupeKeepsFirstVisible
     * @tc.desc   When duplicates differ in other columns, the first visible row supplies the values.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Build three rows with one name and phone but three emails.
     *                   2. Walk it through the reader.
     *                   3. Read the emitted email and address.
     * @tc.expected      The first visible email and address are kept.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cursorMatrixDedupeKeepsFirstVisible', 0, () => {
      const seed: Contact[] = matrixSeed();
      const rows: Contact[] = [];
      rows.push(seed[0]);
      rows.push(contactOf('棣华', '13601000004', 'head@example.com', '北京市丰台区', '', 'D'));
      rows.push(contactOf('棣华', '13601000004', 'middle@example.com', '北京市大兴区', '', 'E'));
      rows.push(contactOf('棣华', '13601000004', 'last@example.com', '北京市通州区', '', 'F'));
      const emitted: Contact[] = visibleRows(rows);
      expect(emitted.length).assertEqual(1);
      expect(emitted[0].email).assertEqual('head@example.com');
      expect(emitted[0].address).assertEqual('北京市丰台区');
      expect(emitted[0].category).assertEqual('D');
      expect(countOf(contactNames(emitted), '棣华')).assertEqual(1);
    });

    /**
     * @tc.name   cursorMatrixDedupePreservesOrder
     * @tc.desc   Dedupe compacts duplicates without re-sorting the survivors.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Build head, 长庚, 柏舟, 长庚, 棣华.
     *                   2. Walk it through the reader.
     *                   3. Compare the survivor order.
     * @tc.expected      Survivors stay in first-seen order: 长庚, 柏舟, 棣华.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cursorMatrixDedupePreservesOrder', 0, () => {
      const seed: Contact[] = matrixSeed();
      const rows: Contact[] = [];
      rows.push(seed[0]);
      rows.push(contactOf('长庚', '13601000003', 'cg@example.com', '北京市朝阳区', '', 'C'));
      rows.push(contactOf('柏舟', '13601000002', 'bz@example.com', '北京市西城区', '', 'B'));
      rows.push(contactOf('长庚', '13601000003', 'cg@example.com', '北京市朝阳区', '', 'C'));
      rows.push(contactOf('棣华', '13601000004', 'dh@example.com', '北京市丰台区', '', 'D'));
      assertVisible(rows, ['长庚', '柏舟', '棣华']);
      expect(visibleRows(rows)[0].name).assertEqual('长庚');
      expect(visibleRows(rows)[2].name).assertEqual('棣华');
      expect(visibleRows(rows).length).assertEqual(3);
    });

    /**
     * @tc.name   cursorMatrixHeadDuplicateAfterSkipSurvives
     * @tc.desc   A row duplicating the skipped head is still visible because the head never joined.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Build two rows with the same name and phone as the head.
     *                   2. Walk the source through the reader.
     *                   3. Read the emitted row and its email.
     * @tc.expected      The second row is emitted once with its own email.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cursorMatrixHeadDuplicateAfterSkipSurvives', 0, () => {
      const seed: Contact[] = matrixSeed();
      const rows: Contact[] = [];
      rows.push(contactOf('安然', '13601000001', 'head@example.com', '北京市东城区', '', 'A'));
      rows.push(contactOf('安然', '13601000001', 'tail@example.com', '北京市东城区', '', 'A'));
      const emitted: Contact[] = visibleRows(rows);
      expect(emitted.length).assertEqual(1);
      expect(emitted[0].name).assertEqual('安然');
      expect(emitted[0].email).assertEqual('tail@example.com');
      expect(countOf(contactNames(emitted), '安然')).assertEqual(1);
      expect(contactNames(emitted).length).assertEqual(1);
    });

    /**
     * @tc.name   cursorMatrixClosedAfterWalk
     * @tc.desc   Every completed walk closes the cursor and leaves the index at the row count.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Build a four-row cursor.
     *                   2. Walk it through the reader.
     *                   3. Read the closed flag and the final index.
     * @tc.expected      The cursor is closed, the index equals the row count and rows survive.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('cursorMatrixClosedAfterWalk', 0, () => {
      const cursor: CursorResultSet = cursorOf(matrixSeed().slice(0, 4));
      expect(cursor.closed).assertFalse();
      const rows: Contact[] = readContactsFromResultSet(cursor);
      expect(rows.length).assertEqual(3);
      expect(cursor.closed).assertTrue();
      expect(cursor.index).assertEqual(4);
      expect(cursor.rowCount()).assertEqual(4);
      expect(cursor.rows.length).assertEqual(4);
      expect(cursor.isAfterLast()).assertTrue();
    });

    /**
     * @tc.name   cursorMatrixWalkTwiceRepeatsRows
     * @tc.desc   The reader ignores the closed flag, so a second walk reproduces the same rows.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Walk a four-row cursor once.
     *                   2. Walk the same closed cursor again.
     *                   3. Compare the two name lists and the closed flag.
     * @tc.expected      Both walks emit 柏舟, 长庚, 棣华 and the cursor stays closed.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cursorMatrixWalkTwiceRepeatsRows', 0, () => {
      const cursor: CursorResultSet = cursorOf(matrixSeed().slice(0, 4));
      const first: Contact[] = readContactsFromResultSet(cursor);
      expect(cursor.closed).assertTrue();
      const second: Contact[] = readContactsFromResultSet(cursor);
      expect(second.length).assertEqual(first.length);
      expect(sameStringArray(contactNames(second), contactNames(first))).assertTrue();
      expect(sameSnapshotArray(snapshotsOf(first), snapshotsOf(second))).assertTrue();
      expect(sameStringArray(contactNames(second), ['柏舟', '长庚', '棣华'])).assertTrue();
      expect(cursor.closed).assertTrue();
    });

    /**
     * @tc.name   cursorMatrixColumnIndexForSixColumns
     * @tc.desc   The six contact columns resolve to their declared indexes zero through five.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Create a cursor and read its column names.
     *                   2. Resolve each production column with getColumnIndex.
     *                   3. Compare the names with the bucket key list.
     * @tc.expected      Every column resolves to its position and the name array matches BUCKET_KEYS.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('cursorMatrixColumnIndexForSixColumns', 0, () => {
      const cursor: CursorResultSet = cursorOf(matrixSeed().slice(0, 2));
      expect(cursor.getColumnIndex(FIELD_NAME)).assertEqual(0);
      expect(cursor.getColumnIndex(FIELD_PHONE)).assertEqual(1);
      expect(cursor.getColumnIndex(FIELD_EMAIL)).assertEqual(2);
      expect(cursor.getColumnIndex(FIELD_ADDRESS)).assertEqual(3);
      expect(cursor.getColumnIndex(FIELD_AVATAR)).assertEqual(4);
      expect(cursor.getColumnIndex(FIELD_CATEGORY)).assertEqual(5);
      expect(sameStringArray(cursor.columnNames, BUCKET_KEYS)).assertTrue();
      expect(cursor.columnNames.length).assertEqual(6);
    });

    /**
     * @tc.name   cursorMatrixUnknownColumnIndexMinusOne
     * @tc.desc   An unknown column name resolves to minus one and reads back an empty string.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Position a cursor on the first row.
     *                   2. Resolve a column that does not exist.
     *                   3. Read through that index.
     * @tc.expected      The index is minus one and the value is empty rather than a name.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('cursorMatrixUnknownColumnIndexMinusOne', 0, () => {
      const cursor: CursorResultSet = cursorOf(matrixSeed().slice(0, 2));
      cursor.goToFirstRow();
      expect(cursor.getColumnIndex('nickname')).assertEqual(-1);
      expect(cursor.getColumnIndex('NAME')).assertEqual(-1);
      expect(cursor.getColumnIndex('')).assertEqual(-1);
      expect(cursor.getString(cursor.getColumnIndex('nickname'))).assertEqual('');
      expect(cursor.getString(-1)).assertEqual('');
      expect(cursor.getString(0)).assertEqual('安然');
    });

    /**
     * @tc.name   cursorMatrixOutOfRangeColumnEmpty
     * @tc.desc   Column indexes beyond the six declared columns read back an empty string.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Position a cursor on the first row.
     *                   2. Read index six and a much larger index.
     *                   3. Compare with a valid index.
     * @tc.expected      Both out-of-range reads are empty while index five holds the category.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('cursorMatrixOutOfRangeColumnEmpty', 0, () => {
      const cursor: CursorResultSet = cursorOf(matrixSeed().slice(0, 2));
      cursor.goToFirstRow();
      expect(cursor.getString(6)).assertEqual('');
      expect(cursor.getString(99)).assertEqual('');
      expect(cursor.getString(5)).assertEqual('A');
      expect(cursor.getString(4)).assertEqual('');
      expect(cursor.getString(3)).assertEqual('北京市东城区');
      expect(cursor.getColumnIndex(FIELD_CATEGORY)).assertEqual(5);
    });

    /**
     * @tc.name   cursorMatrixAfterLastStringEmpty
     * @tc.desc   Once the cursor passes the last row every column reads back empty.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Build a two-row cursor and step past the last row.
     *                   2. Confirm the after-last flag and index.
     *                   3. Read the name and phone columns.
     * @tc.expected      The index equals the row count and both column reads are empty.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cursorMatrixAfterLastStringEmpty', 0, () => {
      const cursor: CursorResultSet = cursorOf(matrixSeed().slice(0, 2));
      expect(cursor.goToFirstRow()).assertTrue();
      expect(cursor.goToNextRow()).assertTrue();
      expect(cursor.goToNextRow()).assertFalse();
      expect(cursor.isAfterLast()).assertTrue();
      expect(cursor.index).assertEqual(2);
      expect(cursor.getString(cursor.getColumnIndex(FIELD_NAME))).assertEqual('');
      expect(cursor.getString(cursor.getColumnIndex(FIELD_PHONE))).assertEqual('');
      expect(cursor.getString(5)).assertEqual('');
    });

    /**
     * @tc.name   cursorMatrixGoToNextRowSequence
     * @tc.desc   Successive goToNextRow calls walk indexes zero to the row count then fail.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Build a three-row cursor that starts at minus one.
     *                   2. Call goToNextRow four times and record every result.
     *                   3. Read the final index.
     * @tc.expected      The first three calls succeed, the fourth fails and the index ends at three.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('cursorMatrixGoToNextRowSequence', 0, () => {
      const cursor: CursorResultSet = cursorOf(matrixSeed().slice(0, 3));
      expect(cursor.index).assertEqual(-1);
      expect(cursor.goToNextRow()).assertTrue();
      expect(cursor.index).assertEqual(0);
      expect(cursor.goToNextRow()).assertTrue();
      expect(cursor.goToNextRow()).assertTrue();
      expect(cursor.index).assertEqual(2);
      expect(cursor.goToNextRow()).assertFalse();
      expect(cursor.index).assertEqual(3);
      expect(cursor.getString(0)).assertEqual('');
    });

    /**
     * @tc.name   cursorMatrixIsAfterLastBoundary
     * @tc.desc   Only index zero and the last valid row report not-after-last.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Build a three-row cursor and move to the first row.
     *                   2. Step through both valid rows.
     *                   3. Step one past the last row.
     * @tc.expected      The flag is false at indexes zero and two and true at index three.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('cursorMatrixIsAfterLastBoundary', 0, () => {
      const cursor: CursorResultSet = cursorOf(matrixSeed().slice(0, 3));
      expect(cursor.goToFirstRow()).assertTrue();
      expect(cursor.index).assertEqual(0);
      expect(cursor.isAfterLast()).assertFalse();
      cursor.goToNextRow();
      expect(cursor.index).assertEqual(1);
      expect(cursor.isAfterLast()).assertFalse();
      cursor.goToNextRow();
      expect(cursor.index).assertEqual(2);
      expect(cursor.isAfterLast()).assertFalse();
      cursor.goToNextRow();
      expect(cursor.isAfterLast()).assertTrue();
    });

    /**
     * @tc.name   cursorMatrixRowCountUnaffectedByWalk
     * @tc.desc   Walking, closing and reopening never changes rowCount or the column list.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Read metadata from a fresh five-row cursor.
     *                   2. Walk it to completion.
     *                   3. Read the same metadata again.
     * @tc.expected      Row count and column count are identical before and after the walk.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('cursorMatrixRowCountUnaffectedByWalk', 0, () => {
      const cursor: CursorResultSet = cursorOf(matrixSeed());
      const rowsBefore: number = cursor.rowCount();
      const columnsBefore: number = cursor.columnNames.length;
      const storedBefore: number = cursor.rows.length;
      const emitted: Contact[] = readContactsFromResultSet(cursor);
      expect(emitted.length).assertEqual(4);
      expect(cursor.rowCount()).assertEqual(rowsBefore);
      expect(cursor.columnNames.length).assertEqual(columnsBefore);
      expect(cursor.rows.length).assertEqual(storedBefore);
      expect(cursor.rowCount()).assertEqual(5);
      expect(cursor.columnNames.length).assertEqual(6);
    });

    /**
     * @tc.name   cursorMatrixGoToFirstRowResetsIndex
     * @tc.desc   goToFirstRow returns a finished cursor to index zero without clearing rows.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Walk a three-row cursor to the end.
     *                   2. Call goToFirstRow again.
     *                   3. Read the index, the flag and the head name.
     * @tc.expected      The index returns to zero, the flag clears and the head row is readable.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cursorMatrixGoToFirstRowResetsIndex', 0, () => {
      const cursor: CursorResultSet = cursorOf(matrixSeed().slice(0, 3));
      readContactsFromResultSet(cursor);
      expect(cursor.index).assertEqual(3);
      expect(cursor.closed).assertTrue();
      expect(cursor.goToFirstRow()).assertTrue();
      expect(cursor.index).assertEqual(0);
      expect(cursor.isAfterLast()).assertFalse();
      expect(cursor.getString(0)).assertEqual('安然');
      expect(cursor.getString(1)).assertEqual('13601000001');
      expect(cursor.closed).assertTrue();
    });

    /**
     * @tc.name   cursorMatrixTrailingDuplicateCollapsed
     * @tc.desc   A duplicate that appears last is collapsed without disturbing earlier rows.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Build head, 柏舟, 长庚 and a repeat of 长庚.
     *                   2. Walk the source through the reader.
     *                   3. Compare the emitted names and count.
     * @tc.expected      Two rows remain in the order 柏舟 then 长庚.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cursorMatrixTrailingDuplicateCollapsed', 0, () => {
      const seed: Contact[] = matrixSeed();
      const rows: Contact[] = [];
      rows.push(seed[0]);
      rows.push(contactOf('柏舟', '13601000002', 'bz@example.com', '北京市西城区', '', 'B'));
      rows.push(contactOf('长庚', '13601000003', 'cg@example.com', '北京市朝阳区', '', 'C'));
      rows.push(contactOf('长庚', '13601000003', 'cg@example.com', '北京市朝阳区', '', 'C'));
      const emitted: Contact[] = visibleRows(rows);
      expect(emitted.length).assertEqual(2);
      expect(contactNames(emitted)[0]).assertEqual('柏舟');
      expect(contactNames(emitted)[1]).assertEqual('长庚');
      expect(countOf(contactNames(emitted), '长庚')).assertEqual(1);
      expect(emitted.length).assertEqual(expectedVisibleCount(rows));
    });

    /**
     * @tc.name   cursorMatrixAlternatingDuplicates
     * @tc.desc   Alternating repeats of two names collapse to one row per name.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Build head, 柏舟, 长庚, 柏舟, 长庚 with identical phones.
     *                   2. Walk the source through the reader.
     *                   3. Compare the emitted names and order.
     * @tc.expected      Exactly 柏舟 then 长庚 are emitted.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cursorMatrixAlternatingDuplicates', 0, () => {
      const seed: Contact[] = matrixSeed();
      const rows: Contact[] = [];
      rows.push(seed[0]);
      rows.push(contactOf('柏舟', '13601000002', 'bz@example.com', '北京市西城区', '', 'B'));
      rows.push(contactOf('长庚', '13601000003', 'cg@example.com', '北京市朝阳区', '', 'C'));
      rows.push(contactOf('柏舟', '13601000002', 'bz@example.com', '北京市西城区', '', 'B'));
      rows.push(contactOf('长庚', '13601000003', 'cg@example.com', '北京市朝阳区', '', 'C'));
      assertVisible(rows, ['柏舟', '长庚']);
      expect(expectedVisibleCount(rows)).assertEqual(2);
      expect(visibleRows(rows).length).assertEqual(2);
      expect(joined(visibleNames(rows))).assertEqual('柏舟,长庚');
    });

    /**
     * @tc.name   cursorMatrixSeedVisibleCountMatchesOracle
     * @tc.desc   The fifteen-row production seed yields fourteen visible rows.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Load the fifteen seed rows.
     *                   2. Walk them through the reader.
     *                   3. Compare the count with expectedVisibleCount.
     * @tc.expected      Both counts are fourteen because only the head row is skipped.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('cursorMatrixSeedVisibleCountMatchesOracle', 0, () => {
      const seed: Contact[] = createSeedContacts();
      const emitted: Contact[] = visibleRows(seed);
      expect(seed.length).assertEqual(15);
      expect(emitted.length).assertEqual(14);
      expect(expectedVisibleCount(seed)).assertEqual(14);
      expect(emitted.length).assertEqual(expectedVisibleCount(seed));
      expect(emitted.length < seed.length).assertTrue();
      expect(emitted.length).assertEqual(expectedVisibleRows(seed).length);
    });

    /**
     * @tc.name   cursorMatrixSeedVisibleNamesMatchOracle
     * @tc.desc   The emitted seed names equal the oracle names in the same order.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Load the fifteen seed rows.
     *                   2. Walk them and build the oracle list.
     *                   3. Compare first, second and last names.
     * @tc.expected      Both lists start at 阿诺德 and end at 法里.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('cursorMatrixSeedVisibleNamesMatchOracle', 0, () => {
      const seed: Contact[] = createSeedContacts();
      const actual: string[] = visibleNames(seed);
      const oracle: string[] = contactNames(expectedVisibleRows(seed));
      expect(sameStringArray(actual, oracle)).assertTrue();
      expect(actual[0]).assertEqual('阿诺德');
      expect(actual[1]).assertEqual('贝拉');
      expect(actual[13]).assertEqual('法里');
      expect(countOf(actual, '艾德里安')).assertEqual(0);
      expect(joined(actual)).assertEqual(joined(oracle));
    });

    /**
     * @tc.name   cursorMatrixExpectedVisibleRowsSkipsHead
     * @tc.desc   The independent oracle starts its output at source index one.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Load the fifteen seed rows.
     *                   2. Build the oracle list directly.
     *                   3. Compare element zero with source element one.
     * @tc.expected      The oracle head is the second source row and the first source row is absent.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cursorMatrixExpectedVisibleRowsSkipsHead', 0, () => {
      const seed: Contact[] = createSeedContacts();
      const oracle: Contact[] = expectedVisibleRows(seed);
      expect(oracle.length).assertEqual(14);
      expect(sameContact(oracle[0], seed[1])).assertTrue();
      expect(oracle[0].name).assertEqual('阿诺德');
      expect(countOf(contactNames(oracle), seed[0].name)).assertEqual(0);
      expect(sameSnapshotArray(snapshotsOf(oracle), snapshotsOf(visibleRows(seed)))).assertTrue();
      expect(oracle[0].phone).assertEqual(seed[1].phone);
    });

    /**
     * @tc.name   cursorMatrixColumnValuesMapInOrder
     * @tc.desc   All six columns map the first row to the matching Contact fields.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Position a cursor on the head row.
     *                   2. Read all six columns through getColumnIndex.
     *                   3. Compare each value with the source row.
     * @tc.expected      Name, phone, email, address, avatar and category all match the source.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('cursorMatrixColumnValuesMapInOrder', 0, () => {
      const seed: Contact[] = matrixSeed();
      const cursor: CursorResultSet = cursorOf(seed);
      cursor.goToFirstRow();
      expect(cursor.getString(cursor.getColumnIndex(FIELD_NAME))).assertEqual('安然');
      expect(cursor.getString(cursor.getColumnIndex(FIELD_PHONE))).assertEqual('13601000001');
      expect(cursor.getString(cursor.getColumnIndex(FIELD_EMAIL))).assertEqual('anran@example.com');
      expect(cursor.getString(cursor.getColumnIndex(FIELD_ADDRESS))).assertEqual('北京市东城区');
      expect(cursor.getString(cursor.getColumnIndex(FIELD_AVATAR))).assertEqual('');
      expect(cursor.getString(cursor.getColumnIndex(FIELD_CATEGORY))).assertEqual('A');
    });

    /**
     * @tc.name   cursorMatrixAvatarRoundTrip
     * @tc.desc   A non-empty avatar reaches the emitted Contact through column four.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Build head plus a row carrying an avatar path.
     *                   2. Walk the source through the reader.
     *                   3. Read the emitted avatar and category.
     * @tc.expected      The avatar and category survive the column mapping unchanged.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cursorMatrixAvatarRoundTrip', 0, () => {
      const seed: Contact[] = matrixSeed();
      const rows: Contact[] = [];
      rows.push(seed[0]);
      rows.push(contactOf('柏舟', '13601000002', 'bz@example.com', '北京市西城区', 'avatar.png', 'B'));
      const emitted: Contact[] = visibleRows(rows);
      expect(emitted.length).assertEqual(1);
      expect(emitted[0].avatar).assertEqual('avatar.png');
      expect(emitted[0].category).assertEqual('B');
      expect(emitted[0].email).assertEqual('bz@example.com');
      expect(emitted[0].address).assertEqual('北京市西城区');
      expect(cursorOf(rows).getColumnIndex(FIELD_AVATAR)).assertEqual(4);
    });

    /**
     * @tc.name   cursorMatrixTenRowMatrix
     * @tc.desc   An eleven-row matrix with unique keys emits ten rows in generation order.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Generate eleven unique rows.
     *                   2. Walk them through the reader.
     *                   3. Check the head, tail and total count.
     * @tc.expected      Ten visible rows from matrix301 through matrix310.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cursorMatrixTenRowMatrix', 0, () => {
      const rows: Contact[] = matrixBulk(11);
      const emitted: Contact[] = visibleRows(rows);
      expect(rows.length).assertEqual(11);
      expect(emitted.length).assertEqual(10);
      expect(emitted[0].name).assertEqual('matrix301');
      expect(emitted[9].name).assertEqual('matrix310');
      expect(countOf(contactNames(emitted), 'matrix300')).assertEqual(0);
      expect(emitted.length).assertEqual(expectedVisibleCount(rows));
    });

    /**
     * @tc.name   cursorMatrixStoreQuerySourceParity
     * @tc.desc   A cursor built from store.query exposes the stored rows in insertion order.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Batch insert five rows into the store.
     *                   2. Query the store and wrap the result in a cursor.
     *                   3. Compare cursor rows with the store snapshot.
     * @tc.expected      The cursor holds the same five rows and the walk emits four.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('cursorMatrixStoreQuerySourceParity', 0, () => {
      const seed: Contact[] = matrixSeed();
      seededStore(store, seed);
      const cursor: CursorResultSet = new CursorResultSet(store.query(true));
      expect(cursor.rows.length).assertEqual(5);
      expect(sameSnapshotArray(snapshotsOf(cursor.rows), snapshotsOf(seed))).assertTrue();
      expect(cursor.index).assertEqual(-1);
      expect(store.queryCalls).assertEqual(1);
      const emitted: Contact[] = readContactsFromResultSet(cursor);
      expect(emitted.length).assertEqual(4);
      expect(contactNames(emitted)[0]).assertEqual('柏舟');
    });

    /**
     * @tc.name   cursorMatrixStoreRoundTripFeedsCursor
     * @tc.desc   Rows written by batchInsert come back through query and then through the walk.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Batch insert six generated rows.
     *                   2. Query the store into a cursor and walk it.
     *                   3. Check the created-table counter and visible count.
     * @tc.expected      Five of the six rows are visible and the table was created once.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('cursorMatrixStoreRoundTripFeedsCursor', 0, () => {
      const rows: Contact[] = matrixBulk(6);
      seededStore(store, rows);
      expect(store.rowCount()).assertEqual(6);
      expect(store.createTableCalls).assertEqual(1);
      const emitted: Contact[] = readContactsFromResultSet(new CursorResultSet(store.query(true)));
      expect(emitted.length).assertEqual(5);
      expect(emitted[0].name).assertEqual('matrix301');
      expect(emitted[4].name).assertEqual('matrix305');
      expect(store.queryCalls).assertEqual(1);
      expect(store.batchCalls).assertEqual(1);
    });

    /**
     * @tc.name   cursorMatrixBatchInsertedRowsDeduped
     * @tc.desc   Duplicate rows written through the store are collapsed when the cursor walks them.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Batch insert head plus three duplicated tail rows.
     *                   2. Query the store and walk the cursor.
     *                   3. Compare the visible names.
     * @tc.expected      Three visible names remain after the head skip and dedupe.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cursorMatrixBatchInsertedRowsDeduped', 0, () => {
      const seed: Contact[] = matrixSeed();
      const rows: Contact[] = [];
      rows.push(seed[0]);
      rows.push(contactOf('柏舟', '13601000002', 'bz@example.com', '北京市西城区', '', 'B'));
      rows.push(contactOf('柏舟', '13601000002', 'bz@example.com', '北京市西城区', '', 'B'));
      rows.push(contactOf('长庚', '13601000003', 'cg@example.com', '北京市朝阳区', '', 'C'));
      rows.push(contactOf('长庚', '13601000003', 'cg@example.com', '北京市朝阳区', '', 'C'));
      rows.push(contactOf('棣华', '13601000004', 'dh@example.com', '北京市丰台区', '', 'D'));
      seededStore(store, rows);
      expect(store.rowCount()).assertEqual(6);
      const emitted: Contact[] = readContactsFromResultSet(new CursorResultSet(store.query(true)));
      assertVisible(rows, ['柏舟', '长庚', '棣华']);
      expect(emitted.length).assertEqual(3);
      expect(emitted.length).assertEqual(expectedVisibleCount(rows));
    });

    /**
     * @tc.name   cursorMatrixMutationThenQueryCursor
     * @tc.desc   A store update is visible through a cursor built after the mutation.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Seed the store with the five-row matrix.
     *                   2. Update 长庚 with a new phone.
     *                   3. Query and walk the refreshed rows.
     * @tc.expected      The visible 长庚 row carries the new phone and the count stays four.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cursorMatrixMutationThenQueryCursor', 0, () => {
      seededStore(store, matrixSeed());
      const affected: number = store.updateContact(
        contactOf('长庚', '13601009999', 'cg-new@example.com', '北京市朝阳区', '', 'C'));
      expect(affected).assertEqual(1);
      expect(store.updateCalls).assertEqual(1);
      const emitted: Contact[] = readContactsFromResultSet(new CursorResultSet(store.query(true)));
      expect(emitted.length).assertEqual(4);
      expect(emitted[1].name).assertEqual('长庚');
      expect(emitted[1].phone).assertEqual('13601009999');
      expect(emitted[1].email).assertEqual('cg-new@example.com');
      expect(countOf(contactNames(emitted), '长庚')).assertEqual(1);
    });

    /**
     * @tc.name   cursorMatrixQueueQueryCompletesBeforeRead
     * @tc.desc   A query task completed on the queue precedes the cursor read in the trace.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Seed the store and submit a query task.
     *                   2. Run and complete the task.
     *                   3. Build the cursor and compare the trace.
     * @tc.expected      The trace is query and the walk emits four rows.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cursorMatrixQueueQueryCompletesBeforeRead', 0, () => {
      seededStore(store, matrixSeed());
      queue.submit('query');
      const name: string = queue.runNext();
      expect(name).assertEqual('query');
      queue.complete(name);
      expect(queue.trace()).assertEqual('query');
      expect(queue.completed.length).assertEqual(1);
      expect(queue.size()).assertEqual(0);
      const emitted: Contact[] = readContactsFromResultSet(new CursorResultSet(store.query(true)));
      expect(emitted.length).assertEqual(4);
      expect(queue.failed.length).assertEqual(0);
    });

    /**
     * @tc.name   cursorMatrixQueueFailureLeavesCursorEmpty
     * @tc.desc   When the query task fails, no rows are queried and the cursor stays empty.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Submit a query task without seeding the store.
     *                   2. Run the task and fail it.
     *                   3. Query an empty store into a cursor and walk it.
     * @tc.expected      The failure is recorded, the query count stays zero and the walk is empty.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cursorMatrixQueueFailureLeavesCursorEmpty', 0, () => {
      queue.submit('query');
      const name: string = queue.runNext();
      queue.fail(name);
      expect(queue.failed.length).assertEqual(1);
      expect(queue.failed[0]).assertEqual('query');
      expect(queue.completed.length).assertEqual(0);
      expect(queue.trace()).assertEqual('');
      expect(store.queryCalls).assertEqual(0);
      const cursor: CursorResultSet = new CursorResultSet(store.query(true));
      expect(cursor.rowCount()).assertEqual(0);
      expect(readContactsFromResultSet(cursor).length).assertEqual(0);
      expect(cursor.closed).assertTrue();
    });

    /**
     * @tc.name   cursorMatrixWrappedQueryMissingContextEmpty
     * @tc.desc   The query wrapper returns an empty array without touching the store when context is missing.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Seed the store with five rows.
     *                   2. Call the wrapper with an invalid context.
     *                   3. Read the store query counter.
     * @tc.expected      The wrapper returns zero rows and the store sees no query.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cursorMatrixWrappedQueryMissingContextEmpty', 0, () => {
      seededStore(store, matrixSeed());
      const rows: Contact[] = wrappedQueryResult(false, store);
      expect(rows.length).assertEqual(0);
      expect(rows instanceof Array).assertTrue();
      expect(store.queryCalls).assertEqual(0);
      expect(store.rowCount()).assertEqual(5);
      expect(wrappedQueryResult(true, store).length).assertEqual(5);
      expect(store.queryCalls).assertEqual(1);
    });

    /**
     * @tc.name   cursorMatrixWrappedBatchCountNonNegative
     * @tc.desc   A failed batch insert is reported as zero rows instead of a negative count.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Call the batch wrapper with an invalid context.
     *                   2. Read the returned count and the store state.
     *                   3. Retry with a valid context.
     * @tc.expected      The first count is zero, nothing is stored, and the retry returns three.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cursorMatrixWrappedBatchCountNonNegative', 0, () => {
      const rows: Contact[] = matrixBulk(3);
      const failed: number = wrappedBatchCount(false, store, rows);
      expect(failed).assertEqual(0);
      expect(failed >= 0).assertTrue();
      expect(store.rowCount()).assertEqual(0);
      expect(store.initialized).assertFalse();
      expect(store.batchCalls).assertEqual(1);
      expect(wrappedBatchCount(true, store, rows)).assertEqual(3);
      expect(store.rowCount()).assertEqual(3);
    });

    /**
     * @tc.name   cursorMatrixCloseBeforeWalkStillEmits
     * @tc.desc   Closing before the first walk does not stop the reader from emitting rows.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Build a four-row cursor and close it immediately.
     *                   2. Walk it through the reader.
     *                   3. Read the emitted names and the closed flag.
     * @tc.expected      Three rows are still emitted and the cursor remains closed.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cursorMatrixCloseBeforeWalkStillEmits', 0, () => {
      const cursor: CursorResultSet = cursorOf(matrixSeed().slice(0, 4));
      cursor.close();
      expect(cursor.closed).assertTrue();
      const emitted: Contact[] = readContactsFromResultSet(cursor);
      expect(emitted.length).assertEqual(3);
      expect(contactNames(emitted)[0]).assertEqual('柏舟');
      expect(contactNames(emitted)[2]).assertEqual('棣华');
      expect(cursor.closed).assertTrue();
      expect(cursor.rowCount()).assertEqual(4);
    });

    /**
     * @tc.name   cursorMatrixEmptySeedEmitsNothing
     * @tc.desc   An empty source produces zero rows from both the walk and the oracle.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Walk an empty source.
     *                   2. Build the oracle for the same source.
     *                   3. Compare both counts with zero.
     * @tc.expected      Both counts are zero and no name text is produced.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('cursorMatrixEmptySeedEmitsNothing', 0, () => {
      const empty: Contact[] = [];
      const emitted: Contact[] = readContactsFromResultSet(cursorOf(empty));
      expect(emitted.length).assertEqual(0);
      expect(expectedVisibleCount(empty)).assertEqual(0);
      expect(expectedVisibleRows(empty).length).assertEqual(0);
      expect(joined(contactNames(emitted))).assertEqual('');
      expect(visibleNames(empty).length).assertEqual(0);
      expect(expectedVisibleRows(empty) instanceof Array).assertTrue();
    });

    /**
     * @tc.name   cursorMatrixStoreReuseKeepsCursorRows
     * @tc.desc   Two cursors built from the same store each see the full retained rows.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Seed the store once.
     *                   2. Walk a cursor, then query again and walk another cursor.
     *                   3. Compare counts, query calls and table creation.
     * @tc.expected      Both walks emit four rows and the table is created only once.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cursorMatrixStoreReuseKeepsCursorRows', 0, () => {
      seededStore(store, matrixSeed());
      const first: Contact[] = readContactsFromResultSet(new CursorResultSet(store.query(true)));
      const second: Contact[] = readContactsFromResultSet(new CursorResultSet(store.query(true)));
      expect(first.length).assertEqual(4);
      expect(second.length).assertEqual(4);
      expect(sameStringArray(contactNames(first), contactNames(second))).assertTrue();
      expect(store.queryCalls).assertEqual(2);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.initialized).assertTrue();
    });

    /**
     * @tc.name   cursorMatrixBlankFieldsStillWalk
     * @tc.desc   A row with blank email, address and category is emitted with empty strings.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Build head plus a row whose three text fields are blank.
     *                   2. Walk the source through the reader.
     *                   3. Read each emitted field.
     * @tc.expected      The row survives with an empty email, address and category.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cursorMatrixBlankFieldsStillWalk', 0, () => {
      const seed: Contact[] = matrixSeed();
      const rows: Contact[] = [];
      rows.push(seed[0]);
      rows.push(contactOf('空白', '13601000008', '', '', '', ''));
      const emitted: Contact[] = visibleRows(rows);
      expect(emitted.length).assertEqual(1);
      expect(emitted[0].name).assertEqual('空白');
      expect(emitted[0].phone).assertEqual('13601000008');
      expect(emitted[0].email).assertEqual('');
      expect(emitted[0].address).assertEqual('');
      expect(emitted[0].category).assertEqual('');
    });

    /**
     * @tc.name   cursorMatrixSnapshotEqualsOracle
     * @tc.desc   Every emitted snapshot equals the oracle snapshot for the same source.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Walk the duplicate matrix source.
     *                   2. Build the oracle for that source.
     *                   3. Compare snapshots pairwise.
     * @tc.expected      The two snapshot arrays are identical and every row matches by value.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cursorMatrixSnapshotEqualsOracle', 0, () => {
      const seed: Contact[] = matrixSeed();
      const rows: Contact[] = [];
      rows.push(seed[0]);
      rows.push(contactOf('柏舟', '13601000002', 'bz@example.com', '北京市西城区', '', 'B'));
      rows.push(contactOf('柏舟', '13601000002', 'bz@example.com', '北京市西城区', '', 'B'));
      rows.push(contactOf('棣华', '13601000004', 'dh@example.com', '北京市丰台区', '', 'D'));
      const emitted: Contact[] = visibleRows(rows);
      const oracle: Contact[] = expectedVisibleRows(rows);
      expect(sameSnapshotArray(snapshotsOf(emitted), snapshotsOf(oracle))).assertTrue();
      expect(emitted.length).assertEqual(oracle.length);
      expect(sameContact(emitted[0], oracle[0])).assertTrue();
      expect(sameContact(emitted[1], oracle[1])).assertTrue();
      expect(emitted[1].name).assertEqual('棣华');
      expect(countOf(contactNames(emitted), '柏舟')).assertEqual(1);
    });
  });
}
