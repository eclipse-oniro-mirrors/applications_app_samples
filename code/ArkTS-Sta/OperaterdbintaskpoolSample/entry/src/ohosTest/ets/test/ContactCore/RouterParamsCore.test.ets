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
 * RouterParamsCore pins the two slot carrier that the sample passes through
 * the router: a text action and an optional Contact payload.
 *
 * Anchors:
 *   Contact.ets:49-57            RouterParams declaration and constructor
 *   OperateRDBInTaskPool.ets:83-88 reading both slots before the guard
 *   AddressBookDetail.ets:51-58  reading data and guarding undefined
 *   AddressBookList.ets:63       params built with an action and a contact
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact, RouterParams } from '../../../../main/ets/pages/model/Contact';
import { ContactManager } from '../../../../main/ets/pages/model/ContactManager';
import {
  contactOf,
  cloneContact,
  resetContactManager,
  RouteIntent,
  ACTION_ADD,
  ACTION_EDIT,
  ACTION_DELETE,
  ROUTE_EDIT,
  ROUTE_LIST
} from '../Shared/SharedDriver';

/** Builds the populated contact used by the slot tests. */
function payloadContact(): Contact {
  return contactOf('参数戊', '13955550001', 'params.wu@example.com',
    '湖北省随州市曾都区', 'params.jpg', 'B');
}

/** A params object with both slots populated. */
function populatedParams(): RouterParams {
  return new RouterParams(ACTION_EDIT, payloadContact());
}

/** True when both slots are usable by the pages. */
function bothSlotsPresent(params: RouterParams): boolean {
  return params.text !== undefined && params.data !== undefined;
}

export default function routerParamsCoreTest(): void {
  describe('RouterParamsCore', () => {
    beforeAll(() => {
      logSuite('RouterParamsCore', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      resetContactManager();
      logSuite('RouterParamsCore', 'end');
    });

    /**
     * @tc.name   textStoresTheActionString
     * @tc.desc   The first constructor argument is exposed unchanged through the text slot.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RouterParamsCore scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('textStoresTheActionString', 0, () => {
      const params: RouterParams = new RouterParams(ACTION_EDIT, payloadContact());
      expect(params.text).assertEqual(ACTION_EDIT);
      expect(params.text).assertEqual('编辑联系人');
      expect(params.text !== undefined).assertTrue();
      expect((params.text as string).length).assertEqual(5);
      expect((params.text as string).startsWith('编辑')).assertTrue();
      expect(params.text === ACTION_ADD).assertFalse();
      logStep('RouterParamsCore', 'text slot checked');
    });

    /**
     * @tc.name   textStoresAnEmptyStringAsDefined
     * @tc.desc   An empty action string is a defined value and survives construction.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RouterParamsCore scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('textStoresAnEmptyStringAsDefined', 0, () => {
      const params: RouterParams = new RouterParams('', payloadContact());
      expect(params.text).assertEqual('');
      expect(params.text === undefined).assertFalse();
      expect((params.text as string).length).assertEqual(0);
      expect(params.text === '').assertTrue();
      expect(bothSlotsPresent(params)).assertTrue();
      expect((params.data as Contact).name).assertEqual('参数戊');
    });

    /**
     * @tc.name   textStoresChineseTextWithoutLoss
     * @tc.desc   A multi character action label keeps every character in the text slot.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RouterParamsCore scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('textStoresChineseTextWithoutLoss', 0, () => {
      const action: string = '查看联系人详情';
      const params: RouterParams = new RouterParams(action, payloadContact());
      expect(params.text).assertEqual(action);
      expect((params.text as string).length).assertEqual(7);
      expect((params.text as string).startsWith('查看')).assertTrue();
      expect((params.text as string).endsWith('详情')).assertTrue();
      expect(params.text === action).assertTrue();
      expect((params.text as string).indexOf('联系人') > 0).assertTrue();
    });

    /**
     * @tc.name   textIsUndefinedWhenConstructedWithUndefined
     * @tc.desc   Passing undefined for the text slot keeps it undefined rather than becoming a string.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RouterParamsCore scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('textIsUndefinedWhenConstructedWithUndefined', 0, () => {
      const params: RouterParams = new RouterParams(undefined, payloadContact());
      expect(params.text === undefined).assertTrue();
      expect(params.text === '').assertFalse();
      expect(params.data !== undefined).assertTrue();
      expect(bothSlotsPresent(params)).assertFalse();
      let guard = false;
      if (!params.text) {
        guard = true;
      }
      expect(guard).assertTrue();
    });

    /**
     * @tc.name   dataStoresTheContactReference
     * @tc.desc   The second constructor argument is stored by reference, not cloned.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RouterParamsCore scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('dataStoresTheContactReference', 0, () => {
      const contact: Contact = payloadContact();
      const params: RouterParams = new RouterParams(ACTION_EDIT, contact);
      expect(params.data === contact).assertTrue();
      expect((params.data as Contact).name).assertEqual('参数戊');
      expect((params.data as Contact).phone).assertEqual('13955550001');
      expect((params.data as Contact).avatar).assertEqual('params.jpg');
      expect(params.data === new Contact()).assertFalse();
      expect((params.data as Contact).category).assertEqual('B');
    });

    /**
     * @tc.name   dataIsUndefinedWhenConstructedWithUndefined
     * @tc.desc   The payload slot can be undefined so the detail page can skip assignment.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RouterParamsCore scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('dataIsUndefinedWhenConstructedWithUndefined', 0, () => {
      const params: RouterParams = new RouterParams(ACTION_EDIT, undefined);
      expect(params.data === undefined).assertTrue();
      expect(params.data instanceof Contact).assertFalse();
      expect(params.text).assertEqual(ACTION_EDIT);
      let guard = false;
      if (!params.data) {
        guard = true;
      }
      expect(guard).assertTrue();
      expect(bothSlotsPresent(params)).assertFalse();
    });

    /**
     * @tc.name   bothSlotsMayBeUndefinedTogether
     * @tc.desc   A params carrier with two undefined slots is valid and both guards trigger.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RouterParamsCore scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('bothSlotsMayBeUndefinedTogether', 0, () => {
      const params: RouterParams = new RouterParams(undefined, undefined);
      expect(params.text === undefined).assertTrue();
      expect(params.data === undefined).assertTrue();
      expect(params.text === undefined && params.data === undefined).assertTrue();
      expect(bothSlotsPresent(params)).assertFalse();
      let guards = 0;
      if (!params.text) {
        guards = guards + 1;
      }
      if (!params.data) {
        guards = guards + 1;
      }
      expect(guards).assertEqual(2);
      expect(params.text === '').assertFalse();
    });

    /**
     * @tc.name   definedTextWithUndefinedDataIsUsable
     * @tc.desc   A text only carrier still exposes an action for routing while the payload is absent.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RouterParamsCore scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('definedTextWithUndefinedDataIsUsable', 0, () => {
      const params: RouterParams = new RouterParams(ACTION_DELETE, undefined);
      expect(params.text).assertEqual(ACTION_DELETE);
      expect(params.data === undefined).assertTrue();
      expect(bothSlotsPresent(params)).assertFalse();
      expect(RouteIntent.isKnownAction(params.text as string)).assertTrue();
      expect(RouteIntent.routeFor(params.text as string)).assertEqual(ROUTE_LIST);
      expect(params.text === ACTION_DELETE).assertTrue();
    });

    /**
     * @tc.name   undefinedTextWithDefinedDataStillCarriesTheRow
     * @tc.desc   A data only carrier keeps the contact even though the page guard rejects it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RouterParamsCore scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('undefinedTextWithDefinedDataStillCarriesTheRow', 0, () => {
      const contact: Contact = payloadContact();
      const params: RouterParams = new RouterParams(undefined, contact);
      expect(params.text === undefined).assertTrue();
      expect(params.data === contact).assertTrue();
      expect((params.data as Contact).email).assertEqual('params.wu@example.com');
      expect((params.data as Contact).address).assertEqual('湖北省随州市曾都区');
      expect(bothSlotsPresent(params)).assertFalse();
      expect(params.data === undefined).assertFalse();
    });

    /**
     * @tc.name   contactMutationIsVisibleThroughParams
     * @tc.desc   Editing the contact after construction changes what params.data reads.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RouterParamsCore scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('contactMutationIsVisibleThroughParams', 0, () => {
      const contact: Contact = payloadContact();
      const params: RouterParams = new RouterParams(ACTION_EDIT, contact);
      contact.phone = '13955559999';
      contact.category = 'F';
      expect((params.data as Contact).phone).assertEqual('13955559999');
      expect((params.data as Contact).category).assertEqual('F');
      expect((params.data as Contact).name).assertEqual('参数戊');
      expect(params.data === contact).assertTrue();
      expect((params.data as Contact).phone === '13955550001').assertFalse();
      expect(params.text).assertEqual(ACTION_EDIT);
    });

    /**
     * @tc.name   textReassignmentChangesOnlyTheTextSlot
     * @tc.desc   The text property is writable after construction without touching the payload.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RouterParamsCore scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('textReassignmentChangesOnlyTheTextSlot', 0, () => {
      const contact: Contact = payloadContact();
      const params: RouterParams = new RouterParams(ACTION_ADD, contact);
      params.text = ACTION_EDIT;
      expect(params.text).assertEqual(ACTION_EDIT);
      expect(params.text === ACTION_ADD).assertFalse();
      expect(params.data === contact).assertTrue();
      expect((params.data as Contact).name).assertEqual('参数戊');
      expect(params.text).assertEqual('编辑联系人');
      expect(bothSlotsPresent(params)).assertTrue();
    });

    /**
     * @tc.name   dataReassignmentReplacesTheContact
     * @tc.desc   Assigning a new Contact to data retargets the payload slot.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RouterParamsCore scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('dataReassignmentReplacesTheContact', 0, () => {
      const first: Contact = payloadContact();
      const second: Contact = contactOf('参数己', '13955550002', 'second@example.com',
        '湖北省恩施土家族苗族自治州恩施市', '', 'C');
      const params: RouterParams = new RouterParams(ACTION_EDIT, first);
      params.data = second;
      expect(params.data === second).assertTrue();
      expect(params.data === first).assertFalse();
      expect((params.data as Contact).name).assertEqual('参数己');
      expect(first.name).assertEqual('参数戊');
      expect((params.data as Contact).category).assertEqual('C');
      expect(params.text).assertEqual(ACTION_EDIT);
    });

    /**
     * @tc.name   twoParamsCanShareOneContactReference
     * @tc.desc   Two carriers built with one contact both observe later mutations on it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RouterParamsCore scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('twoParamsCanShareOneContactReference', 0, () => {
      const contact: Contact = payloadContact();
      const first: RouterParams = new RouterParams(ACTION_EDIT, contact);
      const second: RouterParams = new RouterParams(ACTION_DELETE, contact);
      expect(first.data === second.data).assertTrue();
      expect(first.data === contact).assertTrue();
      contact.address = '湖北省仙桃市沙嘴街道';
      expect((first.data as Contact).address).assertEqual('湖北省仙桃市沙嘴街道');
      expect((second.data as Contact).address).assertEqual('湖北省仙桃市沙嘴街道');
      expect(first.text === second.text).assertFalse();
      expect(first.text).assertEqual(ACTION_EDIT);
    });

    /**
     * @tc.name   paramsSlotsAreIndependentOfEachOther
     * @tc.desc   Clearing one slot does not change the other slot's value or reference.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RouterParamsCore scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('paramsSlotsAreIndependentOfEachOther', 0, () => {
      const contact: Contact = payloadContact();
      const params: RouterParams = new RouterParams(ACTION_EDIT, contact);
      params.data = undefined;
      expect(params.data === undefined).assertTrue();
      expect(params.text).assertEqual(ACTION_EDIT);
      params.data = contact;
      params.text = undefined;
      expect(params.text === undefined).assertTrue();
      expect(params.data === contact).assertTrue();
      expect((params.data as Contact).name).assertEqual('参数戊');
      expect(params.text === undefined && params.data === undefined).assertFalse();
    });

    /**
     * @tc.name   describeUsesActionNameAndRoute
     * @tc.desc   RouteIntent.describe for populated params joins the action, name and edit route.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RouterParamsCore scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('describeUsesActionNameAndRoute', 0, () => {
      const contact: Contact = payloadContact();
      const intent: RouteIntent = new RouteIntent(ACTION_EDIT, contact);
      const params: RouterParams = intent.toParams();
      expect(intent.describe()).assertEqual(ACTION_EDIT + ':参数戊:' + ROUTE_EDIT);
      expect(intent.describe().split(':').length).assertEqual(3);
      expect(intent.describe().indexOf((params.data as Contact).name) > 0).assertTrue();
      expect(intent.describe().startsWith(params.text as string)).assertTrue();
      expect(intent.describe().endsWith(ROUTE_EDIT)).assertTrue();
      expect(intent.describe().length > 20).assertTrue();
    });

    /**
     * @tc.name   describeReflectsANameMutation
     * @tc.desc   Because the description reads the contact live, a rename changes the description.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RouterParamsCore scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('describeReflectsANameMutation', 0, () => {
      const contact: Contact = payloadContact();
      const intent: RouteIntent = new RouteIntent(ACTION_EDIT, contact);
      const before: string = intent.describe();
      contact.name = '改名戊';
      const after: string = intent.describe();
      expect(before === after).assertFalse();
      expect(after.indexOf('改名戊') > 0).assertTrue();
      expect(before.indexOf('参数戊') > 0).assertTrue();
      expect(after.startsWith(ACTION_EDIT)).assertTrue();
      expect(after.endsWith(ROUTE_EDIT)).assertTrue();
      expect(before.split(':')[1]).assertEqual('参数戊');
      expect(after.split(':')[1]).assertEqual('改名戊');
    });

    /**
     * @tc.name   addParamsDescribeEndsWithTheEditRoute
     * @tc.desc   An add carrier describes the edit page it will open.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RouterParamsCore scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addParamsDescribeEndsWithTheEditRoute', 0, () => {
      const intent: RouteIntent = new RouteIntent(ACTION_ADD, new Contact());
      const params: RouterParams = intent.toParams();
      expect(intent.describe().endsWith(ROUTE_EDIT)).assertTrue();
      expect(intent.describe().endsWith(ROUTE_LIST)).assertFalse();
      expect(params.text).assertEqual(ACTION_ADD);
      expect(params.data !== undefined).assertTrue();
      expect((params.data as Contact).name).assertEqual('');
      expect(intent.describe().split(':').length).assertEqual(3);
      expect(intent.describe().indexOf(ROUTE_EDIT) > 0).assertTrue();
    });

    /**
     * @tc.name   deleteParamsDescribeEndsWithTheListRoute
     * @tc.desc   A delete carrier describes the list page that performs the removal.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RouterParamsCore scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteParamsDescribeEndsWithTheListRoute', 0, () => {
      const contact: Contact = payloadContact();
      const intent: RouteIntent = new RouteIntent(ACTION_DELETE, contact);
      const params: RouterParams = intent.toParams();
      expect(intent.describe().endsWith(ROUTE_LIST)).assertTrue();
      expect(intent.describe().endsWith(ROUTE_EDIT)).assertFalse();
      expect(params.text).assertEqual(ACTION_DELETE);
      expect((params.data as Contact) === contact).assertTrue();
      expect(intent.describe().indexOf(contact.name) > 0).assertTrue();
      expect(intent.url()).assertEqual(ROUTE_LIST);
    });

    /**
     * @tc.name   emptyTextIsFalsyButStillDefined
     * @tc.desc   The page guard rejects an empty text even though the slot is not undefined.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RouterParamsCore scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('emptyTextIsFalsyButStillDefined', 0, () => {
      const params: RouterParams = new RouterParams('', payloadContact());
      let applied = false;
      if (params.data && params.text) {
        applied = true;
      }
      expect(applied).assertFalse();
      expect(params.text !== undefined).assertTrue();
      expect(params.text).assertEqual('');
      expect((params.text as string).length).assertEqual(0);
      expect(params.data !== undefined).assertTrue();
      expect(bothSlotsPresent(params)).assertTrue();
    });

    /**
     * @tc.name   populatedParamsPassTheListGuard
     * @tc.desc   Both slots being truthy lets the list page run its action branch.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RouterParamsCore scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('populatedParamsPassTheListGuard', 0, () => {
      const params: RouterParams = new RouterParams(ACTION_ADD, payloadContact());
      let applied = false;
      if (params.data && params.text) {
        applied = true;
      }
      expect(applied).assertTrue();
      expect(bothSlotsPresent(params)).assertTrue();
      expect(params.text).assertEqual(ACTION_ADD);
      expect((params.data as Contact).phone).assertEqual('13955550001');
      expect(RouteIntent.isKnownAction(params.text as string)).assertTrue();
      expect(params.text === undefined).assertFalse();
    });

    /**
     * @tc.name   emailEditIsVisibleThroughThePayload
     * @tc.desc   Updating email on the referenced contact is immediately visible from params.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RouterParamsCore scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('emailEditIsVisibleThroughThePayload', 0, () => {
      const contact: Contact = payloadContact();
      const params: RouterParams = new RouterParams(ACTION_EDIT, contact);
      expect((params.data as Contact).email).assertEqual('params.wu@example.com');
      contact.email = 'params.wu.new@example.com';
      expect((params.data as Contact).email).assertEqual('params.wu.new@example.com');
      expect((params.data as Contact).email === 'params.wu@example.com').assertFalse();
      expect((params.data as Contact).name).assertEqual('参数戊');
      expect(params.text).assertEqual(ACTION_EDIT);
      expect((params.data as Contact).email.endsWith('.com')).assertTrue();
    });

    /**
     * @tc.name   avatarEditIsVisibleThroughThePayload
     * @tc.desc   Replacing the avatar file on the contact changes the value read from params.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RouterParamsCore scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('avatarEditIsVisibleThroughThePayload', 0, () => {
      const contact: Contact = payloadContact();
      const params: RouterParams = new RouterParams(ACTION_EDIT, contact);
      expect((params.data as Contact).avatar).assertEqual('params.jpg');
      contact.avatar = 'operate_rdb_in_taskpool_photo4.jpg';
      expect((params.data as Contact).avatar).assertEqual('operate_rdb_in_taskpool_photo4.jpg');
      expect((params.data as Contact).avatar.endsWith('photo4.jpg')).assertTrue();
      expect((params.data as Contact).avatar === 'params.jpg').assertFalse();
      expect((params.data as Contact).name).assertEqual('参数戊');
      expect(params.data === contact).assertTrue();
    });

    /**
     * @tc.name   categoryEditIsVisibleThroughThePayload
     * @tc.desc   Updating the category on the referenced contact flows to the params payload.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RouterParamsCore scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryEditIsVisibleThroughThePayload', 0, () => {
      const contact: Contact = payloadContact();
      const params: RouterParams = new RouterParams(ACTION_EDIT, contact);
      expect((params.data as Contact).category).assertEqual('B');
      contact.category = 'A';
      expect((params.data as Contact).category).assertEqual('A');
      expect((params.data as Contact).category.length).assertEqual(1);
      expect((params.data as Contact).category === 'B').assertFalse();
      expect(params.text).assertEqual(ACTION_EDIT);
      expect((params.data as Contact).phone).assertEqual('13955550001');
    });

    /**
     * @tc.name   paramsFromAnIntentRoundTrip
     * @tc.desc   An intent built from params and converted back keeps the same text and contact.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RouterParamsCore scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('paramsFromAnIntentRoundTrip', 0, () => {
      const contact: Contact = payloadContact();
      const params: RouterParams = new RouterParams(ACTION_DELETE, contact);
      const intent: RouteIntent = new RouteIntent(params.text as string, params.data as Contact);
      const again: RouterParams = intent.toParams();
      expect(again.text).assertEqual(params.text);
      expect(again.data === params.data).assertTrue();
      expect((again.data as Contact).name).assertEqual('参数戊');
      expect(intent.url()).assertEqual(ROUTE_LIST);
      expect(again.text).assertEqual(ACTION_DELETE);
      expect(again.data === contact).assertTrue();
    });

    /**
     * @tc.name   dataOnlyParamsSkipTheDetailAssignment
     * @tc.desc   The detail guard leaves its default row in place when the payload slot is empty.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RouterParamsCore scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('dataOnlyParamsSkipTheDetailAssignment', 0, () => {
      const params: RouterParams = new RouterParams(ACTION_EDIT, undefined);
      let source: Contact = new Contact('默认行', '13300000000', 'default@example.com', '默认地址');
      if (params.data) {
        source = params.data as Contact;
      }
      expect(source.name).assertEqual('默认行');
      expect(source.phone).assertEqual('13300000000');
      expect(params.data === undefined).assertTrue();
      expect(params.text).assertEqual(ACTION_EDIT);
      expect(source === params.data).assertFalse();
      expect(source.category).assertEqual('');
    });

    /**
     * @tc.name   populatedParamsAssignTheDetailSource
     * @tc.desc   A defined payload replaces the detail default row in the guard branch.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RouterParamsCore scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('populatedParamsAssignTheDetailSource', 0, () => {
      const contact: Contact = payloadContact();
      const params: RouterParams = new RouterParams(ACTION_EDIT, contact);
      let source: Contact = new Contact('默认行');
      if (params.data) {
        source = params.data as Contact;
      }
      expect(source === contact).assertTrue();
      expect(source.name).assertEqual('参数戊');
      expect(source.email).assertEqual('params.wu@example.com');
      expect(source.address).assertEqual('湖北省随州市曾都区');
      expect(source.category).assertEqual('B');
      expect(source === (params.data as Contact)).assertTrue();
    });

    /**
     * @tc.name   twoParamsWithDifferentTextsStayIndependent
     * @tc.desc   Two carriers with different actions keep their own text slots.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RouterParamsCore scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('twoParamsWithDifferentTextsStayIndependent', 0, () => {
      const contact: Contact = payloadContact();
      const add: RouterParams = new RouterParams(ACTION_ADD, contact);
      const remove: RouterParams = new RouterParams(ACTION_DELETE, contact);
      expect(add.text).assertEqual(ACTION_ADD);
      expect(remove.text).assertEqual(ACTION_DELETE);
      expect(add.text === remove.text).assertFalse();
      expect(add.data === remove.data).assertTrue();
      expect(add.text === '新增联系人').assertTrue();
      expect(remove.text === '新增联系人').assertFalse();
      expect(add.text!.length).assertEqual(remove.text!.length);
    });

    /**
     * @tc.name   sameTextWithDifferentPayloadsStaysDistinct
     * @tc.desc   Two carriers with one action but different contacts expose different data.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RouterParamsCore scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sameTextWithDifferentPayloadsStaysDistinct', 0, () => {
      const first: Contact = payloadContact();
      const second: Contact = contactOf('参数庚', '13955550003', 'params.geng@example.com',
        '湖北省潜江市园林街道', '', 'D');
      const a: RouterParams = new RouterParams(ACTION_EDIT, first);
      const b: RouterParams = new RouterParams(ACTION_EDIT, second);
      expect(a.text).assertEqual(b.text);
      expect(a.data === b.data).assertFalse();
      expect((a.data as Contact).name).assertEqual('参数戊');
      expect((b.data as Contact).name).assertEqual('参数庚');
      expect((a.data as Contact).category).assertEqual('B');
      expect((b.data as Contact).category).assertEqual('D');
    });

    /**
     * @tc.name   knownActionTextsShareTheirLength
     * @tc.desc   The three production action strings are all five Chinese characters long.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RouterParamsCore scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('knownActionTextsShareTheirLength', 0, () => {
      const actions: string[] = [ACTION_ADD, ACTION_EDIT, ACTION_DELETE];
      for (let index = 0; index < actions.length; index++) {
        const params: RouterParams = new RouterParams(actions[index], payloadContact());
        expect((params.text as string).length).assertEqual(5);
        expect((params.text as string).endsWith('联系人')).assertTrue();
        expect(RouteIntent.isKnownAction(params.text as string)).assertTrue();
      }
      expect(ACTION_ADD === ACTION_EDIT).assertFalse();
      expect(ACTION_EDIT === ACTION_DELETE).assertFalse();
      expect(ACTION_ADD === ACTION_DELETE).assertFalse();
      expect(actions.length).assertEqual(3);
    });

    /**
     * @tc.name   bothUndefinedCarrierIsInert
     * @tc.desc   A carrier with two empty slots triggers no branch and keeps no payload.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RouterParamsCore scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('bothUndefinedCarrierIsInert', 0, () => {
      const params: RouterParams = new RouterParams(undefined, undefined);
      let branch: string = '';
      if (params.data && params.text) {
        branch = String(params.text);
      }
      expect(branch).assertEqual('');
      expect(params.text === undefined).assertTrue();
      expect(params.data === undefined).assertTrue();
      expect(bothSlotsPresent(params)).assertFalse();
      expect(params.text === undefined && params.data === undefined).assertTrue();
      expect(params.text === '').assertFalse();
    });

    /**
     * @tc.name   describeLengthGrowsWithTheContactName
     * @tc.type   FUNCTION
     * @tc.desc   A longer contact name produces a longer describe string for the same action and route.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RouterParamsCore scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.level  LEVEL3
     */
    it('describeLengthGrowsWithTheContactName', 0, () => {
      const shortContact: Contact = new Contact('短');
      const longContact: Contact = new Contact('长名字联系人戊');
      const shortIntent: RouteIntent = new RouteIntent(ACTION_EDIT, shortContact);
      const longIntent: RouteIntent = new RouteIntent(ACTION_EDIT, longContact);
      expect(longIntent.describe().length > shortIntent.describe().length).assertTrue();
      expect(longIntent.describe().length - shortIntent.describe().length)
        .assertEqual(longContact.name.length - shortContact.name.length);
      expect(shortIntent.describe().endsWith(ROUTE_EDIT)).assertTrue();
      expect(longIntent.describe().split(':')[1]).assertEqual('长名字联系人戊');
      expect(shortIntent.describe().split(':')[1]).assertEqual('短');
    });

    /**
     * @tc.name   paramsTextAndIntentActionStayInSync
     * @tc.desc   Mutating the intent action before converting updates the text the params carry.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RouterParamsCore scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('paramsTextAndIntentActionStayInSync', 0, () => {
      const contact: Contact = payloadContact();
      const intent: RouteIntent = new RouteIntent(ACTION_ADD, contact);
      expect(intent.toParams().text).assertEqual(ACTION_ADD);
      intent.action = ACTION_DELETE;
      const params: RouterParams = intent.toParams();
      expect(params.text).assertEqual(ACTION_DELETE);
      expect(params.text === ACTION_ADD).assertFalse();
      expect(intent.url()).assertEqual(ROUTE_LIST);
      expect(params.data === contact).assertTrue();
      expect((params.data as Contact).name).assertEqual('参数戊');
    });

    /**
     * @tc.name   whitespaceTextIsTruthyAndDefined
     * @tc.desc   A single space is a defined, truthy action value though no action matches it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RouterParamsCore scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('whitespaceTextIsTruthyAndDefined', 0, () => {
      const params: RouterParams = new RouterParams(' ', payloadContact());
      let applied = false;
      if (params.data && params.text) {
        applied = true;
      }
      expect(applied).assertTrue();
      expect(params.text !== undefined).assertTrue();
      expect((params.text as string).length).assertEqual(1);
      expect(params.text).assertEqual(' ');
      expect(RouteIntent.isKnownAction(params.text as string)).assertFalse();
      expect(RouteIntent.routeFor(params.text as string)).assertEqual(ROUTE_LIST);
      expect(params.data !== undefined).assertTrue();
    });

    /**
     * @tc.name   paramsCarryAllSixContactFields
     * @tc.desc   Every Contact field is reachable through the data slot without loss.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RouterParamsCore scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('paramsCarryAllSixContactFields', 0, () => {
      const contact: Contact = payloadContact();
      const params: RouterParams = new RouterParams(ACTION_EDIT, contact);
      const payload: Contact = params.data as Contact;
      expect(payload.name).assertEqual('参数戊');
      expect(payload.phone).assertEqual('13955550001');
      expect(payload.email).assertEqual('params.wu@example.com');
      expect(payload.address).assertEqual('湖北省随州市曾都区');
      expect(payload.avatar).assertEqual('params.jpg');
      expect(payload.category).assertEqual('B');
      expect(payload === contact).assertTrue();
    });

    /**
     * @tc.name   reassigningDataDoesNotMutateThePreviousContact
     * @tc.desc   Replacing the payload leaves the first contact and any snapshot of it unchanged.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RouterParamsCore scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('reassigningDataDoesNotMutateThePreviousContact', 0, () => {
      const first: Contact = payloadContact();
      const second: Contact = contactOf('参数辛', '13955550004', 'params.xin@example.com',
        '湖北省天门市竟陵街道', '', 'E');
      const params: RouterParams = new RouterParams(ACTION_EDIT, first);
      params.data = second;
      expect(params.data === second).assertTrue();
      expect(first.name).assertEqual('参数戊');
      expect(first.phone).assertEqual('13955550001');
      expect((params.data as Contact).name).assertEqual('参数辛');
      expect(first === second).assertFalse();
      expect(params.text).assertEqual(ACTION_EDIT);
    });

    /**
     * @tc.name   cloningThePayloadKeepsTheOriginalUntouched
     * @tc.desc   A clone read from params can be edited without changing the carried contact.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RouterParamsCore scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cloningThePayloadKeepsTheOriginalUntouched', 0, () => {
      const contact: Contact = payloadContact();
      const params: RouterParams = new RouterParams(ACTION_EDIT, contact);
      const copy: Contact = cloneContact(params.data as Contact);
      copy.phone = '13000000000';
      copy.category = 'A';
      expect(copy === contact).assertFalse();
      expect(copy.phone).assertEqual('13000000000');
      expect(contact.phone).assertEqual('13955550001');
      expect((params.data as Contact).category).assertEqual('B');
      expect((params.data as Contact).phone).assertEqual('13955550001');
      expect(copy.name).assertEqual(contact.name);
    });

    /**
     * @tc.name   undefinedAndDefinedCarriersStayIndependent
     * @tc.desc   One carrier with no payload does not affect another carrier that has one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RouterParamsCore scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('undefinedAndDefinedCarriersStayIndependent', 0, () => {
      const empty: RouterParams = new RouterParams(ACTION_EDIT, undefined);
      const full: RouterParams = new RouterParams(ACTION_EDIT, payloadContact());
      expect(empty.data === undefined).assertTrue();
      expect(full.data !== undefined).assertTrue();
      expect(empty.text).assertEqual(full.text);
      expect(bothSlotsPresent(empty)).assertFalse();
      expect(bothSlotsPresent(full)).assertTrue();
      (full.data as Contact).name = '已改名戊';
      expect((full.data as Contact).name).assertEqual('已改名戊');
      expect(empty.data === undefined).assertTrue();
    });
    /**
     * @tc.name   textCanBeClearedAndRestored
     * @tc.desc   Clearing the text slot to undefined and restoring an action keeps both slots consistent.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RouterParamsCore scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('textCanBeClearedAndRestored', 0, () => {
      const contact: Contact = payloadContact();
      const params: RouterParams = new RouterParams(ACTION_ADD, contact);
      params.text = undefined;
      expect(params.text === undefined).assertTrue();
      expect(bothSlotsPresent(params)).assertFalse();
      expect(params.data === contact).assertTrue();
      params.text = ACTION_DELETE;
      expect(params.text).assertEqual(ACTION_DELETE);
      expect(bothSlotsPresent(params)).assertTrue();
      expect(RouteIntent.routeFor(params.text as string)).assertEqual(ROUTE_LIST);
      expect((params.data as Contact).phone).assertEqual('13955550001');
    });

    /**
     * @tc.name   describeFollowsThePayloadReassignment
     * @tc.desc   Replacing the intent's contact changes the name segment of its description.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RouterParamsCore scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('describeFollowsThePayloadReassignment', 0, () => {
      const intent: RouteIntent = new RouteIntent(ACTION_EDIT, payloadContact());
      const before: string = intent.describe();
      intent.contact = new Contact('壬');
      const after: string = intent.describe();
      expect(before.indexOf('参数戊') > 0).assertTrue();
      expect(after.indexOf('替换壬') < 0).assertTrue();
      expect(before === after).assertFalse();
      expect(after.split(':')[1]).assertEqual('壬');
      expect(after.endsWith(ROUTE_EDIT)).assertTrue();
      expect(after.startsWith(ACTION_EDIT)).assertTrue();
      expect(after.length < before.length).assertTrue();
    });

    /**
     * @tc.name   reassignedDataAppearsInLaterParams
     * @tc.desc   Converting the intent after a payload swap yields the new contact in the params.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RouterParamsCore scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('reassignedDataAppearsInLaterParams', 0, () => {
      const intent: RouteIntent = new RouteIntent(ACTION_EDIT, payloadContact());
      const firstParams: RouterParams = intent.toParams();
      const replacement: Contact = new Contact('后来壬', '13700000001', 'later@example.com');
      intent.contact = replacement;
      const secondParams: RouterParams = intent.toParams();
      expect((firstParams.data as Contact).name).assertEqual('参数戊');
      expect((secondParams.data as Contact).name).assertEqual('后来壬');
      expect(secondParams.data === replacement).assertTrue();
      expect(firstParams.data === secondParams.data).assertFalse();
      expect(firstParams.text).assertEqual(secondParams.text);
      expect((secondParams.data as Contact).phone).assertEqual('13700000001');
      expect((secondParams.data as Contact).email).assertEqual('later@example.com');
      expect((secondParams.data as Contact).category).assertEqual('');
      expect((firstParams.data as Contact).phone).assertEqual('13955550001');
      expect(firstParams.data === replacement).assertFalse();
      expect(secondParams.data === replacement).assertTrue();
      expect(firstParams.text as string).assertEqual('编辑联系人');
      expect(secondParams.text as string).assertEqual('编辑联系人');
      expect(intent.url()).assertEqual(ROUTE_EDIT);
      expect(intent.describe().endsWith(ROUTE_EDIT)).assertTrue();
      expect(intent.describe().split(':')[1]).assertEqual('后来壬');
      expect(intent.contact === replacement).assertTrue();
      expect(replacement.name.length).assertEqual(3);
    });

    /**
     * @tc.name   paramsPayloadMatchesTheManagerRowAfterSet
     * @tc.desc   The data slot can reference the exact row the manager stores after a replacement.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RouterParamsCore scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('paramsPayloadMatchesTheManagerRowAfterSet', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      const row: Contact = contactOf('同步己', '13877770001', 'sync@example.com',
        '湖北省黄冈市黄州区', '', 'B');
      const rows: Contact[] = [];
      rows.push(row);
      manager.setContacts(rows);
      const params: RouterParams = new RouterParams(ACTION_EDIT, manager.getContacts()[0]);
      expect(params.data === manager.getContacts()[0]).assertTrue();
      expect((params.data as Contact).name).assertEqual('同步己');
      expect((params.data as Contact).phone).assertEqual('13877770001');
      expect((params.data as Contact).category).assertEqual('B');
      expect(bothSlotsPresent(params)).assertTrue();
      expect(params.text).assertEqual(ACTION_EDIT);
    });

    /**
     * @tc.name   repeatedReadsOfTheSameSlotsAreStable
     * @tc.desc   Four consecutive reads return the same text value and the same payload reference.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RouterParamsCore scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('repeatedReadsOfTheSameSlotsAreStable', 0, () => {
      const params: RouterParams = new RouterParams(ACTION_DELETE, payloadContact());
      const firstText: string = params.text as string;
      const firstData: Contact = params.data as Contact;
      for (let round = 0; round < 4; round++) {
        expect(params.text).assertEqual(firstText);
        expect(params.data === firstData).assertTrue();
        expect(bothSlotsPresent(params)).assertTrue();
      }
      expect(params.text).assertEqual(ACTION_DELETE);
      expect((params.data as Contact).name).assertEqual('参数戊');
      expect((params.data as Contact).email).assertEqual('params.wu@example.com');
      expect(firstData === payloadContact()).assertFalse();
    });

    /**
     * @tc.name   emptyContactPayloadIsStillTruthy
     * @tc.desc   A payload object with six empty fields still satisfies the data truthiness guard.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RouterParamsCore scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('emptyContactPayloadIsStillTruthy', 0, () => {
      const empty: Contact = new Contact();
      const params: RouterParams = new RouterParams(ACTION_ADD, empty);
      let applied = false;
      if (params.data && params.text) {
        applied = true;
      }
      expect(applied).assertTrue();
      expect(params.data !== undefined).assertTrue();
      expect((params.data as Contact).name).assertEqual('');
      expect((params.data as Contact).phone.length).assertEqual(0);
      expect(params.text).assertEqual(ACTION_ADD);
      expect(empty === params.data).assertTrue();
      expect(bothSlotsPresent(params)).assertTrue();
    });

    /**
     * @tc.name   actionTextCanWalkAddEditDelete
     * @tc.desc   One carrier's text can be reassigned through the three actions with matching routes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RouterParamsCore scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('actionTextCanWalkAddEditDelete', 0, () => {
      const params: RouterParams = new RouterParams(ACTION_ADD, payloadContact());
      expect(params.text).assertEqual(ACTION_ADD);
      expect(RouteIntent.routeFor(params.text as string)).assertEqual(ROUTE_EDIT);
      params.text = ACTION_EDIT;
      expect(params.text).assertEqual(ACTION_EDIT);
      expect(RouteIntent.routeFor(params.text as string)).assertEqual(ROUTE_EDIT);
      params.text = ACTION_DELETE;
      expect(params.text).assertEqual(ACTION_DELETE);
      expect(RouteIntent.routeFor(params.text as string)).assertEqual(ROUTE_LIST);
      expect(bothSlotsPresent(params)).assertTrue();
      expect((params.data as Contact).name).assertEqual('参数戊');
    });

    /**
     * @tc.name   describeOfAnEmptyContactHasAnEmptyNameSegment
     * @tc.desc   The description of an empty payload keeps a blank name between two colons.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RouterParamsCore scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('describeOfAnEmptyContactHasAnEmptyNameSegment', 0, () => {
      const intent: RouteIntent = new RouteIntent(ACTION_EDIT, new Contact());
      const description: string = intent.describe();
      expect(description).assertEqual(ACTION_EDIT + '::' + ROUTE_EDIT);
      expect(description.indexOf('::') > 0).assertTrue();
      expect(description.split(':').length).assertEqual(3);
      expect(description.split(':')[1]).assertEqual('');
      expect(description.endsWith(ROUTE_EDIT)).assertTrue();
      expect(description.startsWith(ACTION_EDIT)).assertTrue();
      expect(description.length).assertEqual(ACTION_EDIT.length + ROUTE_EDIT.length + 2);
    });

    /**
     * @tc.name   payloadMutationAfterASetIsReflectedByBothViews
     * @tc.desc   A field edit on the stored row is visible through params and through a fresh intent.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RouterParamsCore scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('payloadMutationAfterASetIsReflectedByBothViews', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      const row: Contact = contactOf('联动己', '13877770002', 'link@example.com',
        '湖北省孝感市孝南区', '', 'C');
      const rows: Contact[] = [];
      rows.push(row);
      manager.setContacts(rows);
      const params: RouterParams = new RouterParams(ACTION_EDIT, row);
      const intent: RouteIntent = new RouteIntent(ACTION_EDIT, row);
      row.email = 'link.new@example.com';
      expect((params.data as Contact).email).assertEqual('link.new@example.com');
      expect((intent.toParams().data as Contact).email).assertEqual('link.new@example.com');
      expect(manager.getContacts()[0].email).assertEqual('link.new@example.com');
      expect(params.data === manager.getContacts()[0]).assertTrue();
      expect(intent.describe().indexOf('联动己') > 0).assertTrue();
      expect(params.text).assertEqual(ACTION_EDIT);
    });

    /**
     * @tc.name   clearingTheStoreDoesNotChangeInflightParams
     * @tc.desc   Clearing the manager leaves an already built params carrier pointing at its contact.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RouterParamsCore scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('clearingTheStoreDoesNotChangeInflightParams', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      const contact: Contact = payloadContact();
      const rows: Contact[] = [];
      rows.push(contact);
      manager.setContacts(rows);
      const params: RouterParams = new RouterParams(ACTION_DELETE, contact);
      manager.setContacts([]);
      expect(manager.getContacts().length).assertEqual(0);
      expect(params.data === contact).assertTrue();
      expect((params.data as Contact).name).assertEqual('参数戊');
      expect((params.data as Contact).category).assertEqual('B');
      expect(params.text).assertEqual(ACTION_DELETE);
      expect(bothSlotsPresent(params)).assertTrue();
      expect(manager.getContacts().length).assertEqual(0);
    });
  });
}
