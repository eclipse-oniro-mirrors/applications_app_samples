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
 * Regression / SnapshotRegression suite.
 *
 * A snapshot is a five field projection of a contact: name, phone, email,
 * address and category. The avatar is intentionally outside the projection, so
 * two rows that differ only by avatar compare equal. The suite pins that
 * projection and the order of the snapshot array after each mutation.
 *
 * Source anchors:
 *   SharedDriver.ets:866-898        ContactSnapshot projection and describe
 *   SharedDriver.ets:900-910        sameSnapshotArray length first
 *   ContactManager.ets:50-70        add, update and delete order effects
 *   SharedDriver.ets:833-864        metrics fingerprint
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import { ContactManager } from '../../../../main/ets/pages/model/ContactManager';
import {
  CATEGORY_A,
  CATEGORY_B,
  CATEGORY_C,
  CATEGORY_D,
  createSeedContacts,
  contactOf,
  cloneContact,
  contactNames,
  joined,
  countOf,
  snapshotsOf,
  sameSnapshotArray,
  ContactSnapshot,
  ContactMetrics,
  CursorResultSet,
  readContactsFromResultSet,
  StoreDouble,
  SearchEngine,
  resetContactManager
} from '../Shared/SharedDriver';

export default function snapshotRegressionTest(): void {
  describe('SnapshotRegression', () => {
    beforeAll(() => {
      logSuite('SnapshotRegression', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      resetContactManager();
      logSuite('SnapshotRegression', 'end');
    });

    /**
     * @tc.name   snapshotDescribeFormat
     * @tc.desc   A snapshot describes five fields separated by slashes, without the avatar.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('snapshotDescribeFormat', 0, () => {
      const row = contactOf('艾德里安', '13333333333', 'aidelian@example.com', '江苏省南京市鼓楼区', 'avatar/a.png', CATEGORY_A);
      const snapshot = new ContactSnapshot(row);
      expect(snapshot.describe()).assertEqual('艾德里安/13333333333/aidelian@example.com/江苏省南京市鼓楼区/A');
      expect(snapshot.describe().split('/').length).assertEqual(5);
      expect(snapshot.describe().indexOf('avatar/a.png')).assertEqual(-1);
      logStep('snapshotRegressionTest', 'snapshot describe format');
    });

    /**
     * @tc.name   snapshotEqualsItself
     * @tc.desc   A snapshot compares equal to a second snapshot of the same row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('snapshotEqualsItself', 0, () => {
      const row = createSeedContacts()[0];
      const first = new ContactSnapshot(row);
      const second = new ContactSnapshot(cloneContact(row));
      expect(first.sameAs(second)).assertTrue();
      expect(second.sameAs(first)).assertTrue();
      expect(first.name).assertEqual(second.name);
      logStep('snapshotRegressionTest', 'snapshot equals itself');
    });

    /**
     * @tc.name   snapshotIgnoresAvatar
     * @tc.desc   Two rows differing only by avatar produce equal snapshots.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotIgnoresAvatar', 0, () => {
      const left = contactOf('林岸', '13800138000', 'lin@example.com', '上海市徐汇区', 'avatar/one.png', CATEGORY_A);
      const right = contactOf('林岸', '13800138000', 'lin@example.com', '上海市徐汇区', 'avatar/two.png', CATEGORY_A);
      expect(new ContactSnapshot(left).sameAs(new ContactSnapshot(right))).assertTrue();
      expect(left.avatar === right.avatar).assertFalse();
      expect(new ContactSnapshot(left).describe()).assertEqual(new ContactSnapshot(right).describe());
      logStep('snapshotRegressionTest', 'snapshot ignores the avatar');
    });

    /**
     * @tc.name   snapshotDiffersOnPhone
     * @tc.desc   A one digit phone change breaks snapshot equality.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('snapshotDiffersOnPhone', 0, () => {
      const left = createSeedContacts()[2];
      const right = cloneContact(left);
      right.phone = '11111111112';
      expect(new ContactSnapshot(left).sameAs(new ContactSnapshot(right))).assertFalse();
      expect(new ContactSnapshot(left).phone).assertEqual('11111111111');
      expect(new ContactSnapshot(right).phone).assertEqual('11111111112');
      logStep('snapshotRegressionTest', 'phone change breaks equality');
    });

    /**
     * @tc.name   snapshotDiffersOnCategory
     * @tc.desc   A category change breaks snapshot equality while the name stays equal.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotDiffersOnCategory', 0, () => {
      const left = createSeedContacts()[0];
      const right = cloneContact(left);
      right.category = CATEGORY_D;
      const leftSnapshot = new ContactSnapshot(left);
      const rightSnapshot = new ContactSnapshot(right);
      expect(leftSnapshot.sameAs(rightSnapshot)).assertFalse();
      expect(leftSnapshot.name).assertEqual(rightSnapshot.name);
      expect(rightSnapshot.category).assertEqual(CATEGORY_D);
      logStep('snapshotRegressionTest', 'category change breaks equality');
    });

    /**
     * @tc.name   snapshotArraysEqualForClones
     * @tc.desc   Snapshot arrays of the seed and a deep clone compare equal element by element.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotArraysEqualForClones', 0, () => {
      const seed = createSeedContacts();
      const copies: Contact[] = [];
      for (let index = 0; index < seed.length; index++) {
        copies.push(cloneContact(seed[index]));
      }
      expect(sameSnapshotArray(snapshotsOf(seed), snapshotsOf(copies))).assertTrue();
      expect(snapshotsOf(seed).length).assertEqual(15);
      expect(snapshotsOf(copies).length).assertEqual(15);
      logStep('snapshotRegressionTest', 'snapshot arrays equal for clones');
    });

    /**
     * @tc.name   snapshotArraysDifferOnLength
     * @tc.desc   A length difference fails before any field comparison.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotArraysDifferOnLength', 0, () => {
      const full = snapshotsOf(createSeedContacts());
      const shortRows = snapshotsOf(createSeedContacts().slice(0, 14));
      expect(full.length).assertEqual(15);
      expect(shortRows.length).assertEqual(14);
      expect(sameSnapshotArray(full, shortRows)).assertFalse();
      expect(sameSnapshotArray(shortRows, full)).assertFalse();
      logStep('snapshotRegressionTest', 'length difference fails the compare');
    });

    /**
     * @tc.name   snapshotAfterAddHasTail
     * @tc.desc   After one append the snapshot array grows by one and the new tail is the added row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotAfterAddHasTail', 0, () => {
      const manager = resetContactManager(createSeedContacts());
      const added = contactOf('苏禾', '13512345678', 'suhe@example.com', '浙江省杭州市西湖区', '', CATEGORY_B);
      manager.addContact(added);
      const snapshot = snapshotsOf(manager.getContacts());
      expect(snapshot.length).assertEqual(16);
      expect(snapshot[15].describe()).assertEqual('苏禾/13512345678/suhe@example.com/浙江省杭州市西湖区/B');
      expect(snapshot[14].name).assertEqual('法里');
      logStep('snapshotRegressionTest', 'append extends the snapshot array');
    });

    /**
     * @tc.name   snapshotAfterDeleteLosesRow
     * @tc.desc   Deleting 贝拉 drops one snapshot and shifts the later elements down.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotAfterDeleteLosesRow', 0, () => {
      const manager = resetContactManager(createSeedContacts());
      manager.deleteContact(contactOf('贝拉', '', '', '', '', ''));
      const snapshot = snapshotsOf(manager.getContacts());
      expect(snapshot.length).assertEqual(14);
      expect(snapshot[1].name).assertEqual('阿诺德');
      expect(snapshot[2].name).assertEqual('本');
      expect(snapshot[3].name).assertEqual('本杰明');
      let bellaCount = 0;
      for (let index = 0; index < snapshot.length; index++) {
        if (snapshot[index].name === '贝拉') {
          bellaCount = bellaCount + 1;
        }
      }
      expect(bellaCount).assertEqual(0);
      logStep('snapshotRegressionTest', 'delete shifts the snapshot array');
    });

    /**
     * @tc.name   snapshotAfterUpdateKeepsIndex
     * @tc.desc   Rewriting 丹尼尔 keeps its snapshot at index eight with the new phone.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotAfterUpdateKeepsIndex', 0, () => {
      const manager = resetContactManager(createSeedContacts());
      manager.updateContact(contactOf('丹尼尔', '17700000001', 'daniel.snap@example.com', '陕西省商洛市商州区', '', CATEGORY_D));
      const snapshot = snapshotsOf(manager.getContacts());
      expect(snapshot.length).assertEqual(15);
      expect(snapshot[8].name).assertEqual('丹尼尔');
      expect(snapshot[8].phone).assertEqual('17700000001');
      expect(snapshot[8].address).assertEqual('陕西省商洛市商州区');
      logStep('snapshotRegressionTest', 'update rewrites in place');
    });

    /**
     * @tc.name   snapshotAfterRecreateMovesTail
     * @tc.desc   Delete then add of 卡梅隆 puts its snapshot at the tail instead of index five.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotAfterRecreateMovesTail', 0, () => {
      const manager = resetContactManager(createSeedContacts());
      manager.deleteContact(contactOf('卡梅隆', '', '', '', '', ''));
      manager.addContact(contactOf('卡梅隆', '17700000002', 'cameron.snap@example.com', '陕西省咸阳市秦都区', '', CATEGORY_C));
      const snapshot = snapshotsOf(manager.getContacts());
      expect(snapshot.length).assertEqual(15);
      expect(snapshot[14].name).assertEqual('卡梅隆');
      expect(snapshot[5].name).assertEqual('康纳');
      expect(snapshot[14].phone).assertEqual('17700000002');
      logStep('snapshotRegressionTest', 'recreated row moves to the tail');
    });

    /**
     * @tc.name   snapshotTrailThreeSteps
     * @tc.desc   Add, edit and delete produce the expected snapshot length at each step.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotTrailThreeSteps', 0, () => {
      const manager = resetContactManager(createSeedContacts());
      expect(snapshotsOf(manager.getContacts()).length).assertEqual(15);
      manager.addContact(contactOf('洛川', '13620000121', 'luochuan.snap@example.com', '河南省郑州市金水区', '', CATEGORY_D));
      expect(snapshotsOf(manager.getContacts()).length).assertEqual(16);
      manager.updateContact(contactOf('洛川', '13620000122', 'luochuan.snap2@example.com', '河南省郑州市中原区', '', CATEGORY_D));
      expect(snapshotsOf(manager.getContacts()).length).assertEqual(16);
      manager.deleteContact(contactOf('洛川', '', '', '', '', ''));
      expect(snapshotsOf(manager.getContacts()).length).assertEqual(15);
      logStep('snapshotRegressionTest', 'snapshot trail across three steps');
    });

    /**
     * @tc.name   snapshotForDuplicateTwin
     * @tc.desc   Two 贝拉 rows have identical snapshots when only the phone is shared.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('snapshotForDuplicateTwin', 0, () => {
      const first = contactOf('贝拉', '11111111111', 'bella@example.com', '湖北省武汉市江汉区', '', CATEGORY_B);
      const twin = contactOf('贝拉', '11111111111', 'bella@example.com', '湖北省武汉市江汉区', '', CATEGORY_B);
      expect(new ContactSnapshot(first).sameAs(new ContactSnapshot(twin))).assertTrue();
      expect(new ContactSnapshot(first).describe()).assertEqual(new ContactSnapshot(twin).describe());
      expect(first.name).assertEqual(twin.name);
      logStep('snapshotRegressionTest', 'duplicate twins share a snapshot');
    });

    /**
     * @tc.name   snapshotEmptyArrayIsEqual
     * @tc.desc   Two empty snapshot arrays compare equal and describe no rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotEmptyArrayIsEqual', 0, () => {
      const empty: Contact[] = [];
      expect(snapshotsOf(empty).length).assertEqual(0);
      expect(sameSnapshotArray(snapshotsOf(empty), snapshotsOf([]))).assertTrue();
      expect(ContactMetrics.from(empty).total).assertEqual(0);
      logStep('snapshotRegressionTest', 'empty snapshot arrays are equal');
    });

    /**
     * @tc.name   snapshotSingleRowArray
     * @tc.desc   A one row array has one snapshot and fails against a two row array.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotSingleRowArray', 0, () => {
      const rows: Contact[] = [];
      rows.push(contactOf('裴照', '13200000101', 'peizhao.snap@example.com', '山西省太原市小店区', '', CATEGORY_A));
      expect(snapshotsOf(rows).length).assertEqual(1);
      expect(snapshotsOf(rows)[0].name).assertEqual('裴照');
      expect(sameSnapshotArray(snapshotsOf(rows), snapshotsOf(createSeedContacts().slice(0, 2)))).assertFalse();
      logStep('snapshotRegressionTest', 'single row array');
    });

    /**
     * @tc.name   snapshotAfterCategoryChange
     * @tc.desc   Changing one category changes exactly that snapshot and lowers its old group.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('snapshotAfterCategoryChange', 0, () => {
      const manager = resetContactManager(createSeedContacts());
      manager.updateContact(contactOf('艾德里安', '13333333333', 'aidelian@example.com', '江苏省南京市鼓楼区', '', CATEGORY_C));
      const snapshot = snapshotsOf(manager.getContacts());
      expect(snapshot[0].category).assertEqual(CATEGORY_C);
      expect(SearchEngine.countCategory(manager.getContacts(), CATEGORY_A)).assertEqual(1);
      expect(snapshot[1].category).assertEqual(CATEGORY_A);
      logStep('snapshotRegressionTest', 'category change updates one snapshot');
    });

    /**
     * @tc.name   fingerprintChangesWhenCategoryCountChanges
     * @tc.desc   Adding a seventh category changes the metrics fingerprint.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('fingerprintChangesWhenCategoryCountChanges', 0, () => {
      const rows = createSeedContacts();
      const before = ContactMetrics.from(rows).fingerprint();
      rows.push(contactOf('龙川', '13900001021', 'longchuan.snap@example.com', '云南省昆明市五华区', '', 'G'));
      const after = ContactMetrics.from(rows);
      expect(after.categories).assertEqual(7);
      expect(after.fingerprint() === before).assertFalse();
      expect(after.total).assertEqual(16);
      logStep('snapshotRegressionTest', 'new category changes the fingerprint');
    });

    /**
     * @tc.name   cursorSnapshotsMatchStoredTail
     * @tc.desc   Snapshots of the walked rows equal snapshots of the stored tail.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('cursorSnapshotsMatchStoredTail', 0, () => {
      const seed = createSeedContacts();
      const visible = readContactsFromResultSet(new CursorResultSet(seed));
      expect(sameSnapshotArray(snapshotsOf(visible), snapshotsOf(seed.slice(1)))).assertTrue();
      expect(snapshotsOf(visible).length).assertEqual(14);
      expect(snapshotsOf(visible)[0].name).assertEqual('阿诺德');
      logStep('snapshotRegressionTest', 'cursor snapshots match the stored tail');
    });

    /**
     * @tc.name   storeSnapshotsMatchBatchInput
     * @tc.desc   Snapshot array after a batch equals the snapshot array of the input chunk.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('storeSnapshotsMatchBatchInput', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      const chunk = createSeedContacts().slice(4, 9);
      store.batchInsert(true, chunk);
      expect(sameSnapshotArray(snapshotsOf(store.rows), snapshotsOf(chunk))).assertTrue();
      expect(store.rowCount()).assertEqual(5);
      expect(snapshotsOf(store.rows)[0].name).assertEqual('本杰明');
      logStep('snapshotRegressionTest', 'store snapshots match the batch input');
    });

    /**
     * @tc.name   snapshotOrderPreservedAfterTwoAdds
     * @tc.desc   Two appends appear in the snapshot array in call order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotOrderPreservedAfterTwoAdds', 0, () => {
      const manager = resetContactManager(createSeedContacts());
      manager.addContact(contactOf('甲一', '13600000101', 'jiayi.snap@example.com', '江苏省无锡市梁溪区', '', CATEGORY_A));
      manager.addContact(contactOf('甲二', '13600000102', 'jiaer.snap@example.com', '江苏省无锡市滨湖区', '', CATEGORY_A));
      const snapshot = snapshotsOf(manager.getContacts());
      expect(snapshot[15].name).assertEqual('甲一');
      expect(snapshot[16].name).assertEqual('甲二');
      expect(snapshot.length).assertEqual(17);
      logStep('snapshotRegressionTest', 'snapshot order follows add order');
    });

    /**
     * @tc.name   snapshotDescribeHasNoEmptyTokens
     * @tc.desc   A fully populated row produces five non empty describe tokens.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('snapshotDescribeHasNoEmptyTokens', 0, () => {
      const row = createSeedContacts()[0];
      const parts = new ContactSnapshot(row).describe().split('/');
      expect(parts.length).assertEqual(5);
      expect(parts[0].length > 0).assertTrue();
      expect(parts[3].length > 0).assertTrue();
      expect(parts[4]).assertEqual(CATEGORY_A);
      expect(countOf(parts, '')).assertEqual(0);
      logStep('snapshotRegressionTest', 'describe has no empty tokens');
    });

    /**
     * @tc.name   snapshotAfterDeleteAllIsEmpty
     * @tc.desc   Deleting every seed name leaves an empty snapshot array.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('snapshotAfterDeleteAllIsEmpty', 0, () => {
      const manager = resetContactManager(createSeedContacts());
      const seed = createSeedContacts();
      for (let index = 0; index < seed.length; index++) {
        manager.deleteContact(contactOf(seed[index].name, '', '', '', '', ''));
      }
      expect(snapshotsOf(manager.getContacts()).length).assertEqual(0);
      expect(sameSnapshotArray(snapshotsOf(manager.getContacts()), snapshotsOf([]))).assertTrue();
      expect(manager.getContacts().length).assertEqual(0);
      logStep('snapshotRegressionTest', 'delete all empties the snapshot array');
    });

    /**
     * @tc.name   snapshotNamesMatchContactNames
     * @tc.desc   The snapshot name projection equals the contact name list.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotNamesMatchContactNames', 0, () => {
      const seed = createSeedContacts();
      const snapshot = snapshotsOf(seed);
      const projected: string[] = [];
      for (let index = 0; index < snapshot.length; index++) {
        projected.push(snapshot[index].name);
      }
      expect(joined(projected)).assertEqual(joined(contactNames(seed)));
      expect(projected.length).assertEqual(15);
      expect(projected[14]).assertEqual('法里');
      logStep('snapshotRegressionTest', 'snapshot names match contact names');
    });

    /**
     * @tc.name   snapshotDiffersOnEmailAndAddress
     * @tc.desc   Email and address each break equality on their own.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotDiffersOnEmailAndAddress', 0, () => {
      const base = createSeedContacts()[1];
      const emailDiff = cloneContact(base);
      emailDiff.email = 'arnold.new@example.com';
      const addressDiff = cloneContact(base);
      addressDiff.address = '上海市长宁区';
      expect(new ContactSnapshot(base).sameAs(new ContactSnapshot(emailDiff))).assertFalse();
      expect(new ContactSnapshot(base).sameAs(new ContactSnapshot(addressDiff))).assertFalse();
      expect(new ContactSnapshot(base).sameAs(new ContactSnapshot(cloneContact(base)))).assertTrue();
      logStep('snapshotRegressionTest', 'email and address break equality');
    });

    /**
     * @tc.name   snapshotDescribeAfterUpdate
     * @tc.desc   The describe string after an update reflects the new phone and keeps the name.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotDescribeAfterUpdate', 0, () => {
      const manager = resetContactManager(createSeedContacts());
      manager.updateContact(contactOf('法里', '11111119999', 'fali.snap@example.com', '吉林省白山市浑江区', '', 'F'));
      const snapshot = snapshotsOf(manager.getContacts())[14];
      expect(snapshot.describe()).assertEqual('法里/11111119999/fali.snap@example.com/吉林省白山市浑江区/F');
      expect(snapshot.name).assertEqual('法里');
      expect(snapshot.describe().split('/').length).assertEqual(5);
      logStep('snapshotRegressionTest', 'describe reflects the update');
    });

    /**
     * @tc.name   snapshotArrayAfterStoreUpdate
     * @tc.desc   The store snapshot array reflects a fan-out update on both duplicate rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('snapshotArrayAfterStoreUpdate', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      const rows = createSeedContacts();
      rows.push(contactOf('贝拉', '11111117777', 'bella.snap.twin@example.com', '湖北省武汉市青山区', '', CATEGORY_B));
      store.batchInsert(true, rows);
      expect(store.updateContact(contactOf('贝拉', '11111112222', 'bella.snap.all@example.com',
        '湖北省武汉市洪山区', '', CATEGORY_B))).assertEqual(2);
      const snapshot = snapshotsOf(store.rows);
      expect(snapshot[2].phone).assertEqual('11111112222');
      expect(snapshot[15].phone).assertEqual('11111112222');
      expect(snapshot[2].describe()).assertEqual(snapshot[15].describe());
      logStep('snapshotRegressionTest', 'store update fans out in the snapshot view');
    });

    /**
     * @tc.name   snapshotLengthTracksEveryMutation
     * @tc.desc   Length goes up, stays, then goes down across one add, edit and delete.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SnapshotRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotLengthTracksEveryMutation', 0, () => {
      const manager = resetContactManager(createSeedContacts());
      const start = snapshotsOf(manager.getContacts()).length;
      manager.addContact(contactOf('闻笛', '13700000101', 'wendi.snap@example.com', '广东省佛山市禅城区', '', CATEGORY_A));
      const afterAdd = snapshotsOf(manager.getContacts()).length;
      manager.updateContact(contactOf('闻笛', '13700000102', 'wendi.snap2@example.com', '广东省佛山市南海区', '', CATEGORY_A));
      const afterEdit = snapshotsOf(manager.getContacts()).length;
      manager.deleteContact(contactOf('闻笛', '', '', '', '', ''));
      const afterDelete = snapshotsOf(manager.getContacts()).length;
      expect(afterAdd - start).assertEqual(1);
      expect(afterEdit).assertEqual(afterAdd);
      expect(start - afterDelete).assertEqual(0);
      expect(afterDelete).assertEqual(15);
      logStep('snapshotRegressionTest', 'length tracks every mutation');
    });
  });
}
