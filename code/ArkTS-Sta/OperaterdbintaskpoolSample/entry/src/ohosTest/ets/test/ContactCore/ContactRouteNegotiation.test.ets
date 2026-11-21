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
 * ContactRouteNegotiation pins the action string to page route mapping used by
 * the three pages.
 *
 * Anchors:
 *   AddressBookList.ets:60-65   detail intent with ACTION_EDIT
 *   AddressBookList.ets:85-91   add intent with ACTION_ADD
 *   AddressBookDetail.ets:243-250 edit intent with ACTION_EDIT
 *   AddressBookDetail.ets:258-264 delete intent with ACTION_DELETE
 *   OperateRDBInTaskPool.ets:90-120 action switch after the router returns
 *   SharedDriver.ets:63-68      action and route literals
 *   SharedDriver.ets:764-795    RouteIntent routeFor and isKnownAction
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
  ROUTE_DETAIL,
  ROUTE_EDIT,
  ROUTE_LIST
} from '../Shared/SharedDriver';

/** A populated contact used as the route payload. */
function routeContact(): Contact {
  return contactOf('路由丁', '13833330001', 'route.ding@example.com',
    '河南省南阳市宛城区', 'route.jpg', 'C');
}

/** Counts the known actions in a supplied list. */
function knownCount(actions: string[]): number {
  let total = 0;
  for (let index = 0; index < actions.length; index++) {
    if (RouteIntent.isKnownAction(actions[index])) {
      total = total + 1;
    }
  }
  return total;
}

export default function contactRouteNegotiationTest(): void {
  describe('ContactRouteNegotiation', () => {
    beforeAll(() => {
      logSuite('ContactRouteNegotiation', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      resetContactManager();
      logSuite('ContactRouteNegotiation', 'end');
    });

    /**
     * @tc.name   addActionMapsToTheEditRoute
     * @tc.desc   A new contact is created on the AddressBookEdit page.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactRouteNegotiation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('addActionMapsToTheEditRoute', 0, () => {
      expect(RouteIntent.routeFor(ACTION_ADD)).assertEqual(ROUTE_EDIT);
      expect(RouteIntent.routeFor(ACTION_ADD)).assertEqual('pages/view/AddressBookEdit');
      expect(RouteIntent.routeFor(ACTION_ADD) === ROUTE_LIST).assertFalse();
      const intent: RouteIntent = new RouteIntent(ACTION_ADD, new Contact());
      expect(intent.url()).assertEqual(ROUTE_EDIT);
      expect(intent.action).assertEqual(ACTION_ADD);
      logStep('ContactRouteNegotiation', 'add route checked');
    });

    /**
     * @tc.name   editActionMapsToTheEditRoute
     * @tc.desc   An existing contact is edited on the AddressBookEdit page.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactRouteNegotiation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('editActionMapsToTheEditRoute', 0, () => {
      const intent: RouteIntent = new RouteIntent(ACTION_EDIT, routeContact());
      expect(intent.url()).assertEqual(ROUTE_EDIT);
      expect(RouteIntent.routeFor(ACTION_EDIT)).assertEqual(ROUTE_EDIT);
      expect(intent.url() === ROUTE_DETAIL).assertFalse();
      expect(intent.url().endsWith('AddressBookEdit')).assertTrue();
      expect(intent.contact.name).assertEqual('路由丁');
      expect(ACTION_EDIT).assertEqual('编辑联系人');
    });

    /**
     * @tc.name   deleteActionMapsToTheListRoute
     * @tc.desc   A deletion returns to the list page, which applies the filter.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactRouteNegotiation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('deleteActionMapsToTheListRoute', 0, () => {
      const intent: RouteIntent = new RouteIntent(ACTION_DELETE, routeContact());
      expect(intent.url()).assertEqual(ROUTE_LIST);
      expect(intent.url()).assertEqual('pages/view/OperateRDBInTaskPool');
      expect(RouteIntent.routeFor(ACTION_DELETE)).assertEqual(ROUTE_LIST);
      expect(intent.url() === ROUTE_EDIT).assertFalse();
      expect(intent.action).assertEqual('删除联系人');
      expect(intent.contact.category).assertEqual('C');
    });

    /**
     * @tc.name   unknownActionFallsBackToTheListRoute
     * @tc.desc   Any action outside the known set resolves to the list page.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactRouteNegotiation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('unknownActionFallsBackToTheListRoute', 0, () => {
      expect(RouteIntent.routeFor('查看联系人')).assertEqual(ROUTE_LIST);
      expect(RouteIntent.routeFor('share')).assertEqual(ROUTE_LIST);
      expect(RouteIntent.routeFor('')).assertEqual(ROUTE_LIST);
      expect(RouteIntent.routeFor('新增联系人 ')).assertEqual(ROUTE_LIST);
      expect(RouteIntent.routeFor('新增联系人') === ROUTE_LIST).assertFalse();
      expect(RouteIntent.isKnownAction('查看联系人')).assertFalse();
    });

    /**
     * @tc.name   knownActionSetHasExactlyThreeMembers
     * @tc.desc   The three documented actions are known and a probe of five strings counts three.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactRouteNegotiation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('knownActionSetHasExactlyThreeMembers', 0, () => {
      const probes: string[] = [ACTION_ADD, ACTION_EDIT, ACTION_DELETE, '刷新联系人', '导出联系人'];
      expect(knownCount(probes)).assertEqual(3);
      expect(RouteIntent.isKnownAction(ACTION_ADD)).assertTrue();
      expect(RouteIntent.isKnownAction(ACTION_EDIT)).assertTrue();
      expect(RouteIntent.isKnownAction(ACTION_DELETE)).assertTrue();
      expect(RouteIntent.isKnownAction('刷新联系人')).assertFalse();
      expect(RouteIntent.isKnownAction('')).assertFalse();
    });

    /**
     * @tc.name   actionAddKeepsItsProductionLiteral
     * @tc.desc   The add action string matches the literal in AddressBookList and OperateRDBInTaskPool.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactRouteNegotiation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('actionAddKeepsItsProductionLiteral', 0, () => {
      expect(ACTION_ADD).assertEqual('新增联系人');
      expect(ACTION_ADD.length).assertEqual(5);
      expect(ACTION_ADD.startsWith('新增')).assertTrue();
      expect(ACTION_ADD.endsWith('联系人')).assertTrue();
      expect(ACTION_ADD === ACTION_EDIT).assertFalse();
      expect(ACTION_ADD === ACTION_DELETE).assertFalse();
    });

    /**
     * @tc.name   actionEditKeepsItsProductionLiteral
     * @tc.desc   The edit action string matches the list row and detail edit literals.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactRouteNegotiation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('actionEditKeepsItsProductionLiteral', 0, () => {
      expect(ACTION_EDIT).assertEqual('编辑联系人');
      expect(ACTION_EDIT.length).assertEqual(5);
      expect(ACTION_EDIT.startsWith('编辑')).assertTrue();
      expect(ACTION_EDIT.endsWith('联系人')).assertTrue();
      expect(ACTION_EDIT === ACTION_DELETE).assertFalse();
      expect(ACTION_EDIT.indexOf('编辑')).assertEqual(0);
    });

    /**
     * @tc.name   actionDeleteKeepsItsProductionLiteral
     * @tc.desc   The delete action string matches the detail delete button literal.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactRouteNegotiation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('actionDeleteKeepsItsProductionLiteral', 0, () => {
      expect(ACTION_DELETE).assertEqual('删除联系人');
      expect(ACTION_DELETE.length).assertEqual(5);
      expect(ACTION_DELETE.startsWith('删除')).assertTrue();
      expect(ACTION_DELETE.endsWith('联系人')).assertTrue();
      expect(ACTION_DELETE === ACTION_ADD).assertFalse();
      expect(ACTION_DELETE.indexOf('删除')).assertEqual(0);
    });

    /**
     * @tc.name   routeEditLiteralIsTheEditPagePath
     * @tc.desc   The edit route literal is a pages/view path ending in AddressBookEdit.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactRouteNegotiation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('routeEditLiteralIsTheEditPagePath', 0, () => {
      expect(ROUTE_EDIT).assertEqual('pages/view/AddressBookEdit');
      expect(ROUTE_EDIT.startsWith('pages/view/')).assertTrue();
      expect(ROUTE_EDIT.endsWith('Edit')).assertTrue();
      expect(ROUTE_EDIT.indexOf('/') > 0).assertTrue();
      expect(ROUTE_EDIT.split('/').length).assertEqual(3);
      expect(ROUTE_EDIT === ROUTE_DETAIL).assertFalse();
    });

    /**
     * @tc.name   routeListLiteralIsTheListPagePath
     * @tc.desc   The list route literal names the OperateRDBInTaskPool page.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactRouteNegotiation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('routeListLiteralIsTheListPagePath', 0, () => {
      expect(ROUTE_LIST).assertEqual('pages/view/OperateRDBInTaskPool');
      expect(ROUTE_LIST.startsWith('pages/view/')).assertTrue();
      expect(ROUTE_LIST.endsWith('OperateRDBInTaskPool')).assertTrue();
      expect(ROUTE_LIST.split('/').length).assertEqual(3);
      expect(ROUTE_LIST.length > ROUTE_EDIT.length).assertTrue();
      expect(ROUTE_LIST === ROUTE_EDIT).assertFalse();
    });

    /**
     * @tc.name   routeDetailLiteralIsTheDetailPagePath
     * @tc.desc   The detail page path is used by the list row push and differs from the other routes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactRouteNegotiation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('routeDetailLiteralIsTheDetailPagePath', 0, () => {
      expect(ROUTE_DETAIL).assertEqual('pages/view/AddressBookDetail');
      expect(ROUTE_DETAIL.startsWith('pages/view/')).assertTrue();
      expect(ROUTE_DETAIL.endsWith('AddressBookDetail')).assertTrue();
      expect(ROUTE_DETAIL === ROUTE_EDIT).assertFalse();
      expect(ROUTE_DETAIL === ROUTE_LIST).assertFalse();
      expect(ROUTE_DETAIL.split('/').length).assertEqual(3);
    });

    /**
     * @tc.name   addAndEditShareTheSameRoute
     * @tc.desc   Both create and edit negotiate to one page, so the edit page handles both modes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactRouteNegotiation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addAndEditShareTheSameRoute', 0, () => {
      const addIntent: RouteIntent = new RouteIntent(ACTION_ADD, new Contact());
      const editIntent: RouteIntent = new RouteIntent(ACTION_EDIT, routeContact());
      expect(addIntent.url()).assertEqual(editIntent.url());
      expect(RouteIntent.routeFor(ACTION_ADD)).assertEqual(RouteIntent.routeFor(ACTION_EDIT));
      expect(addIntent.action === editIntent.action).assertFalse();
      expect(addIntent.contact === editIntent.contact).assertFalse();
      expect(addIntent.url() === ROUTE_LIST).assertFalse();
    });

    /**
     * @tc.name   deleteRouteDiffersFromTheEditRoute
     * @tc.desc   Delete negotiation never reuses the edit page used by create and update.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactRouteNegotiation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteRouteDiffersFromTheEditRoute', 0, () => {
      const deleteRoute: string = RouteIntent.routeFor(ACTION_DELETE);
      const editRoute: string = RouteIntent.routeFor(ACTION_EDIT);
      expect(deleteRoute === editRoute).assertFalse();
      expect(deleteRoute).assertEqual(ROUTE_LIST);
      expect(editRoute).assertEqual(ROUTE_EDIT);
      expect(deleteRoute === ROUTE_DETAIL).assertFalse();
      expect(editRoute === ROUTE_LIST).assertFalse();
      expect(deleteRoute.length > 0).assertTrue();
    });

    /**
     * @tc.name   allThreeRouteLiteralsAreDistinct
     * @tc.desc   Detail, edit and list paths are three unique strings.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactRouteNegotiation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('allThreeRouteLiteralsAreDistinct', 0, () => {
      const routes: string[] = [ROUTE_DETAIL, ROUTE_EDIT, ROUTE_LIST];
      const unique: string[] = [];
      for (let index = 0; index < routes.length; index++) {
        expect(unique.indexOf(routes[index])).assertEqual(-1);
        unique.push(routes[index]);
      }
      expect(unique.length).assertEqual(3);
      expect(routes[0] === routes[1]).assertFalse();
      expect(routes[1] === routes[2]).assertFalse();
      expect(routes[2] === routes[0]).assertFalse();
      expect(ROUTE_LIST === ROUTE_DETAIL).assertFalse();
    });

    /**
     * @tc.name   toParamsCopiesTheActionIntoText
     * @tc.desc   RouteIntent.toParams places the action string in the RouterParams text slot.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactRouteNegotiation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('toParamsCopiesTheActionIntoText', 0, () => {
      const intent: RouteIntent = new RouteIntent(ACTION_EDIT, routeContact());
      const params: RouterParams = intent.toParams();
      expect(params.text).assertEqual(ACTION_EDIT);
      expect(params.text).assertEqual(intent.action);
      expect(params.text === ACTION_EDIT).assertTrue();
      expect(params.text === ACTION_ADD).assertFalse();
      expect(params.text === undefined).assertFalse();
      expect(params.text).assertEqual('编辑联系人');
    });

    /**
     * @tc.name   toParamsKeepsTheContactReference
     * @tc.desc   The router payload points at the same Contact instance the intent was built with.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactRouteNegotiation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('toParamsKeepsTheContactReference', 0, () => {
      const contact: Contact = routeContact();
      const params: RouterParams = new RouteIntent(ACTION_EDIT, contact).toParams();
      expect(params.data === contact).assertTrue();
      expect((params.data as Contact).name).assertEqual('路由丁');
      expect((params.data as Contact).avatar).assertEqual('route.jpg');
      expect(params.data === undefined).assertFalse();
      expect((params.data as Contact).category).assertEqual('C');
      expect(params.data === new Contact('路由丁')).assertFalse();
    });

    /**
     * @tc.name   paramsRoundTripProvidesBothSlots
     * @tc.desc   Building params from an intent yields a defined text and a defined data slot.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactRouteNegotiation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('paramsRoundTripProvidesBothSlots', 0, () => {
      const intent: RouteIntent = new RouteIntent(ACTION_DELETE, routeContact());
      const params: RouterParams = intent.toParams();
      let applied = false;
      if (params.data && params.text) {
        applied = true;
      }
      expect(params.text !== undefined).assertTrue();
      expect(params.data !== undefined).assertTrue();
      expect(applied).assertTrue();
      expect(params.text).assertEqual(intent.action);
      expect((params.data as Contact).phone).assertEqual('13833330001');
      expect(params.text === '').assertFalse();
    });

    /**
     * @tc.name   describeJoinsActionNameAndRoute
     * @tc.desc   The intent description has three colon separated segments ending in the route.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactRouteNegotiation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('describeJoinsActionNameAndRoute', 0, () => {
      const intent: RouteIntent = new RouteIntent(ACTION_ADD, new Contact());
      const description: string = intent.describe();
      const parts: string[] = description.split(':');
      expect(parts.length).assertEqual(3);
      expect(parts[0]).assertEqual(ACTION_ADD);
      expect(parts[1]).assertEqual('');
      expect(parts[2]).assertEqual(ROUTE_EDIT);
      expect(description.startsWith('新增联系人:')).assertTrue();
      expect(description.endsWith(ROUTE_EDIT)).assertTrue();
      expect(description.indexOf('::') > 0).assertTrue();
    });

    /**
     * @tc.name   describeForDeleteUsesTheListRoute
     * @tc.desc   A delete intent description ends with the list path rather than the edit path.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactRouteNegotiation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('describeForDeleteUsesTheListRoute', 0, () => {
      const intent: RouteIntent = new RouteIntent(ACTION_DELETE, routeContact());
      const description: string = intent.describe();
      expect(description.startsWith(ACTION_DELETE + ':')).assertTrue();
      expect(description.indexOf('路由丁') > 0).assertTrue();
      expect(description.endsWith(ROUTE_LIST)).assertTrue();
      expect(description.endsWith(ROUTE_EDIT)).assertFalse();
      expect(description.split(':').length).assertEqual(3);
      expect(description.length > ACTION_DELETE.length).assertTrue();
    });

    /**
     * @tc.name   unknownActionStillCarriesItsContact
     * @tc.desc   Route resolution falls back to the list route while the payload stays intact.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactRouteNegotiation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('unknownActionStillCarriesItsContact', 0, () => {
      const contact: Contact = routeContact();
      const intent: RouteIntent = new RouteIntent('查看联系人', contact);
      expect(intent.url()).assertEqual(ROUTE_LIST);
      expect(RouteIntent.isKnownAction(intent.action)).assertFalse();
      expect(intent.contact === contact).assertTrue();
      expect(intent.describe().endsWith(ROUTE_LIST)).assertTrue();
      expect((intent.toParams().data as Contact).name).assertEqual('路由丁');
      expect(intent.toParams().text).assertEqual('查看联系人');
    });

    /**
     * @tc.name   intentUrlMatchesTheStaticRouteForAllActions
     * @tc.desc   Instance routing agrees with the static helper for the three known actions.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactRouteNegotiation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('intentUrlMatchesTheStaticRouteForAllActions', 0, () => {
      const actions: string[] = [ACTION_ADD, ACTION_EDIT, ACTION_DELETE];
      for (let index = 0; index < actions.length; index++) {
        const intent: RouteIntent = new RouteIntent(actions[index], routeContact());
        expect(intent.url()).assertEqual(RouteIntent.routeFor(actions[index]));
        expect(intent.action).assertEqual(actions[index]);
      }
      expect(new RouteIntent(ACTION_ADD, new Contact()).url()).assertEqual(ROUTE_EDIT);
      expect(new RouteIntent(ACTION_DELETE, new Contact()).url()).assertEqual(ROUTE_LIST);
      expect(RouteIntent.routeFor(ACTION_EDIT)).assertEqual(ROUTE_EDIT);
    });

    /**
     * @tc.name   repeatedRouteResolutionIsDeterministic
     * @tc.desc   Calling routeFor many times for one action always returns the same path.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactRouteNegotiation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('repeatedRouteResolutionIsDeterministic', 0, () => {
      const first: string = RouteIntent.routeFor(ACTION_EDIT);
      for (let index = 0; index < 5; index++) {
        expect(RouteIntent.routeFor(ACTION_EDIT)).assertEqual(first);
      }
      expect(RouteIntent.routeFor(ACTION_DELETE)).assertEqual(ROUTE_LIST);
      expect(RouteIntent.routeFor(ACTION_ADD)).assertEqual(first);
      expect(first).assertEqual(ROUTE_EDIT);
      expect(first === RouteIntent.routeFor(ACTION_DELETE)).assertFalse();
      expect(RouteIntent.routeFor(ACTION_EDIT).length).assertEqual(first.length);
    });

    /**
     * @tc.name   separateIntentsKeepIndependentContacts
     * @tc.desc   Three intents built in a row do not share or overwrite each other's payload.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactRouteNegotiation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('separateIntentsKeepIndependentContacts', 0, () => {
      const first: Contact = contactOf('独立丁一', '13133330001', 'd1@example.com', '河南省焦作市解放区', '', 'A');
      const second: Contact = contactOf('独立丁二', '13133330002', 'd2@example.com', '河南省濮阳市华龙区', '', 'B');
      const third: Contact = contactOf('独立丁三', '13133330003', 'd3@example.com', '河南省许昌市魏都区', '', 'C');
      const a: RouteIntent = new RouteIntent(ACTION_ADD, first);
      const b: RouteIntent = new RouteIntent(ACTION_EDIT, second);
      const c: RouteIntent = new RouteIntent(ACTION_DELETE, third);
      expect(a.contact === first).assertTrue();
      expect(b.contact === second).assertTrue();
      expect(c.contact === third).assertTrue();
      expect(a.contact === b.contact).assertFalse();
      expect(c.url()).assertEqual(ROUTE_LIST);
      expect(a.url()).assertEqual(b.url());
      expect(c.contact.category).assertEqual('C');
    });

    /**
     * @tc.name   actionSwitchAppliesExactlyOneBranch
     * @tc.desc   The list page if chain runs one branch for an add action and none for an unknown one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactRouteNegotiation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('actionSwitchAppliesExactlyOneBranch', 0, () => {
      const text: string = ACTION_ADD;
      let insert = 0;
      let update = 0;
      let remove = 0;
      if (text === ACTION_ADD) {
        insert = insert + 1;
      }
      if (text === ACTION_EDIT) {
        update = update + 1;
      }
      if (text === ACTION_DELETE) {
        remove = remove + 1;
      }
      expect(insert).assertEqual(1);
      expect(update).assertEqual(0);
      expect(remove).assertEqual(0);
      expect(insert + update + remove).assertEqual(1);
      expect(RouteIntent.isKnownAction(text)).assertTrue();
      expect(text).assertEqual('新增联系人');
    });

    /**
     * @tc.name   addIntentCarriesAFreshEmptyContact
     * @tc.desc   The floating add button routes an empty Contact, not a clone of a list row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactRouteNegotiation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addIntentCarriesAFreshEmptyContact', 0, () => {
      const fresh: Contact = new Contact();
      const params: RouterParams = new RouteIntent(ACTION_ADD, fresh).toParams();
      expect((params.data as Contact).name).assertEqual('');
      expect((params.data as Contact).phone).assertEqual('');
      expect((params.data as Contact).email).assertEqual('');
      expect((params.data as Contact).address).assertEqual('');
      expect((params.data as Contact).avatar).assertEqual('');
      expect((params.data as Contact).category).assertEqual('');
      expect(params.text).assertEqual(ACTION_ADD);
    });

    /**
     * @tc.name   editIntentKeepsAvatarAndCategory
     * @tc.desc   The edit route payload includes the non-key fields the form prefills.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactRouteNegotiation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('editIntentKeepsAvatarAndCategory', 0, () => {
      const contact: Contact = routeContact();
      const params: RouterParams = new RouteIntent(ACTION_EDIT, contact).toParams();
      expect((params.data as Contact).avatar).assertEqual('route.jpg');
      expect((params.data as Contact).category).assertEqual('C');
      expect((params.data as Contact).address).assertEqual('河南省南阳市宛城区');
      expect((params.data as Contact).email).assertEqual('route.ding@example.com');
      expect(params.text).assertEqual(ACTION_EDIT);
      expect((params.data as Contact) === contact).assertTrue();
    });

    /**
     * @tc.name   deleteIntentKeepsTheNameForFiltering
     * @tc.desc   The delete payload keeps the exact name the list page filters on.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactRouteNegotiation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteIntentKeepsTheNameForFiltering', 0, () => {
      const contact: Contact = routeContact();
      const params: RouterParams = new RouteIntent(ACTION_DELETE, contact).toParams();
      const payload: Contact = params.data as Contact;
      expect(payload.name).assertEqual('路由丁');
      expect(payload.name === contact.name).assertTrue();
      expect(payload.name.length).assertEqual(3);
      expect(payload.email).assertEqual('route.ding@example.com');
      expect(params.text).assertEqual(ACTION_DELETE);
      expect(RouteIntent.isKnownAction(params.text as string)).assertTrue();
      expect(params.text === ACTION_EDIT).assertFalse();
    });

    /**
     * @tc.name   whitespaceAndCaseVariantsRouteToList
     * @tc.desc   Nearly identical action strings are not treated as known and resolve to the list page.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactRouteNegotiation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('whitespaceAndCaseVariantsRouteToList', 0, () => {
      const variants: string[] = [' 新增联系人', '新增联系人 ', '新增联系人\n', 'ADD', 'Add', '新增'];
      for (let index = 0; index < variants.length; index++) {
        expect(RouteIntent.isKnownAction(variants[index])).assertFalse();
        expect(RouteIntent.routeFor(variants[index])).assertEqual(ROUTE_LIST);
      }
      expect(RouteIntent.isKnownAction(ACTION_ADD)).assertTrue();
      expect(RouteIntent.routeFor(ACTION_ADD)).assertEqual(ROUTE_EDIT);
      expect(variants[0] === ACTION_ADD).assertFalse();
    });

    /**
     * @tc.name   routeResolutionIgnoresTheContactPayload
     * @tc.desc   The same action routes identically for an empty, populated and cloned contact.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactRouteNegotiation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('routeResolutionIgnoresTheContactPayload', 0, () => {
      const empty: Contact = new Contact();
      const full: Contact = routeContact();
      const copy: Contact = cloneContact(full);
      const a: RouteIntent = new RouteIntent(ACTION_EDIT, empty);
      const b: RouteIntent = new RouteIntent(ACTION_EDIT, full);
      const c: RouteIntent = new RouteIntent(ACTION_EDIT, copy);
      expect(a.url()).assertEqual(b.url());
      expect(b.url()).assertEqual(c.url());
      expect(a.contact === b.contact).assertFalse();
      expect(b.contact === c.contact).assertFalse();
      expect(a.describe().split(':')[2]).assertEqual(b.describe().split(':')[2]);
      expect(c.contact.name).assertEqual('路由丁');
    });

    /**
     * @tc.name   negotiationUsesTheCurrentStoreRow
     * @tc.desc   An intent built from the manager row follows an update of that row's fields.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactRouteNegotiation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('negotiationUsesTheCurrentStoreRow', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      const rows: Contact[] = [];
      rows.push(contactOf('当前行', '13233330001', 'current@example.com', '河南省商丘市梁园区', '', 'A'));
      manager.setContacts(rows);
      manager.updateContact(contactOf('当前行', '13233330002', 'current.new@example.com',
        '河南省信阳市浉河区', '', 'B'));
      const intent: RouteIntent = new RouteIntent(ACTION_EDIT, manager.getContacts()[0]);
      const params: RouterParams = intent.toParams();
      expect((params.data as Contact).phone).assertEqual('13233330002');
      expect((params.data as Contact).email).assertEqual('current.new@example.com');
      expect((params.data as Contact).category).assertEqual('B');
      expect(intent.url()).assertEqual(ROUTE_EDIT);
      expect(manager.getContacts().length).assertEqual(1);
      expect(intent.contact.name).assertEqual('当前行');
    });

    /**
     * @tc.name   editThenDeleteIntentsKeepTheirOwnRoutes
     * @tc.desc   Two intents for one contact negotiate to different pages without changing the store.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactRouteNegotiation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('editThenDeleteIntentsKeepTheirOwnRoutes', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      const selected: Contact = routeContact();
      const rows: Contact[] = [];
      rows.push(selected);
      manager.setContacts(rows);
      const editIntent: RouteIntent = new RouteIntent(ACTION_EDIT, manager.getContacts()[0]);
      const deleteIntent: RouteIntent = new RouteIntent(ACTION_DELETE, manager.getContacts()[0]);
      expect(editIntent.url()).assertEqual(ROUTE_EDIT);
      expect(deleteIntent.url()).assertEqual(ROUTE_LIST);
      expect(editIntent.url() === deleteIntent.url()).assertFalse();
      expect(editIntent.contact === deleteIntent.contact).assertTrue();
      expect(manager.getContacts().length).assertEqual(1);
      expect(manager.getContacts()[0].name).assertEqual('路由丁');
      expect(editIntent.action === deleteIntent.action).assertFalse();
    });

    /**
     * @tc.name   knownActionRejectsPrefixAndSuffixVariants
     * @tc.desc   Only the exact three literals are accepted, not strings that contain them.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactRouteNegotiation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('knownActionRejectsPrefixAndSuffixVariants', 0, () => {
      const variants: string[] = ['新增', '联系人', '新增联系人甲', '甲新增联系人',
        '编辑联系', '删除联系人甲', 'add', 'delete'];
      for (let index = 0; index < variants.length; index++) {
        expect(RouteIntent.isKnownAction(variants[index])).assertFalse();
      }
      expect(variants.length).assertEqual(8);
      expect(RouteIntent.isKnownAction(ACTION_ADD)).assertTrue();
      expect(ACTION_ADD.indexOf('新增')).assertEqual(0);
    });

    /**
     * @tc.name   addAndEditNegotiateToTheIdenticalString
     * @tc.desc   The two create and update actions resolve to the same route value, not just equal paths.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactRouteNegotiation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addAndEditNegotiateToTheIdenticalString', 0, () => {
      const addRoute: string = RouteIntent.routeFor(ACTION_ADD);
      const editRoute: string = RouteIntent.routeFor(ACTION_EDIT);
      expect(addRoute === editRoute).assertTrue();
      expect(addRoute === ROUTE_EDIT).assertTrue();
      expect(addRoute === ROUTE_LIST).assertFalse();
      expect(addRoute.length).assertEqual(editRoute.length);
      expect(addRoute.split('/')[2]).assertEqual('AddressBookEdit');
      expect(RouteIntent.isKnownAction(ACTION_ADD) && RouteIntent.isKnownAction(ACTION_EDIT)).assertTrue();
    });

    /**
     * @tc.name   deleteIntentDescriptionAndParamsAgree
     * @tc.desc   The delete intent text, description and params all reference the list page.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactRouteNegotiation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteIntentDescriptionAndParamsAgree', 0, () => {
      const intent: RouteIntent = new RouteIntent(ACTION_DELETE, routeContact());
      const params: RouterParams = intent.toParams();
      expect(intent.describe().endsWith(ROUTE_LIST)).assertTrue();
      expect(params.text).assertEqual(intent.action);
      expect(intent.url()).assertEqual(ROUTE_LIST);
      expect(intent.describe().indexOf(ROUTE_LIST) > 0).assertTrue();
      expect(params.text).assertEqual('删除联系人');
      expect((params.data as Contact).name).assertEqual('路由丁');
    });

    /**
     * @tc.name   routePathsUseThePagesViewPrefix
     * @tc.desc   Every route literal consists of three slash separated segments under pages/view.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactRouteNegotiation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('routePathsUseThePagesViewPrefix', 0, () => {
      const routes: string[] = [ROUTE_DETAIL, ROUTE_EDIT, ROUTE_LIST];
      for (let index = 0; index < routes.length; index++) {
        const segments: string[] = routes[index].split('/');
        expect(segments.length).assertEqual(3);
        expect(segments[0]).assertEqual('pages');
        expect(segments[1]).assertEqual('view');
        expect(segments[2].length > 0).assertTrue();
        expect(routes[index].startsWith('pages/view/')).assertTrue();
      }
      expect(routes[2]).assertEqual('pages/view/OperateRDBInTaskPool');
    });

    /**
     * @tc.name   unknownActionDescriptionUsesTheFallbackRoute
     * @tc.desc   An unrecognized action description still resolves to the list path at its tail.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactRouteNegotiation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('unknownActionDescriptionUsesTheFallbackRoute', 0, () => {
      const intent: RouteIntent = new RouteIntent('导出联系人', routeContact());
      const description: string = intent.describe();
      expect(description.startsWith('导出联系人:')).assertTrue();
      expect(description.endsWith(ROUTE_LIST)).assertTrue();
      expect(description.indexOf(ROUTE_EDIT) < 0).assertTrue();
      expect(intent.toParams().text).assertEqual('导出联系人');
      expect(RouteIntent.isKnownAction('导出联系人')).assertFalse();
      expect(intent.url()).assertEqual(ROUTE_LIST);
      expect(description.split(':').length).assertEqual(3);
    });

    /**
     * @tc.name   twoDeleteIntentsKeepSeparateReferences
     * @tc.desc   Two delete intents built for two contacts never share a payload.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactRouteNegotiation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('twoDeleteIntentsKeepSeparateReferences', 0, () => {
      const first: Contact = contactOf('删丁一', '13344440001', 'del1@example.com', '河南省驻马店市驿城区', '', 'D');
      const second: Contact = contactOf('删丁二', '13344440002', 'del2@example.com', '河南省济源市沁园街道', '', 'E');
      const a: RouteIntent = new RouteIntent(ACTION_DELETE, first);
      const b: RouteIntent = new RouteIntent(ACTION_DELETE, second);
      expect(a.contact === first).assertTrue();
      expect(b.contact === second).assertTrue();
      expect(a.contact === b.contact).assertFalse();
      expect(a.url()).assertEqual(b.url());
      expect(a.toParams().data === b.toParams().data).assertFalse();
      expect((a.toParams().data as Contact).name).assertEqual('删丁一');
      expect((b.toParams().data as Contact).name).assertEqual('删丁二');
    });

    /**
     * @tc.name   everyKnownActionProducesANonEmptyRoute
     * @tc.desc   All three actions yield a non-empty path and a non-empty description tail.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactRouteNegotiation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('everyKnownActionProducesANonEmptyRoute', 0, () => {
      const actions: string[] = [ACTION_ADD, ACTION_EDIT, ACTION_DELETE];
      for (let index = 0; index < actions.length; index++) {
        const route: string = RouteIntent.routeFor(actions[index]);
        expect(route.length > 0).assertTrue();
        expect(route.startsWith('pages/view/')).assertTrue();
        const intent: RouteIntent = new RouteIntent(actions[index], routeContact());
        expect(intent.describe().endsWith(route)).assertTrue();
        expect(intent.toParams().text).assertEqual(actions[index]);
      }
      expect(RouteIntent.routeFor(ACTION_DELETE)).assertEqual(ROUTE_LIST);
      expect(RouteIntent.routeFor(ACTION_ADD)).assertEqual(ROUTE_EDIT);
    });

    /**
     * @tc.name   readingParamsDoesNotMutateTheIntent
     * @tc.desc   Building params, describing and routing leave the intent's action and payload unchanged.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactRouteNegotiation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('readingParamsDoesNotMutateTheIntent', 0, () => {
      const contact: Contact = routeContact();
      const intent: RouteIntent = new RouteIntent(ACTION_EDIT, contact);
      intent.toParams();
      intent.describe();
      intent.url();
      expect(intent.action).assertEqual(ACTION_EDIT);
      expect(intent.contact === contact).assertTrue();
      expect(intent.contact.phone).assertEqual('13833330001');
      expect(intent.url()).assertEqual(ROUTE_EDIT);
      expect(intent.describe()).assertEqual(ACTION_EDIT + ':' + contact.name + ':' + ROUTE_EDIT);
      expect(contact.category).assertEqual('C');
    });

    /**
     * @tc.name   knownProbeCountIsIndependentOfOrder
     * @tc.desc   Shuffling the three actions before probing still counts all three as known.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactRouteNegotiation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('knownProbeCountIsIndependentOfOrder', 0, () => {
      const forward: string[] = [ACTION_ADD, ACTION_EDIT, ACTION_DELETE];
      const backward: string[] = [ACTION_DELETE, ACTION_EDIT, ACTION_ADD];
      const mixed: string[] = [ACTION_EDIT, '非法动作', ACTION_ADD, ACTION_DELETE];
      expect(knownCount(forward)).assertEqual(3);
      expect(knownCount(backward)).assertEqual(3);
      expect(knownCount(mixed)).assertEqual(3);
      expect(mixed.length).assertEqual(4);
      expect(RouteIntent.isKnownAction(backward[0])).assertTrue();
      expect(RouteIntent.routeFor(backward[0])).assertEqual(ROUTE_LIST);
      expect(RouteIntent.routeFor(mixed[2])).assertEqual(ROUTE_EDIT);
    });
    /**
     * @tc.name   negotiationWalkthroughCoversThreeScreens
     * @tc.desc   A create, update and delete walkthrough crosses the edit page twice and the list page once.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactRouteNegotiation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('negotiationWalkthroughCoversThreeScreens', 0, () => {
      const contact: Contact = new Contact();
      const addIntent: RouteIntent = new RouteIntent(ACTION_ADD, contact);
      expect(addIntent.url()).assertEqual(ROUTE_EDIT);
      expect(addIntent.describe().split(':')[1]).assertEqual('');
      contact.name = '走查丁';
      contact.phone = '13555550001';
      contact.email = 'walk@example.com';
      contact.address = '河南省三门峡市湖滨区';
      contact.avatar = 'walk.jpg';
      contact.category = 'F';
      const editIntent: RouteIntent = new RouteIntent(ACTION_EDIT, contact);
      expect(editIntent.url()).assertEqual(ROUTE_EDIT);
      expect(editIntent.url()).assertEqual(addIntent.url());
      expect(editIntent.describe().indexOf('走查丁') > 0).assertTrue();
      expect((editIntent.toParams().data as Contact).phone).assertEqual('13555550001');
      const deleteIntent: RouteIntent = new RouteIntent(ACTION_DELETE, contact);
      expect(deleteIntent.url()).assertEqual(ROUTE_LIST);
      expect(deleteIntent.url() === editIntent.url()).assertFalse();
      expect(deleteIntent.contact === contact).assertTrue();
      expect(deleteIntent.describe().endsWith(ROUTE_LIST)).assertTrue();
      expect((deleteIntent.toParams().data as Contact).category).assertEqual('F');
      expect(RouteIntent.isKnownAction(deleteIntent.action)).assertTrue();
      expect(editIntent.action === deleteIntent.action).assertFalse();
      expect(addIntent.action === editIntent.action).assertFalse();
      expect(ROUTE_DETAIL.startsWith('pages/view/')).assertTrue();
      expect(addIntent.action).assertEqual(ACTION_ADD);
      expect(editIntent.action).assertEqual(ACTION_EDIT);
      expect(deleteIntent.action).assertEqual(ACTION_DELETE);
      expect(addIntent.contact === contact).assertTrue();
      expect(deleteIntent.toParams().text).assertEqual('删除联系人');
      expect(editIntent.toParams().text).assertEqual('编辑联系人');
      expect(addIntent.toParams().text).assertEqual('新增联系人');
      expect(RouteIntent.isKnownAction(ACTION_ADD)).assertTrue();
      expect(RouteIntent.isKnownAction(ACTION_EDIT)).assertTrue();
      expect(RouteIntent.isKnownAction(ACTION_DELETE)).assertTrue();
      expect(ROUTE_EDIT === ROUTE_LIST).assertFalse();
      expect(ROUTE_DETAIL === ROUTE_LIST).assertFalse();
      expect(contact.phone).assertEqual('13555550001');
    });

    /**
     * @tc.name   deleteIntentParamsFilterTheStoreByName
     * @tc.desc   The list page applies a delete intent payload as a name filter over the current rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactRouteNegotiation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('deleteIntentParamsFilterTheStoreByName', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      const rows: Contact[] = [];
      rows.push(contactOf('保留丁', '13911110001', 'keep@example.com', '河南省新乡市红旗区', '', 'A'));
      rows.push(contactOf('移除丁', '13911110002', 'drop@example.com', '河南省鹤壁市淇滨区', '', 'B'));
      manager.setContacts(rows);
      const params: RouterParams = new RouteIntent(ACTION_DELETE, manager.getContacts()[1]).toParams();
      manager.deleteContact(params.data as Contact);
      expect(manager.getContacts().length).assertEqual(1);
      expect(manager.getContacts()[0].name).assertEqual('保留丁');
      expect(manager.getContacts()[0].phone).assertEqual('13911110001');
      expect(params.text).assertEqual(ACTION_DELETE);
      expect(RouteIntent.routeFor(params.text as string)).assertEqual(ROUTE_LIST);
    });

    /**
     * @tc.name   editIntentParamsUpdateTheStoredRow
     * @tc.desc   The edit route payload replaces the stored row when the list page applies it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactRouteNegotiation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('editIntentParamsUpdateTheStoredRow', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      const rows: Contact[] = [];
      rows.push(contactOf('改写丁', '13911110003', 'before.route@example.com',
        '河南省濮阳市清丰县', '', 'C'));
      manager.setContacts(rows);
      const edited: Contact = contactOf('改写丁', '13911110004', 'after.route@example.com',
        '河南省漯河市郾城区', '', 'D');
      const params: RouterParams = new RouteIntent(ACTION_EDIT, edited).toParams();
      manager.updateContact(params.data as Contact);
      const stored: Contact[] = manager.getContacts();
      expect(stored.length).assertEqual(1);
      expect(stored[0].email).assertEqual('after.route@example.com');
      expect(stored[0].phone).assertEqual('13911110004');
      expect(stored[0].category).assertEqual('D');
      expect(params.text).assertEqual(ACTION_EDIT);
      expect(RouteIntent.routeFor(params.text as string)).assertEqual(ROUTE_EDIT);
    });

    /**
     * @tc.name   addIntentParamsAppendToTheStore
     * @tc.desc   The add route payload becomes the tail row after the list page appends it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactRouteNegotiation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('addIntentParamsAppendToTheStore', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      const rows: Contact[] = [];
      rows.push(contactOf('既有丁', '13911110005', 'existing@example.com', '河南省南阳市卧龙区', '', 'A'));
      manager.setContacts(rows);
      const added: Contact = new Contact();
      added.name = '新增丁';
      added.phone = '13911110006';
      added.category = 'E';
      const params: RouterParams = new RouteIntent(ACTION_ADD, added).toParams();
      manager.addContact(params.data as Contact);
      const stored: Contact[] = manager.getContacts();
      expect(stored.length).assertEqual(2);
      expect(stored[1].name).assertEqual('新增丁');
      expect(stored[1] === added).assertTrue();
      expect(params.text).assertEqual(ACTION_ADD);
      expect(RouteIntent.routeFor(params.text as string)).assertEqual(ROUTE_EDIT);
      expect(stored[0].name).assertEqual('既有丁');
    });

    /**
     * @tc.name   routeResolutionIsStableAcrossContactEdits
     * @tc.desc   Mutating the payload fields after intent creation does not change the negotiated route.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactRouteNegotiation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('routeResolutionIsStableAcrossContactEdits', 0, () => {
      const contact: Contact = routeContact();
      const intent: RouteIntent = new RouteIntent(ACTION_EDIT, contact);
      const before: string = intent.url();
      contact.phone = '13000000000';
      contact.email = 'edited.after@example.com';
      contact.category = 'F';
      expect(intent.url()).assertEqual(before);
      expect(intent.url()).assertEqual(ROUTE_EDIT);
      expect((intent.toParams().data as Contact).email).assertEqual('edited.after@example.com');
      expect((intent.toParams().data as Contact).category).assertEqual('F');
      expect(intent.describe().indexOf('路由丁') > 0).assertTrue();
    });

    /**
     * @tc.name   negotiatedRoutesContainNoEmptySegments
     * @tc.desc   Every negotiated path and its fallback split into three non-empty segments.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactRouteNegotiation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('negotiatedRoutesContainNoEmptySegments', 0, () => {
      const paths: string[] = [RouteIntent.routeFor(ACTION_ADD), RouteIntent.routeFor(ACTION_EDIT),
        RouteIntent.routeFor(ACTION_DELETE), RouteIntent.routeFor('未知动作')];
      for (let index = 0; index < paths.length; index++) {
        const segments: string[] = paths[index].split('/');
        expect(segments.length).assertEqual(3);
        for (let part = 0; part < segments.length; part++) {
          expect(segments[part].length > 0).assertTrue();
        }
        expect(paths[index].startsWith('pages/view/')).assertTrue();
      }
      expect(paths[0] === paths[1]).assertTrue();
      expect(paths[2] === paths[3]).assertTrue();
      expect(paths[0] === paths[2]).assertFalse();
      expect(paths.length).assertEqual(4);
      expect(paths[1].endsWith('AddressBookEdit')).assertTrue();
    });
  });
}
