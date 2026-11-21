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

export default function fieldVolume03Test() {
  describe('FieldVolume03Test', () => {

    /**
     * @tc.name   testFieldVolume03Anchor01
     * @tc.number SUB_Contact_FIELD_0153
     * @tc.desc   firstPhone 取首号码，缺失/空数组守卫返回空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume03Anchor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume03Anchor01 begin');
      const withPhone: contact.Contact = { phoneNumbers: [{ phoneNumber: '13800000000' }] };
      const emptyList: contact.Contact = { phoneNumbers: [] };
      const noField: contact.Contact = {};
      expect(ContactFieldExtractor.firstPhone(withPhone)).assertEqual('13800000000');
      expect(ContactFieldExtractor.firstPhone(emptyList)).assertEqual('');
      expect(ContactFieldExtractor.firstPhone(noField)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume03Anchor01 end');
    });
    /**
     * @tc.name   testFieldVolume030154
     * @tc.number SUB_Contact_FIELD_0154
     * @tc.desc   合法：首号码 13000000000 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030154 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '13000000000' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '13000000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13000000000));
      expect(result).assertEqual('13000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030154 end');
    });

    /**
     * @tc.name   testFieldVolume030155
     * @tc.number SUB_Contact_FIELD_0155
     * @tc.desc   合法：首号码 13111111111 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030155 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '13111111111' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '13111111111' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13111111111));
      expect(result).assertEqual('13111111111');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030155 end');
    });

    /**
     * @tc.name   testFieldVolume030156
     * @tc.number SUB_Contact_FIELD_0156
     * @tc.desc   合法：首号码 13222222222 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030156 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '13222222222' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '13222222222' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13222222222));
      expect(result).assertEqual('13222222222');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030156 end');
    });

    /**
     * @tc.name   testFieldVolume030157
     * @tc.number SUB_Contact_FIELD_0157
     * @tc.desc   合法：首号码 13333333333 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030157 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '13333333333' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '13333333333' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13333333333));
      expect(result).assertEqual('13333333333');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030157 end');
    });

    /**
     * @tc.name   testFieldVolume030158
     * @tc.number SUB_Contact_FIELD_0158
     * @tc.desc   合法：首号码 13444444444 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030158 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '13444444444' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '13444444444' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13444444444));
      expect(result).assertEqual('13444444444');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030158 end');
    });

    /**
     * @tc.name   testFieldVolume030159
     * @tc.number SUB_Contact_FIELD_0159
     * @tc.desc   合法：首号码 13555555555 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030159 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '13555555555' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '13555555555' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13555555555));
      expect(result).assertEqual('13555555555');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030159 end');
    });

    /**
     * @tc.name   testFieldVolume030160
     * @tc.number SUB_Contact_FIELD_0160
     * @tc.desc   合法：首号码 13666666666 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030160 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '13666666666' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '13666666666' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13666666666));
      expect(result).assertEqual('13666666666');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030160 end');
    });

    /**
     * @tc.name   testFieldVolume030161
     * @tc.number SUB_Contact_FIELD_0161
     * @tc.desc   合法：首号码 13777777777 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030161 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '13777777777' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '13777777777' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13777777777));
      expect(result).assertEqual('13777777777');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030161 end');
    });

    /**
     * @tc.name   testFieldVolume030162
     * @tc.number SUB_Contact_FIELD_0162
     * @tc.desc   合法：首号码 13888888888 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030162 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '13888888888' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '13888888888' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13888888888));
      expect(result).assertEqual('13888888888');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030162 end');
    });

    /**
     * @tc.name   testFieldVolume030163
     * @tc.number SUB_Contact_FIELD_0163
     * @tc.desc   合法：首号码 13999999999 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030163 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '13999999999' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '13999999999' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13999999999));
      expect(result).assertEqual('13999999999');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030163 end');
    });

    /**
     * @tc.name   testFieldVolume030164
     * @tc.number SUB_Contact_FIELD_0164
     * @tc.desc   合法：首号码 14400000000 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030164 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '14400000000' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '14400000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(14400000000));
      expect(result).assertEqual('14400000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030164 end');
    });

    /**
     * @tc.name   testFieldVolume030165
     * @tc.number SUB_Contact_FIELD_0165
     * @tc.desc   合法：首号码 15000000000 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030165 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '15000000000' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '15000000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(15000000000));
      expect(result).assertEqual('15000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030165 end');
    });

    /**
     * @tc.name   testFieldVolume030166
     * @tc.number SUB_Contact_FIELD_0166
     * @tc.desc   合法：首号码 15500000000 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030166 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '15500000000' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '15500000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(15500000000));
      expect(result).assertEqual('15500000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030166 end');
    });

    /**
     * @tc.name   testFieldVolume030167
     * @tc.number SUB_Contact_FIELD_0167
     * @tc.desc   合法：首号码 16200000000 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030167 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '16200000000' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '16200000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(16200000000));
      expect(result).assertEqual('16200000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030167 end');
    });

    /**
     * @tc.name   testFieldVolume030168
     * @tc.number SUB_Contact_FIELD_0168
     * @tc.desc   合法：首号码 16600000000 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030168 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '16600000000' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '16600000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(16600000000));
      expect(result).assertEqual('16600000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030168 end');
    });

    /**
     * @tc.name   testFieldVolume030169
     * @tc.number SUB_Contact_FIELD_0169
     * @tc.desc   合法：首号码 17000000000 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030169 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '17000000000' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '17000000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(17000000000));
      expect(result).assertEqual('17000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030169 end');
    });

    /**
     * @tc.name   testFieldVolume030170
     * @tc.number SUB_Contact_FIELD_0170
     * @tc.desc   合法：首号码 17700000000 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030170 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '17700000000' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '17700000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(17700000000));
      expect(result).assertEqual('17700000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030170 end');
    });

    /**
     * @tc.name   testFieldVolume030171
     * @tc.number SUB_Contact_FIELD_0171
     * @tc.desc   合法：首号码 18000000000 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030171 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '18000000000' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '18000000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(18000000000));
      expect(result).assertEqual('18000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030171 end');
    });

    /**
     * @tc.name   testFieldVolume030172
     * @tc.number SUB_Contact_FIELD_0172
     * @tc.desc   合法：首号码 18800000000 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030172 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '18800000000' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '18800000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(18800000000));
      expect(result).assertEqual('18800000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030172 end');
    });

    /**
     * @tc.name   testFieldVolume030173
     * @tc.number SUB_Contact_FIELD_0173
     * @tc.desc   合法：首号码 19900000000 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030173 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '19900000000' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '19900000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(19900000000));
      expect(result).assertEqual('19900000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030173 end');
    });

    /**
     * @tc.name   testFieldVolume030174
     * @tc.number SUB_Contact_FIELD_0174
     * @tc.desc   合法：首号码 12345678901 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030174 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '12345678901' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '12345678901' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(12345678901));
      expect(result).assertEqual('12345678901');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030174 end');
    });

    /**
     * @tc.name   testFieldVolume030175
     * @tc.number SUB_Contact_FIELD_0175
     * @tc.desc   合法：首号码 98765432109 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030175 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '98765432109' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '98765432109' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(98765432109));
      expect(result).assertEqual('98765432109');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030175 end');
    });

    /**
     * @tc.name   testFieldVolume030176
     * @tc.number SUB_Contact_FIELD_0176
     * @tc.desc   合法：首号码 10000000000 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030176 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '10000000000' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '10000000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(10000000000));
      expect(result).assertEqual('10000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030176 end');
    });

    /**
     * @tc.name   testFieldVolume030177
     * @tc.number SUB_Contact_FIELD_0177
     * @tc.desc   合法：首号码 20000000000 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030177 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '20000000000' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '20000000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(20000000000));
      expect(result).assertEqual('20000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030177 end');
    });

    /**
     * @tc.name   testFieldVolume030178
     * @tc.number SUB_Contact_FIELD_0178
     * @tc.desc   合法：首号码 00000000000 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030178 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '00000000000' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '00000000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00000000000'));
      expect(result).assertEqual('00000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030178 end');
    });

    /**
     * @tc.name   testFieldVolume030179
     * @tc.number SUB_Contact_FIELD_0179
     * @tc.desc   合法：首号码 11111111111 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030179 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '11111111111' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '11111111111' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(11111111111));
      expect(result).assertEqual('11111111111');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030179 end');
    });

    /**
     * @tc.name   testFieldVolume030180
     * @tc.number SUB_Contact_FIELD_0180
     * @tc.desc   合法：首号码 22222222222 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030180 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '22222222222' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '22222222222' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(22222222222));
      expect(result).assertEqual('22222222222');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030180 end');
    });

    /**
     * @tc.name   testFieldVolume030181
     * @tc.number SUB_Contact_FIELD_0181
     * @tc.desc   合法：首号码 33333333333 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030181 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '33333333333' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '33333333333' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(33333333333));
      expect(result).assertEqual('33333333333');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030181 end');
    });

    /**
     * @tc.name   testFieldVolume030182
     * @tc.number SUB_Contact_FIELD_0182
     * @tc.desc   合法：首号码 44444444444 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030182 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '44444444444' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '44444444444' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(44444444444));
      expect(result).assertEqual('44444444444');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030182 end');
    });

    /**
     * @tc.name   testFieldVolume030183
     * @tc.number SUB_Contact_FIELD_0183
     * @tc.desc   合法：首号码 55555555555 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030183 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '55555555555' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '55555555555' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(55555555555));
      expect(result).assertEqual('55555555555');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030183 end');
    });

    /**
     * @tc.name   testFieldVolume030184
     * @tc.number SUB_Contact_FIELD_0184
     * @tc.desc   边界：空串号码返回空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030184 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String());
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'X'));
      expect(result === 'X').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030184 end');
    });

    /**
     * @tc.name   testFieldVolume030185
     * @tc.number SUB_Contact_FIELD_0185
     * @tc.desc   边界：单字符号码 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030185 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '1' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '1' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030185 end');
    });

    /**
     * @tc.name   testFieldVolume030186
     * @tc.number SUB_Contact_FIELD_0186
     * @tc.desc   守卫：phoneNumbers 缺失返回空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030186 begin');
      const contactInfo: contact.Contact = String('empty-obj') === 'empty-obj' ? {} :
        String('empty-obj') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('empty-obj') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String());
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'X'));
      expect(result === 'X').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030186 end');
    });

    /**
     * @tc.name   testFieldVolume030187
     * @tc.number SUB_Contact_FIELD_0187
     * @tc.desc   守卫：phoneNumbers 空数组返回空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030187 begin');
      const contactInfo: contact.Contact = String('empty-arr') === 'empty-obj' ? {} :
        String('empty-arr') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('empty-arr') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String());
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'X'));
      expect(result === 'X').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030187 end');
    });

    /**
     * @tc.name   testFieldVolume030188
     * @tc.number SUB_Contact_FIELD_0188
     * @tc.desc   守卫：phoneNumbers 缺失返回空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030188 begin');
      const contactInfo: contact.Contact = String('empty-obj') === 'empty-obj' ? {} :
        String('empty-obj') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('empty-obj') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String());
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'X'));
      expect(result === 'X').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030188 end');
    });

    /**
     * @tc.name   testFieldVolume030189
     * @tc.number SUB_Contact_FIELD_0189
     * @tc.desc   守卫：phoneNumbers 空数组返回空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030189 begin');
      const contactInfo: contact.Contact = String('empty-arr') === 'empty-obj' ? {} :
        String('empty-arr') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('empty-arr') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String());
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'X'));
      expect(result === 'X').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030189 end');
    });

    /**
     * @tc.name   testFieldVolume030190
     * @tc.number SUB_Contact_FIELD_0190
     * @tc.desc   组合：多号码取首元素 13000000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030190 begin');
      const contactInfo: contact.Contact = String('two') === 'empty-obj' ? {} :
        String('two') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('two') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '13000000000' }, { phoneNumber: '15000000000' }] } :
         { phoneNumbers: [{ phoneNumber: '13000000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13000000000));
      expect(result).assertEqual('13000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030190 end');
    });

    /**
     * @tc.name   testFieldVolume030191
     * @tc.number SUB_Contact_FIELD_0191
     * @tc.desc   组合：多号码取首元素 13100000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030191 begin');
      const contactInfo: contact.Contact = String('two') === 'empty-obj' ? {} :
        String('two') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('two') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '13100000000' }, { phoneNumber: '15100000000' }] } :
         { phoneNumbers: [{ phoneNumber: '13100000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13100000000));
      expect(result).assertEqual('13100000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030191 end');
    });


  });
}
