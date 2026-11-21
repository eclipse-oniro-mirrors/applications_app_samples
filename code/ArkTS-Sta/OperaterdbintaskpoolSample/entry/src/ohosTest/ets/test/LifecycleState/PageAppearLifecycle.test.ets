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
 * PageAppearLifecycle mirrors OperateRDBInTaskPool.aboutToAppear:
 *
 *   OperateRDBInTaskPool.ets:47     private static isInitialized flag
 *   OperateRDBInTaskPool.ets:53-69  the fifteen row seed payload and its order
 *   OperateRDBInTaskPool.ets:74-80  seed, cache and reload guarded by the flag
 *   OperateRDBInTaskPool.ets:81-121 router params dispatch for add/edit/delete
 *   OperateRDBInTaskPool.ets:124-139 batch insert followed by a verification query
 *   ContactManager.ets:46-70        setContacts, addContact, updateContact, deleteContact
 *
 * SeedFlag is a shared object because the production flag is static: two page
 * instances therefore observe one initialization decision, exactly like the
 * struct does across navigations.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import { ContactManager } from '../../../../main/ets/pages/model/ContactManager';
import {
  StoreDouble,
  RouteIntent,
  ACTION_ADD,
  ACTION_EDIT,
  ACTION_DELETE,
  ROUTE_EDIT,
  ROUTE_LIST,
  CONFLICT_REPLACE,
  CATEGORIES,
  createSeedContacts,
  contactOf,
  cloneContact,
  contactNames,
  countOf,
  joined,
  sameStringArray,
  resetContactManager,
  expectedAfterAdd,
  expectedAfterDelete,
  SearchEngine,
  OperationCatalog
} from '../Shared/SharedDriver';

/** The static isInitialized field of the page struct, modelled as a shared box. */
class SeedFlag {
  public value: boolean = false;

  public set(): void {
    this.value = true;
  }

  public clear(): void {
    this.value = false;
  }
}

/**
 * One instance of the list page. appear() walks the same steps as aboutToAppear
 * and keeps the observable counters the suite asserts on.
 */
class AppearPage {
  public flag: SeedFlag;
  public manager: ContactManager;
  public store: StoreDouble;
  public contextValid: boolean;
  public appearCount: number = 0;
  public seedRuns: number = 0;
  public seedInserted: number = 0;
  public dispatchCount: number = 0;
  public dataArray: Contact[] = [];
  public lastAction: string = '';

  constructor(flag: SeedFlag, manager: ContactManager, store: StoreDouble, contextValid: boolean) {
    this.flag = flag;
    this.manager = manager;
    this.store = store;
    this.contextValid = contextValid;
  }

  /** aboutToAppear body without the router lookup and the setTimeout wrapper. */
  public appear(intent: RouteIntent): void {
    this.appearCount = this.appearCount + 1;
    if (!this.flag.value) {
      const seed: Contact[] = createSeedContacts();
      this.seedInserted = this.store.batchInsert(this.contextValid, seed);
      this.manager.setContacts(seed);
      this.flag.set();
      this.seedRuns = this.seedRuns + 1;
    }
    this.dataArray = this.manager.getContacts();
    this.lastAction = intent.action;
    if (intent.action.length > 0 && RouteIntent.isKnownAction(intent.action)) {
      this.dispatch(intent);
      this.dataArray = this.manager.getContacts();
      this.dispatchCount = this.dispatchCount + 1;
    }
  }

  /** Routes one resolved router param to the matching taskpool wrapper. */
  public dispatch(intent: RouteIntent): void {
    const contact: Contact = cloneContact(intent.contact);
    if (intent.action === ACTION_ADD) {
      this.store.insert(this.contextValid, contact, CONFLICT_REPLACE);
      this.manager.addContact(contact);
      return;
    }
    if (intent.action === ACTION_EDIT) {
      this.store.updateContact(contact);
      this.manager.updateContact(contact);
      return;
    }
    if (intent.action === ACTION_DELETE) {
      this.store.deleteByName(contact.name);
      this.manager.deleteContact(contact);
    }
  }

  public noIntent(): RouteIntent {
    return new RouteIntent('', new Contact());
  }

  public names(): string[] {
    return contactNames(this.dataArray);
  }

  public cachedCount(): number {
    return this.manager.getContacts().length;
  }

  public storedCount(): number {
    return this.store.rowCount();
  }
}

/** Convenience constructor for one page over a fresh store and manager. */
function newPage(flag: SeedFlag): AppearPage {
  const manager: ContactManager = resetContactManager();
  const store: StoreDouble = new StoreDouble();
  return new AppearPage(flag, manager, store, true);
}

export default function pageAppearLifecycleTest(): void {
  describe('PageAppearLifecycle', () => {
    let flag: SeedFlag = new SeedFlag();
    let manager: ContactManager = resetContactManager();
    let store: StoreDouble = new StoreDouble();
    let page: AppearPage = new AppearPage(flag, manager, store, true);

    beforeAll(() => {
      logSuite('PageAppearLifecycle', 'begin');
    });

    beforeEach(async () => {
      manager = resetContactManager();
      store = new StoreDouble();
      flag = new SeedFlag();
      page = new AppearPage(flag, manager, store, true);
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });

    afterAll(() => {
      resetContactManager();
      logSuite('PageAppearLifecycle', 'end');
    });

    /**
     * @tc.name   firstAppearSeedsManagerWithFifteenRows
     * @tc.desc   The first appearance copies the fifteen payload rows into the ContactManager cache.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PageAppearLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('firstAppearSeedsManagerWithFifteenRows', 0, () => {
      page.appear(page.noIntent());
      logStep('seed-manager', 'count=' + String(page.cachedCount()));
      expect(page.cachedCount()).assertEqual(15);
      expect(page.dataArray.length).assertEqual(15);
      expect(page.dataArray[0].name).assertEqual('艾德里安');
      expect(page.seedRuns).assertEqual(1);
      expect(page.appearCount).assertEqual(1);
    });

    /**
     * @tc.name   firstAppearBatchInsertsSeedOnce
     * @tc.desc   The same payload reaches the store through exactly one batch insert call.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PageAppearLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('firstAppearBatchInsertsSeedOnce', 0, () => {
      page.appear(page.noIntent());
      logStep('seed-store', 'rows=' + String(page.storedCount()));
      expect(page.storedCount()).assertEqual(15);
      expect(page.seedInserted).assertEqual(15);
      expect(store.batchCalls).assertEqual(1);
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
    });

    /**
     * @tc.name   firstAppearSetsStaticFlag
     * @tc.desc   The shared isInitialized box flips to true only after the seed completes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PageAppearLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('firstAppearSetsStaticFlag', 0, () => {
      const before: boolean = flag.value;
      page.appear(page.noIntent());
      logStep('seed-flag', String(before) + '->' + String(flag.value));
      expect(before).assertFalse();
      expect(flag.value).assertTrue();
      expect(page.seedRuns).assertEqual(1);
      expect(store.initialized).assertTrue();
      expect(page.dispatchCount).assertEqual(0);
    });

    /**
     * @tc.name   secondAppearSkipsSeedWork
     * @tc.desc   A second appearance must not insert the payload again nor create a second table.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PageAppearLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('secondAppearSkipsSeedWork', 0, () => {
      page.appear(page.noIntent());
      const rowsAfterFirst: number = page.storedCount();
      page.appear(page.noIntent());
      logStep('second-appear', String(rowsAfterFirst) + '->' + String(page.storedCount()));
      expect(page.appearCount).assertEqual(2);
      expect(page.seedRuns).assertEqual(1);
      expect(page.storedCount()).assertEqual(rowsAfterFirst);
      expect(page.storedCount()).assertEqual(15);
      expect(store.batchCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
    });

    /**
     * @tc.name   appearCountIncrementsEveryCall
     * @tc.desc   aboutToAppear runs on every navigation while the seed guard only runs once.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PageAppearLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('appearCountIncrementsEveryCall', 0, () => {
      page.appear(page.noIntent());
      page.appear(page.noIntent());
      page.appear(page.noIntent());
      page.appear(page.noIntent());
      logStep('appear-count', String(page.appearCount) + '/' + String(page.seedRuns));
      expect(page.appearCount).assertEqual(4);
      expect(page.seedRuns).assertEqual(1);
      expect(page.storedCount()).assertEqual(15);
      expect(page.cachedCount()).assertEqual(15);
      expect(store.batchCalls).assertEqual(1);
    });

    /**
     * @tc.name   threeAppearsKeepSeedRunsAtOne
     * @tc.desc   Repeated navigation never duplicates the seeded rows in the store or the cache.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PageAppearLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('threeAppearsKeepSeedRunsAtOne', 0, () => {
      page.appear(page.noIntent());
      page.appear(page.noIntent());
      page.appear(page.noIntent());
      const names: string[] = page.names();
      logStep('no-duplicates', String(names.length) + ' unique=' + String(countOf(names, '艾德里安')));
      expect(names.length).assertEqual(15);
      expect(countOf(names, '艾德里安')).assertEqual(1);
      expect(countOf(names, '阿诺德')).assertEqual(1);
      expect(store.rowCount()).assertEqual(15);
      expect(store.batchCalls).assertEqual(1);
      expect(flag.value).assertTrue();
    });

    /**
     * @tc.name   secondAppearReloadsDataArrayFromManager
     * @tc.desc   Each appearance republishes the manager list into the page state array.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PageAppearLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('secondAppearReloadsDataArrayFromManager', 0, () => {
      page.appear(page.noIntent());
      page.manager.addContact(contactOf('林岸', '13800138000', 'lin@example.com', '上海市徐汇区', '', 'A'));
      page.dataArray = [];
      page.appear(page.noIntent());
      logStep('reload', String(page.dataArray.length));
      expect(page.dataArray.length).assertEqual(16);
      expect(page.dataArray[15].name).assertEqual('林岸');
      expect(page.cachedCount()).assertEqual(16);
      expect(page.storedCount()).assertEqual(15);
      expect(page.seedRuns).assertEqual(1);
    });

    /**
     * @tc.name   addIntentAppendsManagerRow
     * @tc.desc   The resolved 新增联系人 router param appends one row to the cached manager list.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PageAppearLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('addIntentAppendsManagerRow', 0, () => {
      const added: Contact = contactOf('林岸', '13800138000', 'lin@example.com', '上海市徐汇区', '', 'A');
      page.appear(new RouteIntent(ACTION_ADD, added));
      logStep('add-manager', 'count=' + String(page.cachedCount()));
      expect(page.cachedCount()).assertEqual(16);
      expect(page.dataArray[15].name).assertEqual('林岸');
      expect(page.dispatchCount).assertEqual(1);
      expect(page.seedRuns).assertEqual(1);
      expect(sameStringArray(contactNames(page.manager.getContacts()),
        contactNames(expectedAfterAdd(createSeedContacts(), added)))).assertTrue();
    });

    /**
     * @tc.name   addIntentInsertsStoreRow
     * @tc.desc   A new contact is also inserted into the store, bringing its row count to sixteen.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PageAppearLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('addIntentInsertsStoreRow', 0, () => {
      const added: Contact = contactOf('林岸', '13800138000', 'lin@example.com', '上海市徐汇区', '', 'B');
      page.appear(new RouteIntent(ACTION_ADD, added));
      const stored: Contact = store.rows[15];
      logStep('add-store', stored.name + '/' + stored.category);
      expect(page.storedCount()).assertEqual(16);
      expect(stored.name).assertEqual('林岸');
      expect(stored.phone).assertEqual('13800138000');
      expect(stored.category).assertEqual('B');
      expect(store.insertCalls).assertEqual(1);
      expect(store.batchCalls).assertEqual(1);
    });

    /**
     * @tc.name   addIntentUpdatesDataArrayTail
     * @tc.desc   The page state array is republished after the insert, so the tail is the new row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PageAppearLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addIntentUpdatesDataArrayTail', 0, () => {
      const added: Contact = contactOf('闻笛', '13911112222', 'wendi@example.com', '浙江省杭州市西湖区', '', 'C');
      page.appear(page.noIntent());
      expect(page.dataArray.length).assertEqual(15);
      page.appear(new RouteIntent(ACTION_ADD, added));
      logStep('add-tail', page.dataArray[page.dataArray.length - 1].name);
      expect(page.dataArray.length).assertEqual(16);
      expect(page.dataArray[15].name).assertEqual('闻笛');
      expect(page.dataArray[15].email).assertEqual('wendi@example.com');
      expect(page.dataArray[0].name).assertEqual('艾德里安');
      expect(page.names().length).assertEqual(page.cachedCount());
    });

    /**
     * @tc.name   editIntentReplacesCachedRowOnly
     * @tc.desc   Editing rewrites the first cached name match and leaves the other fourteen rows alone.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PageAppearLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('editIntentReplacesCachedRowOnly', 0, () => {
      const edited: Contact = contactOf('贝拉', '13300003333', 'bella.new@example.com', '湖北省武汉市江汉区', '', 'B');
      page.appear(new RouteIntent(ACTION_EDIT, edited));
      const cached: Contact[] = page.manager.getContacts();
      logStep('edit-manager', cached[2].phone);
      expect(cached.length).assertEqual(15);
      expect(cached[2].name).assertEqual('贝拉');
      expect(cached[2].phone).assertEqual('13300003333');
      expect(cached[2].email).assertEqual('bella.new@example.com');
      expect(cached[1].phone).assertEqual('16666666666');
      expect(page.dispatchCount).assertEqual(1);
    });

    /**
     * @tc.name   editIntentUpdatesStorePhone
     * @tc.desc   The store statement rewrites phone, email and address for the edited name.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PageAppearLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('editIntentUpdatesStorePhone', 0, () => {
      const edited: Contact = contactOf('本', '14400004444', 'ben.new@example.com', '四川省成都市武侯区', '', 'B');
      page.appear(new RouteIntent(ACTION_EDIT, edited));
      const stored: Contact = store.rows[3];
      logStep('edit-store', stored.phone + '/' + stored.address);
      expect(stored.phone).assertEqual('14400004444');
      expect(stored.email).assertEqual('ben.new@example.com');
      expect(stored.address).assertEqual('四川省成都市武侯区');
      expect(store.updateCalls).assertEqual(1);
      expect(page.storedCount()).assertEqual(15);
    });

    /**
     * @tc.name   editIntentKeepsRowCount
     * @tc.desc   An edit is never an insert or a delete, so both counts remain fifteen.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PageAppearLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('editIntentKeepsRowCount', 0, () => {
      const edited: Contact = contactOf('卡梅隆', '17700005555', 'cameron.new@example.com', '陕西省西安市雁塔区', '', 'C');
      page.appear(new RouteIntent(ACTION_EDIT, edited));
      logStep('edit-counts', String(page.cachedCount()) + '/' + String(page.storedCount()));
      expect(page.cachedCount()).assertEqual(15);
      expect(page.storedCount()).assertEqual(15);
      expect(store.insertCalls).assertEqual(0);
      expect(store.deleteCalls).assertEqual(0);
      expect(store.batchCalls).assertEqual(1);
      expect(page.dataArray.length).assertEqual(15);
    });

    /**
     * @tc.name   deleteIntentRemovesCachedRow
     * @tc.desc   A 删除联系人 param filters the cached row out, leaving fourteen contacts.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PageAppearLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('deleteIntentRemovesCachedRow', 0, () => {
      const removed: Contact = contactOf('阿诺德', '16666666666', 'arnold@example.com', '上海市浦东新区', '', 'A');
      page.appear(new RouteIntent(ACTION_DELETE, removed));
      const names: string[] = page.names();
      logStep('delete-manager', String(names.length));
      expect(names.length).assertEqual(14);
      expect(countOf(names, '阿诺德')).assertEqual(0);
      expect(names[0]).assertEqual('艾德里安');
      expect(sameStringArray(contactNames(page.manager.getContacts()),
        contactNames(expectedAfterDelete(createSeedContacts(), '阿诺德')))).assertTrue();
      expect(page.dispatchCount).assertEqual(1);
    });

    /**
     * @tc.name   deleteIntentRemovesStoreRows
     * @tc.desc   The SQL delete removes every store row whose name matches the routed contact.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PageAppearLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('deleteIntentRemovesStoreRows', 0, () => {
      const removed: Contact = contactOf('法里', '11111111111', 'katrina@example.com', '吉林省长春市朝阳区', '', 'F');
      page.appear(new RouteIntent(ACTION_DELETE, removed));
      const names: string[] = store.names();
      logStep('delete-store', String(names.length) + ' last=' + names[names.length - 1]);
      expect(names.length).assertEqual(14);
      expect(countOf(names, '法里')).assertEqual(0);
      expect(names[names.length - 1]).assertEqual('法比而');
      expect(store.deleteCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(14);
    });

    /**
     * @tc.name   missingIntentLeavesCountsUnchanged
     * @tc.desc   When router params carry no action, the seed still runs but no dispatch occurs.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PageAppearLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('missingIntentLeavesCountsUnchanged', 0, () => {
      page.appear(page.noIntent());
      page.appear(page.noIntent());
      logStep('no-intent', String(page.dispatchCount));
      expect(page.dispatchCount).assertEqual(0);
      expect(page.cachedCount()).assertEqual(15);
      expect(page.storedCount()).assertEqual(15);
      expect(store.insertCalls).assertEqual(0);
      expect(store.deleteCalls).assertEqual(0);
      expect(page.lastAction).assertEqual('');
    });

    /**
     * @tc.name   unknownActionLeavesState
     * @tc.desc   An unrecognized action text is ignored, mirroring the three if branches.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PageAppearLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('unknownActionLeavesState', 0, () => {
      const unknown: RouteIntent = new RouteIntent('查看联系人', contactOf('林岸', '13800138000', 'l@example.com', '某地'));
      page.appear(unknown);
      logStep('unknown-action', RouteIntent.isKnownAction(unknown.action) ? 'known' : 'unknown');
      expect(RouteIntent.isKnownAction(unknown.action)).assertFalse();
      expect(page.dispatchCount).assertEqual(0);
      expect(page.cachedCount()).assertEqual(15);
      expect(page.storedCount()).assertEqual(15);
      expect(store.insertCalls).assertEqual(0);
      expect(page.dataArray.length).assertEqual(15);
    });

    /**
     * @tc.name   addAfterSecondAppearStillAppends
     * @tc.desc   The seed guard does not swallow a later add intent on a subsequent appearance.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PageAppearLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addAfterSecondAppearStillAppends', 0, () => {
      page.appear(page.noIntent());
      page.appear(new RouteIntent(ACTION_ADD, contactOf('闻笛', '13911112222', 'wendi@example.com', '杭州', '', 'C')));
      page.appear(new RouteIntent(ACTION_ADD, contactOf('苏木', '13922223333', 'sumu@example.com', '苏州', '', 'D')));
      logStep('add-twice', String(page.cachedCount()) + '/' + String(page.storedCount()));
      expect(page.cachedCount()).assertEqual(17);
      expect(page.storedCount()).assertEqual(17);
      expect(page.seedRuns).assertEqual(1);
      expect(page.appearCount).assertEqual(3);
      expect(page.dispatchCount).assertEqual(2);
      expect(page.names()[16]).assertEqual('苏木');
    });

    /**
     * @tc.name   deleteThenNextAppearDoesNotResurrect
     * @tc.desc   The one-time seed flag prevents a deleted contact from returning on re-entry.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PageAppearLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteThenNextAppearDoesNotResurrect', 0, () => {
      const removed: Contact = contactOf('康纳', '10000000000', 'connor@example.com', '辽宁省沈阳市沈河区', '', 'C');
      page.appear(new RouteIntent(ACTION_DELETE, removed));
      page.appear(page.noIntent());
      page.appear(page.noIntent());
      logStep('no-resurrect', 'cached=' + String(page.cachedCount()));
      expect(page.cachedCount()).assertEqual(14);
      expect(page.storedCount()).assertEqual(14);
      expect(countOf(page.names(), '康纳')).assertEqual(0);
      expect(page.seedRuns).assertEqual(1);
      expect(store.batchCalls).assertEqual(1);
    });

    /**
     * @tc.name   queryAfterSeedReturnsFifteen
     * @tc.desc   The verification query run behind the batch insert sees all fifteen seeded rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PageAppearLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('queryAfterSeedReturnsFifteen', 0, () => {
      page.appear(page.noIntent());
      const visible: Contact[] = page.store.query(true);
      logStep('verify-query', String(visible.length));
      expect(visible.length).assertEqual(15);
      expect(visible[0].name).assertEqual('艾德里安');
      expect(visible[14].name).assertEqual('法里');
      expect(store.queryCalls).assertEqual(1);
      expect(sameStringArray(contactNames(visible), contactNames(createSeedContacts()))).assertTrue();
    });

    /**
     * @tc.name   queryAfterAddReturnsSixteen
     * @tc.desc   The store query reflects the routed insert on the very next read.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PageAppearLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queryAfterAddReturnsSixteen', 0, () => {
      page.appear(new RouteIntent(ACTION_ADD,
        contactOf('林岸', '13800138000', 'lin@example.com', '上海市徐汇区', '', 'A')));
      const visible: Contact[] = page.store.query(true);
      logStep('query-sixteen', String(visible.length));
      expect(visible.length).assertEqual(16);
      expect(visible[15].name).assertEqual('林岸');
      expect(visible[15].category).assertEqual('A');
      expect(store.queryCalls).assertEqual(1);
      expect(visible[14].name).assertEqual('法里');
    });

    /**
     * @tc.name   dataArrayMutationDoesNotAffectManager
     * @tc.desc   The page array is a manager copy, so clearing it cannot clear the cached list.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PageAppearLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('dataArrayMutationDoesNotAffectManager', 0, () => {
      page.appear(page.noIntent());
      const published: Contact[] = page.dataArray;
      published.splice(0, published.length);
      const cached: number = page.cachedCount();
      const stored: number = page.storedCount();
      logStep('array-copy', 'published=' + String(published.length) + ' cached=' + String(cached));
      expect(published.length).assertEqual(0);
      expect(cached).assertEqual(15);
      expect(stored).assertEqual(15);
      expect(page.manager.getContacts()[0].name).assertEqual('艾德里安');
      expect(page.seedRuns).assertEqual(1);
    });

    /**
     * @tc.name   sharedFlagAcrossTwoPagesSeedsOnce
     * @tc.desc   Because isInitialized is static, a second page instance reuses the seeded store.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PageAppearLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sharedFlagAcrossTwoPagesSeedsOnce', 0, () => {
      page.appear(page.noIntent());
      const second: AppearPage = new AppearPage(flag, manager, store, true);
      second.appear(page.noIntent());
      logStep('shared-flag', 'pages=' + String(page.appearCount + second.appearCount));
      expect(page.appearCount).assertEqual(1);
      expect(second.appearCount).assertEqual(1);
      expect(second.seedRuns).assertEqual(0);
      expect(second.cachedCount()).assertEqual(15);
      expect(store.rowCount()).assertEqual(15);
      expect(store.batchCalls).assertEqual(1);
    });

    /**
     * @tc.name   clearedFlagReseedsFreshStore
     * @tc.desc   Clearing the static flag forces a new seed, so a rebuilt store gets fifteen rows again.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PageAppearLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('clearedFlagReseedsFreshStore', 0, () => {
      page.appear(page.noIntent());
      flag.clear();
      const rebuilt: StoreDouble = new StoreDouble();
      const second: AppearPage = new AppearPage(flag, resetContactManager(), rebuilt, true);
      second.appear(page.noIntent());
      logStep('reseed', 'runs=' + String(second.seedRuns));
      expect(second.seedRuns).assertEqual(1);
      expect(rebuilt.rowCount()).assertEqual(15);
      expect(rebuilt.batchCalls).assertEqual(1);
      expect(second.cachedCount()).assertEqual(15);
      expect(flag.value).assertTrue();
    });

    /**
     * @tc.name   invalidContextSeedKeepsManagerOnly
     * @tc.desc   A rejected batch insert still leaves the manager seeded because setContacts is synchronous.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PageAppearLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('invalidContextSeedKeepsManagerOnly', 0, () => {
      const noContext: AppearPage = new AppearPage(new SeedFlag(), resetContactManager(), new StoreDouble(), false);
      noContext.appear(noContext.noIntent());
      logStep('no-context', 'manager=' + String(noContext.cachedCount()) + ' store=' + String(noContext.storedCount()));
      expect(noContext.seedInserted).assertEqual(-1);
      expect(noContext.cachedCount()).assertEqual(15);
      expect(noContext.storedCount()).assertEqual(0);
      expect(noContext.store.initialized).assertFalse();
      expect(noContext.dataArray.length).assertEqual(15);
    });

    /**
     * @tc.name   invalidContextSeedFlagIsSetWithoutRetry
     * @tc.desc   The flag is set even after a failed seed, so the next appearance does not retry the batch.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PageAppearLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('invalidContextSeedFlagIsSetWithoutRetry', 0, () => {
      const noContext: AppearPage = new AppearPage(new SeedFlag(), resetContactManager(), new StoreDouble(), false);
      noContext.appear(noContext.noIntent());
      noContext.appear(noContext.noIntent());
      logStep('no-retry', 'batch=' + String(noContext.store.batchCalls));
      expect(noContext.seedRuns).assertEqual(1);
      expect(noContext.store.batchCalls).assertEqual(1);
      expect(noContext.store.rowCount()).assertEqual(0);
      expect(noContext.cachedCount()).assertEqual(15);
      expect(noContext.flag.value).assertTrue();
      expect(noContext.appearCount).assertEqual(2);
    });

    /**
     * @tc.name   routeForAddTargetsEditPage
     * @tc.desc   Both add and edit actions navigate to the edit page, never to the list page.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PageAppearLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('routeForAddTargetsEditPage', 0, () => {
      const addIntent: RouteIntent = new RouteIntent(ACTION_ADD, createSeedContacts()[0]);
      const editIntent: RouteIntent = new RouteIntent(ACTION_EDIT, createSeedContacts()[1]);
      logStep('route-add', addIntent.url());
      expect(addIntent.url()).assertEqual(ROUTE_EDIT);
      expect(editIntent.url()).assertEqual(ROUTE_EDIT);
      expect(addIntent.url() === ROUTE_LIST).assertFalse();
      expect(addIntent.describe().indexOf(ACTION_ADD)).assertEqual(0);
      expect(RouteIntent.isKnownAction(ACTION_ADD)).assertTrue();
      expect(RouteIntent.isKnownAction(ACTION_EDIT)).assertTrue();
    });

    /**
     * @tc.name   routeForDeleteTargetsListPage
     * @tc.desc   A delete action returns to the list page and is still a known action.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PageAppearLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('routeForDeleteTargetsListPage', 0, () => {
      const deleteIntent: RouteIntent = new RouteIntent(ACTION_DELETE, createSeedContacts()[2]);
      logStep('route-delete', deleteIntent.url());
      expect(deleteIntent.url()).assertEqual(ROUTE_LIST);
      expect(RouteIntent.isKnownAction(ACTION_DELETE)).assertTrue();
      expect(deleteIntent.describe().indexOf(ACTION_DELETE)).assertEqual(0);
      expect(deleteIntent.describe().indexOf(ROUTE_LIST) > 0).assertTrue();
      expect(RouteIntent.isKnownAction('新增联系人改')).assertFalse();
      expect(ROUTE_EDIT === ROUTE_LIST).assertFalse();
    });

    /**
     * @tc.name   seedNamesMatchDriverOrder
     * @tc.desc   The cached seed keeps the exact fifteen name order declared by the page.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PageAppearLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('seedNamesMatchDriverOrder', 0, () => {
      page.appear(page.noIntent());
      const expected: string[] = contactNames(createSeedContacts());
      logStep('seed-order', joined(page.names(), ','));
      expect(sameStringArray(page.names(), expected)).assertTrue();
      expect(page.names()[0]).assertEqual('艾德里安');
      expect(page.names()[4]).assertEqual('本杰明');
      expect(page.names()[9]).assertEqual('戴维维');
      expect(page.names()[14]).assertEqual('法里');
      expect(store.names()[11]).assertEqual('艾拉');
    });

    /**
     * @tc.name   seedCategoriesCoverAllSix
     * @tc.desc   The seeded payload uses all six category letters, so grouping sees six buckets.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PageAppearLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('seedCategoriesCoverAllSix', 0, () => {
      page.appear(page.noIntent());
      const groups: string[] = SearchEngine.groupByCategory(page.dataArray);
      logStep('seed-categories', joined(groups, ','));
      expect(groups.length).assertEqual(6);
      expect(sameStringArray(groups, CATEGORIES)).assertTrue();
      expect(SearchEngine.countCategory(page.dataArray, 'A')).assertEqual(2);
      expect(SearchEngine.countCategory(page.dataArray, 'F')).assertEqual(2);
      expect(SearchEngine.countCategory(page.dataArray, 'C')).assertEqual(3);
      expect(page.dataArray.length).assertEqual(15);
    });

    /**
     * @tc.name   duplicateAddKeepsBothCachedRows
     * @tc.desc   The add path only appends, so a duplicate name is stored as a second cached row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PageAppearLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('duplicateAddKeepsBothCachedRows', 0, () => {
      const duplicate: Contact = contactOf('贝拉', '11111111111', 'bella.dup@example.com', '湖北省武汉市江汉区', '', 'B');
      page.appear(new RouteIntent(ACTION_ADD, duplicate));
      const names: string[] = page.names();
      logStep('duplicate-add', 'bella=' + String(countOf(names, '贝拉')));
      expect(names.length).assertEqual(16);
      expect(countOf(names, '贝拉')).assertEqual(2);
      expect(store.rowCount()).assertEqual(16);
      expect(countOf(store.names(), '贝拉')).assertEqual(2);
      expect(page.cachedCount()).assertEqual(16);
    });

    /**
     * @tc.name   deleteUnknownNameLeavesCounts
     * @tc.desc   A routed delete for an absent name removes nothing from either side.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PageAppearLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteUnknownNameLeavesCounts', 0, () => {
      const absent: Contact = contactOf('未登记', '10000000000', 'none@example.com', '未知', '', 'A');
      page.appear(new RouteIntent(ACTION_DELETE, absent));
      logStep('delete-absent', String(page.cachedCount()) + '/' + String(page.storedCount()));
      expect(page.cachedCount()).assertEqual(15);
      expect(page.storedCount()).assertEqual(15);
      expect(store.deleteCalls).assertEqual(1);
      expect(countOf(page.names(), '未登记')).assertEqual(0);
      expect(page.dataArray.length).assertEqual(15);
    });

    /**
     * @tc.name   searchAfterAddFindsNewRow
     * @tc.desc   The freshly added contact is visible to the list page search provider.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PageAppearLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('searchAfterAddFindsNewRow', 0, () => {
      page.appear(new RouteIntent(ACTION_ADD,
        contactOf('林岸', '13800138000', 'lin@example.com', '上海市徐汇区', '', 'A')));
      const found: Contact[] = SearchEngine.filterByName(page.dataArray, '林');
      const empty: Contact[] = SearchEngine.filterByName(page.dataArray, '不存在');
      logStep('search-add', 'found=' + String(found.length));
      expect(found.length).assertEqual(1);
      expect(found[0].name).assertEqual('林岸');
      expect(empty.length).assertEqual(0);
      expect(SearchEngine.filterByName(page.dataArray, '').length).assertEqual(16);
      expect(page.seedRuns).assertEqual(1);
    });

    /**
     * @tc.name   appearDispatchCountTracksKnownActions
     * @tc.desc   Only known action texts dispatch, and every known dispatch bumps one counter.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PageAppearLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('appearDispatchCountTracksKnownActions', 0, () => {
      page.appear(page.noIntent());
      page.appear(new RouteIntent('翻页', createSeedContacts()[0]));
      page.appear(new RouteIntent(ACTION_ADD,
        contactOf('苏木', '13922223333', 'sumu@example.com', '苏州', '', 'D')));
      page.appear(new RouteIntent(ACTION_EDIT,
        contactOf('苏木', '13922224444', 'sumu.new@example.com', '苏州工业园区', '', 'D')));
      page.appear(new RouteIntent(ACTION_DELETE,
        contactOf('苏木', '13922224444', 'sumu.new@example.com', '苏州工业园区', '', 'D')));
      logStep('dispatch-count', String(page.dispatchCount));
      expect(page.dispatchCount).assertEqual(3);
      expect(page.appearCount).assertEqual(5);
      expect(page.cachedCount()).assertEqual(15);
      expect(page.storedCount()).assertEqual(15);
      expect(countOf(page.names(), '苏木')).assertEqual(0);
    });

    /**
     * @tc.name   newPageHelperBuildsIsolatedStore
     * @tc.desc   The helper returns a page whose store and manager start empty and unseeded.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PageAppearLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('newPageHelperBuildsIsolatedStore', 0, () => {
      const isolated: AppearPage = newPage(new SeedFlag());
      logStep('isolated', String(isolated.cachedCount()) + '/' + String(isolated.storedCount()));
      expect(isolated.cachedCount()).assertEqual(0);
      expect(isolated.storedCount()).assertEqual(0);
      expect(isolated.appearCount).assertEqual(0);
      expect(isolated.store.initialized).assertFalse();
      expect(isolated.store === store).assertFalse();
      expect(isolated.dispatchCount).assertEqual(0);
    });

    /**
     * @tc.name   storeInitCountStaysOneAcrossEdits
     * @tc.desc   Every routed dispatch reuses the initialized store instead of creating a new table.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PageAppearLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('storeInitCountStaysOneAcrossEdits', 0, () => {
      const edited: Contact = contactOf('戴维维', '11100002222', 'dai.new@example.com', '吉林省长春市朝阳区', '', 'D');
      page.appear(new RouteIntent(ACTION_EDIT, edited));
      page.appear(new RouteIntent(ACTION_ADD,
        contactOf('林岸', '13800138000', 'lin@example.com', '上海市徐汇区', '', 'A')));
      page.appear(new RouteIntent(ACTION_DELETE, edited));
      logStep('init-stable', 'init=' + String(store.initCalls) + ' table=' + String(store.createTableCalls));
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.batchCalls).assertEqual(1);
      expect(store.insertCalls).assertEqual(1);
      expect(store.deleteCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(15);
      expect(OperationCatalog.all().length).assertEqual(8);
    });

    /**
     * @tc.name   addIntentPreservesExistingCategoryBuckets
     * @tc.desc   Appending a contact with an existing category keeps six buckets and raises that count.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PageAppearLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addIntentPreservesExistingCategoryBuckets', 0, () => {
      page.appear(new RouteIntent(ACTION_ADD,
        contactOf('艾登新', '17700009999', 'aideng.new@example.com', '陕西省西安市雁塔区', '', 'E')));
      const groups: string[] = SearchEngine.groupByCategory(page.dataArray);
      logStep('category-buckets', joined(groups, ','));
      expect(groups.length).assertEqual(6);
      expect(sameStringArray(groups, CATEGORIES)).assertTrue();
      expect(SearchEngine.countCategory(page.dataArray, 'E')).assertEqual(4);
      expect(SearchEngine.countCategory(page.dataArray, 'B')).assertEqual(3);
      expect(page.storedCount()).assertEqual(16);
      expect(page.cachedCount()).assertEqual(16);
    });
  });
}
