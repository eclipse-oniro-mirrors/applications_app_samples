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

export default function fieldVolume07Test() {
  describe('FieldVolume07Test', () => {
    /**
     * @tc.name   testFieldVolume030192
     * @tc.number SUB_Contact_FIELD_0192
     * @tc.desc   组合：多号码取首元素 13200000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030192 begin');
      const contactInfo: contact.Contact = String('two') === 'empty-obj' ? {} :
        String('two') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('two') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '13200000000' }, { phoneNumber: '15200000000' }] } :
         { phoneNumbers: [{ phoneNumber: '13200000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13200000000));
      expect(result).assertEqual('13200000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030192 end');
    });

    /**
     * @tc.name   testFieldVolume030193
     * @tc.number SUB_Contact_FIELD_0193
     * @tc.desc   组合：多号码取首元素 13300000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030193 begin');
      const contactInfo: contact.Contact = String('two') === 'empty-obj' ? {} :
        String('two') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('two') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '13300000000' }, { phoneNumber: '15300000000' }] } :
         { phoneNumbers: [{ phoneNumber: '13300000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13300000000));
      expect(result).assertEqual('13300000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030193 end');
    });

    /**
     * @tc.name   testFieldVolume030194
     * @tc.number SUB_Contact_FIELD_0194
     * @tc.desc   组合：多号码取首元素 13400000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030194 begin');
      const contactInfo: contact.Contact = String('two') === 'empty-obj' ? {} :
        String('two') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('two') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '13400000000' }, { phoneNumber: '15400000000' }] } :
         { phoneNumbers: [{ phoneNumber: '13400000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13400000000));
      expect(result).assertEqual('13400000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030194 end');
    });

    /**
     * @tc.name   testFieldVolume030195
     * @tc.number SUB_Contact_FIELD_0195
     * @tc.desc   组合：多号码取首元素 13500000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030195 begin');
      const contactInfo: contact.Contact = String('two') === 'empty-obj' ? {} :
        String('two') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('two') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '13500000000' }, { phoneNumber: '15500000000' }] } :
         { phoneNumbers: [{ phoneNumber: '13500000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13500000000));
      expect(result).assertEqual('13500000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030195 end');
    });

    /**
     * @tc.name   testFieldVolume030196
     * @tc.number SUB_Contact_FIELD_0196
     * @tc.desc   组合：多号码取首元素 13600000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030196 begin');
      const contactInfo: contact.Contact = String('two') === 'empty-obj' ? {} :
        String('two') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('two') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '13600000000' }, { phoneNumber: '15600000000' }] } :
         { phoneNumbers: [{ phoneNumber: '13600000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13600000000));
      expect(result).assertEqual('13600000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030196 end');
    });

    /**
     * @tc.name   testFieldVolume030197
     * @tc.number SUB_Contact_FIELD_0197
     * @tc.desc   组合：多号码取首元素 13700000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030197 begin');
      const contactInfo: contact.Contact = String('two') === 'empty-obj' ? {} :
        String('two') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('two') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '13700000000' }, { phoneNumber: '15700000000' }] } :
         { phoneNumbers: [{ phoneNumber: '13700000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13700000000));
      expect(result).assertEqual('13700000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030197 end');
    });

    /**
     * @tc.name   testFieldVolume030198
     * @tc.number SUB_Contact_FIELD_0198
     * @tc.desc   组合：多号码取首元素 13800000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030198 begin');
      const contactInfo: contact.Contact = String('two') === 'empty-obj' ? {} :
        String('two') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('two') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '13800000000' }, { phoneNumber: '15800000000' }] } :
         { phoneNumbers: [{ phoneNumber: '13800000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13800000000));
      expect(result).assertEqual('13800000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030198 end');
    });

    /**
     * @tc.name   testFieldVolume030199
     * @tc.number SUB_Contact_FIELD_0199
     * @tc.desc   组合：多号码取首元素 13900000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030199 begin');
      const contactInfo: contact.Contact = String('two') === 'empty-obj' ? {} :
        String('two') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('two') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '13900000000' }, { phoneNumber: '15900000000' }] } :
         { phoneNumbers: [{ phoneNumber: '13900000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13900000000));
      expect(result).assertEqual('13900000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030199 end');
    });

    /**
     * @tc.name   testFieldVolume030200
     * @tc.number SUB_Contact_FIELD_0200
     * @tc.desc   极值：100 字符号码原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030200 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: 'xxxxxxxxxxxxx' +
        'xxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxx' +
          'xxxxxxxxxxxxx' +
            'xxxxxxxxxxxx' }, { phoneNumber: '' }] } : { phoneNumbers: [{ phoneNumber: 'xxxxxxxxxxxxxxxxxxxxxxxxx' +
            'xxxxxxxxxxxxxxxxxxxxxxxxx' +
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(100));
      expect(result.length).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030200 end');
    });

    /**
     * @tc.name   testFieldVolume030201
     * @tc.number SUB_Contact_FIELD_0201
     * @tc.desc   极值：500 字符号码原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030201 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: 'xxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
          'xxxxxxxxxxxxxxxxx' +
            'xxxxxxxxxxxxxxxxx' }, { phoneNumber: '' }] } : { phoneNumbers: [{ phoneNumber: 'xxxxxxxxxxxxxxxxxx' +
            'xxxxxxxxxxxxxxxxxx' +
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(500));
      expect(result.length).assertEqual(500);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030201 end');
    });

    /**
     * @tc.name   testFieldVolume030202
     * @tc.number SUB_Contact_FIELD_0202
     * @tc.desc   组合：两号码取第 1 项 13800000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030202 begin');
      const contactInfo: contact.Contact = String('two') === 'empty-obj' ? {} :
        String('two') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('two') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '13800000000' }, { phoneNumber: '13999999999' }] } :
         { phoneNumbers: [{ phoneNumber: '13800000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13800000000));
      expect(result).assertEqual('13800000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030202 end');
    });

    /**
     * @tc.name   testFieldVolume030203
     * @tc.number SUB_Contact_FIELD_0203
     * @tc.desc   组合：两号码第 1 项为空串返回空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030203 begin');
      const contactInfo: contact.Contact = String('two') === 'empty-obj' ? {} :
        String('two') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('two') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '' }, { phoneNumber: '13999999999' }] } :
         { phoneNumbers: [{ phoneNumber: '' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String());
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'X'));
      expect(result === 'X').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030203 end');
    });

    /**
     * @tc.name   testFieldVolume030204
     * @tc.number SUB_Contact_FIELD_0204
     * @tc.desc   组合：两号码取第 1 项 13999999999
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030204 begin');
      const contactInfo: contact.Contact = String('two') === 'empty-obj' ? {} :
        String('two') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('two') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '13999999999' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '13999999999' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13999999999));
      expect(result).assertEqual('13999999999');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030204 end');
    });

    /**
     * @tc.name   testFieldVolume030205
     * @tc.number SUB_Contact_FIELD_0205
     * @tc.desc   补齐：号码 1560000000 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030205 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '1560000000' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '1560000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1560000000));
      expect(result).assertEqual('1560000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030205 end');
    });

    /**
     * @tc.name   testFieldVolume030206
     * @tc.number SUB_Contact_FIELD_0206
     * @tc.desc   补齐：号码 1560000001 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030206 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '1560000001' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '1560000001' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1560000001));
      expect(result).assertEqual('1560000001');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030206 end');
    });

    /**
     * @tc.name   testFieldVolume030207
     * @tc.number SUB_Contact_FIELD_0207
     * @tc.desc   补齐：号码 1560000002 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030207 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '1560000002' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '1560000002' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1560000002));
      expect(result).assertEqual('1560000002');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030207 end');
    });

    /**
     * @tc.name   testFieldVolume030208
     * @tc.number SUB_Contact_FIELD_0208
     * @tc.desc   补齐：号码 1560000003 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030208 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '1560000003' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '1560000003' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1560000003));
      expect(result).assertEqual('1560000003');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030208 end');
    });

    /**
     * @tc.name   testFieldVolume030209
     * @tc.number SUB_Contact_FIELD_0209
     * @tc.desc   补齐：号码 1560000004 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030209 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '1560000004' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '1560000004' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1560000004));
      expect(result).assertEqual('1560000004');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030209 end');
    });

    /**
     * @tc.name   testFieldVolume030210
     * @tc.number SUB_Contact_FIELD_0210
     * @tc.desc   补齐：号码 1560000005 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030210 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '1560000005' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '1560000005' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1560000005));
      expect(result).assertEqual('1560000005');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030210 end');
    });

    /**
     * @tc.name   testFieldVolume030211
     * @tc.number SUB_Contact_FIELD_0211
     * @tc.desc   补齐：号码 1560000006 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030211 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '1560000006' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '1560000006' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1560000006));
      expect(result).assertEqual('1560000006');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030211 end');
    });

    /**
     * @tc.name   testFieldVolume030212
     * @tc.number SUB_Contact_FIELD_0212
     * @tc.desc   补齐：号码 1560000007 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030212 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '1560000007' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '1560000007' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1560000007));
      expect(result).assertEqual('1560000007');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030212 end');
    });

    /**
     * @tc.name   testFieldVolume030213
     * @tc.number SUB_Contact_FIELD_0213
     * @tc.desc   补齐：号码 1560000008 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030213 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '1560000008' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '1560000008' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1560000008));
      expect(result).assertEqual('1560000008');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030213 end');
    });

    /**
     * @tc.name   testFieldVolume030214
     * @tc.number SUB_Contact_FIELD_0214
     * @tc.desc   补齐：号码 1560000009 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030214 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '1560000009' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '1560000009' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1560000009));
      expect(result).assertEqual('1560000009');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030214 end');
    });

    /**
     * @tc.name   testFieldVolume030215
     * @tc.number SUB_Contact_FIELD_0215
     * @tc.desc   补齐：号码 1560000010 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030215 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '1560000010' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '1560000010' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1560000010));
      expect(result).assertEqual('1560000010');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030215 end');
    });

    /**
     * @tc.name   testFieldVolume030216
     * @tc.number SUB_Contact_FIELD_0216
     * @tc.desc   补齐：号码 1560000011 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030216 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '1560000011' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '1560000011' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1560000011));
      expect(result).assertEqual('1560000011');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030216 end');
    });

    /**
     * @tc.name   testFieldVolume030217
     * @tc.number SUB_Contact_FIELD_0217
     * @tc.desc   补齐：号码 1560000012 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030217 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '1560000012' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '1560000012' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1560000012));
      expect(result).assertEqual('1560000012');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030217 end');
    });

    /**
     * @tc.name   testFieldVolume030218
     * @tc.number SUB_Contact_FIELD_0218
     * @tc.desc   补齐：号码 1560000013 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030218 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '1560000013' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '1560000013' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1560000013));
      expect(result).assertEqual('1560000013');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030218 end');
    });

    /**
     * @tc.name   testFieldVolume030219
     * @tc.number SUB_Contact_FIELD_0219
     * @tc.desc   补齐：号码 1560000014 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030219 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '1560000014' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '1560000014' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1560000014));
      expect(result).assertEqual('1560000014');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030219 end');
    });

    /**
     * @tc.name   testFieldVolume030220
     * @tc.number SUB_Contact_FIELD_0220
     * @tc.desc   补齐：号码 1560000015 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030220 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '1560000015' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '1560000015' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1560000015));
      expect(result).assertEqual('1560000015');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030220 end');
    });

    /**
     * @tc.name   testFieldVolume030221
     * @tc.number SUB_Contact_FIELD_0221
     * @tc.desc   补齐：号码 1560000016 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030221 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '1560000016' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '1560000016' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1560000016));
      expect(result).assertEqual('1560000016');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030221 end');
    });

    /**
     * @tc.name   testFieldVolume030222
     * @tc.number SUB_Contact_FIELD_0222
     * @tc.desc   补齐：号码 1560000017 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030222 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '1560000017' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '1560000017' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1560000017));
      expect(result).assertEqual('1560000017');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030222 end');
    });

    /**
     * @tc.name   testFieldVolume030223
     * @tc.number SUB_Contact_FIELD_0223
     * @tc.desc   补齐：号码 1560000018 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030223 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '1560000018' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '1560000018' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1560000018));
      expect(result).assertEqual('1560000018');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030223 end');
    });

    /**
     * @tc.name   testFieldVolume030224
     * @tc.number SUB_Contact_FIELD_0224
     * @tc.desc   补齐：号码 1560000019 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030224 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '1560000019' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '1560000019' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1560000019));
      expect(result).assertEqual('1560000019');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030224 end');
    });

    /**
     * @tc.name   testFieldVolume030225
     * @tc.number SUB_Contact_FIELD_0225
     * @tc.desc   补齐：号码 1560000020 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030225 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '1560000020' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '1560000020' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1560000020));
      expect(result).assertEqual('1560000020');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030225 end');
    });

    /**
     * @tc.name   testFieldVolume030226
     * @tc.number SUB_Contact_FIELD_0226
     * @tc.desc   补齐：号码 1560000021 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030226 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '1560000021' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '1560000021' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1560000021));
      expect(result).assertEqual('1560000021');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030226 end');
    });

    /**
     * @tc.name   testFieldVolume030227
     * @tc.number SUB_Contact_FIELD_0227
     * @tc.desc   补齐：号码 1560000022 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030227 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '1560000022' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '1560000022' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1560000022));
      expect(result).assertEqual('1560000022');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030227 end');
    });

    /**
     * @tc.name   testFieldVolume030228
     * @tc.number SUB_Contact_FIELD_0228
     * @tc.desc   补齐：号码 1560000023 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume030228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030228 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'empty-arr' ?
        { phoneNumbers: [] } :
        String('false') === 'two' ?
        { phoneNumbers: [{ phoneNumber: '1560000023' }, { phoneNumber: '' }] } :
         { phoneNumbers: [{ phoneNumber: '1560000023' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1560000023));
      expect(result).assertEqual('1560000023');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume030228 end');
    });
  });
}
