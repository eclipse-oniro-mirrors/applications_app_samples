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
 * ContactCore / ContactEditDraft suite.
 *
 * The edit page hands a draft contact back through RouterParams text 编辑联系人.
 * ContactManager.updateContact then replaces only the first row with the draft
 * name, while the store update writes phone, email and address only. The suite
 * pins drafts as clones, the first-match rule, the ignored avatar/category
 * columns and the parity between manager and store after an edit commit.
 *
 * Source anchors:
 *   OperateRDBInTaskPool.ets:100-109  edit request wiring
 *   ContactManager.ets:55-65          first name match replaced, loop breaks
 *   SharedDriver.ets:606-618          StoreDouble.updateContact writes three columns
 *   SharedDriver.ets:748-761          expectedAfterUpdate oracle
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import { ContactManager } from '../../../../main/ets/pages/model/ContactManager';
import {
  createSeedContacts,
  contactOf,
  cloneContact,
  sameContact,
  contactNames,
  joined,
  sameStringArray,
  countOf,
  uniqueStrings,
  expectedAfterUpdate,
  snapshotsOf,
  sameSnapshotArray,
  ContactValidation,
  ContactMetrics,
  SearchEngine,
  StoreDouble,
  resetContactManager
} from '../Shared/SharedDriver';

export default function contactEditDraftTest(): void {
  describe('ContactEditDraft', () => {
    beforeAll(() => {
      logSuite('ContactEditDraft', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      resetContactManager();
      logSuite('ContactEditDraft', 'end');
    });

    /**
     * @tc.name   draftCloneInitialValuesMatchSource
     * @tc.desc   A draft built with cloneContact starts equal to the stored row but is a new object.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditDraft scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('draftCloneInitialValuesMatchSource', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const stored = manager.getContacts()[6];
      const draft = cloneContact(stored);
      expect(draft === stored).assertFalse();
      expect(sameContact(draft, stored)).assertTrue();
      expect(draft.name).assertEqual('康纳');
      expect(draft.phone).assertEqual('10000000000');
      expect(draft.email).assertEqual('connor@example.com');
      expect(draft.category).assertEqual('C');
      expect(manager.getContacts()[6] === stored).assertTrue();
    });

    /**
     * @tc.name   draftCloneMutationLeavesOriginalUntouched
     * @tc.desc   Editing the draft phone and mailbox does not touch the row still held by the manager.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditDraft scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('draftCloneMutationLeavesOriginalUntouched', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const stored = manager.getContacts()[11];
      const draft = cloneContact(stored);
      draft.phone = '13900000000';
      draft.email = 'draft@example.com';
      expect(draft.phone).assertEqual('13900000000');
      expect(stored.phone).assertEqual('10000000000');
      expect(manager.getContacts()[11].phone).assertEqual('10000000000');
      expect(manager.getContacts()[11].email).assertEqual('connor@example.com');
      expect(sameContact(draft, stored)).assertFalse();
      expect(stored.name).assertEqual('艾拉');
    });

    /**
     * @tc.name   draftCommitReplacesFirstMatch
     * @tc.desc   updateContact replaces the first row with the draft name and copies every draft field.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditDraft scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('draftCommitReplacesFirstMatch', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const draft = contactOf('康纳', '13911112222', 'connor.new@example.com', '天津市河西区', '', 'C');
      manager.updateContact(draft);
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(15);
      expect(loaded[6].phone).assertEqual('13911112222');
      expect(loaded[6].email).assertEqual('connor.new@example.com');
      expect(loaded[6].address).assertEqual('天津市河西区');
      expect(sameContact(loaded[6], draft)).assertTrue();
      expect(loaded[6] === draft).assertTrue();
      logStep('editDraftTest', 'first match replaced by the committed draft');
    });

    /**
     * @tc.name   draftCommitKeepsSecondDuplicateUntouched
     * @tc.desc   With two 本 rows only the first is replaced, so the duplicate keeps its phone.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditDraft scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('draftCommitKeepsSecondDuplicateUntouched', 0, () => {
      const manager = ContactManager.getInstance();
      const rows = createSeedContacts();
      rows.push(contactOf('本', '13922223333', 'ben.copy@example.com', '贵州省贵阳市南明区', '', 'B'));
      manager.setContacts(rows);
      const draft = contactOf('本', '13944445555', 'ben.draft@example.com', '云南省昆明市五华区', '', 'B');
      manager.updateContact(draft);
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(16);
      expect(loaded[3].phone).assertEqual('13944445555');
      expect(loaded[15].phone).assertEqual('13922223333');
      expect(loaded[15].email).assertEqual('ben.copy@example.com');
      expect(sameStringArray(contactNames(loaded), contactNames(rows))).assertTrue();
      expect(countOf(contactNames(loaded), '本')).assertEqual(2);
      expect(sameContact(loaded[15], rows[15])).assertTrue();
    });

    /**
     * @tc.name   draftCommitUnknownNameChangesNothing
     * @tc.desc   Committing a draft whose name is absent replaces nothing and inserts nothing.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditDraft scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('draftCommitUnknownNameChangesNothing', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const before = snapshotsOf(manager.getContacts());
      manager.updateContact(contactOf('林岸', '13800138000', 'lin@example.com', '上海市徐汇区', '', 'C'));
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(15);
      expect(sameSnapshotArray(snapshotsOf(loaded), before)).assertTrue();
      expect(contactNames(loaded).indexOf('林岸')).assertEqual(-1);
      expect(ContactMetrics.from(loaded).total).assertEqual(15);
      expect(SearchEngine.groupByCategory(loaded).length).assertEqual(6);
      expect(loaded[13].name).assertEqual('法比而');
    });

    /**
     * @tc.name   draftRenameDoesNotReplaceOldRow
     * @tc.desc   Renaming through the update path leaves the old row in place because lookup is by name.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditDraft scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('draftRenameDoesNotReplaceOldRow', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.updateContact(contactOf('康纳改', '10000000000', 'connor@example.com', '辽宁省沈阳市沈河区', '', 'C'));
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(15);
      expect(contactNames(loaded).indexOf('康纳')).assertEqual(6);
      expect(contactNames(loaded).indexOf('康纳改')).assertEqual(-1);
      expect(loaded[6].phone).assertEqual('10000000000');
      expect(ContactMetrics.from(loaded).uniqueNames).assertEqual(15);
      expect(sameSnapshotArray(snapshotsOf(loaded), snapshotsOf(createSeedContacts()))).assertTrue();
    });

    /**
     * @tc.name   storeUpdateIgnoresAvatarChange
     * @tc.desc   The store update writes name, phone, email and address only, so the avatar is untouched.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditDraft scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('storeUpdateIgnoresAvatarChange', 0, () => {
      const store = new StoreDouble();
      store.batchInsert(true, createSeedContacts());
      expect(store.rows[0].avatar).assertEqual('');
      store.updateContact(contactOf('艾德里安', '13333333333', 'aidelian@example.com',
        '江苏省南京市鼓楼区', 'app.media.avatar_new', 'A'));
      expect(store.rows[0].avatar).assertEqual('');
      expect(store.rows[0].phone).assertEqual('13333333333');
      expect(store.updateCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(15);
      expect(store.rows[0].name).assertEqual('艾德里安');
    });

    /**
     * @tc.name   storeUpdateIgnoresCategoryChange
     * @tc.desc   A draft category never reaches the store, so the stored label stays the original.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditDraft scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('storeUpdateIgnoresCategoryChange', 0, () => {
      const store = new StoreDouble();
      store.batchInsert(true, createSeedContacts());
      store.updateContact(contactOf('贝拉', '11111111111', 'bella@example.com',
        '湖北省武汉市江汉区', '', 'F'));
      expect(store.rows[2].category).assertEqual('B');
      expect(store.rows[2].category === 'F').assertFalse();
      expect(SearchEngine.countCategory(store.rows, 'B')).assertEqual(3);
      expect(SearchEngine.countCategory(store.rows, 'F')).assertEqual(2);
      expect(store.rows[2].phone).assertEqual('11111111111');
      expect(store.updateCalls).assertEqual(1);
    });

    /**
     * @tc.name   storeUpdateUpdatesPhoneEmailAddress
     * @tc.desc   The three writable columns are replaced together for the matching name.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditDraft scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('storeUpdateUpdatesPhoneEmailAddress', 0, () => {
      const store = new StoreDouble();
      store.batchInsert(true, createSeedContacts());
      store.updateContact(contactOf('卡特琳娜', '13955556666', 'katrina.new@example.com', '西藏自治区拉萨市城关区', '', 'C'));
      const row = store.rows[7];
      expect(row.phone).assertEqual('13955556666');
      expect(row.email).assertEqual('katrina.new@example.com');
      expect(row.address).assertEqual('西藏自治区拉萨市城关区');
      expect(row.name).assertEqual('卡特琳娜');
      expect(row.category).assertEqual('C');
      expect(sameContact(row, contactOf('卡特琳娜', '13955556666', 'katrina.new@example.com',
        '西藏自治区拉萨市城关区', '', 'C'))).assertTrue();
    });

    /**
     * @tc.name   storeUpdateAffectsEveryRowWithSameName
     * @tc.desc   Unlike the manager, the store update loop has no break, so both 本 rows change.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditDraft scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('storeUpdateAffectsEveryRowWithSameName', 0, () => {
      const store = new StoreDouble();
      const rows = createSeedContacts();
      rows.push(contactOf('本', '13922223333', 'ben.copy@example.com', '贵州省贵阳市南明区', '', 'B'));
      store.batchInsert(true, rows);
      const affected = store.updateContact(contactOf('本', '13966667777', 'ben.all@example.com', '甘肃省兰州市城关区', '', 'B'));
      expect(affected).assertEqual(2);
      expect(store.rows[3].phone).assertEqual('13966667777');
      expect(store.rows[15].phone).assertEqual('13966667777');
      expect(store.rows[15].email).assertEqual('ben.all@example.com');
      expect(store.rowCount()).assertEqual(16);
      expect(store.rows[3].address).assertEqual('甘肃省兰州市城关区');
    });

    /**
     * @tc.name   storeUpdateReturnsAffectedCount
     * @tc.desc   The store reports one affected row for a unique name and zero for a missing one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditDraft scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('storeUpdateReturnsAffectedCount', 0, () => {
      const store = new StoreDouble();
      store.batchInsert(true, createSeedContacts());
      const affected = store.updateContact(contactOf('艾登', '13977778888', 'eden.new@example.com', '青海省西宁市城中区', '', 'E'));
      expect(affected).assertEqual(1);
      const missing = store.updateContact(contactOf('林岸', '13800138000', 'lin@example.com', '上海市徐汇区', '', 'C'));
      expect(missing).assertEqual(0);
      expect(store.updateCalls).assertEqual(2);
      expect(store.rowCount()).assertEqual(15);
      expect(store.rows[10].phone).assertEqual('13977778888');
    });

    /**
     * @tc.name   storeUpdateUnknownNameReturnsZero
     * @tc.desc   A missing name leaves every column and every row count unchanged in the store.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditDraft scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('storeUpdateUnknownNameReturnsZero', 0, () => {
      const store = new StoreDouble();
      store.batchInsert(true, createSeedContacts());
      const namesBefore = store.names();
      const affected = store.updateContact(contactOf('林岸', '13800138000', 'lin@example.com', '上海市徐汇区', '', 'C'));
      expect(affected).assertEqual(0);
      expect(sameStringArray(store.names(), namesBefore)).assertTrue();
      expect(store.rows[0].phone).assertEqual('13333333333');
      expect(store.rowCount()).assertEqual(15);
      expect(store.updateCalls).assertEqual(1);
      expect(store.names().indexOf('林岸')).assertEqual(-1);
    });

    /**
     * @tc.name   draftEditFlowRunsStepByStep
     * @tc.desc   A full edit walk reads the row, clones it, edits three fields and commits the draft.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditDraft scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('draftEditFlowRunsStepByStep', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const original = manager.getContacts()[13];
      logStep('editDraftTest', 'open draft for ' + original.name);
      const draft = cloneContact(original);
      draft.phone = '13988889999';
      draft.address = '新疆维吾尔自治区乌鲁木齐市天山区';
      draft.email = 'fabier.new@example.com';
      expect(sameContact(draft, original)).assertFalse();
      expect(manager.getContacts()[13].phone).assertEqual('10000000000');
      manager.updateContact(draft);
      const committed = manager.getContacts()[13];
      expect(committed.phone).assertEqual('13988889999');
      expect(committed.email).assertEqual('fabier.new@example.com');
      expect(committed.address).assertEqual('新疆维吾尔自治区乌鲁木齐市天山区');
      expect(committed.name).assertEqual('法比而');
      expect(committed.category).assertEqual('F');
    });

    /**
     * @tc.name   draftDiscardKeepsSnapshotsIdentical
     * @tc.desc   Editing a clone and never committing leaves every stored snapshot unchanged.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditDraft scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('draftDiscardKeepsSnapshotsIdentical', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const before = snapshotsOf(manager.getContacts());
      const draft = cloneContact(manager.getContacts()[9]);
      draft.name = '弃用草稿';
      draft.phone = '13900000000';
      expect(draft.name).assertEqual('弃用草稿');
      expect(sameSnapshotArray(snapshotsOf(manager.getContacts()), before)).assertTrue();
      expect(sameStringArray(contactNames(manager.getContacts()), contactNames(createSeedContacts()))).assertTrue();
      expect(manager.getContacts()[9].name).assertEqual('戴维维');
      expect(ContactMetrics.from(manager.getContacts()).total).assertEqual(15);
    });

    /**
     * @tc.name   draftCommitStoresSameObjectReference
     * @tc.desc   The manager keeps the committed object itself, so a later draft edit shows up on read.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditDraft scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('draftCommitStoresSameObjectReference', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const draft = contactOf('丹尼尔', '13900001111', 'daniel.new@example.com', '宁夏回族自治区银川市兴庆区', '', 'D');
      manager.updateContact(draft);
      expect(manager.getContacts()[8] === draft).assertTrue();
      draft.phone = '13900002222';
      expect(manager.getContacts()[8].phone).assertEqual('13900002222');
      expect(sameContact(manager.getContacts()[8], draft)).assertTrue();
      expect(manager.getContacts().length).assertEqual(15);
      expect(contactNames(manager.getContacts())[8]).assertEqual('丹尼尔');
    });

    /**
     * @tc.name   draftUpdateThenReadBackPhone
     * @tc.desc   A phone edit committed to the manager is visible on the very next read.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditDraft scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('draftUpdateThenReadBackPhone', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      expect(manager.getContacts()[2].phone).assertEqual('11111111111');
      manager.updateContact(contactOf('贝拉', '13912345678', 'bella@example.com', '湖北省武汉市江汉区', '', 'B'));
      expect(manager.getContacts()[2].phone).assertEqual('13912345678');
      expect(manager.getContacts()[2].email).assertEqual('bella@example.com');
      expect(manager.getContacts()[2].category).assertEqual('B');
      expect(manager.getContacts()[2].name).assertEqual('贝拉');
      expect(SearchEngine.filterByName(manager.getContacts(), '贝拉').length).assertEqual(1);
    });

    /**
     * @tc.name   draftTwoSequentialUpdatesKeepLastValue
     * @tc.desc   Two commits for the same name leave only the second phone in place.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditDraft scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('draftTwoSequentialUpdatesKeepLastValue', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.updateContact(contactOf('阿诺德', '13900003333', 'arnold.first@example.com', '上海市浦东新区', '', 'A'));
      expect(manager.getContacts()[1].phone).assertEqual('13900003333');
      manager.updateContact(contactOf('阿诺德', '13900004444', 'arnold.second@example.com', '上海市浦东新区', '', 'A'));
      const loaded = manager.getContacts();
      expect(loaded[1].phone).assertEqual('13900004444');
      expect(loaded[1].email).assertEqual('arnold.second@example.com');
      expect(loaded.length).assertEqual(15);
      expect(countOf(contactNames(loaded), '阿诺德')).assertEqual(1);
      expect(loaded[1].category).assertEqual('A');
      expect(contactNames(loaded)[2]).assertEqual('贝拉');
    });

    /**
     * @tc.name   draftUpdateOfEmptyNameRow
     * @tc.desc   A stored default row has an empty name, so an empty-name draft replaces it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditDraft scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('draftUpdateOfEmptyNameRow', 0, () => {
      const manager = ContactManager.getInstance();
      const rows = createSeedContacts();
      rows.push(new Contact());
      manager.setContacts(rows);
      expect(manager.getContacts()[15].name).assertEqual('');
      const draft = contactOf('', '13900005555', 'blank@example.com', '北京市朝阳区', '', '');
      manager.updateContact(draft);
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(16);
      expect(loaded[15].phone).assertEqual('13900005555');
      expect(loaded[15].email).assertEqual('blank@example.com');
      expect(loaded[15].name).assertEqual('');
      expect(sameContact(loaded[15], draft)).assertTrue();
      expect(loaded[14].name).assertEqual('法里');
    });

    /**
     * @tc.name   draftEditPreservesOtherRowSnapshots
     * @tc.desc   Committing one draft leaves the other fourteen snapshots byte for byte identical.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditDraft scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('draftEditPreservesOtherRowSnapshots', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const before = snapshotsOf(manager.getContacts());
      manager.updateContact(contactOf('康纳', '13900006666', 'connor.edit@example.com', '内蒙古自治区呼和浩特市新城区', '', 'C'));
      const after = snapshotsOf(manager.getContacts());
      expect(before[6].sameAs(after[6])).assertFalse();
      let unchanged = 0;
      for (let index = 0; index < after.length; index++) {
        if (index !== 6 && before[index].sameAs(after[index])) {
          unchanged = unchanged + 1;
        }
      }
      expect(unchanged).assertEqual(14);
      expect(after[5].describe()).assertEqual(before[5].describe());
      expect(after[7].describe()).assertEqual(before[7].describe());
      expect(after.length).assertEqual(before.length);
    });

    /**
     * @tc.name   draftValidationBlocksDuplicateName
     * @tc.desc   An edit draft that keeps an existing name fails the duplicate check before commit.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditDraft scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('draftValidationBlocksDuplicateName', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const draft = contactOf('贝拉', '13900007777', 'bella.edit@example.com', '湖北省武汉市江汉区', '', 'B');
      const errors = ContactValidation.validate(draft, manager.getContacts());
      expect(errors.indexOf('name-duplicate') >= 0).assertTrue();
      expect(ContactValidation.canSubmit(draft, manager.getContacts())).assertFalse();
      expect(ContactValidation.isDuplicateName(manager.getContacts(), draft.name)).assertTrue();
      expect(ContactValidation.validate(draft).length).assertEqual(0);
      expect(ContactValidation.canSubmit(draft)).assertTrue();
      expect(manager.getContacts()[2].phone).assertEqual('11111111111');
      logStep('editDraftTest', 'duplicate name blocked by validation');
    });

    /**
     * @tc.name   draftManagerAndStoreParityAfterEdit
     * @tc.desc   One draft committed to both layers leaves the same phone, mailbox and row count.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditDraft scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('draftManagerAndStoreParityAfterEdit', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      const store = new StoreDouble();
      store.batchInsert(true, seed);
      const draft = contactOf('艾里', '13900008888', 'eli.edit@example.com', '江西省南昌市东湖区', '', 'E');
      manager.updateContact(draft);
      store.updateContact(draft);
      expect(manager.getContacts()[12].phone).assertEqual('13900008888');
      expect(store.rows[12].phone).assertEqual('13900008888');
      expect(store.rows[12].email).assertEqual('eli.edit@example.com');
      expect(sameStringArray(contactNames(manager.getContacts()), store.names())).assertTrue();
      expect(store.rowCount()).assertEqual(manager.getContacts().length);
      expect(store.rows[12].category).assertEqual('E');
      expect(store.updateCalls).assertEqual(1);
    });

    /**
     * @tc.name   draftEditDropsOldAvatarOnReplace
     * @tc.desc   The manager stores the draft object, so a committed blank avatar replaces a stored one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditDraft scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('draftEditDropsOldAvatarOnReplace', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      seed[0].avatar = 'app.media.avatar_adrian';
      manager.setContacts(seed);
      expect(manager.getContacts()[0].avatar).assertEqual('app.media.avatar_adrian');
      const draft = contactOf('艾德里安', '13333333333', 'aidelian@example.com', '江苏省南京市鼓楼区', '', 'A');
      manager.updateContact(draft);
      expect(manager.getContacts()[0].avatar).assertEqual('');
      expect(sameContact(manager.getContacts()[0], draft)).assertTrue();
      expect(manager.getContacts()[0].phone).assertEqual('13333333333');
      expect(manager.getContacts().length).assertEqual(15);
    });

    /**
     * @tc.name   draftMultiFieldEditKeepsNameAndPosition
     * @tc.desc   Editing four fields at once keeps the name in slot four and does not move the row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditDraft scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('draftMultiFieldEditKeepsNameAndPosition', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const draft = contactOf('本杰明', '13900009999', 'benj.edit@example.com', '湖南省长沙市岳麓区', '', 'B');
      manager.updateContact(draft);
      const loaded = manager.getContacts();
      expect(loaded[4].name).assertEqual('本杰明');
      expect(loaded[4].phone).assertEqual('13900009999');
      expect(loaded[4].email).assertEqual('benj.edit@example.com');
      expect(loaded[4].address).assertEqual('湖南省长沙市岳麓区');
      expect(loaded[3].name).assertEqual('本');
      expect(loaded[5].name).assertEqual('卡梅隆');
      expect(contactNames(loaded).indexOf('本杰明')).assertEqual(4);
    });

    /**
     * @tc.name   draftEditDoesNotReorderList
     * @tc.desc   A commit never re-sorts the directory; the full name order equals the oracle order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditDraft scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('draftEditDoesNotReorderList', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      const draft = contactOf('阿诺德', '13900001234', 'arnold.edit@example.com', '上海市浦东新区', '', 'A');
      manager.updateContact(draft);
      const loaded = manager.getContacts();
      expect(sameStringArray(contactNames(loaded), contactNames(seed))).assertTrue();
      expect(sameStringArray(contactNames(loaded), contactNames(expectedAfterUpdate(seed, draft)))).assertTrue();
      expect(loaded[0].name).assertEqual('艾德里安');
      expect(loaded[1].phone).assertEqual('13900001234');
      expect(loaded[14].name).assertEqual('法里');
      expect(uniqueStrings(contactNames(loaded)).length).assertEqual(15);
    });

    /**
     * @tc.name   draftCommitCountUnchanged
     * @tc.desc   An update never adds or removes rows, so the manager and store counts stay fifteen.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditDraft scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('draftCommitCountUnchanged', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const store = new StoreDouble();
      store.batchInsert(true, createSeedContacts());
      manager.updateContact(contactOf('法里', '13900002468', 'fali.edit@example.com', '广东省深圳市南山区', '', 'F'));
      store.updateContact(contactOf('法里', '13900002468', 'fali.edit@example.com', '广东省深圳市南山区', '', 'F'));
      expect(manager.getContacts().length).assertEqual(15);
      expect(store.rowCount()).assertEqual(15);
      expect(ContactMetrics.from(manager.getContacts()).total).assertEqual(15);
      expect(store.names()[14]).assertEqual('法里');
      expect(manager.getContacts()[14].phone).assertEqual('13900002468');
      expect(store.rows[14].phone).assertEqual('13900002468');
    });

    /**
     * @tc.name   draftRepeatedSameEditIsIdempotent
     * @tc.desc   Committing the identical draft twice produces the same snapshots as committing once.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditDraft scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('draftRepeatedSameEditIsIdempotent', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const draft = contactOf('戴维维', '13900001357', 'david.edit@example.com', '湖北省宜昌市西陵区', '', 'D');
      manager.updateContact(draft);
      const once = snapshotsOf(manager.getContacts());
      manager.updateContact(draft);
      const twice = snapshotsOf(manager.getContacts());
      expect(sameSnapshotArray(once, twice)).assertTrue();
      expect(manager.getContacts().length).assertEqual(15);
      expect(manager.getContacts()[9].phone).assertEqual('13900001357');
      expect(countOf(contactNames(manager.getContacts()), '戴维维')).assertEqual(1);
      expect(ContactMetrics.from(manager.getContacts()).duplicateNames).assertEqual(0);
    });

    /**
     * @tc.name   draftManagerFirstOnlyVersusStoreAll
     * @tc.desc   With duplicated names the manager edits the first row and the store edits both.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditDraft scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('draftManagerFirstOnlyVersusStoreAll', 0, () => {
      const manager = ContactManager.getInstance();
      const rows = [
        contactOf('本', '12222222222', 'ben@example.com', '四川省成都市锦江区', '', 'B'),
        contactOf('本', '13900001414', 'ben.copy@example.com', '四川省绵阳市涪城区', '', 'B')
      ];
      manager.setContacts(rows);
      const store = new StoreDouble();
      store.batchInsert(true, rows);
      const draft = contactOf('本', '13900001515', 'ben.edit@example.com', '四川省德阳市旌阳区', '', 'B');
      manager.updateContact(draft);
      const affected = store.updateContact(draft);
      expect(manager.getContacts()[0].phone).assertEqual('13900001515');
      expect(manager.getContacts()[1].phone).assertEqual('13900001414');
      expect(affected).assertEqual(2);
      expect(store.rows[1].phone).assertEqual('13900001515');
      expect(store.rows[1].email).assertEqual('ben.edit@example.com');
      expect(manager.getContacts().length).assertEqual(store.rowCount());
    });

    /**
     * @tc.name   draftValidationRejectsEmptyDraft
     * @tc.desc   A blank draft fails four required-field checks before any commit is attempted.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditDraft scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('draftValidationRejectsEmptyDraft', 0, () => {
      const draft = new Contact();
      const errors = ContactValidation.validate(draft);
      expect(errors.length).assertEqual(4);
      expect(errors.indexOf('name-empty') >= 0).assertTrue();
      expect(errors.indexOf('phone-empty') >= 0).assertTrue();
      expect(errors.indexOf('email-empty') >= 0).assertTrue();
      expect(errors.indexOf('address-empty') >= 0).assertTrue();
      expect(ContactValidation.canSubmit(draft)).assertFalse();
      expect(joined(errors, ',')).assertEqual('name-empty,phone-empty,email-empty,address-empty');
    });

    /**
     * @tc.name   draftValidationAcceptsCompleteDraft
     * @tc.desc   A complete new draft passes validation when it is checked against the catalog names.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditDraft scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('draftValidationAcceptsCompleteDraft', 0, () => {
      const draft = contactOf('林岸', '13800138000', 'lin@example.com', '上海市徐汇区', '', 'C');
      expect(draft.avatar).assertEqual('');
      expect(draft.category).assertEqual('C');
      expect(ContactValidation.validate(draft).length).assertEqual(0);
      expect(ContactValidation.validate(draft, createSeedContacts()).length).assertEqual(0);
      expect(ContactValidation.canSubmit(draft, createSeedContacts())).assertTrue();
      expect(ContactValidation.isDuplicateName(createSeedContacts(), draft.name)).assertFalse();
      expect(draft.name.length).assertEqual(2);
    });

    /**
     * @tc.name   commitThenDeleteRemovesEditedRow
     * @tc.desc   The committed name is still the delete key, so the edited row can be removed afterwards.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditDraft scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('commitThenDeleteRemovesEditedRow', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.updateContact(contactOf('艾拉', '13900001616', 'ella.edit@example.com', '江苏省无锡市梁溪区', '', 'E'));
      expect(manager.getContacts()[11].phone).assertEqual('13900001616');
      manager.deleteContact(contactOf('艾拉', '', '', '', '', ''));
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(14);
      expect(contactNames(loaded).indexOf('艾拉')).assertEqual(-1);
      expect(SearchEngine.countCategory(loaded, 'E')).assertEqual(2);
      expect(loaded[10].name).assertEqual('艾登');
      expect(loaded[11].name).assertEqual('艾里');
    });

    /**
     * @tc.name   editSequenceAcrossThreeRows
     * @tc.desc   Three commits in a row each touch only their own name and keep the catalog order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditDraft scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('editSequenceAcrossThreeRows', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.updateContact(contactOf('艾德里安', '13900001717', 'adrian.edit@example.com', '江苏省南京市玄武区', '', 'A'));
      manager.updateContact(contactOf('康纳', '13900001818', 'connor.edit@example.com', '辽宁省大连市中山区', '', 'C'));
      manager.updateContact(contactOf('法比而', '13900001919', 'fabier.edit@example.com', '辽宁省鞍山市铁东区', '', 'F'));
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(15);
      expect(loaded[0].email).assertEqual('adrian.edit@example.com');
      expect(loaded[6].email).assertEqual('connor.edit@example.com');
      expect(loaded[13].email).assertEqual('fabier.edit@example.com');
      expect(joined(contactNames(loaded).slice(0, 3), '>')).assertEqual('艾德里安>阿诺德>贝拉');
      expect(ContactMetrics.from(loaded).uniqueNames).assertEqual(15);
      expect(SearchEngine.countCategory(loaded, 'C')).assertEqual(3);
    });

    /**
     * @tc.name   commitUnchangedCloneKeepsSnapshots
     * @tc.desc   Committing an untouched clone is a no-op for every snapshot in the catalog.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditDraft scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('commitUnchangedCloneKeepsSnapshots', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const before = snapshotsOf(manager.getContacts());
      const draft = cloneContact(manager.getContacts()[5]);
      manager.updateContact(draft);
      expect(sameSnapshotArray(snapshotsOf(manager.getContacts()), before)).assertTrue();
      expect(manager.getContacts().length).assertEqual(15);
      expect(manager.getContacts()[5] === draft).assertTrue();
      expect(sameContact(manager.getContacts()[5], createSeedContacts()[5])).assertTrue();
      expect(ContactMetrics.from(manager.getContacts()).fingerprint())
        .assertEqual(ContactMetrics.from(createSeedContacts()).fingerprint());
    });

    /**
     * @tc.name   draftMissedStoreUpdateThenMatchingQueryReadsBack
     * @tc.desc   A missing name leaves the store row intact, then a matching update is visible to query.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditDraft scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('draftMissedStoreUpdateThenMatchingQueryReadsBack', 0, () => {
      const store = new StoreDouble();
      store.batchInsert(true, createSeedContacts());
      store.updateContact(contactOf('陶德', '13900002020', 'todd@example.com', '山东省青岛市市南区', '', 'D'));
      expect(store.updateCalls).assertEqual(1);
      const rows = store.query(true);
      expect(rows.length).assertEqual(15);
      expect(rows[8].phone).assertEqual('17777777777');
      expect(rows[8].email).assertEqual('cameron@example.com');
      store.updateContact(contactOf('丹尼尔', '13900002020', 'todd@example.com', '山东省青岛市市南区', '', 'D'));
      const edited = store.query(true);
      expect(edited[8].phone).assertEqual('13900002020');
      expect(edited[8].email).assertEqual('todd@example.com');
      expect(store.queryCalls).assertEqual(2);
    });

    /**
     * @tc.name   draftCommitKeepsMetricsWhenDigitCountStable
     * @tc.desc   A same-length phone edit changes no metric counter, so the fingerprint is unchanged.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditDraft scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('draftCommitKeepsMetricsWhenDigitCountStable', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const before = ContactMetrics.from(manager.getContacts());
      manager.updateContact(contactOf('艾登', '13900002121', 'eden.edit@example.com', '陕西省西安市碑林区', '', 'E'));
      const after = ContactMetrics.from(manager.getContacts());
      expect(after.total).assertEqual(before.total);
      expect(after.uniqueNames).assertEqual(before.uniqueNames);
      expect(after.categories).assertEqual(before.categories);
      expect(after.totalPhoneDigits).assertEqual(before.totalPhoneDigits);
      expect(after.fingerprint()).assertEqual(before.fingerprint());
      expect(manager.getContacts()[10].phone).assertEqual('13900002121');
      expect(before.totalPhoneDigits).assertEqual(165);
    });

    /**
     * @tc.name   draftManagerUpdateLeavesStoreUntouched
     * @tc.desc   Committing only to the manager does not change the independent store rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditDraft scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('draftManagerUpdateLeavesStoreUntouched', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const seed = createSeedContacts();
      const store = new StoreDouble();
      store.batchInsert(true, seed);
      const draft = contactOf('戴维维', '13900002222', 'david.edit@example.com', '湖北省襄阳市襄城区', '', 'D');
      manager.updateContact(draft);
      expect(manager.getContacts()[9].phone).assertEqual('13900002222');
      expect(store.rows[9].phone).assertEqual('11111111111');
      expect(store.updateCalls).assertEqual(0);
      expect(store.rowCount()).assertEqual(15);
      expect(store.names()[9]).assertEqual('戴维维');
      expect(manager.getContacts()[9].phone === store.rows[9].phone).assertFalse();
    });
    /**
     * @tc.name   draftAddressOnlyEditKeepsPhoneAndEmail
     * @tc.desc   Changing only the address still writes the draft phone and mailbox values to the manager.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditDraft scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('draftAddressOnlyEditKeepsPhoneAndEmail', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const stored = manager.getContacts()[1];
      const draft = cloneContact(stored);
      draft.address = '海南省三亚市吉阳区';
      manager.updateContact(draft);
      const loaded = manager.getContacts();
      expect(loaded[1].address).assertEqual('海南省三亚市吉阳区');
      expect(loaded[1].phone).assertEqual('16666666666');
      expect(loaded[1].email).assertEqual('arnold@example.com');
      expect(loaded[1].name).assertEqual('阿诺德');
      expect(loaded[1].category).assertEqual('A');
      expect(sameContact(loaded[1], draft)).assertTrue();
      expect(loaded.length).assertEqual(15);
    });

    /**
     * @tc.name   draftStoreUpdateKeepsOtherRowsIntact
     * @tc.desc   A store update for 法比而 leaves the other fourteen rows byte for byte unchanged.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditDraft scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('draftStoreUpdateKeepsOtherRowsIntact', 0, () => {
      const store = new StoreDouble();
      const seed = createSeedContacts();
      store.batchInsert(true, seed);
      const before = snapshotsOf(store.rows);
      store.updateContact(contactOf('法比而', '13900002525', 'fabier.edit@example.com',
        '黑龙江省哈尔滨市南岗区', '', 'F'));
      const after = snapshotsOf(store.rows);
      let untouched = 0;
      for (let index = 0; index < after.length; index++) {
        if (index !== 13 && before[index].sameAs(after[index])) {
          untouched = untouched + 1;
        }
      }
      expect(untouched).assertEqual(14);
      expect(before[13].sameAs(after[13])).assertFalse();
      expect(store.rows[13].phone).assertEqual('13900002525');
      expect(store.rowCount()).assertEqual(15);
      expect(store.updateCalls).assertEqual(1);
    });
  });
}
