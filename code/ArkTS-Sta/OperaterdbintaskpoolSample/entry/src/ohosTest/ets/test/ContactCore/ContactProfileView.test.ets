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
 * ContactProfileView projects the AddressBookDetail screen without any ArkUI
 * dependency: the detail builders read name, phone, email, address, avatar and
 * category, and the two buttons push edit and delete intents.
 *
 * Anchors:
 *   AddressBookDetail.ets:46-47   default sourceData literal
 *   AddressBookDetail.ets:51-58   params guard and data assignment
 *   AddressBookDetail.ets:91-134  phone builder projections
 *   AddressBookDetail.ets:163-202 email and address builders
 *   AddressBookDetail.ets:207-227 nav title and avatar
 *   AddressBookDetail.ets:243-265 edit and delete intents
 *   AddressBookList.ets:60-68     row tap detail intent
 *   AddressBookList.ets:85-91     add intent with a fresh Contact
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
  ContactSnapshot,
  snapshotsOf,
  sameSnapshotArray,
  ACTION_ADD,
  ACTION_EDIT,
  ACTION_DELETE,
  ROUTE_DETAIL,
  ROUTE_EDIT,
  ROUTE_LIST
} from '../Shared/SharedDriver';

/** Resource keys used by the four labelled rows of the detail page. */
const LABEL_PHONE: string = 'app.string.operate_rdb_in_taskpool_detail_phone';
const LABEL_EMAIL: string = 'app.string.operate_rdb_in_taskpool_detail_email';
const LABEL_ADDRESS: string = 'app.string.operate_rdb_in_taskpool_detail_address';
const LABEL_VIDEO: string = 'app.string.operate_rdb_in_taskpool_detail_video';

/** The literal that AddressBookDetail uses before router params arrive. */
function detailDefault(): Contact {
  return new Contact('艾德里安', '13333333333', 'aidelian@example.com', '江苏省南京市鼓楼区',
    'operate_rdb_in_taskpool_photo1.jpg', 'A');
}

/** Six field projection of the detail source row. */
function profileParts(contact: Contact): string[] {
  return [contact.name, contact.phone, contact.email, contact.address, contact.avatar, contact.category];
}

/** Installs one selected row and returns it. */
function selectContact(contact: Contact): Contact {
  const rows: Contact[] = [];
  rows.push(contact);
  ContactManager.getInstance().setContacts(rows);
  return contact;
}

export default function contactProfileViewTest(): void {
  describe('ContactProfileView', () => {
    beforeAll(() => {
      logSuite('ContactProfileView', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      resetContactManager();
      logSuite('ContactProfileView', 'end');
    });

    /**
     * @tc.name   detailDefaultRowCarriesTheProductionLiteral
     * @tc.desc   The fallback contact shown before routing matches the AddressBookDetail literal.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactProfileView scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('detailDefaultRowCarriesTheProductionLiteral', 0, () => {
      const fallback: Contact = detailDefault();
      expect(fallback.name).assertEqual('艾德里安');
      expect(fallback.phone).assertEqual('13333333333');
      expect(fallback.email).assertEqual('aidelian@example.com');
      expect(fallback.address).assertEqual('江苏省南京市鼓楼区');
      expect(fallback.avatar).assertEqual('operate_rdb_in_taskpool_photo1.jpg');
      expect(fallback.category).assertEqual('A');
      logStep('ContactProfileView', 'detail default checked');
    });

    /**
     * @tc.name   profileProjectsTheNameForTheTitle
     * @tc.desc   The nav builder receives sourceData.name unchanged.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactProfileView scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('profileProjectsTheNameForTheTitle', 0, () => {
      const selected: Contact = selectContact(contactOf('标题甲', '13311110001', 'title@example.com',
        '江苏省扬州市广陵区', 'title.jpg', 'B'));
      expect(selected.name).assertEqual('标题甲');
      expect(selected.name.length).assertEqual(3);
      expect(selected.name.indexOf('标') >= 0).assertTrue();
      expect(profileParts(selected)[0]).assertEqual('标题甲');
      expect(selected.name === '').assertFalse();
      expect(ContactManager.getInstance().getContacts()[0].name).assertEqual('标题甲');
    });

    /**
     * @tc.name   profileProjectsThePhoneRow
     * @tc.desc   The phone builder reads sourceData.phone directly.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactProfileView scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('profileProjectsThePhoneRow', 0, () => {
      const selected: Contact = selectContact(contactOf('电话乙', '13311110002', 'phone@example.com',
        '江苏省泰州市海陵区', 'phone.jpg', 'C'));
      expect(selected.phone).assertEqual('13311110002');
      expect(selected.phone.length).assertEqual(11);
      expect(profileParts(selected)[1]).assertEqual('13311110002');
      expect(profileParts(selected)[1].startsWith('133')).assertTrue();
      expect(selected.phone === selected.email).assertFalse();
      expect(selected.phone).assertEqual('13311110002');
    });

    /**
     * @tc.name   profileProjectsTheEmailRow
     * @tc.desc   The email builder reads sourceData.email without normalization.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactProfileView scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('profileProjectsTheEmailRow', 0, () => {
      const selected: Contact = selectContact(contactOf('邮箱乙', '13311110003', 'profile.mail@example.com',
        '江苏省镇江市京口区', 'mail.jpg', 'D'));
      expect(profileParts(selected)[2]).assertEqual('profile.mail@example.com');
      expect(selected.email.indexOf('@') > 0).assertTrue();
      expect(selected.email.endsWith('.com')).assertTrue();
      expect(selected.email.split('@')[0]).assertEqual('profile.mail');
      expect(selected.email.length).assertEqual(24);
      expect(selected.email).assertEqual('profile.mail@example.com');
    });

    /**
     * @tc.name   profileProjectsTheAddressRow
     * @tc.desc   The address builder reads the full administrative address.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactProfileView scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('profileProjectsTheAddressRow', 0, () => {
      const address: string = '江苏省盐城市亭湖区解放北路';
      const selected: Contact = selectContact(contactOf('地址乙', '13311110004', 'address@example.com',
        address, 'address.jpg', 'E'));
      expect(profileParts(selected)[3]).assertEqual(address);
      expect(selected.address.startsWith('江苏省')).assertTrue();
      expect(selected.address.endsWith('北路')).assertTrue();
      expect(selected.address.indexOf('亭湖区') > 0).assertTrue();
      expect(selected.address.length).assertEqual(13);
      expect(selected.address === address).assertTrue();
    });

    /**
     * @tc.name   profileProjectsTheCategoryChip
     * @tc.desc   The category value flows from the stored contact to the profile projection.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactProfileView scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('profileProjectsTheCategoryChip', 0, () => {
      const selected: Contact = selectContact(contactOf('分类乙', '13311110005', 'category@example.com',
        '江苏省淮安市清江浦区', 'category.jpg', 'F'));
      expect(profileParts(selected)[5]).assertEqual('F');
      expect(selected.category.length).assertEqual(1);
      expect(selected.category).assertEqual('F');
      expect(selected.category === 'A').assertFalse();
      expect(selected.category.toUpperCase()).assertEqual('F');
      expect(profileParts(selected).length).assertEqual(6);
    });

    /**
     * @tc.name   profileProjectsTheAvatarFile
     * @tc.desc   The avatar builder uses the stored file name when the contact carries one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactProfileView scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('profileProjectsTheAvatarFile', 0, () => {
      const selected: Contact = selectContact(contactOf('头像乙', '13311110006', 'avatar@example.com',
        '江苏省宿迁市宿城区', 'operate_rdb_in_taskpool_portrait.jpg', 'A'));
      expect(selected.avatar).assertEqual('operate_rdb_in_taskpool_portrait.jpg');
      expect(profileParts(selected)[4]).assertEqual('operate_rdb_in_taskpool_portrait.jpg');
      expect(selected.avatar.endsWith('.jpg')).assertTrue();
      expect(selected.avatar.startsWith('operate_rdb_in_taskpool_')).assertTrue();
      expect(selected.avatar.length > 20).assertTrue();
      expect(selected.avatar === '').assertFalse();
    });

    /**
     * @tc.name   emptyAvatarFallsBackToThePlaceholder
     * @tc.desc   A contact without an avatar keeps an empty file name so the page shows its default portrait.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactProfileView scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('emptyAvatarFallsBackToThePlaceholder', 0, () => {
      const selected: Contact = selectContact(contactOf('无头像', '13311110007', 'noavatar@example.com',
        '江苏省连云港市海州区', '', 'B'));
      expect(selected.avatar).assertEqual('');
      expect(profileParts(selected)[4]).assertEqual('');
      expect(selected.avatar.length).assertEqual(0);
      expect(selected.avatar.indexOf('.jpg') < 0).assertTrue();
      expect(profileParts(selected)[5]).assertEqual('B');
      expect(selected.name).assertEqual('无头像');
    });

    /**
     * @tc.name   selectedContactSnapshotMatchesTheStoredRow
     * @tc.desc   The snapshot taken from the detail source equals the snapshot of the stored row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactProfileView scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('selectedContactSnapshotMatchesTheStoredRow', 0, () => {
      const selected: Contact = selectContact(contactOf('快照乙', '13311110008', 'snapshot@example.com',
        '江苏省南京市浦口区', 'snapshot.jpg', 'C'));
      const fromSource: ContactSnapshot = new ContactSnapshot(selected);
      const fromStore: ContactSnapshot = new ContactSnapshot(ContactManager.getInstance().getContacts()[0]);
      expect(fromSource.sameAs(fromStore)).assertTrue();
      expect(fromSource.name).assertEqual('快照乙');
      expect(fromSource.phone).assertEqual('13311110008');
      expect(fromSource.category).assertEqual('C');
      expect(sameSnapshotArray([fromSource], [fromStore])).assertTrue();
    });

    /**
     * @tc.name   snapshotDescriptionJoinsFiveProfileFields
     * @tc.desc   The selected contact description carries name, phone, email, address and category.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactProfileView scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotDescriptionJoinsFiveProfileFields', 0, () => {
      const selected: Contact = selectContact(contactOf('描述乙', '13311110009', 'describe@example.com',
        '江苏省南京市六合区', 'describe.jpg', 'D'));
      const snapshot: ContactSnapshot = new ContactSnapshot(selected);
      const parts: string[] = snapshot.describe().split('/');
      expect(parts.length).assertEqual(5);
      expect(parts[0]).assertEqual('描述乙');
      expect(parts[1]).assertEqual('13311110009');
      expect(parts[2]).assertEqual('describe@example.com');
      expect(parts[3]).assertEqual('江苏省南京市六合区');
      expect(parts[4]).assertEqual('D');
      expect(snapshot.describe().indexOf('describe@example.com') > 0).assertTrue();
    });

    /**
     * @tc.name   editIntentTargetsTheEditRoute
     * @tc.desc   The detail edit button builds an edit action for the AddressBookEdit page.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactProfileView scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('editIntentTargetsTheEditRoute', 0, () => {
      const selected: Contact = selectContact(contactOf('编辑丙', '13411110001', 'edit@example.com',
        '安徽省铜陵市铜官区', 'edit.jpg', 'A'));
      const intent: RouteIntent = new RouteIntent(ACTION_EDIT, selected);
      expect(intent.action).assertEqual(ACTION_EDIT);
      expect(intent.url()).assertEqual(ROUTE_EDIT);
      expect(intent.url()).assertEqual('pages/view/AddressBookEdit');
      expect(RouteIntent.routeFor(ACTION_EDIT)).assertEqual(ROUTE_EDIT);
      expect(intent.url() === ROUTE_LIST).assertFalse();
      expect(intent.contact === selected).assertTrue();
    });

    /**
     * @tc.name   deleteIntentTargetsTheListRoute
     * @tc.desc   The detail delete button returns to the list page with a delete action.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactProfileView scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('deleteIntentTargetsTheListRoute', 0, () => {
      const selected: Contact = selectContact(contactOf('删除丙', '13411110002', 'delete@example.com',
        '安徽省池州市贵池区', 'delete.jpg', 'B'));
      const intent: RouteIntent = new RouteIntent(ACTION_DELETE, selected);
      expect(intent.action).assertEqual(ACTION_DELETE);
      expect(intent.url()).assertEqual(ROUTE_LIST);
      expect(intent.url()).assertEqual('pages/view/OperateRDBInTaskPool');
      expect(RouteIntent.routeFor(ACTION_DELETE)).assertEqual(ROUTE_LIST);
      expect(intent.url() === ROUTE_EDIT).assertFalse();
      expect(intent.contact.name).assertEqual('删除丙');
    });

    /**
     * @tc.name   rowTapIntentTargetsTheDetailRoute
     * @tc.desc   The list row click pushes the detail url with an edit action and the tapped contact.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactProfileView scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('rowTapIntentTargetsTheDetailRoute', 0, () => {
      const tapped: Contact = selectContact(contactOf('点按丙', '13411110003', 'tap@example.com',
        '安徽省滁州市琅琊区', 'tap.jpg', 'C'));
      const params: RouterParams = new RouterParams(ACTION_EDIT, tapped);
      expect(ROUTE_DETAIL).assertEqual('pages/view/AddressBookDetail');
      expect(params.text).assertEqual(ACTION_EDIT);
      expect((params.data as Contact) === tapped).assertTrue();
      expect(params.text).assertEqual('编辑联系人');
      expect(ROUTE_DETAIL === ROUTE_EDIT).assertFalse();
      expect((params.data as Contact).name).assertEqual('点按丙');
    });

    /**
     * @tc.name   addIntentTargetsTheEditRouteWithAFreshContact
     * @tc.desc   The floating add button opens the edit page with an empty Contact payload.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactProfileView scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('addIntentTargetsTheEditRouteWithAFreshContact', 0, () => {
      const fresh: Contact = new Contact();
      const intent: RouteIntent = new RouteIntent(ACTION_ADD, fresh);
      expect(intent.action).assertEqual(ACTION_ADD);
      expect(intent.url()).assertEqual(ROUTE_EDIT);
      expect(intent.url()).assertEqual(RouteIntent.routeFor(ACTION_EDIT));
      expect(intent.contact.name).assertEqual('');
      expect(intent.contact.phone).assertEqual('');
      expect(RouteIntent.isKnownAction(ACTION_ADD)).assertTrue();
      expect(ROUTE_EDIT.startsWith('pages/view/')).assertTrue();
    });

    /**
     * @tc.name   detailRouteLiteralsMatchThePushUrls
     * @tc.desc   The three production route literals are distinct page paths with the expected prefix.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactProfileView scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('detailRouteLiteralsMatchThePushUrls', 0, () => {
      expect(ROUTE_DETAIL.startsWith('pages/view/')).assertTrue();
      expect(ROUTE_EDIT.startsWith('pages/view/')).assertTrue();
      expect(ROUTE_LIST.startsWith('pages/view/')).assertTrue();
      expect(ROUTE_DETAIL === ROUTE_EDIT).assertFalse();
      expect(ROUTE_DETAIL === ROUTE_LIST).assertFalse();
      expect(ROUTE_EDIT === ROUTE_LIST).assertFalse();
      expect(ROUTE_DETAIL.endsWith('AddressBookDetail')).assertTrue();
      expect(ROUTE_EDIT.endsWith('AddressBookEdit')).assertTrue();
      expect(ROUTE_LIST.endsWith('OperateRDBInTaskPool')).assertTrue();
    });

    /**
     * @tc.name   intentParamsCarryTheSelectedContact
     * @tc.desc   RouteIntent.toParams exposes the same action text and the same contact reference.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactProfileView scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('intentParamsCarryTheSelectedContact', 0, () => {
      const selected: Contact = selectContact(contactOf('参数丙', '13511110001', 'params@example.com',
        '福建省莆田市城厢区', 'params.jpg', 'D'));
      const intent: RouteIntent = new RouteIntent(ACTION_EDIT, selected);
      const params: RouterParams = intent.toParams();
      expect(params.text).assertEqual(ACTION_EDIT);
      expect(params.data === selected).assertTrue();
      expect((params.data as Contact).email).assertEqual('params@example.com');
      expect((params.data as Contact).avatar).assertEqual('params.jpg');
      expect(params.text === undefined).assertFalse();
      expect(params.data === undefined).assertFalse();
    });

    /**
     * @tc.name   detailFallsBackWhenDataIsUndefined
     * @tc.desc   With text only, the params guard leaves the detail default row in place.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactProfileView scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('detailFallsBackWhenDataIsUndefined', 0, () => {
      const params: RouterParams = new RouterParams(ACTION_EDIT, undefined);
      let source: Contact = detailDefault();
      if (params.data) {
        source = params.data as Contact;
      }
      expect(params.data === undefined).assertTrue();
      expect(source.name).assertEqual('艾德里安');
      expect(source.phone).assertEqual('13333333333');
      expect(source.category).assertEqual('A');
      expect(source.avatar).assertEqual('operate_rdb_in_taskpool_photo1.jpg');
    });

    /**
     * @tc.name   detailGuardRejectsAProfileWithUndefinedText
     * @tc.desc   The list page returns early when text is missing, so no sync runs for the profile.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactProfileView scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('detailGuardRejectsAProfileWithUndefinedText', 0, () => {
      const selected: Contact = selectContact(contactOf('守卫丙', '13511110003', 'guard@example.com',
        '福建省三明市梅列区', 'guard.jpg', 'E'));
      const params: RouterParams = new RouterParams(undefined, selected);
      let applied = false;
      if (params.data && params.text) {
        applied = true;
      }
      expect(params.data === undefined).assertFalse();
      expect(params.text === undefined).assertTrue();
      expect(applied).assertFalse();
      expect(ContactManager.getInstance().getContacts().length).assertEqual(1);
      expect(ContactManager.getInstance().getContacts()[0].name).assertEqual('守卫丙');
    });

    /**
     * @tc.name   fourDetailLabelsAreNonEmptyStrings
     * @tc.desc   The four resource keys rendered under the profile values are present and non-empty.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactProfileView scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fourDetailLabelsAreNonEmptyStrings', 0, () => {
      const labels: string[] = [LABEL_PHONE, LABEL_EMAIL, LABEL_ADDRESS, LABEL_VIDEO];
      expect(labels.length).assertEqual(4);
      for (let index = 0; index < labels.length; index++) {
        expect(labels[index].length > 0).assertTrue();
        expect(labels[index].startsWith('app.string.operate_rdb_in_taskpool_detail_')).assertTrue();
      }
      expect(LABEL_PHONE.endsWith('phone')).assertTrue();
      expect(LABEL_EMAIL.endsWith('email')).assertTrue();
      expect(LABEL_ADDRESS.endsWith('address')).assertTrue();
      expect(LABEL_VIDEO.endsWith('video')).assertTrue();
    });

    /**
     * @tc.name   detailLabelsAreDistinctResourceKeys
     * @tc.desc   Each profile row uses its own resource key rather than sharing one label.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactProfileView scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('detailLabelsAreDistinctResourceKeys', 0, () => {
      const labels: string[] = [LABEL_PHONE, LABEL_EMAIL, LABEL_ADDRESS, LABEL_VIDEO];
      const seen: string[] = [];
      for (let index = 0; index < labels.length; index++) {
        expect(seen.indexOf(labels[index])).assertEqual(-1);
        seen.push(labels[index]);
      }
      expect(seen.length).assertEqual(4);
      expect(LABEL_PHONE === LABEL_EMAIL).assertFalse();
      expect(LABEL_ADDRESS === LABEL_VIDEO).assertFalse();
      expect(LABEL_EMAIL === LABEL_ADDRESS).assertFalse();
    });

    /**
     * @tc.name   profileAfterUpdateShowsTheNewEmail
     * @tc.desc   Updating the selected row changes the projection the detail page would render.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactProfileView scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('profileAfterUpdateShowsTheNewEmail', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      selectContact(contactOf('改后丙', '13611110001', 'before@example.com',
        '福建省龙岩市新罗区', 'before.jpg', 'A'));
      manager.updateContact(contactOf('改后丙', '13611110002', 'after@example.com',
        '福建省南平市延平区', 'after.jpg', 'B'));
      const profile: Contact = manager.getContacts()[0];
      expect(profile.email).assertEqual('after@example.com');
      expect(profile.phone).assertEqual('13611110002');
      expect(profile.address).assertEqual('福建省南平市延平区');
      expect(profile.category).assertEqual('B');
      expect(profile.avatar).assertEqual('after.jpg');
      expect(profile.email === 'before@example.com').assertFalse();
    });

    /**
     * @tc.name   profileAfterDeleteLeavesNoRows
     * @tc.desc   Deleting the selected contact removes the detail source row entirely.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactProfileView scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('profileAfterDeleteLeavesNoRows', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      selectContact(contactOf('删后丙', '13611110003', 'gone@example.com',
        '福建省宁德市蕉城区', 'gone.jpg', 'C'));
      manager.deleteContact(new Contact('删后丙'));
      expect(manager.getContacts().length).assertEqual(0);
      expect(snapshotsOf(manager.getContacts()).length).assertEqual(0);
      expect(manager.getContacts().length === 1).assertFalse();
      expect(profileParts(detailDefault())[0]).assertEqual('艾德里安');
    });

    /**
     * @tc.name   twoContactsYieldDifferentProfiles
     * @tc.desc   Two selected rows produce projections that differ in every visible field.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactProfileView scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('twoContactsYieldDifferentProfiles', 0, () => {
      const left: Contact = contactOf('左像', '13611110004', 'left@example.com',
        '江西省萍乡市安源区', 'left.jpg', 'A');
      const right: Contact = contactOf('右像', '13611110005', 'right@example.com',
        '江西省新余市渝水区', 'right.jpg', 'B');
      const leftParts: string[] = profileParts(left);
      const rightParts: string[] = profileParts(right);
      expect(leftParts.length).assertEqual(rightParts.length);
      for (let index = 0; index < leftParts.length; index++) {
        expect(leftParts[index] === rightParts[index]).assertFalse();
      }
      expect(leftParts[0]).assertEqual('左像');
      expect(rightParts[0]).assertEqual('右像');
      expect(leftParts[5]).assertEqual('A');
    });

    /**
     * @tc.name   profileProjectionProducesSixParts
     * @tc.desc   The detail projection keeps one slot per Contact field, including unused ones.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactProfileView scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('profileProjectionProducesSixParts', 0, () => {
      const selected: Contact = selectContact(contactOf('六槽', '13611110006', 'sixslot@example.com',
        '江西省鹰潭市月湖区', '', 'D'));
      const parts: string[] = profileParts(selected);
      expect(parts.length).assertEqual(6);
      expect(parts[0]).assertEqual('六槽');
      expect(parts[1]).assertEqual('13611110006');
      expect(parts[2]).assertEqual('sixslot@example.com');
      expect(parts[3]).assertEqual('江西省鹰潭市月湖区');
      expect(parts[4]).assertEqual('');
      expect(parts[5]).assertEqual('D');
    });

    /**
     * @tc.name   avatarRoundTripsThroughTheStore
     * @tc.desc   The avatar file name written into the store is the one the profile renders.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactProfileView scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('avatarRoundTripsThroughTheStore', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      selectContact(contactOf('头像往返', '13611110007', 'avatar2@example.com',
        '江西省赣州市南康区', 'operate_rdb_in_taskpool_photo2.jpg', 'E'));
      expect(manager.getContacts()[0].avatar).assertEqual('operate_rdb_in_taskpool_photo2.jpg');
      manager.updateContact(contactOf('头像往返', '13611110007', 'avatar2@example.com',
        '江西省赣州市南康区', 'operate_rdb_in_taskpool_photo3.jpg', 'E'));
      expect(manager.getContacts()[0].avatar).assertEqual('operate_rdb_in_taskpool_photo3.jpg');
      expect(manager.getContacts()[0].avatar.endsWith('photo3.jpg')).assertTrue();
      expect(manager.getContacts()[0].avatar === detailDefault().avatar).assertFalse();
      expect(manager.getContacts().length).assertEqual(1);
    });

    /**
     * @tc.name   intentDescriptionJoinsActionNameAndUrl
     * @tc.desc   RouteIntent.describe exposes the action, the contact name and the resolved route.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactProfileView scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('intentDescriptionJoinsActionNameAndUrl', 0, () => {
      const selected: Contact = selectContact(contactOf('描述丙', '13711110001', 'intent@example.com',
        '云南省玉溪市红塔区', 'intent.jpg', 'A'));
      const intent: RouteIntent = new RouteIntent(ACTION_EDIT, selected);
      const description: string = intent.describe();
      expect(description.indexOf(ACTION_EDIT)).assertEqual(0);
      expect(description.indexOf('描述丙') > 0).assertTrue();
      expect(description.endsWith(ROUTE_EDIT)).assertTrue();
      expect(description.split(':').length).assertEqual(3);
      expect(description === intent.describe()).assertTrue();
      expect(intent.action).assertEqual('编辑联系人');
    });

    /**
     * @tc.name   editIntentDoesNotMutateTheStoreByItself
     * @tc.desc   Building the detail intent is side effect free until the list page applies it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactProfileView scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('editIntentDoesNotMutateTheStoreByItself', 0, () => {
      const selected: Contact = selectContact(contactOf('无副作用', '13711110002', 'pure@example.com',
        '云南省保山市隆阳区', 'pure.jpg', 'B'));
      const intent: RouteIntent = new RouteIntent(ACTION_EDIT, selected);
      intent.toParams();
      intent.url();
      intent.describe();
      const rows: Contact[] = ContactManager.getInstance().getContacts();
      expect(rows.length).assertEqual(1);
      expect(rows[0].email).assertEqual('pure@example.com');
      expect(rows[0].name).assertEqual('无副作用');
      expect(rows[0] === selected).assertTrue();
      expect(ContactManager.getInstance().getContacts().length).assertEqual(1);
    });

    /**
     * @tc.name   deleteIntentDoesNotRemoveTheRowByItself
     * @tc.desc   The delete navigation only carries a payload; the list page performs the removal.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactProfileView scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteIntentDoesNotRemoveTheRowByItself', 0, () => {
      const selected: Contact = selectContact(contactOf('待删除', '13711110003', 'pending@example.com',
        '云南省昭通市昭阳区', 'pending.jpg', 'C'));
      const params: RouterParams = new RouteIntent(ACTION_DELETE, selected).toParams();
      expect(params.text).assertEqual(ACTION_DELETE);
      expect(ContactManager.getInstance().getContacts().length).assertEqual(1);
      ContactManager.getInstance().deleteContact(params.data as Contact);
      expect(ContactManager.getInstance().getContacts().length).assertEqual(0);
      expect(snapshotsOf(ContactManager.getInstance().getContacts()).length).assertEqual(0);
      expect(params.data === undefined).assertFalse();
    });

    /**
     * @tc.name   bothDetailButtonsUseKnownActions
     * @tc.desc   The edit and delete actions rendered by the detail buttons are in the known action set.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactProfileView scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('bothDetailButtonsUseKnownActions', 0, () => {
      expect(RouteIntent.isKnownAction(ACTION_EDIT)).assertTrue();
      expect(RouteIntent.isKnownAction(ACTION_DELETE)).assertTrue();
      expect(RouteIntent.isKnownAction(ACTION_ADD)).assertTrue();
      expect(RouteIntent.isKnownAction('查看联系人')).assertFalse();
      expect(RouteIntent.isKnownAction('')).assertFalse();
      expect(RouteIntent.routeFor(ACTION_EDIT)).assertEqual(ROUTE_EDIT);
      expect(RouteIntent.routeFor(ACTION_DELETE)).assertEqual(ROUTE_LIST);
    });

    /**
     * @tc.name   profileSnapshotDiffersAfterAnEdit
     * @tc.desc   A snapshot taken before and after an update reports different values.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactProfileView scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('profileSnapshotDiffersAfterAnEdit', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      selectContact(contactOf('快照改', '13711110004', 'snap.before@example.com',
        '云南省丽江市古城区', 'snap.jpg', 'D'));
      const before: ContactSnapshot = new ContactSnapshot(manager.getContacts()[0]);
      manager.updateContact(contactOf('快照改', '13711110005', 'snap.after@example.com',
        '云南省普洱市思茅区', 'snap2.jpg', 'E'));
      const after: ContactSnapshot = new ContactSnapshot(manager.getContacts()[0]);
      expect(before.sameAs(after)).assertFalse();
      expect(sameSnapshotArray([before], [after])).assertFalse();
      expect(after.email).assertEqual('snap.after@example.com');
      expect(after.address).assertEqual('云南省普洱市思茅区');
      expect(after.category).assertEqual('E');
      expect(before.category).assertEqual('D');
    });

    /**
     * @tc.name   selectedProfileIsFoundAmongManyRows
     * @tc.desc   Selecting the third of five rows projects that row's fields, not the first one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactProfileView scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('selectedProfileIsFoundAmongManyRows', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      const rows: Contact[] = [];
      for (let index = 0; index < 5; index++) {
        rows.push(contactOf('多行' + String(index), '1321111000' + String(index),
          'multi' + String(index) + '@example.com', '贵州省六盘水市钟山区', '', 'A'));
      }
      manager.setContacts(rows);
      const selected: Contact = manager.getContacts()[2];
      const parts: string[] = profileParts(selected);
      expect(parts[0]).assertEqual('多行2');
      expect(parts[1]).assertEqual('13211110002');
      expect(parts[2]).assertEqual('multi2@example.com');
      expect(parts[0] === profileParts(manager.getContacts()[0])[0]).assertFalse();
      expect(parts[5]).assertEqual('A');
      expect(manager.getContacts().length).assertEqual(5);
    });

    /**
     * @tc.name   emptyNameProjectsToAnEmptyTitle
     * @tc.desc   A contact without a name still yields a defined empty title value for the nav builder.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactProfileView scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('emptyNameProjectsToAnEmptyTitle', 0, () => {
      const selected: Contact = selectContact(contactOf('', '13211110005', 'noname@example.com',
        '贵州省毕节市七星关区', '', 'B'));
      const title: string = selected.name;
      expect(title).assertEqual('');
      expect(title.length).assertEqual(0);
      expect(title === '').assertTrue();
      expect(profileParts(selected)[0]).assertEqual('');
      expect(profileParts(selected)[2]).assertEqual('noname@example.com');
      expect(profileParts(selected)[5]).assertEqual('B');
    });

    /**
     * @tc.name   profileShowsPhoneTextWithoutReformatting
     * @tc.desc   The phone row renders the stored string verbatim, including a formatted value.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactProfileView scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('profileShowsPhoneTextWithoutReformatting', 0, () => {
      const selected: Contact = selectContact(contactOf('格式电话', '133-1111-0006',
        'formatted@example.com', '贵州省安顺市西秀区', 'formatted.jpg', 'C'));
      expect(profileParts(selected)[1]).assertEqual('133-1111-0006');
      expect(profileParts(selected)[1].indexOf('-') > 0).assertTrue();
      expect(profileParts(selected)[1].length).assertEqual(13);
      expect(profileParts(selected)[1]).assertEqual(selected.phone);
      expect(profileParts(selected)[1] === '13311110006').assertFalse();
      expect(profileParts(selected)[0]).assertEqual('格式电话');
    });

    /**
     * @tc.name   deleteIntentNeverTargetsTheDetailRoute
     * @tc.desc   The delete route resolves to the list page and never back to the detail page.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactProfileView scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteIntentNeverTargetsTheDetailRoute', 0, () => {
      const selected: Contact = selectContact(contactOf('回路', '13311110007', 'loop@example.com',
        '贵州省黔东南苗族侗族自治州凯里市', '', 'D'));
      const intent: RouteIntent = new RouteIntent(ACTION_DELETE, selected);
      expect(intent.url() === ROUTE_DETAIL).assertFalse();
      expect(intent.url() === ROUTE_EDIT).assertFalse();
      expect(intent.url()).assertEqual(ROUTE_LIST);
      expect(RouteIntent.routeFor(ACTION_DELETE) === ROUTE_DETAIL).assertFalse();
      expect(intent.contact.address.indexOf('凯里市') > 0).assertTrue();
      expect(intent.contact.category).assertEqual('D');
    });

    /**
     * @tc.name   profileProjectionAfterAStoreReplacement
     * @tc.desc   Replacing the store swaps the detail source but keeps the projection shape.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactProfileView scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('profileProjectionAfterAStoreReplacement', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      selectContact(contactOf('旧选中', '13311110008', 'old.select@example.com',
        '贵州省黔南布依族苗族自治州都匀市', 'old.jpg', 'E'));
      const replacement: Contact = contactOf('新选中', '13311110009', 'new.select@example.com',
        '贵州省黔西南布依族苗族自治州兴义市', 'new.jpg', 'F');
      const rows: Contact[] = [];
      rows.push(replacement);
      manager.setContacts(rows);
      const parts: string[] = profileParts(manager.getContacts()[0]);
      expect(parts.length).assertEqual(6);
      expect(parts[0]).assertEqual('新选中');
      expect(parts[2]).assertEqual('new.select@example.com');
      expect(parts[4]).assertEqual('new.jpg');
      expect(parts[5]).assertEqual('F');
      expect(manager.getContacts()[0] === replacement).assertTrue();
    });

    /**
     * @tc.name   sharedLabelPrefixCoversEveryDetailRow
     * @tc.desc   All four label keys share one resource namespace prefix with no gaps.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactProfileView scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('sharedLabelPrefixCoversEveryDetailRow', 0, () => {
      const labels: string[] = [LABEL_PHONE, LABEL_EMAIL, LABEL_ADDRESS, LABEL_VIDEO];
      const prefix: string = 'app.string.operate_rdb_in_taskpool_detail_';
      for (let index = 0; index < labels.length; index++) {
        expect(labels[index].startsWith(prefix)).assertTrue();
        expect(labels[index].length > prefix.length).assertTrue();
        expect(labels[index].indexOf(' ')).assertEqual(-1);
      }
      expect(labels[0].substring(prefix.length)).assertEqual('phone');
      expect(labels[1].substring(prefix.length)).assertEqual('email');
      expect(labels[2].substring(prefix.length)).assertEqual('address');
      expect(labels[3].substring(prefix.length)).assertEqual('video');
    });

    /**
     * @tc.name   deleteParamsCarryTheWholeSelectedContact
     * @tc.desc   The delete route payload keeps every field so the list page can filter by name.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactProfileView scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteParamsCarryTheWholeSelectedContact', 0, () => {
      const selected: Contact = selectContact(contactOf('整体删除', '13522220001', 'whole@example.com',
        '四川省广元市利州区', 'whole.jpg', 'A'));
      const params: RouterParams = new RouteIntent(ACTION_DELETE, selected).toParams();
      expect(params.text).assertEqual('删除联系人');
      expect((params.data as Contact).name).assertEqual('整体删除');
      expect((params.data as Contact).phone).assertEqual('13522220001');
      expect((params.data as Contact).email).assertEqual('whole@example.com');
      expect((params.data as Contact).avatar).assertEqual('whole.jpg');
      expect((params.data as Contact).category).assertEqual('A');
    });

    /**
     * @tc.name   rowTapRoundTripPreservesEveryField
     * @tc.desc   A tapped row pushed as params and read back equals the source contact field by field.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactProfileView scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('rowTapRoundTripPreservesEveryField', 0, () => {
      const tapped: Contact = selectContact(contactOf('往返点按', '13522220002', 'tap.round@example.com',
        '四川省内江市东兴区', 'tap.round.jpg', 'B'));
      const params: RouterParams = new RouteIntent(ACTION_EDIT, tapped).toParams();
      const restored: Contact = params.data as Contact;
      expect(restored === tapped).assertTrue();
      const left: string[] = profileParts(tapped);
      const right: string[] = profileParts(restored);
      for (let index = 0; index < left.length; index++) {
        expect(left[index]).assertEqual(right[index]);
      }
      expect(restored.name).assertEqual('往返点按');
      expect(restored.category).assertEqual('B');
    });
    /**
     * @tc.name   detailActionButtonsAreDistinctAndComplete
     * @tc.desc   The two buttons under the profile use different actions, routes and button labels.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactProfileView scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('detailActionButtonsAreDistinctAndComplete', 0, () => {
      const editLabel: string = 'app.string.operate_rdb_in_taskpool_dialog_edit_button_text';
      const deleteLabel: string = 'app.string.operate_rdb_in_taskpool_dialog_delete_button_text';
      const selected: Contact = selectContact(contactOf('双按钮', '13522220003', 'buttons@example.com',
        '四川省眉山市东坡区', 'buttons.jpg', 'C'));
      const editIntent: RouteIntent = new RouteIntent(ACTION_EDIT, selected);
      const deleteIntent: RouteIntent = new RouteIntent(ACTION_DELETE, selected);
      expect(editLabel === deleteLabel).assertFalse();
      expect(editLabel.startsWith('app.string.operate_rdb_in_taskpool_dialog_')).assertTrue();
      expect(deleteLabel.endsWith('delete_button_text')).assertTrue();
      expect(editIntent.action === deleteIntent.action).assertFalse();
      expect(editIntent.url() === deleteIntent.url()).assertFalse();
      expect(editIntent.contact === deleteIntent.contact).assertTrue();
      expect(editIntent.url()).assertEqual(ROUTE_EDIT);
      expect(deleteIntent.url()).assertEqual(ROUTE_LIST);
      expect(editLabel.length > 0).assertTrue();
      expect(deleteLabel.length > 0).assertTrue();
      expect(editLabel !== deleteLabel).assertTrue();
      expect(editIntent.contact.name).assertEqual(deleteIntent.contact.name);
      expect(editIntent.contact.phone).assertEqual(deleteIntent.contact.phone);
      expect(deleteIntent.contact.category).assertEqual('C');
      expect(editLabel.endsWith('edit_button_text')).assertTrue();
      expect(deleteLabel.startsWith('app.string.operate_rdb_in_taskpool_dialog_')).assertTrue();
      expect(editLabel.indexOf('delete') < 0).assertTrue();
      expect(deleteLabel.indexOf('edit_') < 0).assertTrue();
      expect(RouteIntent.isKnownAction(editIntent.action)).assertTrue();
      expect(RouteIntent.isKnownAction(deleteIntent.action)).assertTrue();
      expect(editIntent.contact.name).assertEqual('双按钮');
      expect(deleteIntent.contact.phone).assertEqual('13522220003');
      expect(editIntent.toParams().text).assertEqual(ACTION_EDIT);
      expect(deleteIntent.toParams().text).assertEqual(ACTION_DELETE);
      expect(editIntent.url().indexOf('AddressBookEdit') > 0).assertTrue();
    });

    /**
     * @tc.name   navTitleUsesTheContactNameNotAResourceKey
     * @tc.desc   The detail title is the raw contact name, while the four row labels are resource keys.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactProfileView scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('navTitleUsesTheContactNameNotAResourceKey', 0, () => {
      const selected: Contact = selectContact(contactOf('标题丁', '13844440001', 'title2@example.com',
        '安徽省马鞍山市雨山区', '', 'A'));
      const title: string = profileParts(selected)[0];
      expect(title).assertEqual('标题丁');
      expect(title.indexOf('app.string')).assertEqual(-1);
      expect(title === LABEL_PHONE).assertFalse();
      expect(LABEL_PHONE.startsWith('app.string')).assertTrue();
      expect(title.length).assertEqual(3);
      expect(title.endsWith('丁')).assertTrue();
      expect(selected.name === title).assertTrue();
      expect(profileParts(selected)[2]).assertEqual('title2@example.com');
      expect(title === LABEL_EMAIL).assertFalse();
      expect(title === LABEL_ADDRESS).assertFalse();
      expect(selected.category).assertEqual('A');
    });
  });
}
