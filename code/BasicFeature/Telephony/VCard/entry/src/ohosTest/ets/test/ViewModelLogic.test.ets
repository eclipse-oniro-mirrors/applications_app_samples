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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { ContactSummary, HistoryAction, HistoryEntry } from 'library';
import { ToolboxViewModel } from '../../../main/ets/vcard/viewmodel/ToolboxViewModel';
import {
  HistoryViewModel,
  HISTORY_FILTER_ALL,
  HISTORY_FILTER_EXPORT,
  HISTORY_FILTER_IMPORT
} from '../../../main/ets/vcard/viewmodel/HistoryViewModel';
import { ContactViewModel } from '../../../main/ets/vcard/viewmodel/ContactViewModel';
import { SettingsViewModel } from '../../../main/ets/vcard/viewmodel/SettingsViewModel';

const DOMAIN: number = 0xF811;

function makeContact(name: string, phone: string, org: string): ContactSummary {
  const contact: ContactSummary = new ContactSummary();
  contact.fullName = name;
  if (phone.length > 0) {
    contact.phones.push(phone);
  }
  contact.organization = org;
  return contact;
}

export default function viewModelLogicTest() {
  describe('ViewModelLogicTest', () => {
    /**
     * @tc.number    SUB_VCARD_LOGIC_VIEWMODEL_0100
     * @tc.name      testToolboxToggle0001
     * @tc.desc      Verify toggleContact adds new ids, keeps the selection order
     *               and removes an id on a repeated toggle.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testToolboxToggle0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testToolboxToggle0001';
      const vm: ToolboxViewModel = new ToolboxViewModel();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      vm.toggleContact(5);
      expect(vm.selectedIds.length).assertEqual(1);
      expect(vm.selectedIds[0]).assertEqual(5);
      vm.toggleContact(7);
      expect(vm.selectedIds.length).assertEqual(2);
      expect(vm.selectedIds[1]).assertEqual(7);
      vm.toggleContact(5);
      expect(vm.selectedIds.length).assertEqual(1);
      expect(vm.selectedIds[0]).assertEqual(7);
      vm.toggleContact(7);
      expect(vm.selectedIds.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_VIEWMODEL_0200
     * @tc.name      testToolboxScope0001
     * @tc.desc      Verify setScope(true) keeps the picker closed, setScope(false)
     *               opens the picker, and confirming an empty selection falls
     *               back to the all-contacts scope.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testToolboxScope0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testToolboxScope0001';
      const vm: ToolboxViewModel = new ToolboxViewModel();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      vm.setScope(true);
      expect(vm.scopeAll).assertTrue();
      expect(vm.showPicker).assertFalse();
      vm.setScope(false);
      expect(vm.scopeAll).assertFalse();
      expect(vm.showPicker).assertTrue();
      vm.confirmPicker();
      expect(vm.scopeAll).assertTrue();
      expect(vm.showPicker).assertFalse();
      expect(vm.selectedIds.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_VIEWMODEL_0300
     * @tc.name      testToolboxConfirm0001
     * @tc.desc      Verify confirming the picker with selected ids keeps the
     *               custom scope and the selection untouched.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testToolboxConfirm0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testToolboxConfirm0001';
      const vm: ToolboxViewModel = new ToolboxViewModel();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      vm.setScope(false);
      expect(vm.showPicker).assertTrue();
      vm.toggleContact(3);
      vm.confirmPicker();
      expect(vm.showPicker).assertFalse();
      expect(vm.scopeAll).assertFalse();
      expect(vm.selectedIds.length).assertEqual(1);
      expect(vm.selectedIds[0]).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_VIEWMODEL_0400
     * @tc.name      testToolboxGuard0001
     * @tc.desc      Verify every toolbox async operation returns false and leaves
     *               the busy and preview flags untouched before init.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testToolboxGuard0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testToolboxGuard0001';
      const vm: ToolboxViewModel = new ToolboxViewModel();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const picked: boolean = await vm.pickFile();
      expect(picked).assertFalse();
      const imported: boolean = await vm.importFile();
      expect(imported).assertFalse();
      const exported: boolean = await vm.exportCards();
      expect(exported).assertFalse();
      const saved: boolean = await vm.saveExportAs();
      expect(saved).assertFalse();
      expect(vm.busy).assertFalse();
      expect(vm.hasPreview).assertFalse();
      expect(vm.pickFailed).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_VIEWMODEL_0500
     * @tc.name      testToolboxSetter0001
     * @tc.desc      Verify setVersion and setCharset update the export options
     *               from their defaults, including a non-validated value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testToolboxSetter0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testToolboxSetter0001';
      const vm: ToolboxViewModel = new ToolboxViewModel();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(vm.version).assertEqual(0);
      expect(vm.charset).assertEqual('UTF-8');
      vm.setVersion(2);
      expect(vm.version).assertEqual(2);
      vm.setCharset('GBK');
      expect(vm.charset).assertEqual('GBK');
      vm.setVersion(-1);
      expect(vm.version).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_VIEWMODEL_0600
     * @tc.name      testHistoryFilter0001
     * @tc.desc      Verify setFilter switches visibleEntries between all,
     *               import-only and export-only views, treats any non-import
     *               value as the export view, and restores all entries when
     *               switching back to the all filter.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testHistoryFilter0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testHistoryFilter0001';
      const vm: HistoryViewModel = new HistoryViewModel();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(vm.filter).assertEqual(HISTORY_FILTER_ALL);
      expect(vm.visibleEntries.length).assertEqual(0);
      const entries: HistoryEntry[] = [];
      const first: HistoryEntry = new HistoryEntry();
      first.action = HistoryAction.IMPORT;
      entries.push(first);
      const second: HistoryEntry = new HistoryEntry();
      second.action = HistoryAction.EXPORT;
      entries.push(second);
      const third: HistoryEntry = new HistoryEntry();
      third.action = HistoryAction.CREATE;
      entries.push(third);
      const fourth: HistoryEntry = new HistoryEntry();
      fourth.action = HistoryAction.IMPORT;
      entries.push(fourth);
      vm.entries = entries;
      expect(vm.visibleEntries.length).assertEqual(4);
      vm.setFilter(HISTORY_FILTER_IMPORT);
      expect(vm.filter).assertEqual(HISTORY_FILTER_IMPORT);
      expect(vm.visibleEntries.length).assertEqual(2);
      expect(vm.visibleEntries[0].action).assertEqual(HistoryAction.IMPORT);
      vm.setFilter(HISTORY_FILTER_EXPORT);
      expect(vm.visibleEntries.length).assertEqual(1);
      expect(vm.visibleEntries[0].action).assertEqual(HistoryAction.EXPORT);
      vm.setFilter(99);
      expect(vm.visibleEntries.length).assertEqual(1);
      expect(vm.visibleEntries[0].action).assertEqual(HistoryAction.EXPORT);
      vm.setFilter(HISTORY_FILTER_ALL);
      expect(vm.visibleEntries.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_VIEWMODEL_0700
     * @tc.name      testHistoryGuard0001
     * @tc.desc      Verify history load and clear are safe no-ops before init and
     *               keep the loaded flag false.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testHistoryGuard0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testHistoryGuard0001';
      const vm: HistoryViewModel = new HistoryViewModel();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(vm.loaded).assertFalse();
      expect(vm.loading).assertFalse();
      const cleared: boolean = await vm.clear();
      expect(cleared).assertFalse();
      await vm.load();
      expect(vm.loaded).assertFalse();
      expect(vm.loading).assertFalse();
      expect(vm.entries.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_VIEWMODEL_0800
     * @tc.name      testContactFilter0001
     * @tc.desc      Verify filteredContacts matches name, organization and phone
     *               keywords case-insensitively with trimming, and clears to an
     *               empty result for unknown keywords.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testContactFilter0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testContactFilter0001';
      const vm: ContactViewModel = new ContactViewModel();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const list: ContactSummary[] = [
        makeContact('Alice', '13800000001', ''),
        makeContact('Bob', '', 'Acme Corp'),
        makeContact('Carol', '13955556666', '')
      ];
      vm.contacts = list;
      expect(vm.filteredContacts.length).assertEqual(3);
      vm.search('ali');
      expect(vm.filteredContacts.length).assertEqual(1);
      expect(vm.filteredContacts[0].fullName).assertEqual('Alice');
      vm.search('ACME');
      expect(vm.filteredContacts.length).assertEqual(1);
      expect(vm.filteredContacts[0].fullName).assertEqual('Bob');
      vm.search('1395555');
      expect(vm.filteredContacts.length).assertEqual(1);
      expect(vm.filteredContacts[0].fullName).assertEqual('Carol');
      vm.search('  ali  ');
      expect(vm.filteredContacts.length).assertEqual(1);
      vm.search('zzz');
      expect(vm.filteredContacts.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_VIEWMODEL_0900
     * @tc.name      testContactSelect0001
     * @tc.desc      Verify selectedContact falls back to an empty summary before
     *               any selection and openDetail switches the selection while
     *               resetting the error code.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testContactSelect0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testContactSelect0001';
      const vm: ContactViewModel = new ContactViewModel();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const fallback: ContactSummary = vm.selectedContact();
      expect(fallback.fullName).assertEqual('');
      expect(fallback.id).assertEqual(-1);
      const alice: ContactSummary = makeContact('Alice', '13800000001', '');
      vm.errorCode = 401;
      vm.openDetail(alice);
      expect(vm.selectedContact().fullName).assertEqual('Alice');
      expect(vm.errorCode).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_VIEWMODEL_1000
     * @tc.name      testContactDraft0001
     * @tc.desc      Verify startEdit refuses without a selection, copies the
     *               selected contact into the draft, and startCreate resets the
     *               draft for a new contact.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testContactDraft0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testContactDraft0001';
      const vm: ContactViewModel = new ContactViewModel();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const noTarget: boolean = vm.startEdit();
      expect(noTarget).assertFalse();
      const source: ContactSummary = makeContact('Alice', '13800000001', 'Acme');
      source.emails.push('a@example.com');
      source.jobTitle = 'Dev';
      source.note = 'n1';
      vm.openDetail(source);
      const edited: boolean = vm.startEdit();
      expect(edited).assertTrue();
      expect(vm.draft.fullName).assertEqual('Alice');
      expect(vm.draft.phone).assertEqual('13800000001');
      expect(vm.draft.email).assertEqual('a@example.com');
      expect(vm.draft.organization).assertEqual('Acme');
      expect(vm.draft.jobTitle).assertEqual('Dev');
      expect(vm.draft.note).assertEqual('n1');
      const created: boolean = vm.startCreate();
      expect(created).assertTrue();
      expect(vm.draft.fullName).assertEqual('');
      expect(vm.selected === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_VIEWMODEL_1100
     * @tc.name      testContactDemo0001
     * @tc.desc      Verify demo mode blocks create, edit, save and remove
     *               operations so read-only demo data is never written back.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testContactDemo0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testContactDemo0001';
      const vm: ContactViewModel = new ContactViewModel();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      vm.demoMode = true;
      expect(vm.startCreate()).assertFalse();
      expect(vm.startEdit()).assertFalse();
      const saved: boolean = await vm.save();
      expect(saved).assertFalse();
      const removed: boolean = await vm.remove();
      expect(removed).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_VIEWMODEL_1200
     * @tc.name      testSettingsGuard0001
     * @tc.desc      Verify settings updates return false before init and leave
     *               the default settings object unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSettingsGuard0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testSettingsGuard0001';
      const vm: SettingsViewModel = new SettingsViewModel();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(vm.ready).assertFalse();
      const versionSaved: boolean = await vm.updateVersion(2);
      expect(versionSaved).assertFalse();
      expect(vm.settings.defaultVersion).assertEqual(0);
      const charsetSaved: boolean = await vm.updateCharset('GBK');
      expect(charsetSaved).assertFalse();
      expect(vm.settings.defaultCharset).assertEqual('UTF-8');
      const jumpSaved: boolean = await vm.updateAutoJump(false);
      expect(jumpSaved).assertFalse();
      expect(vm.settings.autoJumpToContacts).assertTrue();
      const limitSaved: boolean = await vm.updateHistoryLimit(50);
      expect(limitSaved).assertFalse();
      expect(vm.settings.historyLimit).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })
  })
}
