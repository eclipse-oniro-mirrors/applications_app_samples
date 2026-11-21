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
 * EditSessionLifecycle models the AddressBookEdit commit path:
 *
 *   AddressBookEdit.ets:176-279     the draft is validated before it is committed
 *   OperateRDBInTaskPool.ets:101-109 edit commits the store first, then the manager
 *   DatabaseConnection.ets:241-272  update only rewrites phone, email and address
 *   ContactManager.ets:55-65        update replaces the first row with the same name
 *   Contact.ets:31-47               the six public fields carried by a draft
 *
 * EditSession is a thin orchestration layer over SharedDriver helpers. It never
 * re-implements store or manager behaviour; it only decides when to call them.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import { ContactManager } from '../../../../main/ets/pages/model/ContactManager';
import {
  StoreDouble,
  ContactSnapshot,
  ContactValidation,
  ContactMapper,
  Bucket,
  createSeedContacts,
  contactOf,
  cloneContact,
  sameContact,
  contactNames,
  sameStringArray,
  joined,
  countOf,
  resetContactManager,
  expectedAfterUpdate,
  snapshotsOf,
  sameSnapshotArray
} from '../Shared/SharedDriver';

/** Captures the state of one edit overlay before it is committed or cancelled. */
class EditSession {
  public original: Contact;
  public draft: Contact;
  public closed: boolean = false;
  public commitCount: number = 0;
  public cancelCount: number = 0;

  constructor(source: Contact) {
    this.original = cloneContact(source);
    this.draft = cloneContact(source);
  }

  public setPhone(phone: string): void {
    this.draft.phone = phone;
  }

  public setEmail(email: string): void {
    this.draft.email = email;
  }

  public setAddress(address: string): void {
    this.draft.address = address;
  }

  public setCategory(category: string): void {
    this.draft.category = category;
  }

  public setAvatar(avatar: string): void {
    this.draft.avatar = avatar;
  }

  public renameDraft(name: string): void {
    this.draft.name = name;
  }

  public isOpen(): boolean {
    return !this.closed;
  }

  /** Store first, then the manager, mirroring the resolved promise callback. */
  public commit(manager: ContactManager, store: StoreDouble): boolean {
    if (this.closed) {
      return false;
    }
    store.updateContact(this.draft);
    manager.updateContact(cloneContact(this.draft));
    this.commitCount = this.commitCount + 1;
    this.closed = true;
    this.original = cloneContact(this.draft);
    return true;
  }

  public cancel(): boolean {
    if (this.closed) {
      return false;
    }
    this.draft = cloneContact(this.original);
    this.cancelCount = this.cancelCount + 1;
    this.closed = true;
    return true;
  }

  public reopen(): void {
    this.original = cloneContact(this.draft);
    this.closed = false;
  }

  public snapshot(): ContactSnapshot {
    return new ContactSnapshot(this.draft);
  }
}

/** One store, one manager and one draft sharing the same original row. */
class EditFixture {
  public store: StoreDouble = new StoreDouble();
  public manager: ContactManager;
  public session: EditSession;

  constructor(source: Contact) {
    this.manager = resetContactManager([cloneContact(source)]);
    this.store = new StoreDouble();
    this.store.batchInsert(true, [cloneContact(source)]);
    this.session = new EditSession(source);
  }

  public managerRows(): Contact[] {
    return this.manager.getContacts();
  }

  public storeRows(): Contact[] {
    return this.store.query(true);
  }
}

/** First manager row with the given name, or an empty Contact when absent. */
function rowNamed(rows: Contact[], name: string): Contact {
  for (let index = 0; index < rows.length; index++) {
    if (rows[index].name === name) {
      return rows[index];
    }
  }
  return new Contact();
}

/** Number of store rows whose phone column equals the target. */
function phoneCount(store: StoreDouble, phone: string): number {
  let total = 0;
  for (let index = 0; index < store.rows.length; index++) {
    if (store.rows[index].phone === phone) {
      total = total + 1;
    }
  }
  return total;
}

export default function editSessionLifecycleTest(): void {
  describe('EditSessionLifecycle', () => {
    let manager: ContactManager = resetContactManager();
    let store: StoreDouble = new StoreDouble();
    let session: EditSession = new EditSession(createSeedContacts()[0]);

    beforeAll(() => {
      logSuite('EditSessionLifecycle', 'begin');
    });

    beforeEach(async () => {
      manager = resetContactManager();
      store = new StoreDouble();
      session = new EditSession(createSeedContacts()[0]);
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });

    afterAll(() => {
      resetContactManager();
      logSuite('EditSessionLifecycle', 'end');
    });

    /**
     * @tc.name   openDraftCopiesOriginalFields
     * @tc.desc   A freshly opened session clones all six fields and starts open with no commits.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditSessionLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('openDraftCopiesOriginalFields', 0, () => {
      const source: Contact = createSeedContacts()[0];
      const draft = new EditSession(source);
      logStep('open-draft', draft.draft.name);
      expect(draft.draft.name).assertEqual(source.name);
      expect(draft.draft.phone).assertEqual(source.phone);
      expect(draft.draft.email).assertEqual(source.email);
      expect(draft.draft.address).assertEqual(source.address);
      expect(draft.isOpen()).assertTrue();
      expect(draft.commitCount).assertEqual(0);
    });

    /**
     * @tc.name   draftMutationLeavesManagerUntouched
     * @tc.desc   Editing the overlay does not reach the manager before commit is called.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditSessionLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('draftMutationLeavesManagerUntouched', 0, () => {
      const fixture = new EditFixture(createSeedContacts()[1]);
      const before: string = fixture.managerRows()[0].phone;
      fixture.session.setPhone('13900000001');
      const after: Contact[] = fixture.managerRows();
      logStep('draft-manager', 'before=' + before + ' after=' + after[0].phone);
      expect(after.length).assertEqual(1);
      expect(after[0].phone).assertEqual(before);
      expect(fixture.session.draft.phone).assertEqual('13900000001');
      expect(fixture.session.commitCount).assertEqual(0);
      expect(fixture.session.isOpen()).assertTrue();
    });

    /**
     * @tc.name   draftMutationLeavesStoreUntouched
     * @tc.desc   The relational row keeps its old email until the session commits.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditSessionLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('draftMutationLeavesStoreUntouched', 0, () => {
      const fixture = new EditFixture(createSeedContacts()[2]);
      const before: string = fixture.storeRows()[0].email;
      fixture.session.setEmail('draft@example.com');
      const after: Contact[] = fixture.storeRows();
      logStep('draft-store', 'before=' + before);
      expect(after[0].email).assertEqual(before);
      expect(after[0].email === 'draft@example.com').assertFalse();
      expect(fixture.store.updateCalls).assertEqual(0);
      expect(fixture.store.rowCount()).assertEqual(1);
      expect(fixture.session.draft.email).assertEqual('draft@example.com');
    });

    /**
     * @tc.name   setPhoneOnlyChangesDraftPhone
     * @tc.desc   A phone edit leaves name, email, address, avatar and category on the draft intact.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditSessionLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('setPhoneOnlyChangesDraftPhone', 0, () => {
      const fixture = new EditFixture(createSeedContacts()[3]);
      const original: ContactSnapshot = fixture.session.snapshot();
      fixture.session.setPhone('15555555555');
      const edited: ContactSnapshot = fixture.session.snapshot();
      logStep('phone-only', edited.describe());
      expect(edited.phone).assertEqual('15555555555');
      expect(edited.phone === original.phone).assertFalse();
      expect(edited.name).assertEqual(original.name);
      expect(edited.email).assertEqual(original.email);
      expect(edited.address).assertEqual(original.address);
      expect(edited.category).assertEqual(original.category);
    });

    /**
     * @tc.name   renameDraftKeepsOtherDraftFields
     * @tc.desc   Renaming the draft does not disturb the five non-name fields.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditSessionLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('renameDraftKeepsOtherDraftFields', 0, () => {
      const fixture = new EditFixture(createSeedContacts()[4]);
      const original: Contact = cloneContact(fixture.session.draft);
      fixture.session.renameDraft('本杰明改');
      logStep('rename-draft', fixture.session.draft.name);
      expect(fixture.session.draft.name).assertEqual('本杰明改');
      expect(fixture.session.draft.phone).assertEqual(original.phone);
      expect(fixture.session.draft.email).assertEqual(original.email);
      expect(fixture.session.draft.address).assertEqual(original.address);
      expect(fixture.session.draft.avatar).assertEqual(original.avatar);
      expect(fixture.session.draft.category).assertEqual(original.category);
    });

    /**
     * @tc.name   commitAppliesDraftPhoneToManager
     * @tc.desc   A successful commit replaces the cached manager row with the draft values.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditSessionLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('commitAppliesDraftPhoneToManager', 0, () => {
      const fixture = new EditFixture(createSeedContacts()[5]);
      fixture.session.setPhone('13312345678');
      const accepted: boolean = fixture.session.commit(fixture.manager, fixture.store);
      const cached: Contact = fixture.managerRows()[0];
      logStep('commit-phone', cached.phone);
      expect(accepted).assertTrue();
      expect(cached.phone).assertEqual('13312345678');
      expect(cached.name).assertEqual('卡梅隆');
      expect(fixture.managerRows().length).assertEqual(1);
      expect(fixture.session.commitCount).assertEqual(1);
    });

    /**
     * @tc.name   commitAppliesDraftEmailToStore
     * @tc.desc   The update statement carries the draft email into the relational row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditSessionLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('commitAppliesDraftEmailToStore', 0, () => {
      const fixture: EditFixture = new EditFixture(createSeedContacts()[6]);
      fixture.session.setEmail('committed@example.com');
      fixture.session.commit(fixture.manager, fixture.store);
      const stored: Contact = fixture.storeRows()[0];
      logStep('commit-email', stored.email);
      expect(stored.email).assertEqual('committed@example.com');
      expect(stored.name).assertEqual('康纳');
      expect(fixture.store.updateCalls).assertEqual(1);
      expect(fixture.store.rowCount()).assertEqual(1);
      expect(fixture.managerRows()[0].email).assertEqual('committed@example.com');
    });

    /**
     * @tc.name   commitSplitsAddressAndCategoryBetweenStoreAndManager
     * @tc.desc   The store rewrites address only while the manager also receives the new category.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditSessionLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('commitSplitsAddressAndCategoryBetweenStoreAndManager', 0, () => {
      const fixture: EditFixture = new EditFixture(createSeedContacts()[7]);
      fixture.session.setAddress('北京市海淀区');
      fixture.session.setCategory('F');
      fixture.session.commit(fixture.manager, fixture.store);
      const stored: Contact = fixture.storeRows()[0];
      const cached: Contact = fixture.managerRows()[0];
      logStep('commit-split', stored.address + '/' + cached.category);
      expect(stored.address).assertEqual('北京市海淀区');
      expect(stored.category).assertEqual('C');
      expect(cached.address).assertEqual('北京市海淀区');
      expect(cached.category).assertEqual('F');
      expect(cached.name).assertEqual('卡特琳娜');
    });

    /**
     * @tc.name   commitIgnoresAvatarAndCategoryInStoreStatement
     * @tc.desc   The UPDATE literal names phone, email and address, so avatar and category keep old values.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditSessionLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('commitIgnoresAvatarAndCategoryInStoreStatement', 0, () => {
      const fixture: EditFixture = new EditFixture(createSeedContacts()[8]);
      const oldAvatar: string = fixture.storeRows()[0].avatar;
      const oldCategory: string = fixture.storeRows()[0].category;
      fixture.session.setAvatar('avatar-new');
      fixture.session.setCategory('E');
      fixture.session.setPhone('14444444444');
      fixture.session.commit(fixture.manager, fixture.store);
      const stored: Contact = fixture.storeRows()[0];
      logStep('store-fields', String(stored.avatar) + '|' + stored.category);
      expect(stored.phone).assertEqual('14444444444');
      expect(stored.avatar).assertEqual(oldAvatar);
      expect(stored.category).assertEqual(oldCategory);
      expect(stored.category === 'E').assertFalse();
      expect(fixture.managerRows()[0].avatar).assertEqual('avatar-new');
    });

    /**
     * @tc.name   commitReplacesOnlyFirstManagerMatch
     * @tc.desc   ContactManager.updateContact stops at the first name match and keeps later duplicates.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditSessionLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('commitReplacesOnlyFirstManagerMatch', 0, () => {
      const first: Contact = contactOf('贝拉', '11111111111', 'bella@example.com', '湖北省武汉市江汉区', '', 'B');
      const second: Contact = contactOf('贝拉', '11111111111', 'bella.old@example.com', '湖北省武汉市江汉区', '', 'B');
      manager = resetContactManager([first, cloneContact(second)]);
      const draft = new EditSession(first);
      draft.setPhone('19999999999');
      draft.commit(manager, store);
      const rows: Contact[] = manager.getContacts();
      logStep('first-match', rows[0].phone + '/' + rows[1].phone);
      expect(rows.length).assertEqual(2);
      expect(rows[0].phone).assertEqual('19999999999');
      expect(rows[1].phone).assertEqual('11111111111');
      expect(rows[1].email).assertEqual('bella.old@example.com');
      expect(expectedAfterUpdate([first, second], draft.draft)[0].phone).assertEqual('19999999999');
      expect(sameStringArray(contactNames(rows), ['贝拉', '贝拉'])).assertTrue();
    });

    /**
     * @tc.name   commitUpdatesEveryStoreRowWithSameName
     * @tc.desc   The SQL update matches by name, so two store rows with that name both change phone.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditSessionLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('commitUpdatesEveryStoreRowWithSameName', 0, () => {
      const first: Contact = contactOf('本', '12222222222', 'ben@example.com', '四川省成都市锦江区', '', 'B');
      const second: Contact = contactOf('本', '12222222222', 'ben.alt@example.com', '四川省成都市锦江区', '', 'B');
      store = new StoreDouble();
      store.batchInsert(true, [first, cloneContact(second)]);
      const draft = new EditSession(first);
      draft.setPhone('17700001111');
      draft.commit(resetContactManager([first]), store);
      const rows: Contact[] = store.query(true);
      logStep('store-match', rows[0].phone + '/' + rows[1].phone);
      expect(rows.length).assertEqual(2);
      expect(rows[0].phone).assertEqual('17700001111');
      expect(rows[1].phone).assertEqual('17700001111');
      expect(rows[0].email).assertEqual('ben@example.com');
      expect(rows[1].email).assertEqual('ben@example.com');
      expect(store.updateCalls).assertEqual(1);
    });

    /**
     * @tc.name   commitMarksSessionClosed
     * @tc.desc   After commit the overlay is closed and cannot be reused without an explicit reopen.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditSessionLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('commitMarksSessionClosed', 0, () => {
      const fixture: EditFixture = new EditFixture(createSeedContacts()[9]);
      const accepted: boolean = fixture.session.commit(fixture.manager, fixture.store);
      logStep('closed', String(fixture.session.closed));
      expect(accepted).assertTrue();
      expect(fixture.session.closed).assertTrue();
      expect(fixture.session.isOpen()).assertFalse();
      expect(fixture.session.cancelCount).assertEqual(0);
      expect(fixture.session.commitCount).assertEqual(1);
    });

    /**
     * @tc.name   secondCommitIsRejected
     * @tc.desc   A committed session rejects the next commit, so the counters stay at one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditSessionLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('secondCommitIsRejected', 0, () => {
      const fixture: EditFixture = new EditFixture(createSeedContacts()[10]);
      const first: boolean = fixture.session.commit(fixture.manager, fixture.store);
      const second: boolean = fixture.session.commit(fixture.manager, fixture.store);
      logStep('double-commit', String(first) + '/' + String(second));
      expect(first).assertTrue();
      expect(second).assertFalse();
      expect(fixture.session.commitCount).assertEqual(1);
      expect(fixture.store.updateCalls).assertEqual(1);
      expect(fixture.store.rowCount()).assertEqual(1);
      expect(fixture.managerRows().length).assertEqual(1);
    });

    /**
     * @tc.name   cancelRestoresDraftFields
     * @tc.desc   Cancelling discards every draft mutation and restores the original contact values.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditSessionLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('cancelRestoresDraftFields', 0, () => {
      const fixture: EditFixture = new EditFixture(createSeedContacts()[11]);
      const original: Contact = cloneContact(fixture.session.draft);
      fixture.session.setPhone('10000000001');
      fixture.session.setEmail('cancelled@example.com');
      fixture.session.setAddress('天津市和平区');
      const accepted: boolean = fixture.session.cancel();
      logStep('cancel', fixture.session.draft.phone);
      expect(accepted).assertTrue();
      expect(sameContact(fixture.session.draft, original)).assertTrue();
      expect(fixture.session.draft.phone).assertEqual(original.phone);
      expect(fixture.session.draft.email).assertEqual(original.email);
      expect(fixture.session.cancelCount).assertEqual(1);
    });

    /**
     * @tc.name   cancelLeavesManagerUnchanged
     * @tc.desc   A cancelled session never calls ContactManager.updateContact.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditSessionLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('cancelLeavesManagerUnchanged', 0, () => {
      const fixture: EditFixture = new EditFixture(createSeedContacts()[12]);
      const original: ContactSnapshot = fixture.session.snapshot();
      fixture.session.setPhone('18800001111');
      fixture.session.renameDraft('过渡名字');
      fixture.session.cancel();
      const cached: Contact = fixture.managerRows()[0];
      logStep('cancel-manager', cached.name + '/' + cached.phone);
      expect(cached.name).assertEqual('艾里');
      expect(cached.phone).assertEqual(original.phone);
      expect(fixture.managerRows().length).assertEqual(1);
      expect(fixture.session.commitCount).assertEqual(0);
      expect(fixture.store.updateCalls).assertEqual(0);
    });

    /**
     * @tc.name   cancelLeavesStorePhoneUnchanged
     * @tc.desc   The relational row keeps its phone, email and address after a cancel.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditSessionLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('cancelLeavesStorePhoneUnchanged', 0, () => {
      const fixture: EditFixture = new EditFixture(createSeedContacts()[13]);
      const original: Contact = cloneContact(fixture.storeRows()[0]);
      fixture.session.setPhone('10101010101');
      fixture.session.setEmail('phantom@example.com');
      fixture.session.setAddress('重庆市渝中区');
      fixture.session.cancel();
      const stored: Contact = fixture.storeRows()[0];
      logStep('cancel-store', stored.phone);
      expect(stored.phone).assertEqual(original.phone);
      expect(stored.email).assertEqual(original.email);
      expect(stored.address).assertEqual(original.address);
      expect(fixture.store.updateCalls).assertEqual(0);
      expect(fixture.store.rowCount()).assertEqual(1);
    });

    /**
     * @tc.name   cancelClosesSession
     * @tc.desc   Cancel closes the overlay exactly like commit, but through the cancel counter.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditSessionLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('cancelClosesSession', 0, () => {
      const fixture: EditFixture = new EditFixture(createSeedContacts()[14]);
      const accepted: boolean = fixture.session.cancel();
      logStep('cancel-closed', String(fixture.session.closed));
      expect(accepted).assertTrue();
      expect(fixture.session.closed).assertTrue();
      expect(fixture.session.isOpen()).assertFalse();
      expect(fixture.session.cancelCount).assertEqual(1);
      expect(fixture.session.commitCount).assertEqual(0);
      expect(fixture.session.cancel()).assertFalse();
    });

    /**
     * @tc.name   commitAfterCancelIsRejected
     * @tc.desc   Once cancelled, the overlay refuses to write to the store or the manager.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditSessionLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('commitAfterCancelIsRejected', 0, () => {
      const fixture: EditFixture = new EditFixture(createSeedContacts()[0]);
      fixture.session.setPhone('19191919191');
      fixture.session.cancel();
      const rejected: boolean = fixture.session.commit(fixture.manager, fixture.store);
      logStep('commit-after-cancel', String(rejected));
      expect(rejected).assertFalse();
      expect(fixture.store.updateCalls).assertEqual(0);
      expect(fixture.managerRows()[0].phone).assertEqual('13333333333');
      expect(fixture.session.commitCount).assertEqual(0);
      expect(fixture.session.closed).assertTrue();
    });

    /**
     * @tc.name   reopenAfterCancelStartsFromRestoredDraft
     * @tc.desc   Reopening adopts the restored draft as the new baseline for the next edit.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditSessionLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('reopenAfterCancelStartsFromRestoredDraft', 0, () => {
      const fixture: EditFixture = new EditFixture(createSeedContacts()[1]);
      const baseline: Contact = cloneContact(fixture.session.draft);
      fixture.session.setPhone('16600001111');
      fixture.session.cancel();
      fixture.session.reopen();
      const reopened: ContactSnapshot = fixture.session.snapshot();
      logStep('reopen', reopened.describe());
      expect(fixture.session.isOpen()).assertTrue();
      expect(reopened.phone).assertEqual(baseline.phone);
      expect(reopened.name).assertEqual(baseline.name);
      expect(reopened.email).assertEqual(baseline.email);
      expect(fixture.session.cancelCount).assertEqual(1);
    });

    /**
     * @tc.name   repeatedEditsAccumulateOnManager
     * @tc.desc   Two committed rounds on one row leave the manager holding the second round values.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditSessionLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('repeatedEditsAccumulateOnManager', 0, () => {
      const fixture: EditFixture = new EditFixture(createSeedContacts()[2]);
      fixture.session.setPhone('13300002222');
      fixture.session.commit(fixture.manager, fixture.store);
      fixture.session.reopen();
      fixture.session.setEmail('second@example.com');
      fixture.session.commit(fixture.manager, fixture.store);
      const cached: Contact = fixture.managerRows()[0];
      logStep('repeat-manager', cached.phone + '/' + cached.email);
      expect(fixture.managerRows().length).assertEqual(1);
      expect(cached.phone).assertEqual('13300002222');
      expect(cached.email).assertEqual('second@example.com');
      expect(cached.name).assertEqual('贝拉');
      expect(fixture.session.commitCount).assertEqual(2);
      expect(fixture.store.updateCalls).assertEqual(2);
    });

    /**
     * @tc.name   repeatedEditsOverwriteStorePhone
     * @tc.desc   Each committed round rewrites the store phone, so the last value wins.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditSessionLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('repeatedEditsOverwriteStorePhone', 0, () => {
      const fixture: EditFixture = new EditFixture(createSeedContacts()[3]);
      fixture.session.setPhone('10000000002');
      fixture.session.commit(fixture.manager, fixture.store);
      const middle: string = fixture.storeRows()[0].phone;
      fixture.session.reopen();
      fixture.session.setPhone('10000000003');
      fixture.session.commit(fixture.manager, fixture.store);
      const finalPhone: string = fixture.storeRows()[0].phone;
      logStep('repeat-store', middle + '->' + finalPhone);
      expect(middle).assertEqual('10000000002');
      expect(finalPhone).assertEqual('10000000003');
      expect(phoneCount(fixture.store, '10000000002')).assertEqual(0);
      expect(phoneCount(fixture.store, '10000000003')).assertEqual(1);
      expect(fixture.store.rowCount()).assertEqual(1);
    });

    /**
     * @tc.name   storeUpdateSkipsUnknownName
     * @tc.desc   Committing a draft whose name is absent leaves every store row untouched.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditSessionLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('storeUpdateSkipsUnknownName', 0, () => {
      store = new StoreDouble();
      store.batchInsert(true, createSeedContacts().slice(0, 4));
      manager = resetContactManager(createSeedContacts().slice(0, 4));
      const stranger: Contact = contactOf('不存在', '13500009999', 'ghost@example.com', '未知地址', '', 'A');
      const draft = new EditSession(stranger);
      draft.setPhone('13500008888');
      const affected: number = store.updateContact(draft.draft);
      const committed: boolean = draft.commit(manager, store);
      logStep('unknown-name', 'affected=' + String(affected));
      expect(affected).assertEqual(0);
      expect(committed).assertTrue();
      expect(store.rowCount()).assertEqual(4);
      expect(manager.getContacts().length).assertEqual(4);
      expect(phoneCount(store, '13500008888')).assertEqual(0);
    });

    /**
     * @tc.name   commitThenReopenSeesCommittedValues
     * @tc.desc   Reopened drafts are cloned from the committed values, not from the first snapshot.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditSessionLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('commitThenReopenSeesCommittedValues', 0, () => {
      const fixture: EditFixture = new EditFixture(createSeedContacts()[4]);
      fixture.session.setPhone('16700001234');
      fixture.session.setAddress('上海市静安区');
      fixture.session.commit(fixture.manager, fixture.store);
      fixture.session.reopen();
      const reopened: Contact = cloneContact(fixture.session.draft);
      logStep('reopen-committed', reopened.phone + '/' + reopened.address);
      expect(reopened.phone).assertEqual('16700001234');
      expect(reopened.address).assertEqual('上海市静安区');
      expect(reopened.name).assertEqual('本杰明');
      expect(fixture.session.isOpen()).assertTrue();
      expect(fixture.store.updateCalls).assertEqual(1);
    });

    /**
     * @tc.name   sessionSnapshotDiffersFromOriginalAfterMutation
     * @tc.desc   ContactSnapshot equality distinguishes the edited draft from the untouched original.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditSessionLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sessionSnapshotDiffersFromOriginalAfterMutation', 0, () => {
      const fixture: EditFixture = new EditFixture(createSeedContacts()[5]);
      const original: ContactSnapshot = new ContactSnapshot(fixture.session.original);
      fixture.session.setCategory('A');
      const edited: ContactSnapshot = fixture.session.snapshot();
      logStep('snapshot-diff', original.describe() + ' vs ' + edited.describe());
      expect(original.sameAs(edited)).assertFalse();
      expect(original.category).assertEqual('C');
      expect(edited.category).assertEqual('A');
      expect(edited.name).assertEqual(original.name);
      expect(edited.phone).assertEqual(original.phone);
      expect(sameSnapshotArray([original], [edited])).assertFalse();
    });

    /**
     * @tc.name   validationRejectsDuplicateNameAtCommit
     * @tc.desc   The edit form blocks a draft whose name already exists in the cached list.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditSessionLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('validationRejectsDuplicateNameAtCommit', 0, () => {
      const rows: Contact[] = createSeedContacts().slice(0, 3);
      manager = resetContactManager(rows);
      const candidate: Contact = contactOf('贝拉', '15500007777', 'dup@example.com', '湖北省武汉市江汉区', '', 'B');
      const errors: string[] = ContactValidation.validate(candidate, manager.getContacts());
      const allowed: boolean = ContactValidation.canSubmit(candidate, manager.getContacts());
      logStep('duplicate-name', joined(errors, ','));
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('name-duplicate');
      expect(allowed).assertFalse();
      expect(ContactValidation.isDuplicateName(rows, '贝拉')).assertTrue();
      expect(ContactValidation.isDuplicateName(rows, '贝拉新')).assertFalse();
    });

    /**
     * @tc.name   sessionBucketMatchesDraftFields
     * @tc.desc   The values bucket built from the draft carries the six edited columns in order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditSessionLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sessionBucketMatchesDraftFields', 0, () => {
      const fixture: EditFixture = new EditFixture(createSeedContacts()[6]);
      fixture.session.setPhone('19900001111');
      fixture.session.setEmail('bucket@example.com');
      const bucket: Bucket = ContactMapper.toBucket(fixture.session.draft);
      const restored: Contact = ContactMapper.fromBucket(bucket);
      logStep('session-bucket', bucket.describe());
      expect(bucket.size()).assertEqual(6);
      expect(bucket.get('phone')).assertEqual('19900001111');
      expect(bucket.get('email')).assertEqual('bucket@example.com');
      expect(sameContact(restored, fixture.session.draft)).assertTrue();
      expect(bucket.keyAt(0)).assertEqual('name');
      expect(bucket.get('category')).assertEqual('C');
    });

    /**
     * @tc.name   threeSessionsKeepManagerOrder
     * @tc.desc   Three committed overlays rewrite three rows without reordering the manager list.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditSessionLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('threeSessionsKeepManagerOrder', 0, () => {
      const rows: Contact[] = createSeedContacts().slice(0, 3);
      manager = resetContactManager(rows);
      store = new StoreDouble();
      store.batchInsert(true, rows);
      const first = new EditSession(rows[0]);
      first.setPhone('13000000001');
      first.commit(manager, store);
      const second = new EditSession(rows[1]);
      second.setPhone('13000000002');
      second.commit(manager, store);
      const third = new EditSession(rows[2]);
      third.setPhone('13000000003');
      third.commit(manager, store);
      const names: string[] = contactNames(manager.getContacts());
      logStep('order', joined(names, ','));
      expect(sameStringArray(names, ['艾德里安', '阿诺德', '贝拉'])).assertTrue();
      expect(manager.getContacts()[0].phone).assertEqual('13000000001');
      expect(manager.getContacts()[1].phone).assertEqual('13000000002');
      expect(manager.getContacts()[2].phone).assertEqual('13000000003');
      expect(store.updateCalls).assertEqual(3);
      expect(store.rowCount()).assertEqual(3);
    });

    /**
     * @tc.name   commitKeepsUnrelatedManagerRows
     * @tc.desc   Updating one cached row leaves the neighbouring contacts byte for byte unchanged.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditSessionLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('commitKeepsUnrelatedManagerRows', 0, () => {
      const rows: Contact[] = createSeedContacts().slice(0, 5);
      manager = resetContactManager(rows);
      store = new StoreDouble();
      store.batchInsert(true, rows);
      const neighbour: Contact = cloneContact(rows[4]);
      const draft = new EditSession(rows[2]);
      draft.setPhone('13700007777');
      draft.commit(manager, store);
      const cached: Contact[] = manager.getContacts();
      logStep('neighbour', cached[4].name + '/' + cached[4].phone);
      expect(cached.length).assertEqual(5);
      expect(sameContact(cached[4], neighbour)).assertTrue();
      expect(cached[2].phone).assertEqual('13700007777');
      expect(cached[1].phone).assertEqual(rows[1].phone);
      expect(store.rowCount()).assertEqual(5);
    });

    /**
     * @tc.name   storeUpdateCountTracksEveryCommit
     * @tc.desc   The update counter advances once per accepted commit and never on cancel.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditSessionLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('storeUpdateCountTracksEveryCommit', 0, () => {
      const fixture: EditFixture = new EditFixture(createSeedContacts()[7]);
      fixture.session.setPhone('13300009999');
      fixture.session.commit(fixture.manager, fixture.store);
      const afterFirst: number = fixture.store.updateCalls;
      fixture.session.reopen();
      fixture.session.cancel();
      fixture.session.reopen();
      fixture.session.setEmail('third@example.com');
      fixture.session.commit(fixture.manager, fixture.store);
      logStep('update-count', String(afterFirst) + '->' + String(fixture.store.updateCalls));
      expect(afterFirst).assertEqual(1);
      expect(fixture.store.updateCalls).assertEqual(2);
      expect(fixture.store.rowCount()).assertEqual(1);
      expect(fixture.store.rows[0].email).assertEqual('third@example.com');
      expect(fixture.session.commitCount).assertEqual(2);
      expect(fixture.session.cancelCount).assertEqual(1);
    });

    /**
     * @tc.name   fixtureStartsWithOneManagerAndOneStoreRow
     * @tc.desc   The fixture seeds exactly one cached row and one relational row from the same source.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditSessionLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('fixtureStartsWithOneManagerAndOneStoreRow', 0, () => {
      const fixture: EditFixture = new EditFixture(createSeedContacts()[8]);
      const cached: Contact[] = fixture.managerRows();
      const stored: Contact[] = fixture.storeRows();
      logStep('fixture-shape', String(cached.length) + '/' + String(stored.length));
      expect(cached.length).assertEqual(1);
      expect(stored.length).assertEqual(1);
      expect(sameContact(cached[0], stored[0])).assertTrue();
      expect(fixture.store.initCalls).assertEqual(1);
      expect(fixture.store.initialized).assertTrue();
      expect(countOf(contactNames(cached), '丹尼尔')).assertEqual(1);
    });

    /**
     * @tc.name   cancelReopenCommitAppliesNewValue
     * @tc.desc   A cancelled round followed by a fresh commit writes only the second round value.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditSessionLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cancelReopenCommitAppliesNewValue', 0, () => {
      const fixture: EditFixture = new EditFixture(createSeedContacts()[9]);
      fixture.session.setPhone('12300004567');
      fixture.session.cancel();
      fixture.session.reopen();
      fixture.session.setPhone('12300007654');
      const accepted: boolean = fixture.session.commit(fixture.manager, fixture.store);
      logStep('cancel-reopen-commit', fixture.storeRows()[0].phone);
      expect(accepted).assertTrue();
      expect(fixture.storeRows()[0].phone).assertEqual('12300007654');
      expect(fixture.managerRows()[0].phone).assertEqual('12300007654');
      expect(phoneCount(fixture.store, '12300004567')).assertEqual(0);
      expect(fixture.store.updateCalls).assertEqual(1);
      expect(fixture.session.cancelCount).assertEqual(1);
    });

    /**
     * @tc.name   commitWithoutMutationsKeepsAllValues
     * @tc.desc   Committing an untouched draft still records one write but changes no field value.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditSessionLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('commitWithoutMutationsKeepsAllValues', 0, () => {
      const fixture: EditFixture = new EditFixture(createSeedContacts()[10]);
      const before: Contact = cloneContact(fixture.storeRows()[0]);
      const accepted: boolean = fixture.session.commit(fixture.manager, fixture.store);
      const after: Contact = fixture.storeRows()[0];
      logStep('noop-commit', after.name);
      expect(accepted).assertTrue();
      expect(sameContact(before, after)).assertTrue();
      expect(fixture.store.updateCalls).assertEqual(1);
      expect(fixture.managerRows()[0].phone).assertEqual(before.phone);
      expect(fixture.store.rowCount()).assertEqual(1);
      expect(fixture.session.commitCount).assertEqual(1);
    });
  });
}
