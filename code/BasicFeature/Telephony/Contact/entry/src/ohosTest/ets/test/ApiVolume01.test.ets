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
import contact from '@ohos.contact';
import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import fileIo from '@ohos.file.fs';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_Contact]';

export default function apiVolume01Test() {
  describe('ApiVolume01Test', () => {

    /**
     * @tc.name   testApiVolume01Anchor01
     * @tc.number SUB_Contact_API_0001
     * @tc.desc   查询类入口函数存在且为函数，与 null 对照
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume01Anchor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume01Anchor01 begin');
      expect(typeof contact.queryContacts).assertEqual('function');
      expect(typeof router.pushUrl).assertEqual('function');
      expect(contact.queryContacts === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume01Anchor01 end');
    });
    /**
     * @tc.name   testApiVolume010002
     * @tc.number SUB_Contact_API_0002
     * @tc.desc   @ohos.contact.addContact 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010002 begin');
      const result: string = typeof contact.addContact;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof contact.addContact), String('function'));
      expect(typeof contact.addContact).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(contact.addContact === undefined));
      expect(contact.addContact === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(contact.addContact.name), String('addContact'));
      expect(contact.addContact.name).assertEqual('addContact');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010002 end');
    });

    /**
     * @tc.name   testApiVolume010003
     * @tc.number SUB_Contact_API_0003
     * @tc.desc   @ohos.contact.addContactViaUI 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010003 begin');
      const result: string = typeof contact.addContactViaUI;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof contact.addContactViaUI), String('function'));
      expect(typeof contact.addContactViaUI).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(contact.addContactViaUI === undefined));
      expect(contact.addContactViaUI === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(contact.addContactViaUI.name), String('contactsPickerSave'));
      expect(contact.addContactViaUI.name).assertEqual('contactsPickerSave');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010003 end');
    });

    /**
     * @tc.name   testApiVolume010004
     * @tc.number SUB_Contact_API_0004
     * @tc.desc   @ohos.contact.addContacts 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010004 begin');
      const result: string = typeof contact.addContacts;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof contact.addContacts), String('function'));
      expect(typeof contact.addContacts).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(contact.addContacts === undefined));
      expect(contact.addContacts === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(contact.addContacts.name), String('addContacts'));
      expect(contact.addContacts.name).assertEqual('addContacts');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010004 end');
    });

    /**
     * @tc.name   testApiVolume010005
     * @tc.number SUB_Contact_API_0005
     * @tc.desc   @ohos.contact.deleteContact 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010005 begin');
      const result: string = typeof contact.deleteContact;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof contact.deleteContact), String('function'));
      expect(typeof contact.deleteContact).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(contact.deleteContact === undefined));
      expect(contact.deleteContact === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(contact.deleteContact.name), String('deleteContact'));
      expect(contact.deleteContact.name).assertEqual('deleteContact');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010005 end');
    });

    /**
     * @tc.name   testApiVolume010006
     * @tc.number SUB_Contact_API_0006
     * @tc.desc   @ohos.contact.hasMatchedCallLog 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010006 begin');
      const result: string = typeof contact.hasMatchedCallLog;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof contact.hasMatchedCallLog), String('function'));
      expect(typeof contact.hasMatchedCallLog).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(contact.hasMatchedCallLog === undefined));
      expect(contact.hasMatchedCallLog === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(contact.hasMatchedCallLog.name), String('hasMatchedCallLog'));
      expect(contact.hasMatchedCallLog.name).assertEqual('hasMatchedCallLog');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010006 end');
    });

    /**
     * @tc.name   testApiVolume010007
     * @tc.number SUB_Contact_API_0007
     * @tc.desc   @ohos.contact.importContactsViaUI 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010007 begin');
      const result: string = typeof contact.importContactsViaUI;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof contact.importContactsViaUI), String('function'));
      expect(typeof contact.importContactsViaUI).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(contact.importContactsViaUI === undefined));
      expect(contact.importContactsViaUI === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(contact.importContactsViaUI.name), String('importContactsViaUI'));
      expect(contact.importContactsViaUI.name).assertEqual('importContactsViaUI');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010007 end');
    });

    /**
     * @tc.name   testApiVolume010008
     * @tc.number SUB_Contact_API_0008
     * @tc.desc   @ohos.contact.isLocalContact 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010008 begin');
      const result: string = typeof contact.isLocalContact;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof contact.isLocalContact), String('function'));
      expect(typeof contact.isLocalContact).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(contact.isLocalContact === undefined));
      expect(contact.isLocalContact === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(contact.isLocalContact.name), String('isLocalContact'));
      expect(contact.isLocalContact.name).assertEqual('isLocalContact');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010008 end');
    });

    /**
     * @tc.name   testApiVolume010009
     * @tc.number SUB_Contact_API_0009
     * @tc.desc   @ohos.contact.isMyCard 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010009 begin');
      const result: string = typeof contact.isMyCard;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof contact.isMyCard), String('function'));
      expect(typeof contact.isMyCard).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(contact.isMyCard === undefined));
      expect(contact.isMyCard === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(contact.isMyCard.name), String('isMyCard'));
      expect(contact.isMyCard.name).assertEqual('isMyCard');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010009 end');
    });

    /**
     * @tc.name   testApiVolume010010
     * @tc.number SUB_Contact_API_0010
     * @tc.desc   @ohos.contact.queryContact 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010010 begin');
      const result: string = typeof contact.queryContact;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof contact.queryContact), String('function'));
      expect(typeof contact.queryContact).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(contact.queryContact === undefined));
      expect(contact.queryContact === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(contact.queryContact.name), String('queryContact'));
      expect(contact.queryContact.name).assertEqual('queryContact');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010010 end');
    });

    /**
     * @tc.name   testApiVolume010011
     * @tc.number SUB_Contact_API_0011
     * @tc.desc   @ohos.contact.queryContactSyncInfo 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010011 begin');
      const result: string = typeof contact.queryContactSyncInfo;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof contact.queryContactSyncInfo), String('function'));
      expect(typeof contact.queryContactSyncInfo).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(contact.queryContactSyncInfo === undefined));
      expect(contact.queryContactSyncInfo === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(contact.queryContactSyncInfo.name), String('queryContactSyncInfo'));
      expect(contact.queryContactSyncInfo.name).assertEqual('queryContactSyncInfo');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010011 end');
    });

    /**
     * @tc.name   testApiVolume010012
     * @tc.number SUB_Contact_API_0012
     * @tc.desc   @ohos.contact.queryContacts 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010012 begin');
      const result: string = typeof contact.queryContacts;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof contact.queryContacts), String('function'));
      expect(typeof contact.queryContacts).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(contact.queryContacts === undefined));
      expect(contact.queryContacts === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(contact.queryContacts.name), String('queryContacts'));
      expect(contact.queryContacts.name).assertEqual('queryContacts');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010012 end');
    });

    /**
     * @tc.name   testApiVolume010013
     * @tc.number SUB_Contact_API_0013
     * @tc.desc   @ohos.contact.queryContactsByEmail 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010013 begin');
      const result: string = typeof contact.queryContactsByEmail;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof contact.queryContactsByEmail), String('function'));
      expect(typeof contact.queryContactsByEmail).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(contact.queryContactsByEmail === undefined));
      expect(contact.queryContactsByEmail === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(contact.queryContactsByEmail.name), String('queryContactsByEmail'));
      expect(contact.queryContactsByEmail.name).assertEqual('queryContactsByEmail');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010013 end');
    });

    /**
     * @tc.name   testApiVolume010014
     * @tc.number SUB_Contact_API_0014
     * @tc.desc   @ohos.contact.queryContactsByPhoneNumber 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010014 begin');
      const result: string = typeof contact.queryContactsByPhoneNumber;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof contact.queryContactsByPhoneNumber), String('function'));
      expect(typeof contact.queryContactsByPhoneNumber).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(contact.queryContactsByPhoneNumber === undefined));
      expect(contact.queryContactsByPhoneNumber === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(contact.queryContactsByPhoneNumber.name), String('queryContactsByPhoneNumber'));
      expect(contact.queryContactsByPhoneNumber.name).assertEqual('queryContactsByPhoneNumber');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010014 end');
    });

    /**
     * @tc.name   testApiVolume010015
     * @tc.number SUB_Contact_API_0015
     * @tc.desc   @ohos.contact.queryContactsCount 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010015 begin');
      const result: string = typeof contact.queryContactsCount;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof contact.queryContactsCount), String('function'));
      expect(typeof contact.queryContactsCount).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(contact.queryContactsCount === undefined));
      expect(contact.queryContactsCount === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(contact.queryContactsCount.name), String('queryContactsCount'));
      expect(contact.queryContactsCount.name).assertEqual('queryContactsCount');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010015 end');
    });

    /**
     * @tc.name   testApiVolume010016
     * @tc.number SUB_Contact_API_0016
     * @tc.desc   @ohos.contact.queryGroups 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010016 begin');
      const result: string = typeof contact.queryGroups;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof contact.queryGroups), String('function'));
      expect(typeof contact.queryGroups).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(contact.queryGroups === undefined));
      expect(contact.queryGroups === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(contact.queryGroups.name), String('queryGroups'));
      expect(contact.queryGroups.name).assertEqual('queryGroups');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010016 end');
    });

    /**
     * @tc.name   testApiVolume010017
     * @tc.number SUB_Contact_API_0017
     * @tc.desc   @ohos.contact.queryHolders 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010017 begin');
      const result: string = typeof contact.queryHolders;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof contact.queryHolders), String('function'));
      expect(typeof contact.queryHolders).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(contact.queryHolders === undefined));
      expect(contact.queryHolders === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(contact.queryHolders.name), String('queryHolders'));
      expect(contact.queryHolders.name).assertEqual('queryHolders');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010017 end');
    });

    /**
     * @tc.name   testApiVolume010018
     * @tc.number SUB_Contact_API_0018
     * @tc.desc   @ohos.contact.queryKey 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010018 begin');
      const result: string = typeof contact.queryKey;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof contact.queryKey), String('function'));
      expect(typeof contact.queryKey).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(contact.queryKey === undefined));
      expect(contact.queryKey === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(contact.queryKey.name), String('queryKey'));
      expect(contact.queryKey.name).assertEqual('queryKey');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010018 end');
    });

    /**
     * @tc.name   testApiVolume010019
     * @tc.number SUB_Contact_API_0019
     * @tc.desc   @ohos.contact.queryMyCard 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010019 begin');
      const result: string = typeof contact.queryMyCard;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof contact.queryMyCard), String('function'));
      expect(typeof contact.queryMyCard).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(contact.queryMyCard === undefined));
      expect(contact.queryMyCard === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(contact.queryMyCard.name), String('queryMyCard'));
      expect(contact.queryMyCard.name).assertEqual('queryMyCard');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010019 end');
    });

    /**
     * @tc.name   testApiVolume010020
     * @tc.number SUB_Contact_API_0020
     * @tc.desc   @ohos.contact.saveToExistingContactViaUI 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010020 begin');
      const result: string = typeof contact.saveToExistingContactViaUI;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof contact.saveToExistingContactViaUI), String('function'));
      expect(typeof contact.saveToExistingContactViaUI).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(contact.saveToExistingContactViaUI === undefined));
      expect(contact.saveToExistingContactViaUI === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(contact.saveToExistingContactViaUI.name), String('contactsPickerSaveToExist'));
      expect(contact.saveToExistingContactViaUI.name).assertEqual('contactsPickerSaveToExist');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010020 end');
    });

    /**
     * @tc.name   testApiVolume010021
     * @tc.number SUB_Contact_API_0021
     * @tc.desc   @ohos.contact.selectContact 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010021 begin');
      const result: string = typeof contact.selectContact;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof contact.selectContact), String('function'));
      expect(typeof contact.selectContact).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(contact.selectContact === undefined));
      expect(contact.selectContact === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(contact.selectContact.name), String('contactsPickerSelect'));
      expect(contact.selectContact.name).assertEqual('contactsPickerSelect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010021 end');
    });

    /**
     * @tc.name   testApiVolume010022
     * @tc.number SUB_Contact_API_0022
     * @tc.desc   @ohos.contact.selectContacts 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010022 begin');
      const result: string = typeof contact.selectContacts;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof contact.selectContacts), String('function'));
      expect(typeof contact.selectContacts).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(contact.selectContacts === undefined));
      expect(contact.selectContacts === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(contact.selectContacts.name), String('contactsPickerSelect'));
      expect(contact.selectContacts.name).assertEqual('contactsPickerSelect');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010022 end');
    });

    /**
     * @tc.name   testApiVolume010023
     * @tc.number SUB_Contact_API_0023
     * @tc.desc   @ohos.contact.syncContacts 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010023 begin');
      const result: string = typeof contact.syncContacts;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof contact.syncContacts), String('function'));
      expect(typeof contact.syncContacts).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(contact.syncContacts === undefined));
      expect(contact.syncContacts === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(contact.syncContacts.name), String('syncContacts'));
      expect(contact.syncContacts.name).assertEqual('syncContacts');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010023 end');
    });

    /**
     * @tc.name   testApiVolume010024
     * @tc.number SUB_Contact_API_0024
     * @tc.desc   @ohos.contact.updateContact 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010024 begin');
      const result: string = typeof contact.updateContact;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof contact.updateContact), String('function'));
      expect(typeof contact.updateContact).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(contact.updateContact === undefined));
      expect(contact.updateContact === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(contact.updateContact.name), String('updateContact'));
      expect(contact.updateContact.name).assertEqual('updateContact');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010024 end');
    });

    /**
     * @tc.name   testApiVolume010025
     * @tc.number SUB_Contact_API_0025
     * @tc.desc   @ohos.router.pushUrl 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010025 begin');
      const result: string = typeof router.pushUrl;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof router.pushUrl), String('function'));
      expect(typeof router.pushUrl).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(router.pushUrl === undefined));
      expect(router.pushUrl === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(router.pushUrl.name), String('pushUrl'));
      expect(router.pushUrl.name).assertEqual('pushUrl');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010025 end');
    });

    /**
     * @tc.name   testApiVolume010026
     * @tc.number SUB_Contact_API_0026
     * @tc.desc   @ohos.router.replaceUrl 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010026 begin');
      const result: string = typeof router.replaceUrl;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof router.replaceUrl), String('function'));
      expect(typeof router.replaceUrl).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(router.replaceUrl === undefined));
      expect(router.replaceUrl === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(router.replaceUrl.name), String('replaceUrl'));
      expect(router.replaceUrl.name).assertEqual('replaceUrl');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010026 end');
    });

    /**
     * @tc.name   testApiVolume010027
     * @tc.number SUB_Contact_API_0027
     * @tc.desc   @ohos.router.back 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010027 begin');
      const result: string = typeof router.back;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof router.back), String('function'));
      expect(typeof router.back).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(router.back === undefined));
      expect(router.back === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(router.back.name), String('back'));
      expect(router.back.name).assertEqual('back');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010027 end');
    });

    /**
     * @tc.name   testApiVolume010028
     * @tc.number SUB_Contact_API_0028
     * @tc.desc   @ohos.router.clear 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010028 begin');
      const result: string = typeof router.clear;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof router.clear), String('function'));
      expect(typeof router.clear).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(router.clear === undefined));
      expect(router.clear === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(router.clear.name), String('clear'));
      expect(router.clear.name).assertEqual('clear');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010028 end');
    });

    /**
     * @tc.name   testApiVolume010029
     * @tc.number SUB_Contact_API_0029
     * @tc.desc   @ohos.router.getParams 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010029 begin');
      const result: string = typeof router.getParams;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof router.getParams), String('function'));
      expect(typeof router.getParams).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(router.getParams === undefined));
      expect(router.getParams === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(router.getParams.name), String('getParams'));
      expect(router.getParams.name).assertEqual('getParams');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010029 end');
    });

    /**
     * @tc.name   testApiVolume010030
     * @tc.number SUB_Contact_API_0030
     * @tc.desc   @ohos.router.getLength 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010030 begin');
      const result: string = typeof router.getLength;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof router.getLength), String('function'));
      expect(typeof router.getLength).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(router.getLength === undefined));
      expect(router.getLength === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(router.getLength.name), String('getLength'));
      expect(router.getLength.name).assertEqual('getLength');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010030 end');
    });

    /**
     * @tc.name   testApiVolume010031
     * @tc.number SUB_Contact_API_0031
     * @tc.desc   @ohos.router.getState 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010031 begin');
      const result: string = typeof router.getState;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof router.getState), String('function'));
      expect(typeof router.getState).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(router.getState === undefined));
      expect(router.getState === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(router.getState.name), String('getState'));
      expect(router.getState.name).assertEqual('getState');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010031 end');
    });

    /**
     * @tc.name   testApiVolume010032
     * @tc.number SUB_Contact_API_0032
     * @tc.desc   @ohos.router.getStateByIndex 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010032 begin');
      const result: string = typeof router.getStateByIndex;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof router.getStateByIndex), String('function'));
      expect(typeof router.getStateByIndex).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(router.getStateByIndex === undefined));
      expect(router.getStateByIndex === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(router.getStateByIndex.name), String('getStateByIndex'));
      expect(router.getStateByIndex.name).assertEqual('getStateByIndex');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010032 end');
    });

    /**
     * @tc.name   testApiVolume010033
     * @tc.number SUB_Contact_API_0033
     * @tc.desc   @ohos.router.getStateByUrl 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010033 begin');
      const result: string = typeof router.getStateByUrl;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof router.getStateByUrl), String('function'));
      expect(typeof router.getStateByUrl).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(router.getStateByUrl === undefined));
      expect(router.getStateByUrl === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(router.getStateByUrl.name), String('getStateByUrl'));
      expect(router.getStateByUrl.name).assertEqual('getStateByUrl');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010033 end');
    });

    /**
     * @tc.name   testApiVolume010034
     * @tc.number SUB_Contact_API_0034
     * @tc.desc   @ohos.router.enableAlertBeforeBackPage 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010034 begin');
      const result: string = typeof router.enableAlertBeforeBackPage;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof router.enableAlertBeforeBackPage), String('function'));
      expect(typeof router.enableAlertBeforeBackPage).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(router.enableAlertBeforeBackPage === undefined));
      expect(router.enableAlertBeforeBackPage === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(router.enableAlertBeforeBackPage.name), String('enableAlertBeforeBackPage'));
      expect(router.enableAlertBeforeBackPage.name).assertEqual('enableAlertBeforeBackPage');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010034 end');
    });

    /**
     * @tc.name   testApiVolume010035
     * @tc.number SUB_Contact_API_0035
     * @tc.desc   @ohos.router.disableAlertBeforeBackPage 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010035 begin');
      const result: string = typeof router.disableAlertBeforeBackPage;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof router.disableAlertBeforeBackPage), String('function'));
      expect(typeof router.disableAlertBeforeBackPage).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(router.disableAlertBeforeBackPage === undefined));
      expect(router.disableAlertBeforeBackPage === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(router.disableAlertBeforeBackPage.name), String('disableAlertBeforeBackPage'));
      expect(router.disableAlertBeforeBackPage.name).assertEqual('disableAlertBeforeBackPage');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010035 end');
    });

    /**
     * @tc.name   testApiVolume010036
     * @tc.number SUB_Contact_API_0036
     * @tc.desc   @ohos.router.showAlertBeforeBackPage 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010036 begin');
      const result: string = typeof router.showAlertBeforeBackPage;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof router.showAlertBeforeBackPage), String('function'));
      expect(typeof router.showAlertBeforeBackPage).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(router.showAlertBeforeBackPage === undefined));
      expect(router.showAlertBeforeBackPage === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(router.showAlertBeforeBackPage.name), String('showAlertBeforeBackPage'));
      expect(router.showAlertBeforeBackPage.name).assertEqual('showAlertBeforeBackPage');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010036 end');
    });

    /**
     * @tc.name   testApiVolume010037
     * @tc.number SUB_Contact_API_0037
     * @tc.desc   @ohos.router.hideAlertBeforeBackPage 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010037 begin');
      const result: string = typeof router.hideAlertBeforeBackPage;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof router.hideAlertBeforeBackPage), String('function'));
      expect(typeof router.hideAlertBeforeBackPage).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(router.hideAlertBeforeBackPage === undefined));
      expect(router.hideAlertBeforeBackPage === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(router.hideAlertBeforeBackPage.name), String('hideAlertBeforeBackPage'));
      expect(router.hideAlertBeforeBackPage.name).assertEqual('hideAlertBeforeBackPage');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010037 end');
    });

    /**
     * @tc.name   testApiVolume010038
     * @tc.number SUB_Contact_API_0038
     * @tc.desc   @ohos.router.push 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010038 begin');
      const result: string = typeof router.push;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof router.push), String('function'));
      expect(typeof router.push).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(router.push === undefined));
      expect(router.push === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(router.push.name), String('push'));
      expect(router.push.name).assertEqual('push');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010038 end');
    });

    /**
     * @tc.name   testApiVolume010039
     * @tc.number SUB_Contact_API_0039
     * @tc.desc   @ohos.router.replace 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010039 begin');
      const result: string = typeof router.replace;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof router.replace), String('function'));
      expect(typeof router.replace).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(router.replace === undefined));
      expect(router.replace === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(router.replace.name), String('replace'));
      expect(router.replace.name).assertEqual('replace');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010039 end');
    });

    /**
     * @tc.name   testApiVolume010040
     * @tc.number SUB_Contact_API_0040
     * @tc.desc   @ohos.router.pushNamedRoute 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010040 begin');
      const result: string = typeof router.pushNamedRoute;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof router.pushNamedRoute), String('function'));
      expect(typeof router.pushNamedRoute).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(router.pushNamedRoute === undefined));
      expect(router.pushNamedRoute === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(router.pushNamedRoute.name), String('pushNamedRoute'));
      expect(router.pushNamedRoute.name).assertEqual('pushNamedRoute');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010040 end');
    });

    /**
     * @tc.name   testApiVolume010041
     * @tc.number SUB_Contact_API_0041
     * @tc.desc   @ohos.router.replaceNamedRoute 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010041 begin');
      const result: string = typeof router.replaceNamedRoute;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof router.replaceNamedRoute), String('function'));
      expect(typeof router.replaceNamedRoute).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(router.replaceNamedRoute === undefined));
      expect(router.replaceNamedRoute === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(router.replaceNamedRoute.name), String('replaceNamedRoute'));
      expect(router.replaceNamedRoute.name).assertEqual('replaceNamedRoute');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010041 end');
    });

    /**
     * @tc.name   testApiVolume010042
     * @tc.number SUB_Contact_API_0042
     * @tc.desc   @ohos.promptAction.showToast 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010042 begin');
      const result: string = typeof promptAction.showToast;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof promptAction.showToast), String('function'));
      expect(typeof promptAction.showToast).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(promptAction.showToast === undefined));
      expect(promptAction.showToast === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(promptAction.showToast.name), String('showToast'));
      expect(promptAction.showToast.name).assertEqual('showToast');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010042 end');
    });

    /**
     * @tc.name   testApiVolume010043
     * @tc.number SUB_Contact_API_0043
     * @tc.desc   @ohos.promptAction.openToast 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010043 begin');
      const result: string = typeof promptAction.openToast;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof promptAction.openToast), String('function'));
      expect(typeof promptAction.openToast).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(promptAction.openToast === undefined));
      expect(promptAction.openToast === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(promptAction.openToast.name), String('openToast'));
      expect(promptAction.openToast.name).assertEqual('openToast');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010043 end');
    });

    /**
     * @tc.name   testApiVolume010044
     * @tc.number SUB_Contact_API_0044
     * @tc.desc   @ohos.promptAction.closeToast 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010044 begin');
      const result: string = typeof promptAction.closeToast;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof promptAction.closeToast), String('function'));
      expect(typeof promptAction.closeToast).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(promptAction.closeToast === undefined));
      expect(promptAction.closeToast === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(promptAction.closeToast.name), String('closeToast'));
      expect(promptAction.closeToast.name).assertEqual('closeToast');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010044 end');
    });

    /**
     * @tc.name   testApiVolume010045
     * @tc.number SUB_Contact_API_0045
     * @tc.desc   @ohos.promptAction.showDialog 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010045 begin');
      const result: string = typeof promptAction.showDialog;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof promptAction.showDialog), String('function'));
      expect(typeof promptAction.showDialog).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(promptAction.showDialog === undefined));
      expect(promptAction.showDialog === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(promptAction.showDialog.name), String('showDialog'));
      expect(promptAction.showDialog.name).assertEqual('showDialog');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010045 end');
    });

    /**
     * @tc.name   testApiVolume010046
     * @tc.number SUB_Contact_API_0046
     * @tc.desc   @ohos.promptAction.showActionMenu 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010046 begin');
      const result: string = typeof promptAction.showActionMenu;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof promptAction.showActionMenu), String('function'));
      expect(typeof promptAction.showActionMenu).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(promptAction.showActionMenu === undefined));
      expect(promptAction.showActionMenu === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(promptAction.showActionMenu.name), String('showActionMenu'));
      expect(promptAction.showActionMenu.name).assertEqual('showActionMenu');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010046 end');
    });

    /**
     * @tc.name   testApiVolume010047
     * @tc.number SUB_Contact_API_0047
     * @tc.desc   @ohos.promptAction.openCustomDialog 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010047 begin');
      const result: string = typeof promptAction.openCustomDialog;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof promptAction.openCustomDialog), String('function'));
      expect(typeof promptAction.openCustomDialog).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(promptAction.openCustomDialog === undefined));
      expect(promptAction.openCustomDialog === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(promptAction.openCustomDialog.name), String('openCustomDialog'));
      expect(promptAction.openCustomDialog.name).assertEqual('openCustomDialog');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010047 end');
    });

    /**
     * @tc.name   testApiVolume010048
     * @tc.number SUB_Contact_API_0048
     * @tc.desc   @ohos.promptAction.closeCustomDialog 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010048 begin');
      const result: string = typeof promptAction.closeCustomDialog;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof promptAction.closeCustomDialog), String('function'));
      expect(typeof promptAction.closeCustomDialog).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(promptAction.closeCustomDialog === undefined));
      expect(promptAction.closeCustomDialog === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(promptAction.closeCustomDialog.name), String('closeCustomDialog'));
      expect(promptAction.closeCustomDialog.name).assertEqual('closeCustomDialog');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010048 end');
    });

    /**
     * @tc.name   testApiVolume010049
     * @tc.number SUB_Contact_API_0049
     * @tc.desc   @ohos.file.fs.access 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010049 begin');
      const result: string = typeof fileIo.access;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.access), String('function'));
      expect(typeof fileIo.access).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.access === undefined));
      expect(fileIo.access === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.access.name), String('access'));
      expect(fileIo.access.name).assertEqual('access');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010049 end');
    });

    /**
     * @tc.name   testApiVolume010050
     * @tc.number SUB_Contact_API_0050
     * @tc.desc   @ohos.file.fs.accessSync 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010050 begin');
      const result: string = typeof fileIo.accessSync;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.accessSync), String('function'));
      expect(typeof fileIo.accessSync).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.accessSync === undefined));
      expect(fileIo.accessSync === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.accessSync.name), String('accessSync'));
      expect(fileIo.accessSync.name).assertEqual('accessSync');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010050 end');
    });

    /**
     * @tc.name   testApiVolume010051
     * @tc.number SUB_Contact_API_0051
     * @tc.desc   @ohos.file.fs.close 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010051 begin');
      const result: string = typeof fileIo.close;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.close), String('function'));
      expect(typeof fileIo.close).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.close === undefined));
      expect(fileIo.close === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.close.name), String('close'));
      expect(fileIo.close.name).assertEqual('close');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010051 end');
    });


  });
}
