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
 * Accessibility / FormControlSemantics suite.
 *
 * The edit form exposes four text inputs, a submit button and a cancel path.
 * Screen reader semantics depend on the labels the page attaches, so the suite
 * pins the action names, the routes they resolve to, the toast that announces a
 * duplicate and the exact validation codes that gate the submit button.
 *
 * Source anchors:
 *   AddressBookEdit.ets:176-279      input limits, duplicate guard and submit
 *   OperateRDBInTaskPool.ets:112-120 action names and routing
 *   Contact.ets:49-57                RouterParams carrier
 *   SharedDriver.ets:762-795         RouteIntent semantics
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact, RouterParams } from '../../../../main/ets/pages/model/Contact';
import {
  ACTION_ADD,
  ACTION_EDIT,
  ACTION_DELETE,
  ROUTE_EDIT,
  ROUTE_LIST,
  ROUTE_DETAIL,
  DUPLICATE_NAME_TOAST,
  CATEGORY_A,
  CATEGORY_B,
  MAX_ADDRESS_LENGTH,
  MAX_EMAIL_LENGTH,
  MAX_NAME_LENGTH,
  MAX_PHONE_LENGTH,
  createSeedContacts,
  contactOf,
  containsChinese,
  isDigitsOnly,
  hasEmailShape,
  ContactValidation,
  RouteIntent,
  SearchEngine,
  resetContactManager
} from '../Shared/SharedDriver';

export default function formControlSemanticsTest(): void {
  describe('FormControlSemantics', () => {
    beforeAll(() => {
      logSuite('FormControlSemantics', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      resetContactManager();
      logSuite('FormControlSemantics', 'end');
    });

    /**
     * @tc.name   addActionRoutesToEditForm
     * @tc.desc   The add action opens the edit form.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FormControlSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('addActionRoutesToEditForm', 0, () => {
      expect(RouteIntent.routeFor(ACTION_ADD)).assertEqual(ROUTE_EDIT);
      expect(ROUTE_EDIT).assertEqual('pages/view/AddressBookEdit');
      expect(RouteIntent.isKnownAction(ACTION_ADD)).assertTrue();
      expect(ACTION_ADD).assertEqual('新增联系人');
      logStep('formControlSemanticsTest', 'add opens the edit form');
    });

    /**
     * @tc.name   editActionRoutesToEditForm
     * @tc.desc   The edit action opens the same edit form as add.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FormControlSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('editActionRoutesToEditForm', 0, () => {
      expect(RouteIntent.routeFor(ACTION_EDIT)).assertEqual(ROUTE_EDIT);
      expect(RouteIntent.routeFor(ACTION_EDIT)).assertEqual(RouteIntent.routeFor(ACTION_ADD));
      expect(ACTION_EDIT).assertEqual('编辑联系人');
      expect(RouteIntent.isKnownAction(ACTION_EDIT)).assertTrue();
      logStep('formControlSemanticsTest', 'edit opens the edit form');
    });

    /**
     * @tc.name   deleteActionRoutesToList
     * @tc.desc   The delete action returns to the list page rather than the form.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FormControlSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('deleteActionRoutesToList', 0, () => {
      expect(RouteIntent.routeFor(ACTION_DELETE)).assertEqual(ROUTE_LIST);
      expect(ROUTE_LIST).assertEqual('pages/view/OperateRDBInTaskPool');
      expect(ACTION_DELETE).assertEqual('删除联系人');
      expect(RouteIntent.routeFor(ACTION_DELETE) === ROUTE_EDIT).assertFalse();
      logStep('formControlSemanticsTest', 'delete returns to the list');
    });

    /**
     * @tc.name   unknownActionFallsBackToList
     * @tc.desc   An unrecognised action resolves to the list route and is not a known action.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FormControlSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('unknownActionFallsBackToList', 0, () => {
      expect(RouteIntent.routeFor('未知动作')).assertEqual(ROUTE_LIST);
      expect(RouteIntent.routeFor('')).assertEqual(ROUTE_LIST);
      expect(RouteIntent.isKnownAction('未知动作')).assertFalse();
      expect(RouteIntent.isKnownAction('')).assertFalse();
      logStep('formControlSemanticsTest', 'unknown action falls back to the list');
    });

    /**
     * @tc.name   threeActionNamesAreKnown
     * @tc.desc   Exactly the add, edit and delete labels are recognised.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FormControlSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('threeActionNamesAreKnown', 0, () => {
      expect(RouteIntent.isKnownAction(ACTION_ADD)).assertTrue();
      expect(RouteIntent.isKnownAction(ACTION_EDIT)).assertTrue();
      expect(RouteIntent.isKnownAction(ACTION_DELETE)).assertTrue();
      expect(RouteIntent.isKnownAction(ACTION_ADD + 'x')).assertFalse();
      expect(containsChinese(ACTION_ADD)).assertTrue();
      logStep('formControlSemanticsTest', 'three action names are known');
    });

    /**
     * @tc.name   detailRouteLiteralPinned
     * @tc.desc   The detail route literal is not reachable from the three form actions.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FormControlSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('detailRouteLiteralPinned', 0, () => {
      expect(ROUTE_DETAIL).assertEqual('pages/view/AddressBookDetail');
      expect(ROUTE_DETAIL.indexOf('Detail') > 0).assertTrue();
      expect(RouteIntent.routeFor(ACTION_ADD) === ROUTE_DETAIL).assertFalse();
      expect(RouteIntent.routeFor(ACTION_EDIT) === ROUTE_DETAIL).assertFalse();
      logStep('formControlSemanticsTest', 'detail route literal is pinned');
    });

    /**
     * @tc.name   duplicateToastAnnouncesConflict
     * @tc.desc   The duplicate toast is the CJK sentence from the form and ends with an exclamation.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FormControlSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('duplicateToastAnnouncesConflict', 0, () => {
      expect(DUPLICATE_NAME_TOAST).assertEqual('姓名已存在，请重新输入!');
      expect(DUPLICATE_NAME_TOAST.length).assertEqual(12);
      expect(DUPLICATE_NAME_TOAST.endsWith('!')).assertTrue();
      expect(containsChinese(DUPLICATE_NAME_TOAST)).assertTrue();
      logStep('formControlSemanticsTest', 'duplicate toast announces the conflict');
    });

    /**
     * @tc.name   submitBlockedByEmptyName
     * @tc.desc   An empty name alone keeps the submit button disabled.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FormControlSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('submitBlockedByEmptyName', 0, () => {
      const draft = contactOf('', '13800138000', 'lin@example.com', '上海市徐汇区', '', CATEGORY_A);
      const errors = ContactValidation.validate(draft);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('name-empty');
      expect(ContactValidation.canSubmit(draft)).assertFalse();
      logStep('formControlSemanticsTest', 'empty name blocks submit');
    });

    /**
     * @tc.name   submitBlockedByEmptyPhone
     * @tc.desc   An empty phone reports phone-empty and blocks submit.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FormControlSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('submitBlockedByEmptyPhone', 0, () => {
      const draft = contactOf('林岸', '', 'lin@example.com', '上海市徐汇区', '', CATEGORY_A);
      const errors = ContactValidation.validate(draft);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('phone-empty');
      expect(ContactValidation.canSubmit(draft)).assertFalse();
      expect(isDigitsOnly(draft.phone)).assertFalse();
      logStep('formControlSemanticsTest', 'empty phone blocks submit');
    });

    /**
     * @tc.name   submitBlockedByMalformedEmail
     * @tc.desc   An email without an at sign reports email-malformed and blocks submit.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FormControlSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('submitBlockedByMalformedEmail', 0, () => {
      const draft = contactOf('林岸', '13800138000', 'lin.example.com', '上海市徐汇区', '', CATEGORY_A);
      expect(hasEmailShape(draft.email)).assertFalse();
      const errors = ContactValidation.validate(draft);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('email-malformed');
      expect(ContactValidation.canSubmit(draft)).assertFalse();
      logStep('formControlSemanticsTest', 'malformed email blocks submit');
    });

    /**
     * @tc.name   submitBlockedByEmptyAddress
     * @tc.desc   An empty address reports address-empty and blocks submit on its own.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FormControlSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('submitBlockedByEmptyAddress', 0, () => {
      const draft = contactOf('林岸', '13800138000', 'lin@example.com', '', '', CATEGORY_A);
      const errors = ContactValidation.validate(draft);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('address-empty');
      expect(ContactValidation.canSubmit(draft)).assertFalse();
      logStep('formControlSemanticsTest', 'empty address blocks submit');
    });

    /**
     * @tc.name   submitAllowedForCompleteDraft
     * @tc.desc   A draft inside every limit enables the submit button.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FormControlSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('submitAllowedForCompleteDraft', 0, () => {
      const draft = contactOf('林岸', '13800138000', 'lin@example.com', '上海市徐汇区', '', CATEGORY_B);
      const errors = ContactValidation.validate(draft);
      expect(errors.length).assertEqual(0);
      expect(ContactValidation.canSubmit(draft)).assertTrue();
      expect(ContactValidation.canSubmit(draft, createSeedContacts())).assertTrue();
      logStep('formControlSemanticsTest', 'complete draft enables submit');
    });

    /**
     * @tc.name   fourInputLimitsPinned
     * @tc.desc   The four text inputs advertise twelve, twelve, twenty five and one hundred.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FormControlSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fourInputLimitsPinned', 0, () => {
      expect(MAX_NAME_LENGTH).assertEqual(12);
      expect(MAX_PHONE_LENGTH).assertEqual(12);
      expect(MAX_EMAIL_LENGTH).assertEqual(25);
      expect(MAX_ADDRESS_LENGTH).assertEqual(100);
      expect(MAX_ADDRESS_LENGTH > MAX_EMAIL_LENGTH).assertTrue();
      logStep('formControlSemanticsTest', 'four input limits pinned');
    });

    /**
     * @tc.name   routerParamsCarryContact
     * @tc.desc   Router parameters carry the action text and the whole contact object.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FormControlSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('routerParamsCarryContact', 0, () => {
      const contact = contactOf('苏禾', '13512345678', 'suhe@example.com', '浙江省杭州市西湖区', '', CATEGORY_A);
      const params = new RouterParams(ACTION_EDIT, contact);
      expect(params.text).assertEqual(ACTION_EDIT);
      expect(params.data === contact).assertTrue();
      expect(params.data !== undefined).assertTrue();
      logStep('formControlSemanticsTest', 'router params carry the contact');
    });

    /**
     * @tc.name   routerParamsAllowUndefined
     * @tc.desc   Router parameters accept undefined for both fields, which marks an empty form.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FormControlSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('routerParamsAllowUndefined', 0, () => {
      const params = new RouterParams(undefined, undefined);
      expect(params.text === undefined).assertTrue();
      expect(params.data === undefined).assertTrue();
      expect(RouteIntent.isKnownAction('')).assertFalse();
      logStep('formControlSemanticsTest', 'router params allow an empty form');
    });

    /**
     * @tc.name   routeIntentDescribeFormat
     * @tc.desc   The intent description joins action, name and route with colons.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FormControlSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('routeIntentDescribeFormat', 0, () => {
      const intent = new RouteIntent(ACTION_EDIT, contactOf('苏禾', '13512345678', 'suhe@example.com',
        '浙江省杭州市西湖区', '', CATEGORY_A));
      expect(intent.describe()).assertEqual('编辑联系人:苏禾:pages/view/AddressBookEdit');
      expect(intent.describe().split(':').length).assertEqual(3);
      expect(intent.url()).assertEqual(ROUTE_EDIT);
      logStep('formControlSemanticsTest', 'intent describe format');
    });

    /**
     * @tc.name   routeIntentParamsPreserveAction
     * @tc.desc   Converting an intent to router parameters keeps the action text.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FormControlSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('routeIntentParamsPreserveAction', 0, () => {
      const contact = contactOf('莫川', '13100000041', 'mochuan@example.com', '贵州省贵阳市南明区', '', CATEGORY_A);
      const intent = new RouteIntent(ACTION_ADD, contact);
      const params = intent.toParams();
      expect(params.text).assertEqual(ACTION_ADD);
      expect(params.data !== undefined).assertTrue();
      expect((params.data as Contact).name).assertEqual('莫川');
      expect(intent.url()).assertEqual(ROUTE_EDIT);
      logStep('formControlSemanticsTest', 'intent params preserve the action');
    });

    /**
     * @tc.name   phoneInputRejectsLetters
     * @tc.desc   The phone input accepts digits only, so a letter fails the numeric check.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FormControlSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('phoneInputRejectsLetters', 0, () => {
      expect(isDigitsOnly('1380013800a')).assertFalse();
      expect(isDigitsOnly('138 0013 8000')).assertFalse();
      expect(isDigitsOnly('+8613800138000')).assertFalse();
      expect(isDigitsOnly('13800138000')).assertTrue();
      logStep('formControlSemanticsTest', 'phone input rejects letters');
    });

    /**
     * @tc.name   phoneInputAcceptsEveryDigit
     * @tc.desc   All ten digits are accepted individually by the numeric check.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FormControlSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('phoneInputAcceptsEveryDigit', 0, () => {
      expect(isDigitsOnly('0')).assertTrue();
      expect(isDigitsOnly('9')).assertTrue();
      expect(isDigitsOnly('0123456789')).assertTrue();
      expect(isDigitsOnly('')).assertFalse();
      logStep('formControlSemanticsTest', 'phone input accepts every digit');
    });

    /**
     * @tc.name   emailInputNeedsDotAfterAt
     * @tc.desc   An email with an at sign but no dot after it is malformed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FormControlSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('emailInputNeedsDotAfterAt', 0, () => {
      expect(hasEmailShape('user@example')).assertFalse();
      expect(hasEmailShape('user@example.com')).assertTrue();
      expect(hasEmailShape('@example.com')).assertFalse();
      expect(hasEmailShape('user@.com')).assertFalse();
      logStep('formControlSemanticsTest', 'email input needs a dotted domain');
    });

    /**
     * @tc.name   errorOrderIsStable
     * @tc.desc   An all empty form reports the four empty codes in field order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FormControlSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('errorOrderIsStable', 0, () => {
      const errors = ContactValidation.validate(new Contact());
      expect(errors.length).assertEqual(4);
      expect(errors[0]).assertEqual('name-empty');
      expect(errors[1]).assertEqual('phone-empty');
      expect(errors[2]).assertEqual('email-empty');
      expect(errors[3]).assertEqual('address-empty');
      logStep('formControlSemanticsTest', 'error order follows field order');
    });

    /**
     * @tc.name   duplicateBlocksSubmitAgainstSeed
     * @tc.desc   A complete draft with a seed name is blocked by the duplicate code alone.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FormControlSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('duplicateBlocksSubmitAgainstSeed', 0, () => {
      const seed = createSeedContacts();
      const draft = contactOf('贝拉', '13900002001', 'bella.form@example.com', '天津市和平区', '', CATEGORY_B);
      const errors = ContactValidation.validate(draft, seed);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('name-duplicate');
      expect(ContactValidation.canSubmit(draft, seed)).assertFalse();
      expect(SearchEngine.countCategory(seed, CATEGORY_B)).assertEqual(3);
      logStep('formControlSemanticsTest', 'duplicate blocks submit against the seed');
    });

    /**
     * @tc.name   avatarAndCategoryAreOptional
     * @tc.desc   Empty avatar and category are accepted because only four fields are validated.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FormControlSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('avatarAndCategoryAreOptional', 0, () => {
      const draft = contactOf('裴照', '13200000091', 'peizhao.form@example.com', '山西省太原市小店区', '', '');
      const errors = ContactValidation.validate(draft);
      expect(errors.length).assertEqual(0);
      expect(draft.avatar).assertEqual('');
      expect(draft.category).assertEqual('');
      expect(ContactValidation.canSubmit(draft)).assertTrue();
      logStep('formControlSemanticsTest', 'avatar and category are optional');
    });

    /**
     * @tc.name   actionLabelsAreDistinct
     * @tc.desc   The three action labels are pairwise different strings.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FormControlSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('actionLabelsAreDistinct', 0, () => {
      expect(ACTION_ADD === ACTION_EDIT).assertFalse();
      expect(ACTION_EDIT === ACTION_DELETE).assertFalse();
      expect(ACTION_ADD === ACTION_DELETE).assertFalse();
      expect(ACTION_ADD.length).assertEqual(5);
      expect(ACTION_DELETE.length).assertEqual(5);
      logStep('formControlSemanticsTest', 'action labels are distinct');
    });

    /**
     * @tc.name   overLongNameBlockedByInputLimit
     * @tc.desc   A thirteen character name is rejected with name-too-long before routing.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FormControlSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('overLongNameBlockedByInputLimit', 0, () => {
      const draft = contactOf('ABCDEFGHIJKLM', '13800138060', 'long.name@example.com', '上海市徐汇区', '', CATEGORY_A);
      expect(draft.name.length).assertEqual(13);
      const errors = ContactValidation.validate(draft);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('name-too-long');
      expect(ContactValidation.canSubmit(draft)).assertFalse();
      logStep('formControlSemanticsTest', 'over long name is blocked');
    });

    /**
     * @tc.name   overLongAddressBlockedByInputLimit
     * @tc.desc   A one hundred and one character address is rejected with address-too-long.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FormControlSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('overLongAddressBlockedByInputLimit', 0, () => {
      let address = '';
      for (let index = 0; index < 101; index++) {
        address = address + 'x';
      }
      const draft = contactOf('林岸', '13800138061', 'lin.long@example.com', address, '', CATEGORY_A);
      expect(address.length).assertEqual(101);
      expect(ContactValidation.validate(draft).indexOf('address-too-long') >= 0).assertTrue();
      expect(ContactValidation.canSubmit(draft)).assertFalse();
      logStep('formControlSemanticsTest', 'over long address is blocked');
    });

    /**
     * @tc.name   deleteIntentNeverOpensTheForm
     * @tc.desc   A delete intent reports the list route and its description keeps the name.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FormControlSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteIntentNeverOpensTheForm', 0, () => {
      const intent = new RouteIntent(ACTION_DELETE, contactOf('贝拉', '11111111111', 'bella@example.com',
        '湖北省武汉市江汉区', '', CATEGORY_B));
      expect(intent.url()).assertEqual(ROUTE_LIST);
      expect(intent.describe()).assertEqual('删除联系人:贝拉:pages/view/OperateRDBInTaskPool');
      expect(intent.describe().indexOf(ROUTE_EDIT)).assertEqual(-1);
      expect(RouteIntent.isKnownAction(ACTION_DELETE)).assertTrue();
      logStep('formControlSemanticsTest', 'delete intent stays on the list');
    });

    /**
     * @tc.name   letterInPhoneReportsOneCode
     * @tc.desc   A single letter in the phone reports phone-not-numeric only.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FormControlSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('letterInPhoneReportsOneCode', 0, () => {
      const draft = contactOf('裴云', '1320000x92', 'peiyun.form@example.com', '山西省大同市云冈区', '', CATEGORY_B);
      const errors = ContactValidation.validate(draft);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('phone-not-numeric');
      expect(errors.indexOf('phone-too-long')).assertEqual(-1);
      logStep('formControlSemanticsTest', 'letter in phone reports one code');
    });

    /**
     * @tc.name   submitEnabledAfterCorrection
     * @tc.desc   The same draft is blocked, then accepted once the malformed field is corrected.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FormControlSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('submitEnabledAfterCorrection', 0, () => {
      const broken = contactOf('裴风', '1320000', 'peifeng.example.com', '山西省运城市盐湖区', '', CATEGORY_B);
      expect(ContactValidation.canSubmit(broken)).assertFalse();
      const fixed = contactOf('裴风', '1320000', 'peifeng@example.com', '山西省运城市盐湖区', '', CATEGORY_B);
      expect(ContactValidation.canSubmit(fixed)).assertTrue();
      expect(ContactValidation.validate(fixed).length).assertEqual(0);
      expect(fixed.phone).assertEqual(broken.phone);
      logStep('formControlSemanticsTest', 'submit enabled after correction');
    });

    /**
     * @tc.name   twoErrorsReportedTogether
     * @tc.desc   An empty name and an empty address are reported in one validation pass.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FormControlSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('twoErrorsReportedTogether', 0, () => {
      const draft = contactOf('', '13800138062', 'lin.two@example.com', '', '', CATEGORY_A);
      const errors = ContactValidation.validate(draft);
      expect(errors.length).assertEqual(2);
      expect(errors[0]).assertEqual('name-empty');
      expect(errors[1]).assertEqual('address-empty');
      expect(ContactValidation.canSubmit(draft)).assertFalse();
      logStep('formControlSemanticsTest', 'two errors are reported together');
    });

    /**
     * @tc.name   duplicateAndShapeErrorCoexist
     * @tc.desc   A seed name plus a broken address reports both duplicate and address codes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FormControlSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('duplicateAndShapeErrorCoexist', 0, () => {
      const seed = createSeedContacts();
      const draft = contactOf('贝拉', '13900002002', 'bella.coexist@example.com', '', '', CATEGORY_B);
      const errors = ContactValidation.validate(draft, seed);
      expect(errors.length).assertEqual(2);
      expect(errors[0]).assertEqual('address-empty');
      expect(errors[1]).assertEqual('name-duplicate');
      expect(ContactValidation.canSubmit(draft, seed)).assertFalse();
      logStep('formControlSemanticsTest', 'duplicate and shape errors coexist');
    });
  });
}
