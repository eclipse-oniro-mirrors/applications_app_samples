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

export default function fieldVolume06Test() {
  describe('FieldVolume06Test', () => {

    /**
     * @tc.name   testFieldVolume06Anchor01
     * @tc.number SUB_Contact_FIELD_0381
     * @tc.desc   300 字符号码原样返回不截断
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume06Anchor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume06Anchor01 begin');
      const longPhone: string = '1'.repeat(300);
      const withLong: contact.Contact = { phoneNumbers: [{ phoneNumber: longPhone }] };
      const extracted: string = ContactFieldExtractor.firstPhone(withLong);
      expect(extracted).assertEqual(longPhone);
      expect(extracted.length).assertEqual(300);
      expect(extracted === '1'.repeat(299)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume06Anchor01 end');
    });
    /**
     * @tc.name   testFieldVolume060382
     * @tc.number SUB_Contact_FIELD_0382
     * @tc.desc   极值：64 字符号码原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume060382', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060382 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'long-name' ?
        { name: { fullName: 'pppppppppppppppp' +
        'pppppppppppppppp' +
        'pppppppppppppppppppppppppppppppp' } } : { phoneNumbers: [{ phoneNumber: 'pppppppppppppppppppppppppppppppp' +
          'pppppppppppppppppppppppppppppppp' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result), String('pppppppppppppppppppppppppppppppp' +
        'pppppppppppppppppppppppppppppppp'));
      expect(result).assertEqual('pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(64));
      expect(result.length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060382 end');
    });

    /**
     * @tc.name   testFieldVolume060383
     * @tc.number SUB_Contact_FIELD_0383
     * @tc.desc   极值：128 字符号码原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume060383', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060383 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'long-name' ?
        { name: { fullName: 'pppppppppppppppp' +
        'pppppppppppppppp' +
        'pppppppppppppppppppppppppppppppp' +
        'pppppppppppppppppppppppppppppppp' +
          'pppppppppppppppppppppppppppppppp' } } : { phoneNumbers: [{ phoneNumber: 'pppppppppppppppppppppppppppppppp' +
            'pppppppppppppppppppppppppppppppp' +
          'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result), String('pppppppppppppppppppppppppppppppp' +
        'pppppppppppppppppppppppppppppppp' +
        'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp'));
      expect(result).assertEqual('pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(128));
      expect(result.length).assertEqual(128);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060383 end');
    });

    /**
     * @tc.name   testFieldVolume060384
     * @tc.number SUB_Contact_FIELD_0384
     * @tc.desc   极值：256 字符号码原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume060384', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060384 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'long-name' ?
        { name: { fullName: 'pppppppppppppppp' +
        'pppppppppppppppp' +
        'pppppppppppppppppppppppppppppppp' +
        'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'pppppppppppppppppppppppppppppppp' +
          'pppppppppppppppppppppppppppppppp' } } : { phoneNumbers: [{ phoneNumber: 'pppppppppppppppppppppppppppppppp' +
            'pppppppppppppppppppppppppppppppp' +
          'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
          'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
          'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result), String('pppppppppppppppppppppppppppppppp' +
        'pppppppppppppppppppppppppppppppp' +
        'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp'));
      expect(result).assertEqual('pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(256));
      expect(result.length).assertEqual(256);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060384 end');
    });

    /**
     * @tc.name   testFieldVolume060385
     * @tc.number SUB_Contact_FIELD_0385
     * @tc.desc   极值：512 字符号码原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume060385', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060385 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'long-name' ?
        { name: { fullName: 'pppppppppppppppp' +
        'pppppppppppppppp' +
        'pppppppppppppppppppppppppppppppp' +
        'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'pppppppppppppppppppppppppppppppp' +
          'pppppppppppppppppppppppppppppppp' } } : { phoneNumbers: [{ phoneNumber: 'pppppppppppppppppppppppppppppppp' +
            'pppppppppppppppppppppppppppppppp' +
          'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
          'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
          'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
          'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
          'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
          'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
          'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result), String('pppppppppppppppppppppppppppppppp' +
        'pppppppppppppppppppppppppppppppp' +
        'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp'));
      expect(result).assertEqual('pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(512));
      expect(result.length).assertEqual(512);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060385 end');
    });

    /**
     * @tc.name   testFieldVolume060386
     * @tc.number SUB_Contact_FIELD_0386
     * @tc.desc   极值：1024 字符号码原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume060386', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060386 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'long-name' ?
        { name: { fullName: 'pppppppppppppppppp' +
        'ppppppppppppppppp' +
        'pppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppp' +
          'ppppppppppppppppppppppppppppp' } } : { phoneNumbers: [{ phoneNumber: 'ppppppppppppppppppppppppppppppppppp' +
          'pppppppppppppppppppppppppppppppppp' +
          'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
          'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
          'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
          'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
          'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
          'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
          'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
          'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
          'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
          'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
          'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
          'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
          'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
          'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result), String('ppppppppppppppppppppppppppppppppppp' +
        'pppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppp'));
      expect(result).assertEqual('ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1024));
      expect(result.length).assertEqual(1024);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060386 end');
    });

    /**
     * @tc.name   testFieldVolume060387
     * @tc.number SUB_Contact_FIELD_0387
     * @tc.desc   极值：2048 字符号码原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume060387', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060387 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'long-name' ?
        { name: { fullName: 'pppppppppppppppppp' +
        'pppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'pppppppppppppppppppppppppppppp' +
          'pppppppppppppppppppppppppppppp' } } : { phoneNumbers: [{ phoneNumber: 'pppppppppppppppppp' +
            'pppppppppppppppppp' +
          'ppppppppppppppppppppppppppppppppppp' +
          'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
          'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
          'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
          'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
          'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
          'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
          'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
          'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
          'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
          'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
          'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
          'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
          'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
          'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
          'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
          'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
          'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
          'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
          'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
          'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
          'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
          'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
          'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
          'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
          'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
          'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
          'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
          'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result), String('pppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp'));
      expect(result).assertEqual('ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp' +
        'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2048));
      expect(result.length).assertEqual(2048);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060387 end');
    });

    /**
     * @tc.name   testFieldVolume060388
     * @tc.number SUB_Contact_FIELD_0388
     * @tc.desc   合法：号码 13000000000 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume060388', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060388 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'long-name' ?
        { name: { fullName: '13000000000' } } :
         { phoneNumbers: [{ phoneNumber: '13000000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13000000000));
      expect(result).assertEqual('13000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060388 end');
    });

    /**
     * @tc.name   testFieldVolume060389
     * @tc.number SUB_Contact_FIELD_0389
     * @tc.desc   合法：号码 13100000000 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume060389', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060389 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'long-name' ?
        { name: { fullName: '13100000000' } } :
         { phoneNumbers: [{ phoneNumber: '13100000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13100000000));
      expect(result).assertEqual('13100000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060389 end');
    });

    /**
     * @tc.name   testFieldVolume060390
     * @tc.number SUB_Contact_FIELD_0390
     * @tc.desc   合法：号码 13200000000 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume060390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060390 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'long-name' ?
        { name: { fullName: '13200000000' } } :
         { phoneNumbers: [{ phoneNumber: '13200000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13200000000));
      expect(result).assertEqual('13200000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060390 end');
    });

    /**
     * @tc.name   testFieldVolume060391
     * @tc.number SUB_Contact_FIELD_0391
     * @tc.desc   合法：号码 13300000000 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume060391', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060391 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'long-name' ?
        { name: { fullName: '13300000000' } } :
         { phoneNumbers: [{ phoneNumber: '13300000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13300000000));
      expect(result).assertEqual('13300000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060391 end');
    });

    /**
     * @tc.name   testFieldVolume060392
     * @tc.number SUB_Contact_FIELD_0392
     * @tc.desc   合法：号码 13400000000 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume060392', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060392 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'long-name' ?
        { name: { fullName: '13400000000' } } :
         { phoneNumbers: [{ phoneNumber: '13400000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13400000000));
      expect(result).assertEqual('13400000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060392 end');
    });

    /**
     * @tc.name   testFieldVolume060393
     * @tc.number SUB_Contact_FIELD_0393
     * @tc.desc   合法：号码 13500000000 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume060393', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060393 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'long-name' ?
        { name: { fullName: '13500000000' } } :
         { phoneNumbers: [{ phoneNumber: '13500000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13500000000));
      expect(result).assertEqual('13500000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060393 end');
    });

    /**
     * @tc.name   testFieldVolume060394
     * @tc.number SUB_Contact_FIELD_0394
     * @tc.desc   合法：号码 13600000000 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume060394', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060394 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'long-name' ?
        { name: { fullName: '13600000000' } } :
         { phoneNumbers: [{ phoneNumber: '13600000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13600000000));
      expect(result).assertEqual('13600000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060394 end');
    });

    /**
     * @tc.name   testFieldVolume060395
     * @tc.number SUB_Contact_FIELD_0395
     * @tc.desc   合法：号码 13700000000 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume060395', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060395 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'long-name' ?
        { name: { fullName: '13700000000' } } :
         { phoneNumbers: [{ phoneNumber: '13700000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13700000000));
      expect(result).assertEqual('13700000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060395 end');
    });

    /**
     * @tc.name   testFieldVolume060396
     * @tc.number SUB_Contact_FIELD_0396
     * @tc.desc   合法：号码 13800000000 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume060396', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060396 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'long-name' ?
        { name: { fullName: '13800000000' } } :
         { phoneNumbers: [{ phoneNumber: '13800000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13800000000));
      expect(result).assertEqual('13800000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060396 end');
    });

    /**
     * @tc.name   testFieldVolume060397
     * @tc.number SUB_Contact_FIELD_0397
     * @tc.desc   合法：号码 13900000000 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume060397', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060397 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'long-name' ?
        { name: { fullName: '13900000000' } } :
         { phoneNumbers: [{ phoneNumber: '13900000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13900000000));
      expect(result).assertEqual('13900000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060397 end');
    });

    /**
     * @tc.name   testFieldVolume060398
     * @tc.number SUB_Contact_FIELD_0398
     * @tc.desc   合法：号码 13000000000 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume060398', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060398 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'long-name' ?
        { name: { fullName: '13000000000' } } :
         { phoneNumbers: [{ phoneNumber: '13000000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13000000000));
      expect(result).assertEqual('13000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060398 end');
    });

    /**
     * @tc.name   testFieldVolume060399
     * @tc.number SUB_Contact_FIELD_0399
     * @tc.desc   合法：号码 13100000000 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume060399', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060399 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'long-name' ?
        { name: { fullName: '13100000000' } } :
         { phoneNumbers: [{ phoneNumber: '13100000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13100000000));
      expect(result).assertEqual('13100000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060399 end');
    });

    /**
     * @tc.name   testFieldVolume060400
     * @tc.number SUB_Contact_FIELD_0400
     * @tc.desc   合法：号码 13200000000 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume060400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060400 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'long-name' ?
        { name: { fullName: '13200000000' } } :
         { phoneNumbers: [{ phoneNumber: '13200000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13200000000));
      expect(result).assertEqual('13200000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060400 end');
    });

    /**
     * @tc.name   testFieldVolume060401
     * @tc.number SUB_Contact_FIELD_0401
     * @tc.desc   合法：号码 13300000000 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume060401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060401 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'long-name' ?
        { name: { fullName: '13300000000' } } :
         { phoneNumbers: [{ phoneNumber: '13300000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13300000000));
      expect(result).assertEqual('13300000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060401 end');
    });

    /**
     * @tc.name   testFieldVolume060402
     * @tc.number SUB_Contact_FIELD_0402
     * @tc.desc   合法：号码 13400000000 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume060402', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060402 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'long-name' ?
        { name: { fullName: '13400000000' } } :
         { phoneNumbers: [{ phoneNumber: '13400000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13400000000));
      expect(result).assertEqual('13400000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060402 end');
    });

    /**
     * @tc.name   testFieldVolume060403
     * @tc.number SUB_Contact_FIELD_0403
     * @tc.desc   合法：号码 13500000000 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume060403', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060403 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'long-name' ?
        { name: { fullName: '13500000000' } } :
         { phoneNumbers: [{ phoneNumber: '13500000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13500000000));
      expect(result).assertEqual('13500000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060403 end');
    });

    /**
     * @tc.name   testFieldVolume060404
     * @tc.number SUB_Contact_FIELD_0404
     * @tc.desc   合法：号码 13600000000 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume060404', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060404 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'long-name' ?
        { name: { fullName: '13600000000' } } :
         { phoneNumbers: [{ phoneNumber: '13600000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13600000000));
      expect(result).assertEqual('13600000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060404 end');
    });

    /**
     * @tc.name   testFieldVolume060405
     * @tc.number SUB_Contact_FIELD_0405
     * @tc.desc   合法：号码 13700000000 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume060405', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060405 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'long-name' ?
        { name: { fullName: '13700000000' } } :
         { phoneNumbers: [{ phoneNumber: '13700000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13700000000));
      expect(result).assertEqual('13700000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060405 end');
    });

    /**
     * @tc.name   testFieldVolume060406
     * @tc.number SUB_Contact_FIELD_0406
     * @tc.desc   合法：号码 13800000000 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume060406', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060406 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'long-name' ?
        { name: { fullName: '13800000000' } } :
         { phoneNumbers: [{ phoneNumber: '13800000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13800000000));
      expect(result).assertEqual('13800000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060406 end');
    });

    /**
     * @tc.name   testFieldVolume060407
     * @tc.number SUB_Contact_FIELD_0407
     * @tc.desc   合法：号码 13900000000 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume060407', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060407 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'long-name' ?
        { name: { fullName: '13900000000' } } :
         { phoneNumbers: [{ phoneNumber: '13900000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13900000000));
      expect(result).assertEqual('13900000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060407 end');
    });

    /**
     * @tc.name   testFieldVolume060408
     * @tc.number SUB_Contact_FIELD_0408
     * @tc.desc   合法：号码 13000000000 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume060408', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060408 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'long-name' ?
        { name: { fullName: '13000000000' } } :
         { phoneNumbers: [{ phoneNumber: '13000000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13000000000));
      expect(result).assertEqual('13000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060408 end');
    });

    /**
     * @tc.name   testFieldVolume060409
     * @tc.number SUB_Contact_FIELD_0409
     * @tc.desc   合法：号码 13100000000 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume060409', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060409 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'long-name' ?
        { name: { fullName: '13100000000' } } :
         { phoneNumbers: [{ phoneNumber: '13100000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13100000000));
      expect(result).assertEqual('13100000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060409 end');
    });

    /**
     * @tc.name   testFieldVolume060410
     * @tc.number SUB_Contact_FIELD_0410
     * @tc.desc   合法：号码 13200000000 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume060410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060410 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'long-name' ?
        { name: { fullName: '13200000000' } } :
         { phoneNumbers: [{ phoneNumber: '13200000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13200000000));
      expect(result).assertEqual('13200000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060410 end');
    });

    /**
     * @tc.name   testFieldVolume060411
     * @tc.number SUB_Contact_FIELD_0411
     * @tc.desc   合法：号码 13300000000 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume060411', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060411 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'long-name' ?
        { name: { fullName: '13300000000' } } :
         { phoneNumbers: [{ phoneNumber: '13300000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13300000000));
      expect(result).assertEqual('13300000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060411 end');
    });

    /**
     * @tc.name   testFieldVolume060412
     * @tc.number SUB_Contact_FIELD_0412
     * @tc.desc   合法：号码 13400000000 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume060412', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060412 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'long-name' ?
        { name: { fullName: '13400000000' } } :
         { phoneNumbers: [{ phoneNumber: '13400000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13400000000));
      expect(result).assertEqual('13400000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060412 end');
    });

    /**
     * @tc.name   testFieldVolume060413
     * @tc.number SUB_Contact_FIELD_0413
     * @tc.desc   合法：号码 13500000000 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume060413', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060413 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'long-name' ?
        { name: { fullName: '13500000000' } } :
         { phoneNumbers: [{ phoneNumber: '13500000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13500000000));
      expect(result).assertEqual('13500000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060413 end');
    });

    /**
     * @tc.name   testFieldVolume060414
     * @tc.number SUB_Contact_FIELD_0414
     * @tc.desc   合法：号码 13600000000 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume060414', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060414 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'long-name' ?
        { name: { fullName: '13600000000' } } :
         { phoneNumbers: [{ phoneNumber: '13600000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13600000000));
      expect(result).assertEqual('13600000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060414 end');
    });

    /**
     * @tc.name   testFieldVolume060415
     * @tc.number SUB_Contact_FIELD_0415
     * @tc.desc   合法：号码 13700000000 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume060415', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060415 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'long-name' ?
        { name: { fullName: '13700000000' } } :
         { phoneNumbers: [{ phoneNumber: '13700000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13700000000));
      expect(result).assertEqual('13700000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060415 end');
    });

    /**
     * @tc.name   testFieldVolume060416
     * @tc.number SUB_Contact_FIELD_0416
     * @tc.desc   合法：号码 13800000000 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume060416', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060416 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'long-name' ?
        { name: { fullName: '13800000000' } } :
         { phoneNumbers: [{ phoneNumber: '13800000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13800000000));
      expect(result).assertEqual('13800000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060416 end');
    });

    /**
     * @tc.name   testFieldVolume060417
     * @tc.number SUB_Contact_FIELD_0417
     * @tc.desc   合法：号码 13900000000 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume060417', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060417 begin');
      const contactInfo: contact.Contact = String('false') === 'empty-obj' ? {} :
        String('false') === 'long-name' ?
        { name: { fullName: '13900000000' } } :
         { phoneNumbers: [{ phoneNumber: '13900000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13900000000));
      expect(result).assertEqual('13900000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060417 end');
    });

    /**
     * @tc.name   testFieldVolume060418
     * @tc.number SUB_Contact_FIELD_0418
     * @tc.desc   守卫：空对象返回空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume060418', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060418 begin');
      const contactInfo: contact.Contact = String('empty-obj') === 'empty-obj' ? {} :
        String('empty-obj') === 'long-name' ?
        { name: { fullName: '' } } :
         { phoneNumbers: [{ phoneNumber: '' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String());
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'X'));
      expect(result === 'X').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060418 end');
    });

    /**
     * @tc.name   testFieldVolume060419
     * @tc.number SUB_Contact_FIELD_0419
     * @tc.desc   守卫：空对象返回空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume060419', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060419 begin');
      const contactInfo: contact.Contact = String('empty-obj') === 'empty-obj' ? {} :
        String('empty-obj') === 'long-name' ?
        { name: { fullName: '' } } :
         { phoneNumbers: [{ phoneNumber: '' }] };
      const result: string = ContactFieldExtractor.firstPhone(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String());
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'X'));
      expect(result === 'X').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume060419 end');
    });


  });
}
