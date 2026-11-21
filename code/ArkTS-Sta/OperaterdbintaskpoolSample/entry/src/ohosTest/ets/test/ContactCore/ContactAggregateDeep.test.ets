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
 * ContactCore / ContactAggregateDeep suite.
 *
 * The suite pins the aggregate behaviour of the real Contact and RouterParams
 * carriers together with the metric, snapshot and route helpers of the shared
 * driver.
 *
 * Source anchors:
 *   Contact.ets:31-47              six fields, all defaulting to ''
 *   Contact.ets:49-57              RouterParams text/data pair
 *   ContactManager.ets:36-48       singleton plus copy-on-read
 *   SharedDriver.ets:88-120        seed rows, cloneContact, sameContact
 *   SharedDriver.ets:834-864       ContactMetrics over a row array
 *   SharedDriver.ets:867-910       ContactSnapshot and snapshot arrays
 *   SharedDriver.ets:764-795       RouteRequest action to route mapping
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact, RouterParams } from '../../../../main/ets/pages/model/Contact';
import { ContactManager } from '../../../../main/ets/pages/model/ContactManager';
import {
  ACTION_ADD,
  ACTION_DELETE,
  ACTION_EDIT,
  ROUTE_EDIT,
  ROUTE_LIST,
  createSeedContacts,
  contactOf,
  cloneContact,
  sameContact,
  contactNames,
  joined,
  uniqueStrings,
  countOf,
  ContactMetrics,
  ContactSnapshot,
  snapshotsOf,
  sameSnapshotArray,
  RouteRequest,
  resetContactManager
} from '../Shared/SharedDriver';

/** One label plus the rows that carry it, used by the aggregate grouping cases. */
class AggregateGroup {
  public label: string;
  public rows: Contact[];

  constructor(label: string, rows: Contact[]) {
    this.label = label;
    this.rows = rows;
  }

  public size(): number {
    return this.rows.length;
  }

  public names(): string[] {
    return contactNames(this.rows);
  }
}

/** Groups rows by the named column while keeping first-appearance order of labels. */
function groupRowsBy(rows: Contact[], field: string): AggregateGroup[] {
  const labels: string[] = [];
  for (let index = 0; index < rows.length; index++) {
    const value = field === 'email' ? rows[index].email : rows[index].phone;
    if (labels.indexOf(value) < 0) {
      labels.push(value);
    }
  }
  const groups: AggregateGroup[] = [];
  for (let index = 0; index < labels.length; index++) {
    const members: Contact[] = [];
    for (let inner = 0; inner < rows.length; inner++) {
      const value = field === 'email' ? rows[inner].email : rows[inner].phone;
      if (value === labels[index]) {
        members.push(rows[inner]);
      }
    }
    groups.push(new AggregateGroup(labels[index], members));
  }
  return groups;
}

/** Returns the group with the largest membership, or an empty group for no rows. */
function widestGroup(groups: AggregateGroup[]): AggregateGroup {
  const empty = new AggregateGroup('', []);
  if (groups.length === 0) {
    return empty;
  }
  let widest = groups[0];
  for (let index = 1; index < groups.length; index++) {
    if (groups[index].size() > widest.size()) {
      widest = groups[index];
    }
  }
  return widest;
}

export default function contactAggregateDeepTest(): void {
  describe('ContactAggregateDeep', () => {
    beforeAll(() => {
      logSuite('ContactAggregateDeep', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      resetContactManager();
      logSuite('ContactAggregateDeep', 'end');
    });

    /**
     * @tc.name   contactDefaultConstructorLeavesEveryFieldEmpty
     * @tc.desc   The no-argument Contact constructor in Contact.ets:38-46 writes six empty strings.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactAggregateDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('contactDefaultConstructorLeavesEveryFieldEmpty', 0, () => {
      const contact = new Contact();
      expect(contact.name).assertEqual('');
      expect(contact.phone).assertEqual('');
      expect(contact.email).assertEqual('');
      expect(contact.address).assertEqual('');
      expect(contact.avatar).assertEqual('');
      expect(contact.category).assertEqual('');
      const blank = joined([contact.name, contact.phone, contact.email, contact.address], '|');
      expect(blank).assertEqual('|||');
      expect(contact.name.length).assertEqual(0);
    });

    /**
     * @tc.name   contactFullConstructorPreservesAllSixValues
     * @tc.desc   Supplying all six constructor arguments keeps every value in the declared field.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactAggregateDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('contactFullConstructorPreservesAllSixValues', 0, () => {
      const contact = new Contact('林岸', '13800138000', 'lin@example.com', '上海市徐汇区',
        'app.media.avatar_lin', 'C');
      expect(contact.name).assertEqual('林岸');
      expect(contact.phone).assertEqual('13800138000');
      expect(contact.email).assertEqual('lin@example.com');
      expect(contact.address).assertEqual('上海市徐汇区');
      expect(contact.avatar).assertEqual('app.media.avatar_lin');
      expect(contact.category).assertEqual('C');
      expect(joined([contact.name, contact.category], '@')).assertEqual('林岸@C');
    });

    /**
     * @tc.name   contactPartialConstructorKeepsTrailingDefaults
     * @tc.desc   Only the first two arguments are given, so the remaining four fields stay empty.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactAggregateDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('contactPartialConstructorKeepsTrailingDefaults', 0, () => {
      const contact = new Contact('贝拉', '11111111111');
      expect(contact.name).assertEqual('贝拉');
      expect(contact.phone).assertEqual('11111111111');
      expect(contact.email).assertEqual('');
      expect(contact.address).assertEqual('');
      expect(contact.avatar).assertEqual('');
      expect(contact.category).assertEqual('');
      expect(contact.phone.length).assertEqual(11);
    });

    /**
     * @tc.name   contactFieldsRemainWritableAfterConstruction
     * @tc.desc   The six public fields can be assigned later and then match a fully built contact.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactAggregateDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('contactFieldsRemainWritableAfterConstruction', 0, () => {
      const contact = new Contact();
      contact.name = '戴维维';
      contact.phone = '11111111111';
      contact.email = 'katrina@example.com';
      contact.address = '吉林省长春市朝阳区';
      contact.category = 'D';
      const reference = contactOf('戴维维', '11111111111', 'katrina@example.com',
        '吉林省长春市朝阳区', '', 'D');
      expect(sameContact(contact, reference)).assertTrue();
      expect(contact.name).assertEqual(reference.name);
      expect(contact.avatar).assertEqual('');
      expect(contact.email).assertEqual('katrina@example.com');
      logStep('contactAggregateDeepTest', 'writable field check for 戴维维');
    });

    /**
     * @tc.name   routerParamsUndefinedInputsStayUndefined
     * @tc.desc   RouterParams accepts undefined for both slots, while a built request fills them.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactAggregateDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('routerParamsUndefinedInputsStayUndefined', 0, () => {
      const empty = new RouterParams(undefined, undefined);
      expect(empty.text === undefined).assertTrue();
      expect(empty.data === undefined).assertTrue();
      const carried = new RouteRequest(ACTION_ADD, createSeedContacts()[0]).toParams();
      expect(carried.text !== undefined).assertTrue();
      expect(carried.data !== undefined).assertTrue();
      expect(carried.text).assertEqual(ACTION_ADD);
    });

    /**
     * @tc.name   routerParamsKeepsTheSameContactReference
     * @tc.desc   RouterParams stores the Contact by reference, so a later field update is visible.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactAggregateDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('routerParamsKeepsTheSameContactReference', 0, () => {
      const contact = new Contact('康纳', '10000000000', 'connor@example.com', '辽宁省沈阳市沈河区', '', 'C');
      const params = new RouterParams(ACTION_EDIT, contact);
      const stored = params.data as Contact;
      expect(stored === contact).assertTrue();
      contact.phone = '10999999999';
      expect((params.data as Contact).phone).assertEqual('10999999999');
      expect(contact.name).assertEqual('康纳');
      expect(params.text).assertEqual(ACTION_EDIT);
    });

    /**
     * @tc.name   routerParamsTextIsIndependentOfContactName
     * @tc.desc   The action text slot is a separate string; renaming the payload does not alter it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactAggregateDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('routerParamsTextIsIndependentOfContactName', 0, () => {
      const contact = contactOf('艾登', '17777777777', 'cameron@example.com', '陕西省西安市雁塔区', '', 'E');
      const params = new RouterParams(ACTION_DELETE, contact);
      expect(params.text).assertEqual(ACTION_DELETE);
      contact.name = '艾登改';
      expect(params.text).assertEqual(ACTION_DELETE);
      expect((params.data as Contact).name).assertEqual('艾登改');
      expect(params.text !== (params.data as Contact).name).assertTrue();
      expect(RouteRequest.isKnownAction(params.text as string)).assertTrue();
    });

    /**
     * @tc.name   cloneContactProducesEqualButDistinctInstance
     * @tc.desc   cloneContact copies the six values into a new object that sameContact accepts.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactAggregateDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('cloneContactProducesEqualButDistinctInstance', 0, () => {
      const source = createSeedContacts()[2];
      const copy = cloneContact(source);
      expect(copy === source).assertFalse();
      expect(sameContact(copy, source)).assertTrue();
      expect(copy.name).assertEqual('贝拉');
      expect(copy.phone).assertEqual('11111111111');
      expect(copy.category).assertEqual('B');
      expect(copy.email).assertEqual('bella@example.com');
    });

    /**
     * @tc.name   cloneContactIsolatesLaterMutation
     * @tc.desc   Editing the clone leaves the source row untouched, including its email and address.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactAggregateDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('cloneContactIsolatesLaterMutation', 0, () => {
      const source = createSeedContacts()[8];
      const copy = cloneContact(source);
      copy.name = '丹尼尔改';
      copy.phone = '18888888888';
      copy.email = 'changed@example.com';
      copy.category = 'F';
      expect(source.name).assertEqual('丹尼尔');
      expect(source.phone).assertEqual('17777777777');
      expect(source.email).assertEqual('cameron@example.com');
      expect(source.category).assertEqual('D');
      expect(sameContact(copy, source)).assertFalse();
      expect(copy.address).assertEqual(source.address);
    });

    /**
     * @tc.name   sameContactRejectsSingleFieldDifferences
     * @tc.desc   Changing exactly one of the six fields makes sameContact return false every time.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactAggregateDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sameContactRejectsSingleFieldDifferences', 0, () => {
      const base = createSeedContacts()[0];
      const otherName = contactOf('艾德里安改', base.phone, base.email, base.address, base.avatar, base.category);
      const otherPhone = contactOf(base.name, '13333333334', base.email, base.address, base.avatar, base.category);
      const otherEmail = contactOf(base.name, base.phone, 'other@example.com', base.address, base.avatar, base.category);
      const otherAddress = contactOf(base.name, base.phone, base.email, '北京市东城区', base.avatar, base.category);
      const otherAvatar = contactOf(base.name, base.phone, base.email, base.address, 'app.media.avatar_a', base.category);
      const otherCategory = contactOf(base.name, base.phone, base.email, base.address, base.avatar, 'F');
      expect(sameContact(base, otherName)).assertFalse();
      expect(sameContact(base, otherPhone)).assertFalse();
      expect(sameContact(base, otherEmail)).assertFalse();
      expect(sameContact(base, otherAddress)).assertFalse();
      expect(sameContact(base, otherAvatar)).assertFalse();
      expect(sameContact(base, otherCategory)).assertFalse();
      expect(sameContact(base, cloneContact(base))).assertTrue();
    });

    /**
     * @tc.name   sameContactAcceptsTwoIndependentCopies
     * @tc.desc   Two separately constructed rows with identical values compare equal, even at index 14.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactAggregateDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('sameContactAcceptsTwoIndependentCopies', 0, () => {
      const seed = createSeedContacts();
      const left = seed[14];
      const right = contactOf('法里', '11111111111', 'katrina@example.com', '吉林省长春市朝阳区', '', 'F');
      expect(left === right).assertFalse();
      expect(sameContact(left, right)).assertTrue();
      expect(right.category).assertEqual('F');
      expect(right.name).assertEqual('法里');
      expect(joined([left.name, right.name], '=')).assertEqual('法里=法里');
    });

    /**
     * @tc.name   seedAggregateCollectsFifteenRows
     * @tc.desc   The seed catalog has fifteen rows and the first and last names pin the ordering.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactAggregateDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('seedAggregateCollectsFifteenRows', 0, () => {
      const rows = createSeedContacts();
      expect(rows.length).assertEqual(15);
      expect(rows[0].name).assertEqual('艾德里安');
      expect(rows[14].name).assertEqual('法里');
      expect(rows[14].category).assertEqual('F');
      expect(contactNames(rows).length).assertEqual(15);
      expect(countOf(contactNames(rows), '本')).assertEqual(1);
      expect(rows[3].phone).assertEqual('12222222222');
    });

    /**
     * @tc.name   seedMetricsCountUniqueNamesAndCategories
     * @tc.desc   ContactMetrics reports fifteen rows, fifteen unique names and six categories.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactAggregateDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('seedMetricsCountUniqueNamesAndCategories', 0, () => {
      const rows = createSeedContacts();
      const metrics = ContactMetrics.from(rows);
      expect(metrics.total).assertEqual(15);
      expect(metrics.uniqueNames).assertEqual(15);
      expect(metrics.duplicateNames).assertEqual(0);
      expect(metrics.categories).assertEqual(6);
      expect(metrics.uniqueNames).assertEqual(uniqueStrings(contactNames(rows)).length);
      expect(metrics.total - metrics.uniqueNames).assertEqual(metrics.duplicateNames);
    });

    /**
     * @tc.name   seedMetricsSumPhoneDigitsAcrossRows
     * @tc.desc   Every seed phone has eleven digits, so the aggregate digit count is 165.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactAggregateDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('seedMetricsSumPhoneDigitsAcrossRows', 0, () => {
      const rows = createSeedContacts();
      let expected = 0;
      for (let index = 0; index < rows.length; index++) {
        expected = expected + rows[index].phone.length;
      }
      const metrics = ContactMetrics.from(rows);
      expect(expected).assertEqual(165);
      expect(metrics.totalPhoneDigits).assertEqual(165);
      expect(metrics.totalPhoneDigits).assertEqual(expected);
      expect(metrics.totalPhoneDigits / metrics.total).assertEqual(11);
    });

    /**
     * @tc.name   seedMetricsFillRatioIsOneForUniqueSeed
     * @tc.desc   With no repeated names the fill ratio equals 1 and stays between 0 and 1.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactAggregateDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('seedMetricsFillRatioIsOneForUniqueSeed', 0, () => {
      const metrics = ContactMetrics.from(createSeedContacts());
      expect(metrics.fillRatio()).assertEqual(1);
      expect(metrics.fillRatio() > 0).assertTrue();
      expect(metrics.fillRatio() <= 1).assertTrue();
      const withDuplicate = createSeedContacts();
      withDuplicate.push(cloneContact(withDuplicate[0]));
      const mixed = ContactMetrics.from(withDuplicate);
      expect(mixed.duplicateNames).assertEqual(1);
      expect(mixed.uniqueNames).assertEqual(15);
      expect(mixed.fillRatio() < 1).assertTrue();
    });

    /**
     * @tc.name   metricsFingerprintIsStableForSameRows
     * @tc.desc   Two metric snapshots over identical rows produce the same fingerprint value.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactAggregateDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('metricsFingerprintIsStableForSameRows', 0, () => {
      const first = ContactMetrics.from(createSeedContacts());
      const second = ContactMetrics.from(createSeedContacts());
      expect(first.fingerprint()).assertEqual(second.fingerprint());
      expect(first.fingerprint()).assertEqual(first.fingerprint());
      expect(first.fingerprint() >= 0).assertTrue();
      expect(first.fingerprint() < 1000003).assertTrue();
      expect(first.fingerprint() === second.fingerprint()).assertTrue();
    });

    /**
     * @tc.name   metricsFingerprintIgnoresRowOrder
     * @tc.desc   Reversing the seed order keeps all aggregate counters, so the fingerprint is identical.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactAggregateDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('metricsFingerprintIgnoresRowOrder', 0, () => {
      const rows = createSeedContacts();
      const reversed: Contact[] = [];
      for (let index = rows.length - 1; index >= 0; index--) {
        reversed.push(rows[index]);
      }
      const forward = ContactMetrics.from(rows);
      const backward = ContactMetrics.from(reversed);
      expect(backward.total).assertEqual(forward.total);
      expect(backward.uniqueNames).assertEqual(forward.uniqueNames);
      expect(backward.fingerprint()).assertEqual(forward.fingerprint());
      expect(backward.totalPhoneDigits).assertEqual(forward.totalPhoneDigits);
      expect(reversed[0].name).assertEqual('法里');
      expect(reversed[14].name).assertEqual('艾德里安');
      const reversedNames: string[] = [];
      for (let index = rows.length - 1; index >= 0; index--) {
        reversedNames.push(rows[index].name);
      }
      expect(joined(reversedNames, ',')).assertEqual(joined(contactNames(reversed), ','));
      expect(joined(reversedNames, ',') === joined(contactNames(rows), ',')).assertFalse();
    });

    /**
     * @tc.name   snapshotArrayCapturesSeedOrderAndValues
     * @tc.desc   snapshotsOf keeps the row order and copies name, phone, email, address and category.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactAggregateDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('snapshotArrayCapturesSeedOrderAndValues', 0, () => {
      const rows = createSeedContacts();
      const snapshots = snapshotsOf(rows);
      expect(snapshots.length).assertEqual(15);
      expect(snapshots[0].name).assertEqual('艾德里安');
      expect(snapshots[6].phone).assertEqual('10000000000');
      expect(snapshots[6].category).assertEqual('C');
      expect(snapshots[14].email).assertEqual('katrina@example.com');
      expect(snapshots[14].sameAs(new ContactSnapshot(rows[14]))).assertTrue();
    });

    /**
     * @tc.name   snapshotOmitsAvatarFromDescriptor
     * @tc.desc   ContactSnapshot.describe joins five slash separated parts and never the avatar slot.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactAggregateDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotOmitsAvatarFromDescriptor', 0, () => {
      const row = contactOf('艾里', '11111111111', 'katrina@example.com', '吉林省长春市朝阳区',
        'app.media.avatar_eli', 'E');
      const snapshot = new ContactSnapshot(row);
      const described = snapshot.describe();
      expect(described).assertEqual('艾里/11111111111/katrina@example.com/吉林省长春市朝阳区/E');
      expect(described.indexOf('app.media.avatar_eli')).assertEqual(-1);
      expect(described.split('/').length).assertEqual(5);
      expect(snapshot.category).assertEqual('E');
      expect(snapshot.name).assertEqual(row.name);
    });

    /**
     * @tc.name   clonedSnapshotArrayMatchesTheOriginalRows
     * @tc.desc   Cloning every row before snapshotting produces an identical snapshot array.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactAggregateDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('clonedSnapshotArrayMatchesTheOriginalRows', 0, () => {
      const rows = createSeedContacts();
      const copies: Contact[] = [];
      for (let index = 0; index < rows.length; index++) {
        copies.push(cloneContact(rows[index]));
      }
      const original = snapshotsOf(rows);
      const cloned = snapshotsOf(copies);
      expect(sameSnapshotArray(original, cloned)).assertTrue();
      expect(original.length === cloned.length).assertTrue();
      expect(cloned[3].name).assertEqual('本');
      expect(cloned[12].category).assertEqual('E');
      expect(sameSnapshotArray(original, snapshotsOf(rows.slice(0, 14)))).assertFalse();
    });

    /**
     * @tc.name   snapshotArrayDiffersAfterSinglePhoneEdit
     * @tc.desc   Editing one phone number breaks snapshot equality only at that row index.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactAggregateDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotArrayDiffersAfterSinglePhoneEdit', 0, () => {
      const rows = createSeedContacts();
      const before = snapshotsOf(rows);
      rows[5].phone = '17777777778';
      const after = snapshotsOf(rows);
      expect(sameSnapshotArray(before, after)).assertFalse();
      expect(before[5].sameAs(after[5])).assertFalse();
      expect(before[4].sameAs(after[4])).assertTrue();
      expect(after[5].phone).assertEqual('17777777778');
      expect(before[5].phone).assertEqual('17777777777');
    });

    /**
     * @tc.name   routeRequestForAddTargetsTheEditPage
     * @tc.desc   Both add and edit actions resolve to AddressBookEdit while delete resolves later.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactAggregateDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('routeRequestForAddTargetsTheEditPage', 0, () => {
      const contact = createSeedContacts()[1];
      const request = new RouteRequest(ACTION_ADD, contact);
      expect(request.url()).assertEqual(ROUTE_EDIT);
      expect(RouteRequest.routeFor(ACTION_EDIT)).assertEqual(ROUTE_EDIT);
      expect(request.describe().indexOf(ROUTE_EDIT) > 0).assertTrue();
      expect(request.contact === contact).assertTrue();
      expect(request.action).assertEqual(ACTION_ADD);
    });

    /**
     * @tc.name   routeRequestForDeleteFallsBackToTheListPage
     * @tc.desc   A delete request routes back to the list page and still carries its payload contact.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactAggregateDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('routeRequestForDeleteFallsBackToTheListPage', 0, () => {
      const contact = cloneContact(createSeedContacts()[10]);
      const request = new RouteRequest(ACTION_DELETE, contact);
      expect(request.url()).assertEqual(ROUTE_LIST);
      expect(RouteRequest.routeFor(ACTION_DELETE)).assertEqual(ROUTE_LIST);
      expect(request.contact.category).assertEqual('E');
      expect(request.contact.name).assertEqual('艾登');
      const params = request.toParams();
      expect((params.data as Contact).phone).assertEqual('17777777777');
    });

    /**
     * @tc.name   routeRequestUnknownActionIsNotKnown
     * @tc.desc   Only the three production action literals are known; others fall back to the list.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactAggregateDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('routeRequestUnknownActionIsNotKnown', 0, () => {
      expect(RouteRequest.isKnownAction(ACTION_ADD)).assertTrue();
      expect(RouteRequest.isKnownAction(ACTION_EDIT)).assertTrue();
      expect(RouteRequest.isKnownAction(ACTION_DELETE)).assertTrue();
      expect(RouteRequest.isKnownAction('查看联系人')).assertFalse();
      expect(RouteRequest.isKnownAction('')).assertFalse();
      expect(RouteRequest.routeFor('查看联系人')).assertEqual(ROUTE_LIST);
      expect(RouteRequest.isKnownAction(ACTION_ADD + ' ')).assertFalse();
    });

    /**
     * @tc.name   routeRequestDescribeConcatenatesActionNameAndRoute
     * @tc.desc   describe() emits action:name:route, so the three segments can be split back apart.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactAggregateDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('routeRequestDescribeConcatenatesActionNameAndRoute', 0, () => {
      const contact = contactOf('法比而', '10000000000', 'connor@example.com', '辽宁省沈阳市沈河区', '', 'F');
      const request = new RouteRequest(ACTION_EDIT, contact);
      const described = request.describe();
      const segments = described.split(':');
      expect(segments.length).assertEqual(3);
      expect(segments[0]).assertEqual(ACTION_EDIT);
      expect(segments[1]).assertEqual('法比而');
      expect(segments[2]).assertEqual(ROUTE_EDIT);
      expect(described.startsWith(ACTION_EDIT)).assertTrue();
      expect(described.endsWith(ROUTE_EDIT)).assertTrue();
    });

    /**
     * @tc.name   aggregateCategoryOrderFollowsFirstAppearance
     * @tc.desc   Aggregating the seed rows yields categories in first-appearance order A to F.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactAggregateDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('aggregateCategoryOrderFollowsFirstAppearance', 0, () => {
      const rows = createSeedContacts();
      const categories: string[] = [];
      for (let index = 0; index < rows.length; index++) {
        if (categories.indexOf(rows[index].category) < 0) {
          categories.push(rows[index].category);
        }
      }
      expect(categories.length).assertEqual(6);
      expect(joined(categories, '')).assertEqual('ABCDEF');
      expect(categories[0]).assertEqual('A');
      expect(categories[5]).assertEqual('F');
      expect(countOf(categories, 'C')).assertEqual(1);
      expect(categories.indexOf('D')).assertEqual(3);
    });
    /**
     * @tc.name   aggregatePairwiseComparisonFindsNoEqualRows
     * @tc.desc   All 105 unordered seed pairs differ by at least one field while each row equals itself.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactAggregateDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('aggregatePairwiseComparisonFindsNoEqualRows', 0, () => {
      const rows = createSeedContacts();
      let compared = 0;
      let equalPairs = 0;
      let selfEqual = 0;
      for (let outer = 0; outer < rows.length; outer++) {
        if (sameContact(rows[outer], rows[outer])) {
          selfEqual = selfEqual + 1;
        }
        for (let inner = outer + 1; inner < rows.length; inner++) {
          compared = compared + 1;
          if (sameContact(rows[outer], rows[inner])) {
            equalPairs = equalPairs + 1;
          }
        }
      }
      expect(compared).assertEqual(105);
      expect(equalPairs).assertEqual(0);
      expect(selfEqual).assertEqual(15);
      expect(rows.length * (rows.length - 1) / 2).assertEqual(compared);
      expect(equalPairs + selfEqual).assertEqual(15);
      logStep('contactAggregateDeepTest', 'pairwise comparisons=' + String(compared));
    });

    /**
     * @tc.name   aggregateEmailGroupsCollapseRepeatedProfiles
     * @tc.desc   Grouping the seed by email yields eight labels, and the widest group has four rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactAggregateDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('aggregateEmailGroupsCollapseRepeatedProfiles', 0, () => {
      const groups = groupRowsBy(createSeedContacts(), 'email');
      expect(groups.length).assertEqual(8);
      expect(widestGroup(groups).label).assertEqual('katrina@example.com');
      expect(widestGroup(groups).size()).assertEqual(4);
      const cameron = groups[5];
      expect(cameron.label).assertEqual('cameron@example.com');
      expect(cameron.size()).assertEqual(3);
      expect(joined(cameron.names(), '>')).assertEqual('卡梅隆>丹尼尔>艾登');
      let sum: number = 0;
      for (let index = 0; index < groups.length; index++) {
        sum = sum + groups[index].size();
      }
      expect(sum).assertEqual(15);
      expect(groups[0].label).assertEqual('aidelian@example.com');
      expect(groups[0].size()).assertEqual(1);
    });

    /**
     * @tc.name   aggregatePhoneGroupsShareRegionalAddresses
     * @tc.desc   Six phone numbers cover the catalog and the busiest number owns five rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactAggregateDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('aggregatePhoneGroupsShareRegionalAddresses', 0, () => {
      const rows = createSeedContacts();
      const groups = groupRowsBy(rows, 'phone');
      expect(groups.length).assertEqual(6);
      const busiest = widestGroup(groups);
      expect(busiest.label).assertEqual('11111111111');
      expect(busiest.size()).assertEqual(5);
      expect(countOf(contactNames(busiest.rows), '法里')).assertEqual(1);
      expect(busiest.rows[0].address).assertEqual('湖北省武汉市江汉区');
      expect(busiest.rows[4].address).assertEqual('吉林省长春市朝阳区');
      expect(groups[0].label).assertEqual('13333333333');
      expect(groups[0].size()).assertEqual(1);
      expect(groups[5].label).assertEqual('10000000000');
    });

    /**
     * @tc.name   aggregateMetricsAfterAppendingClonesTrackGrowth
     * @tc.desc   Appending two cloned rows raises the total to 17 while unique names stay at 15.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactAggregateDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('aggregateMetricsAfterAppendingClonesTrackGrowth', 0, () => {
      const base = createSeedContacts();
      const grown = createSeedContacts();
      grown.push(cloneContact(grown[0]));
      grown.push(cloneContact(grown[4]));
      const before = ContactMetrics.from(base);
      const after = ContactMetrics.from(grown);
      expect(after.total).assertEqual(17);
      expect(after.uniqueNames).assertEqual(15);
      expect(after.duplicateNames).assertEqual(2);
      expect(after.categories).assertEqual(before.categories);
      expect(after.totalPhoneDigits).assertEqual(before.totalPhoneDigits + 22);
      expect(after.fillRatio() < before.fillRatio()).assertTrue();
      expect(after.fingerprint() === before.fingerprint()).assertFalse();
      expect(grown[16].name).assertEqual('本杰明');
    });
    /**
     * @tc.name   aggregateCategoryHistogramTotalsPerLabel
     * @tc.desc   Joining names per category reproduces the six seed groups with 2/3/3/2/3/2 members.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactAggregateDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('aggregateCategoryHistogramTotalsPerLabel', 0, () => {
      const rows = createSeedContacts();
      const labels = ['A', 'B', 'C', 'D', 'E', 'F'];
      const joinedByLabel: string[] = [];
      for (let index = 0; index < labels.length; index++) {
        const members: string[] = [];
        for (let inner = 0; inner < rows.length; inner++) {
          if (rows[inner].category === labels[index]) {
            members.push(rows[inner].name);
          }
        }
        joinedByLabel.push(joined(members, '>'));
      }
      expect(joinedByLabel[0]).assertEqual('艾德里安>阿诺德');
      expect(joinedByLabel[1]).assertEqual('贝拉>本>本杰明');
      expect(joinedByLabel[2]).assertEqual('卡梅隆>康纳>卡特琳娜');
      expect(joinedByLabel[3]).assertEqual('丹尼尔>戴维维');
      expect(joinedByLabel[4]).assertEqual('艾登>艾拉>艾里');
      expect(joinedByLabel[5]).assertEqual('法比而>法里');
      let members = 0;
      for (let index = 0; index < labels.length; index++) {
        members = members + joinedByLabel[index].split('>').length;
      }
      expect(members).assertEqual(15);
      expect(labels.length).assertEqual(6);
    });

    /**
     * @tc.name   aggregateSnapshotOfSubsetKeepsRelativeOrder
     * @tc.desc   Slicing rows 2..8 before snapshotting keeps the original relative order of seven rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactAggregateDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('aggregateSnapshotOfSubsetKeepsRelativeOrder', 0, () => {
      const rows = createSeedContacts();
      const subset = rows.slice(2, 9);
      const snapshots = snapshotsOf(subset);
      expect(snapshots.length).assertEqual(7);
      expect(snapshots[0].name).assertEqual('贝拉');
      expect(snapshots[3].name).assertEqual('卡梅隆');
      expect(snapshots[6].name).assertEqual('丹尼尔');
      expect(joined(snapshots[0].describe().split('/'), ' ').indexOf('贝拉') >= 0).assertTrue();
      expect(sameSnapshotArray(snapshots, snapshotsOf(rows.slice(2, 9)))).assertTrue();
      expect(sameSnapshotArray(snapshots, snapshotsOf(rows.slice(3, 10)))).assertFalse();
      expect(snapshots[6].category).assertEqual('D');
    });

    /**
     * @tc.name   aggregateRouteRequestsForEverySeedRowStayKnown
     * @tc.desc   Building an add request for each seed row yields fifteen distinct known edit routes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactAggregateDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('aggregateRouteRequestsForEverySeedRowStayKnown', 0, () => {
      const rows = createSeedContacts();
      const described: string[] = [];
      let known = 0;
      for (let index = 0; index < rows.length; index++) {
        const request = new RouteRequest(ACTION_ADD, rows[index]);
        if (RouteRequest.isKnownAction(request.action)) {
          known = known + 1;
        }
        expect(request.url()).assertEqual(ROUTE_EDIT);
        described.push(request.describe());
      }
      expect(known).assertEqual(15);
      expect(uniqueStrings(described).length).assertEqual(15);
      expect(described[0].startsWith(ACTION_ADD + ':')).assertTrue();
      expect(described[14].endsWith(ROUTE_EDIT)).assertTrue();
      expect(described[6].indexOf('康纳') > 0).assertTrue();
    });

    /**
     * @tc.name   aggregateMetricsOfSingleRowDefaults
     * @tc.desc   A one-row aggregate reports unit totals and a fingerprint unlike the fifteen-row seed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactAggregateDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('aggregateMetricsOfSingleRowDefaults', 0, () => {
      const single = contactOf('林岸', '13800138000', 'lin@example.com', '上海市徐汇区', '', 'C');
      const metrics = ContactMetrics.from([single]);
      expect(metrics.total).assertEqual(1);
      expect(metrics.uniqueNames).assertEqual(1);
      expect(metrics.duplicateNames).assertEqual(0);
      expect(metrics.categories).assertEqual(1);
      expect(metrics.totalPhoneDigits).assertEqual(11);
      expect(metrics.fillRatio()).assertEqual(1);
      expect(metrics.fingerprint() === ContactMetrics.from(createSeedContacts()).fingerprint()).assertFalse();
      expect(metrics.total - metrics.duplicateNames).assertEqual(1);
    });
    /**
     * @tc.name   aggregateEmptyCatalogMetricsAreAllZero
     * @tc.desc   An empty catalog yields zeroed metrics, a zero fill ratio and no grouping buckets.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactAggregateDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('aggregateEmptyCatalogMetricsAreAllZero', 0, () => {
      const empty: Contact[] = [];
      const metrics = ContactMetrics.from(empty);
      expect(metrics.total).assertEqual(0);
      expect(metrics.uniqueNames).assertEqual(0);
      expect(metrics.duplicateNames).assertEqual(0);
      expect(metrics.categories).assertEqual(0);
      expect(metrics.totalPhoneDigits).assertEqual(0);
      expect(metrics.fillRatio()).assertEqual(0);
      const groups = groupRowsBy(empty, 'email');
      expect(groups.length).assertEqual(0);
      expect(widestGroup(groups).label).assertEqual('');
      expect(widestGroup(groups).size()).assertEqual(0);
      const snapshot: ContactSnapshot[] = snapshotsOf(empty);
      expect(snapshot.length).assertEqual(0);
      expect(sameSnapshotArray(snapshot, snapshotsOf(empty))).assertTrue();
      expect(metrics.fingerprint()).assertEqual(ContactMetrics.from([]).fingerprint());
      expect(empty.length).assertEqual(0);
    });
    /**
     * @tc.name   aggregateProfileReuseAcrossCategoriesIsDetectable
     * @tc.desc   Email plus address groups repeat across categories although all names stay unique.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactAggregateDeep scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('aggregateProfileReuseAcrossCategoriesIsDetectable', 0, () => {
      const rows = createSeedContacts();
      const profiles: string[] = [];
      for (let index = 0; index < rows.length; index++) {
        profiles.push(rows[index].email + '|' + rows[index].address);
      }
      expect(uniqueStrings(profiles).length).assertEqual(8);
      expect(countOf(profiles, 'cameron@example.com|陕西省西安市雁塔区')).assertEqual(3);
      expect(countOf(profiles, 'katrina@example.com|吉林省长春市朝阳区')).assertEqual(4);
      expect(countOf(profiles, 'connor@example.com|辽宁省沈阳市沈河区')).assertEqual(3);
      expect(uniqueStrings(contactNames(rows)).length).assertEqual(15);
      expect(joined(uniqueStrings(profiles), ',').split(',').length).assertEqual(8);
      expect(profiles[8]).assertEqual(profiles[10]);
      expect(profiles[9]).assertEqual(profiles[14]);
    });
  });
}
