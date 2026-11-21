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

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite } from './Shared/Support';
import { Contact, RouterParams } from '../../../main/ets/pages/model/Contact';
import { ContactManager } from '../../../main/ets/pages/model/ContactManager';
import {
  ACTION_ADD,
  TABLE_CONTACT,
  STORE_NAME,
  STORE_ABILITY,
  SQL_CREATE_CONTACT,
  createSeedContacts,
  SchemaInfo,
  resetContactManager
} from './Shared/SharedDriver';

// Entry suite of the OperaterdbintaskpoolSample ohosTest module. It reaches the
// real Contact, RouterParams and ContactManager exports from the test hap and
// verifies the table literals before the category suites run.
export default function abilityTest(): void {
  describe('AbilityTest', () => {
    beforeAll(() => {
      logSuite('AbilityTest', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      resetContactManager();
      logSuite('AbilityTest', 'end');
    });

    /**
     * @tc.name   productionContactDefaultsToSixEmptyFields
     * @tc.desc   The real Contact constructor stores six empty strings when called without arguments.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Ability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('productionContactDefaultsToSixEmptyFields', 0, () => {
      const contact = new Contact();
      expect(contact.name).assertEqual('');
      expect(contact.phone).assertEqual('');
      expect(contact.email).assertEqual('');
      expect(contact.address).assertEqual('');
      expect(contact.avatar).assertEqual('');
      expect(contact.category).assertEqual('');
    });

    /**
     * @tc.name   productionRouterParamsCarriesActionAndContact
     * @tc.desc   RouterParams keeps the action text and the Contact reference supplied by the list page.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Ability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('productionRouterParamsCarriesActionAndContact', 0, () => {
      const contact = new Contact('林岸', '13800138000', 'lin@example.com', '上海市徐汇区');
      const params = new RouterParams(ACTION_ADD, contact);
      expect(params.text).assertEqual(ACTION_ADD);
      expect(params.data !== undefined).assertTrue();
      expect((params.data as Contact).name).assertEqual('林岸');
    });

    /**
     * @tc.name   productionManagerSingletonIsReusedAcrossLookups
     * @tc.desc   Two getInstance calls return the same object, as required by the page level cache.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Ability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('productionManagerSingletonIsReusedAcrossLookups', 0, () => {
      const first = ContactManager.getInstance();
      const second = ContactManager.getInstance();
      expect(first === second).assertTrue();
      first.setContacts(createSeedContacts());
      expect(second.getContacts().length).assertEqual(15);
    });

    /**
     * @tc.name   storeConfigurationMatchesTheRdbConstants
     * @tc.desc   The table name, database file and ability name are the literals used by the sample.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Ability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('storeConfigurationMatchesTheRdbConstants', 0, () => {
      expect(TABLE_CONTACT).assertEqual('contact');
      expect(STORE_NAME).assertEqual('contact.db');
      expect(STORE_ABILITY).assertEqual('EntryAbility');
      expect(SQL_CREATE_CONTACT.indexOf('CREATE TABLE IF NOT EXISTS contact')).assertEqual(0);
    });

    /**
     * @tc.name   createTableStatementDeclaresIdAsAutoincrementKey
     * @tc.desc   The schema parser finds seven columns and the id primary key with AUTOINCREMENT.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Ability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('createTableStatementDeclaresIdAsAutoincrementKey', 0, () => {
      const schema = new SchemaInfo(SQL_CREATE_CONTACT);
      expect(schema.table).assertEqual('contact');
      expect(schema.columnCount()).assertEqual(7);
      expect(schema.primaryKey).assertEqual('id');
      expect(schema.autoincrement).assertTrue();
      expect(schema.hasColumn('category')).assertTrue();
    });
  });
}
