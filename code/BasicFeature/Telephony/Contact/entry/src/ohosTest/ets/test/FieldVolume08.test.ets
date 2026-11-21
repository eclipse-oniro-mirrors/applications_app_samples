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
import { ContactFieldExtractor } from '../../../main/ets/utils/ContactFieldExtractor';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_Contact]';

export default function fieldVolume08Test() {
  describe('FieldVolume08Test', () => {
    /**
     * @tc.name   testFieldVolume050343
     * @tc.number SUB_Contact_FIELD_0343
     * @tc.desc   守卫组合：仅 name（guard7），firstPhone 走缺失守卫返回空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050343', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050343 begin');
      const contactInfo: contact.Contact = String('name-only') === 'true' ? {} :
        String('name-only') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: 'guard7' }] } :
        String('name-only') === 'name-only' ?
        { name: { fullName: 'guard7' } } :
         { name: { fullName: 'guard7' }, phoneNumbers: [{ phoneNumber: '' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('guard7'));
      expect(result).assertEqual('guard7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String());
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050343 end');
    });

    /**
     * @tc.name   testFieldVolume050344
     * @tc.number SUB_Contact_FIELD_0344
     * @tc.desc   守卫组合：仅 name（guard8），firstPhone 走缺失守卫返回空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050344', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050344 begin');
      const contactInfo: contact.Contact = String('name-only') === 'true' ? {} :
        String('name-only') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: 'guard8' }] } :
        String('name-only') === 'name-only' ?
        { name: { fullName: 'guard8' } } :
         { name: { fullName: 'guard8' }, phoneNumbers: [{ phoneNumber: '' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('guard8'));
      expect(result).assertEqual('guard8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String());
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050344 end');
    });

    /**
     * @tc.name   testFieldVolume050345
     * @tc.number SUB_Contact_FIELD_0345
     * @tc.desc   守卫组合：仅 name（guard9），firstPhone 走缺失守卫返回空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050345', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050345 begin');
      const contactInfo: contact.Contact = String('name-only') === 'true' ? {} :
        String('name-only') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: 'guard9' }] } :
        String('name-only') === 'name-only' ?
        { name: { fullName: 'guard9' } } :
         { name: { fullName: 'guard9' }, phoneNumbers: [{ phoneNumber: '' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('guard9'));
      expect(result).assertEqual('guard9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String());
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050345 end');
    });

    /**
     * @tc.name   testFieldVolume050346
     * @tc.number SUB_Contact_FIELD_0346
     * @tc.desc   守卫组合：全字段缺失，两提取均返回空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050346', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050346 begin');
      const contactInfo: contact.Contact = String('true') === 'true' ? {} :
        String('true') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: '' }] } :
        String('true') === 'name-only' ?
        { name: { fullName: '' } } :
         { name: { fullName: '' }, phoneNumbers: [{ phoneNumber: '' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String());
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String());
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'X'));
      expect(result === 'X').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050346 end');
    });

    /**
     * @tc.name   testFieldVolume050347
     * @tc.number SUB_Contact_FIELD_0347
     * @tc.desc   守卫组合：全字段缺失，两提取均返回空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050347', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050347 begin');
      const contactInfo: contact.Contact = String('true') === 'true' ? {} :
        String('true') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: '' }] } :
        String('true') === 'name-only' ?
        { name: { fullName: '' } } :
         { name: { fullName: '' }, phoneNumbers: [{ phoneNumber: '' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String());
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String());
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'X'));
      expect(result === 'X').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050347 end');
    });

    /**
     * @tc.name   testFieldVolume050348
     * @tc.number SUB_Contact_FIELD_0348
     * @tc.desc   守卫组合：全字段缺失，两提取均返回空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050348', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050348 begin');
      const contactInfo: contact.Contact = String('true') === 'true' ? {} :
        String('true') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: '' }] } :
        String('true') === 'name-only' ?
        { name: { fullName: '' } } :
         { name: { fullName: '' }, phoneNumbers: [{ phoneNumber: '' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String());
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String());
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'X'));
      expect(result === 'X').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050348 end');
    });

    /**
     * @tc.name   testFieldVolume050349
     * @tc.number SUB_Contact_FIELD_0349
     * @tc.desc   守卫组合：全字段缺失，两提取均返回空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050349', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050349 begin');
      const contactInfo: contact.Contact = String('true') === 'true' ? {} :
        String('true') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: '' }] } :
        String('true') === 'name-only' ?
        { name: { fullName: '' } } :
         { name: { fullName: '' }, phoneNumbers: [{ phoneNumber: '' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String());
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String());
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'X'));
      expect(result === 'X').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050349 end');
    });

    /**
     * @tc.name   testFieldVolume050350
     * @tc.number SUB_Contact_FIELD_0350
     * @tc.desc   守卫组合：全字段缺失，两提取均返回空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050350 begin');
      const contactInfo: contact.Contact = String('true') === 'true' ? {} :
        String('true') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: '' }] } :
        String('true') === 'name-only' ?
        { name: { fullName: '' } } :
         { name: { fullName: '' }, phoneNumbers: [{ phoneNumber: '' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String());
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String());
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'X'));
      expect(result === 'X').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050350 end');
    });

    /**
     * @tc.name   testFieldVolume050351
     * @tc.number SUB_Contact_FIELD_0351
     * @tc.desc   守卫组合：name=mix0 且 phoneNumbers 第 1 项为空串，firstPhone 返回空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050351', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050351 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: 'mix0' }] } :
        String('false') === 'name-only' ?
        { name: { fullName: 'mix0' } } :
         { name: { fullName: 'mix0' }, phoneNumbers: [{ phoneNumber: '' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('mix0'));
      expect(result).assertEqual('mix0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String());
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050351 end');
    });

    /**
     * @tc.name   testFieldVolume050352
     * @tc.number SUB_Contact_FIELD_0352
     * @tc.desc   守卫组合：name=mix1 且 phoneNumbers 第 1 项为空串，firstPhone 返回空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050352', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050352 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: 'mix1' }] } :
        String('false') === 'name-only' ?
        { name: { fullName: 'mix1' } } :
         { name: { fullName: 'mix1' }, phoneNumbers: [{ phoneNumber: '' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('mix1'));
      expect(result).assertEqual('mix1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String());
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050352 end');
    });

    /**
     * @tc.name   testFieldVolume050353
     * @tc.number SUB_Contact_FIELD_0353
     * @tc.desc   守卫组合：name=mix2 且 phoneNumbers 第 1 项为空串，firstPhone 返回空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050353', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050353 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: 'mix2' }] } :
        String('false') === 'name-only' ?
        { name: { fullName: 'mix2' } } :
         { name: { fullName: 'mix2' }, phoneNumbers: [{ phoneNumber: '' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('mix2'));
      expect(result).assertEqual('mix2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String());
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050353 end');
    });

    /**
     * @tc.name   testFieldVolume050354
     * @tc.number SUB_Contact_FIELD_0354
     * @tc.desc   守卫组合：name=mix3 且 phoneNumbers 第 1 项为空串，firstPhone 返回空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050354', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050354 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: 'mix3' }] } :
        String('false') === 'name-only' ?
        { name: { fullName: 'mix3' } } :
         { name: { fullName: 'mix3' }, phoneNumbers: [{ phoneNumber: '' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('mix3'));
      expect(result).assertEqual('mix3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String());
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050354 end');
    });

    /**
     * @tc.name   testFieldVolume050355
     * @tc.number SUB_Contact_FIELD_0355
     * @tc.desc   守卫组合：name=mix4 且 phoneNumbers 第 1 项为空串，firstPhone 返回空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050355', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050355 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: 'mix4' }] } :
        String('false') === 'name-only' ?
        { name: { fullName: 'mix4' } } :
         { name: { fullName: 'mix4' }, phoneNumbers: [{ phoneNumber: '' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('mix4'));
      expect(result).assertEqual('mix4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String());
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050355 end');
    });

    /**
     * @tc.name   testFieldVolume050356
     * @tc.number SUB_Contact_FIELD_0356
     * @tc.desc   守卫组合：name 为空串且 phoneNumbers 第 1 项为 15000000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050356', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050356 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: '' }] } :
        String('false') === 'name-only' ?
        { name: { fullName: '' } } :
         { name: { fullName: '' }, phoneNumbers: [{ phoneNumber: '15000000000' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String());
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(15000000000));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('15000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'X'));
      expect(result === 'X').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050356 end');
    });

    /**
     * @tc.name   testFieldVolume050357
     * @tc.number SUB_Contact_FIELD_0357
     * @tc.desc   守卫组合：name 为空串且 phoneNumbers 第 1 项为 15100000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050357', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050357 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: '' }] } :
        String('false') === 'name-only' ?
        { name: { fullName: '' } } :
         { name: { fullName: '' }, phoneNumbers: [{ phoneNumber: '15100000000' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String());
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(15100000000));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('15100000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'X'));
      expect(result === 'X').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050357 end');
    });

    /**
     * @tc.name   testFieldVolume050358
     * @tc.number SUB_Contact_FIELD_0358
     * @tc.desc   守卫组合：name 为空串且 phoneNumbers 第 1 项为 15200000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050358', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050358 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: '' }] } :
        String('false') === 'name-only' ?
        { name: { fullName: '' } } :
         { name: { fullName: '' }, phoneNumbers: [{ phoneNumber: '15200000000' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String());
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(15200000000));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('15200000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'X'));
      expect(result === 'X').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050358 end');
    });

    /**
     * @tc.name   testFieldVolume050359
     * @tc.number SUB_Contact_FIELD_0359
     * @tc.desc   守卫组合：name 为空串且 phoneNumbers 第 1 项为 15300000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050359', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050359 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: '' }] } :
        String('false') === 'name-only' ?
        { name: { fullName: '' } } :
         { name: { fullName: '' }, phoneNumbers: [{ phoneNumber: '15300000000' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String());
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(15300000000));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('15300000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'X'));
      expect(result === 'X').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050359 end');
    });

    /**
     * @tc.name   testFieldVolume050360
     * @tc.number SUB_Contact_FIELD_0360
     * @tc.desc   守卫组合：name 为空串且 phoneNumbers 第 1 项为 15400000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050360 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: '' }] } :
        String('false') === 'name-only' ?
        { name: { fullName: '' } } :
         { name: { fullName: '' }, phoneNumbers: [{ phoneNumber: '15400000000' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String());
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(15400000000));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('15400000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'X'));
      expect(result === 'X').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050360 end');
    });

    /**
     * @tc.name   testFieldVolume050361
     * @tc.number SUB_Contact_FIELD_0361
     * @tc.desc   守卫组合：name 与 phoneNumbers 均为 100 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050361', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050361 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: 'xxxxxxxxxxxxx' +
        'xxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxx' +
          'xxxxxxxxxxxxx' +
            'xxxxxxxxxxxx' }] } : String('false') === 'name-only' ? { name: { fullName: 'xxxxxxxxxxxxxxxxxxxxxxxxx' +
            'xxxxxxxxxxxxxxxxxxxxxxxxx' +
          'xxxxxxxxxxxxxxxxxxxxxxxxx' +
            'xxxxxxxxxxxxxxxxxxxxxxxxx' } } : { name: { fullName: 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
            'xxxxxxxxxxxxxxxxxxxxxxxxx' +
              'xxxxxxxxxxxxxxxxxxxxxxxxx' }, phoneNumbers: [{ phoneNumber: 'xxxxxxxxxxxxxxxxxxxxxxxxx' +
                'xxxxxxxxxxxxxxxxxxxxxxxxx' +
              'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String('xxxxxxxxxxxxx' +
          'xxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050361 end');
    });

    /**
     * @tc.name   testFieldVolume050362
     * @tc.number SUB_Contact_FIELD_0362
     * @tc.desc   补齐：name=combo_0 与 phoneNumbers 首元素 1660000000 互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050362', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050362 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: 'combo_0' }] } :
        String('false') === 'name-only' ?
        { name: { fullName: 'combo_0' } } :
         { name: { fullName: 'combo_0' }, phoneNumbers: [{ phoneNumber: '1660000000' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('combo_0'));
      expect(result).assertEqual('combo_0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(1660000000));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('1660000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050362 end');
    });

    /**
     * @tc.name   testFieldVolume050363
     * @tc.number SUB_Contact_FIELD_0363
     * @tc.desc   补齐：name=combo_1 与 phoneNumbers 首元素 1660000001 互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050363', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050363 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: 'combo_1' }] } :
        String('false') === 'name-only' ?
        { name: { fullName: 'combo_1' } } :
         { name: { fullName: 'combo_1' }, phoneNumbers: [{ phoneNumber: '1660000001' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('combo_1'));
      expect(result).assertEqual('combo_1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(1660000001));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('1660000001');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050363 end');
    });

    /**
     * @tc.name   testFieldVolume050364
     * @tc.number SUB_Contact_FIELD_0364
     * @tc.desc   补齐：name=combo_2 与 phoneNumbers 首元素 1660000002 互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050364', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050364 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: 'combo_2' }] } :
        String('false') === 'name-only' ?
        { name: { fullName: 'combo_2' } } :
         { name: { fullName: 'combo_2' }, phoneNumbers: [{ phoneNumber: '1660000002' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('combo_2'));
      expect(result).assertEqual('combo_2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(1660000002));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('1660000002');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050364 end');
    });

    /**
     * @tc.name   testFieldVolume050365
     * @tc.number SUB_Contact_FIELD_0365
     * @tc.desc   补齐：name=combo_3 与 phoneNumbers 首元素 1660000003 互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050365', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050365 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: 'combo_3' }] } :
        String('false') === 'name-only' ?
        { name: { fullName: 'combo_3' } } :
         { name: { fullName: 'combo_3' }, phoneNumbers: [{ phoneNumber: '1660000003' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('combo_3'));
      expect(result).assertEqual('combo_3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(1660000003));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('1660000003');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050365 end');
    });

    /**
     * @tc.name   testFieldVolume050366
     * @tc.number SUB_Contact_FIELD_0366
     * @tc.desc   补齐：name=combo_4 与 phoneNumbers 首元素 1660000004 互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050366', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050366 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: 'combo_4' }] } :
        String('false') === 'name-only' ?
        { name: { fullName: 'combo_4' } } :
         { name: { fullName: 'combo_4' }, phoneNumbers: [{ phoneNumber: '1660000004' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('combo_4'));
      expect(result).assertEqual('combo_4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(1660000004));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('1660000004');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050366 end');
    });

    /**
     * @tc.name   testFieldVolume050367
     * @tc.number SUB_Contact_FIELD_0367
     * @tc.desc   补齐：name=combo_5 与 phoneNumbers 首元素 1660000005 互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050367', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050367 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: 'combo_5' }] } :
        String('false') === 'name-only' ?
        { name: { fullName: 'combo_5' } } :
         { name: { fullName: 'combo_5' }, phoneNumbers: [{ phoneNumber: '1660000005' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('combo_5'));
      expect(result).assertEqual('combo_5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(1660000005));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('1660000005');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050367 end');
    });

    /**
     * @tc.name   testFieldVolume050368
     * @tc.number SUB_Contact_FIELD_0368
     * @tc.desc   补齐：name=combo_6 与 phoneNumbers 首元素 1660000006 互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050368', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050368 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: 'combo_6' }] } :
        String('false') === 'name-only' ?
        { name: { fullName: 'combo_6' } } :
         { name: { fullName: 'combo_6' }, phoneNumbers: [{ phoneNumber: '1660000006' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('combo_6'));
      expect(result).assertEqual('combo_6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(1660000006));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('1660000006');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050368 end');
    });

    /**
     * @tc.name   testFieldVolume050369
     * @tc.number SUB_Contact_FIELD_0369
     * @tc.desc   补齐：name=combo_7 与 phoneNumbers 首元素 1660000007 互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050369', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050369 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: 'combo_7' }] } :
        String('false') === 'name-only' ?
        { name: { fullName: 'combo_7' } } :
         { name: { fullName: 'combo_7' }, phoneNumbers: [{ phoneNumber: '1660000007' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('combo_7'));
      expect(result).assertEqual('combo_7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(1660000007));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('1660000007');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050369 end');
    });

    /**
     * @tc.name   testFieldVolume050370
     * @tc.number SUB_Contact_FIELD_0370
     * @tc.desc   补齐：name=combo_8 与 phoneNumbers 首元素 1660000008 互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050370 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: 'combo_8' }] } :
        String('false') === 'name-only' ?
        { name: { fullName: 'combo_8' } } :
         { name: { fullName: 'combo_8' }, phoneNumbers: [{ phoneNumber: '1660000008' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('combo_8'));
      expect(result).assertEqual('combo_8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(1660000008));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('1660000008');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050370 end');
    });

    /**
     * @tc.name   testFieldVolume050371
     * @tc.number SUB_Contact_FIELD_0371
     * @tc.desc   补齐：name=combo_9 与 phoneNumbers 首元素 1660000009 互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050371', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050371 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: 'combo_9' }] } :
        String('false') === 'name-only' ?
        { name: { fullName: 'combo_9' } } :
         { name: { fullName: 'combo_9' }, phoneNumbers: [{ phoneNumber: '1660000009' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('combo_9'));
      expect(result).assertEqual('combo_9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(1660000009));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('1660000009');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050371 end');
    });

    /**
     * @tc.name   testFieldVolume050372
     * @tc.number SUB_Contact_FIELD_0372
     * @tc.desc   补齐：name=combo_10 与 phoneNumbers 首元素 1660000010 互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050372', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050372 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: 'combo_10' }] } :
        String('false') === 'name-only' ?
        { name: { fullName: 'combo_10' } } :
         { name: { fullName: 'combo_10' }, phoneNumbers: [{ phoneNumber: '1660000010' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('combo_10'));
      expect(result).assertEqual('combo_10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(1660000010));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('1660000010');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050372 end');
    });

    /**
     * @tc.name   testFieldVolume050373
     * @tc.number SUB_Contact_FIELD_0373
     * @tc.desc   补齐：name=combo_11 与 phoneNumbers 首元素 1660000011 互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050373', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050373 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: 'combo_11' }] } :
        String('false') === 'name-only' ?
        { name: { fullName: 'combo_11' } } :
         { name: { fullName: 'combo_11' }, phoneNumbers: [{ phoneNumber: '1660000011' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('combo_11'));
      expect(result).assertEqual('combo_11');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(1660000011));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('1660000011');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050373 end');
    });

    /**
     * @tc.name   testFieldVolume050374
     * @tc.number SUB_Contact_FIELD_0374
     * @tc.desc   补齐：name=combo_12 与 phoneNumbers 首元素 1660000012 互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050374', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050374 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: 'combo_12' }] } :
        String('false') === 'name-only' ?
        { name: { fullName: 'combo_12' } } :
         { name: { fullName: 'combo_12' }, phoneNumbers: [{ phoneNumber: '1660000012' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('combo_12'));
      expect(result).assertEqual('combo_12');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(1660000012));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('1660000012');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050374 end');
    });

    /**
     * @tc.name   testFieldVolume050375
     * @tc.number SUB_Contact_FIELD_0375
     * @tc.desc   补齐：name=combo_13 与 phoneNumbers 首元素 1660000013 互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050375', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050375 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: 'combo_13' }] } :
        String('false') === 'name-only' ?
        { name: { fullName: 'combo_13' } } :
         { name: { fullName: 'combo_13' }, phoneNumbers: [{ phoneNumber: '1660000013' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('combo_13'));
      expect(result).assertEqual('combo_13');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(1660000013));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('1660000013');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050375 end');
    });

    /**
     * @tc.name   testFieldVolume050376
     * @tc.number SUB_Contact_FIELD_0376
     * @tc.desc   补齐：name=combo_14 与 phoneNumbers 首元素 1660000014 互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050376', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050376 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: 'combo_14' }] } :
        String('false') === 'name-only' ?
        { name: { fullName: 'combo_14' } } :
         { name: { fullName: 'combo_14' }, phoneNumbers: [{ phoneNumber: '1660000014' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('combo_14'));
      expect(result).assertEqual('combo_14');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(1660000014));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('1660000014');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050376 end');
    });

    /**
     * @tc.name   testFieldVolume050377
     * @tc.number SUB_Contact_FIELD_0377
     * @tc.desc   补齐：name=combo_15 与 phoneNumbers 首元素 1660000015 互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050377', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050377 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: 'combo_15' }] } :
        String('false') === 'name-only' ?
        { name: { fullName: 'combo_15' } } :
         { name: { fullName: 'combo_15' }, phoneNumbers: [{ phoneNumber: '1660000015' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('combo_15'));
      expect(result).assertEqual('combo_15');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(1660000015));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('1660000015');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050377 end');
    });

    /**
     * @tc.name   testFieldVolume050378
     * @tc.number SUB_Contact_FIELD_0378
     * @tc.desc   补齐：name=combo_16 与 phoneNumbers 首元素 1660000016 互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050378', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050378 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: 'combo_16' }] } :
        String('false') === 'name-only' ?
        { name: { fullName: 'combo_16' } } :
         { name: { fullName: 'combo_16' }, phoneNumbers: [{ phoneNumber: '1660000016' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('combo_16'));
      expect(result).assertEqual('combo_16');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(1660000016));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('1660000016');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050378 end');
    });

    /**
     * @tc.name   testFieldVolume050379
     * @tc.number SUB_Contact_FIELD_0379
     * @tc.desc   补齐：name=combo_17 与 phoneNumbers 首元素 1660000017 互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050379', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050379 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: 'combo_17' }] } :
        String('false') === 'name-only' ?
        { name: { fullName: 'combo_17' } } :
         { name: { fullName: 'combo_17' }, phoneNumbers: [{ phoneNumber: '1660000017' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('combo_17'));
      expect(result).assertEqual('combo_17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(1660000017));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('1660000017');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050379 end');
    });

    /**
     * @tc.name   testFieldVolume050380
     * @tc.number SUB_Contact_FIELD_0380
     * @tc.desc   补齐：name=combo_18 与 phoneNumbers 首元素 1660000018 互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050380 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: 'combo_18' }] } :
        String('false') === 'name-only' ?
        { name: { fullName: 'combo_18' } } :
         { name: { fullName: 'combo_18' }, phoneNumbers: [{ phoneNumber: '1660000018' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('combo_18'));
      expect(result).assertEqual('combo_18');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(1660000018));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('1660000018');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050380 end');
    });
  });
}
