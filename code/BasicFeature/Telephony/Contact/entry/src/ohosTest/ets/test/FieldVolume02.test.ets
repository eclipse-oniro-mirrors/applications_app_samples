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

export default function fieldVolume02Test() {
  describe('FieldVolume02Test', () => {

    /**
     * @tc.name   testFieldVolume02Anchor01
     * @tc.number SUB_Contact_FIELD_0077
     * @tc.desc   firstLetter 取首字符并大写归一
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume02Anchor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume02Anchor01 begin');
      const lowerName: contact.Contact = { name: { fullName: 'zhangsan' } };
      const upperName: contact.Contact = { name: { fullName: 'Zhangsan' } };
      const emptyName: contact.Contact = {};
      expect(ContactFieldExtractor.firstLetter(lowerName)).assertEqual('Z');
      expect(ContactFieldExtractor.firstLetter(upperName)).assertEqual('Z');
      expect(ContactFieldExtractor.firstLetter(emptyName)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume02Anchor01 end');
    });
    /**
     * @tc.name   testFieldVolume020078
     * @tc.number SUB_Contact_FIELD_0078
     * @tc.desc   合法：小写 a 首字母归一为大写 A
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020078 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'a' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('A'));
      expect(result).assertEqual('A');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020078 end');
    });

    /**
     * @tc.name   testFieldVolume020079
     * @tc.number SUB_Contact_FIELD_0079
     * @tc.desc   合法：小写 a 开头的多字符姓名取首字母 A
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020079 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'arest' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('A'));
      expect(result).assertEqual('A');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020079 end');
    });

    /**
     * @tc.name   testFieldVolume020080
     * @tc.number SUB_Contact_FIELD_0080
     * @tc.desc   合法：小写 b 首字母归一为大写 B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020080 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'b' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('B'));
      expect(result).assertEqual('B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020080 end');
    });

    /**
     * @tc.name   testFieldVolume020081
     * @tc.number SUB_Contact_FIELD_0081
     * @tc.desc   合法：小写 b 开头的多字符姓名取首字母 B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020081 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'brest' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('B'));
      expect(result).assertEqual('B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020081 end');
    });

    /**
     * @tc.name   testFieldVolume020082
     * @tc.number SUB_Contact_FIELD_0082
     * @tc.desc   合法：小写 c 首字母归一为大写 C
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020082 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'c' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('C'));
      expect(result).assertEqual('C');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020082 end');
    });

    /**
     * @tc.name   testFieldVolume020083
     * @tc.number SUB_Contact_FIELD_0083
     * @tc.desc   合法：小写 c 开头的多字符姓名取首字母 C
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020083 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'crest' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('C'));
      expect(result).assertEqual('C');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020083 end');
    });

    /**
     * @tc.name   testFieldVolume020084
     * @tc.number SUB_Contact_FIELD_0084
     * @tc.desc   合法：小写 d 首字母归一为大写 D
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020084 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'd' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('D'));
      expect(result).assertEqual('D');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020084 end');
    });

    /**
     * @tc.name   testFieldVolume020085
     * @tc.number SUB_Contact_FIELD_0085
     * @tc.desc   合法：小写 d 开头的多字符姓名取首字母 D
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020085 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'drest' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('D'));
      expect(result).assertEqual('D');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020085 end');
    });

    /**
     * @tc.name   testFieldVolume020086
     * @tc.number SUB_Contact_FIELD_0086
     * @tc.desc   合法：小写 e 首字母归一为大写 E
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020086 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'e' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('E'));
      expect(result).assertEqual('E');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020086 end');
    });

    /**
     * @tc.name   testFieldVolume020087
     * @tc.number SUB_Contact_FIELD_0087
     * @tc.desc   合法：小写 e 开头的多字符姓名取首字母 E
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020087 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'erest' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('E'));
      expect(result).assertEqual('E');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020087 end');
    });

    /**
     * @tc.name   testFieldVolume020088
     * @tc.number SUB_Contact_FIELD_0088
     * @tc.desc   合法：小写 f 首字母归一为大写 F
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020088 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'f' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('F'));
      expect(result).assertEqual('F');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020088 end');
    });

    /**
     * @tc.name   testFieldVolume020089
     * @tc.number SUB_Contact_FIELD_0089
     * @tc.desc   合法：小写 f 开头的多字符姓名取首字母 F
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020089 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'frest' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('F'));
      expect(result).assertEqual('F');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020089 end');
    });

    /**
     * @tc.name   testFieldVolume020090
     * @tc.number SUB_Contact_FIELD_0090
     * @tc.desc   合法：小写 g 首字母归一为大写 G
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020090 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'g' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('G'));
      expect(result).assertEqual('G');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020090 end');
    });

    /**
     * @tc.name   testFieldVolume020091
     * @tc.number SUB_Contact_FIELD_0091
     * @tc.desc   合法：小写 g 开头的多字符姓名取首字母 G
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020091 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'grest' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('G'));
      expect(result).assertEqual('G');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020091 end');
    });

    /**
     * @tc.name   testFieldVolume020092
     * @tc.number SUB_Contact_FIELD_0092
     * @tc.desc   合法：小写 h 首字母归一为大写 H
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020092 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'h' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('H'));
      expect(result).assertEqual('H');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020092 end');
    });

    /**
     * @tc.name   testFieldVolume020093
     * @tc.number SUB_Contact_FIELD_0093
     * @tc.desc   合法：小写 h 开头的多字符姓名取首字母 H
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020093 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'hrest' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('H'));
      expect(result).assertEqual('H');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020093 end');
    });

    /**
     * @tc.name   testFieldVolume020094
     * @tc.number SUB_Contact_FIELD_0094
     * @tc.desc   合法：小写 i 首字母归一为大写 I
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020094 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'i' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('I'));
      expect(result).assertEqual('I');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020094 end');
    });

    /**
     * @tc.name   testFieldVolume020095
     * @tc.number SUB_Contact_FIELD_0095
     * @tc.desc   合法：小写 i 开头的多字符姓名取首字母 I
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020095 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'irest' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('I'));
      expect(result).assertEqual('I');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020095 end');
    });

    /**
     * @tc.name   testFieldVolume020096
     * @tc.number SUB_Contact_FIELD_0096
     * @tc.desc   合法：小写 j 首字母归一为大写 J
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020096 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'j' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('J'));
      expect(result).assertEqual('J');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020096 end');
    });

    /**
     * @tc.name   testFieldVolume020097
     * @tc.number SUB_Contact_FIELD_0097
     * @tc.desc   合法：小写 j 开头的多字符姓名取首字母 J
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020097 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'jrest' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('J'));
      expect(result).assertEqual('J');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020097 end');
    });

    /**
     * @tc.name   testFieldVolume020098
     * @tc.number SUB_Contact_FIELD_0098
     * @tc.desc   合法：小写 k 首字母归一为大写 K
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020098 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'k' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('K'));
      expect(result).assertEqual('K');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020098 end');
    });

    /**
     * @tc.name   testFieldVolume020099
     * @tc.number SUB_Contact_FIELD_0099
     * @tc.desc   合法：小写 k 开头的多字符姓名取首字母 K
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020099 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'krest' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('K'));
      expect(result).assertEqual('K');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020099 end');
    });

    /**
     * @tc.name   testFieldVolume020100
     * @tc.number SUB_Contact_FIELD_0100
     * @tc.desc   合法：小写 l 首字母归一为大写 L
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020100 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'l' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('L'));
      expect(result).assertEqual('L');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020100 end');
    });

    /**
     * @tc.name   testFieldVolume020101
     * @tc.number SUB_Contact_FIELD_0101
     * @tc.desc   合法：小写 l 开头的多字符姓名取首字母 L
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020101 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'lrest' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('L'));
      expect(result).assertEqual('L');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020101 end');
    });

    /**
     * @tc.name   testFieldVolume020102
     * @tc.number SUB_Contact_FIELD_0102
     * @tc.desc   合法：小写 m 首字母归一为大写 M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020102 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'm' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('M'));
      expect(result).assertEqual('M');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020102 end');
    });

    /**
     * @tc.name   testFieldVolume020103
     * @tc.number SUB_Contact_FIELD_0103
     * @tc.desc   合法：小写 m 开头的多字符姓名取首字母 M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020103 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'mrest' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('M'));
      expect(result).assertEqual('M');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020103 end');
    });

    /**
     * @tc.name   testFieldVolume020104
     * @tc.number SUB_Contact_FIELD_0104
     * @tc.desc   合法：小写 n 首字母归一为大写 N
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020104 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'n' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('N'));
      expect(result).assertEqual('N');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020104 end');
    });

    /**
     * @tc.name   testFieldVolume020105
     * @tc.number SUB_Contact_FIELD_0105
     * @tc.desc   合法：小写 n 开头的多字符姓名取首字母 N
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020105 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'nrest' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('N'));
      expect(result).assertEqual('N');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020105 end');
    });

    /**
     * @tc.name   testFieldVolume020106
     * @tc.number SUB_Contact_FIELD_0106
     * @tc.desc   合法：小写 o 首字母归一为大写 O
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020106 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'o' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('O'));
      expect(result).assertEqual('O');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020106 end');
    });

    /**
     * @tc.name   testFieldVolume020107
     * @tc.number SUB_Contact_FIELD_0107
     * @tc.desc   合法：小写 o 开头的多字符姓名取首字母 O
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020107 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'orest' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('O'));
      expect(result).assertEqual('O');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020107 end');
    });

    /**
     * @tc.name   testFieldVolume020108
     * @tc.number SUB_Contact_FIELD_0108
     * @tc.desc   合法：小写 p 首字母归一为大写 P
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020108 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'p' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('P'));
      expect(result).assertEqual('P');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020108 end');
    });

    /**
     * @tc.name   testFieldVolume020109
     * @tc.number SUB_Contact_FIELD_0109
     * @tc.desc   合法：小写 p 开头的多字符姓名取首字母 P
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020109 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'prest' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('P'));
      expect(result).assertEqual('P');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020109 end');
    });

    /**
     * @tc.name   testFieldVolume020110
     * @tc.number SUB_Contact_FIELD_0110
     * @tc.desc   合法：小写 q 首字母归一为大写 Q
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020110 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'q' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Q'));
      expect(result).assertEqual('Q');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020110 end');
    });

    /**
     * @tc.name   testFieldVolume020111
     * @tc.number SUB_Contact_FIELD_0111
     * @tc.desc   合法：小写 q 开头的多字符姓名取首字母 Q
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020111 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'qrest' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Q'));
      expect(result).assertEqual('Q');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020111 end');
    });

    /**
     * @tc.name   testFieldVolume020112
     * @tc.number SUB_Contact_FIELD_0112
     * @tc.desc   合法：小写 r 首字母归一为大写 R
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020112 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'r' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('R'));
      expect(result).assertEqual('R');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020112 end');
    });

    /**
     * @tc.name   testFieldVolume020113
     * @tc.number SUB_Contact_FIELD_0113
     * @tc.desc   合法：小写 r 开头的多字符姓名取首字母 R
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020113 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'rrest' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('R'));
      expect(result).assertEqual('R');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020113 end');
    });

    /**
     * @tc.name   testFieldVolume020114
     * @tc.number SUB_Contact_FIELD_0114
     * @tc.desc   合法：小写 s 首字母归一为大写 S
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020114 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 's' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('S'));
      expect(result).assertEqual('S');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020114 end');
    });

    /**
     * @tc.name   testFieldVolume020115
     * @tc.number SUB_Contact_FIELD_0115
     * @tc.desc   合法：小写 s 开头的多字符姓名取首字母 S
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020115 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'srest' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('S'));
      expect(result).assertEqual('S');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020115 end');
    });

    /**
     * @tc.name   testFieldVolume020116
     * @tc.number SUB_Contact_FIELD_0116
     * @tc.desc   合法：小写 t 首字母归一为大写 T
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020116 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 't' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('T'));
      expect(result).assertEqual('T');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020116 end');
    });

    /**
     * @tc.name   testFieldVolume020117
     * @tc.number SUB_Contact_FIELD_0117
     * @tc.desc   合法：小写 t 开头的多字符姓名取首字母 T
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020117 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'trest' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('T'));
      expect(result).assertEqual('T');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020117 end');
    });

    /**
     * @tc.name   testFieldVolume020118
     * @tc.number SUB_Contact_FIELD_0118
     * @tc.desc   合法：小写 u 首字母归一为大写 U
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020118 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'u' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('U'));
      expect(result).assertEqual('U');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020118 end');
    });

    /**
     * @tc.name   testFieldVolume020119
     * @tc.number SUB_Contact_FIELD_0119
     * @tc.desc   合法：小写 u 开头的多字符姓名取首字母 U
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020119 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'urest' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('U'));
      expect(result).assertEqual('U');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020119 end');
    });

    /**
     * @tc.name   testFieldVolume020120
     * @tc.number SUB_Contact_FIELD_0120
     * @tc.desc   合法：小写 v 首字母归一为大写 V
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020120 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'v' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('V'));
      expect(result).assertEqual('V');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020120 end');
    });

    /**
     * @tc.name   testFieldVolume020121
     * @tc.number SUB_Contact_FIELD_0121
     * @tc.desc   合法：小写 v 开头的多字符姓名取首字母 V
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020121 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'vrest' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('V'));
      expect(result).assertEqual('V');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020121 end');
    });

    /**
     * @tc.name   testFieldVolume020122
     * @tc.number SUB_Contact_FIELD_0122
     * @tc.desc   合法：小写 w 首字母归一为大写 W
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020122 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'w' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('W'));
      expect(result).assertEqual('W');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020122 end');
    });

    /**
     * @tc.name   testFieldVolume020123
     * @tc.number SUB_Contact_FIELD_0123
     * @tc.desc   合法：小写 w 开头的多字符姓名取首字母 W
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020123 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'wrest' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('W'));
      expect(result).assertEqual('W');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020123 end');
    });

    /**
     * @tc.name   testFieldVolume020124
     * @tc.number SUB_Contact_FIELD_0124
     * @tc.desc   合法：小写 x 首字母归一为大写 X
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020124 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'x' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('X'));
      expect(result).assertEqual('X');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020124 end');
    });

    /**
     * @tc.name   testFieldVolume020125
     * @tc.number SUB_Contact_FIELD_0125
     * @tc.desc   合法：小写 x 开头的多字符姓名取首字母 X
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020125 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'xrest' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('X'));
      expect(result).assertEqual('X');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020125 end');
    });

    /**
     * @tc.name   testFieldVolume020126
     * @tc.number SUB_Contact_FIELD_0126
     * @tc.desc   合法：小写 y 首字母归一为大写 Y
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020126 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'y' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Y'));
      expect(result).assertEqual('Y');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020126 end');
    });

    /**
     * @tc.name   testFieldVolume020127
     * @tc.number SUB_Contact_FIELD_0127
     * @tc.desc   合法：小写 y 开头的多字符姓名取首字母 Y
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020127 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'yrest' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Y'));
      expect(result).assertEqual('Y');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020127 end');
    });

    /**
     * @tc.name   testFieldVolume020128
     * @tc.number SUB_Contact_FIELD_0128
     * @tc.desc   合法：小写 z 首字母归一为大写 Z
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020128 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'z' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Z'));
      expect(result).assertEqual('Z');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020128 end');
    });

    /**
     * @tc.name   testFieldVolume020129
     * @tc.number SUB_Contact_FIELD_0129
     * @tc.desc   合法：小写 z 开头的多字符姓名取首字母 Z
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020129 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'zrest' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Z'));
      expect(result).assertEqual('Z');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020129 end');
    });

    /**
     * @tc.name   testFieldVolume020130
     * @tc.number SUB_Contact_FIELD_0130
     * @tc.desc   合法：大写 A 首字母保持 A
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020130 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'A' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('A'));
      expect(result).assertEqual('A');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020130 end');
    });

    /**
     * @tc.name   testFieldVolume020131
     * @tc.number SUB_Contact_FIELD_0131
     * @tc.desc   合法：大写 B 首字母保持 B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020131 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'B' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('B'));
      expect(result).assertEqual('B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020131 end');
    });

    /**
     * @tc.name   testFieldVolume020132
     * @tc.number SUB_Contact_FIELD_0132
     * @tc.desc   合法：大写 C 首字母保持 C
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020132 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'C' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('C'));
      expect(result).assertEqual('C');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020132 end');
    });

    /**
     * @tc.name   testFieldVolume020133
     * @tc.number SUB_Contact_FIELD_0133
     * @tc.desc   合法：大写 D 首字母保持 D
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020133 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'D' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('D'));
      expect(result).assertEqual('D');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020133 end');
    });

    /**
     * @tc.name   testFieldVolume020134
     * @tc.number SUB_Contact_FIELD_0134
     * @tc.desc   合法：大写 E 首字母保持 E
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020134 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'E' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('E'));
      expect(result).assertEqual('E');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020134 end');
    });

    /**
     * @tc.name   testFieldVolume020135
     * @tc.number SUB_Contact_FIELD_0135
     * @tc.desc   合法：大写 F 首字母保持 F
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020135 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'F' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('F'));
      expect(result).assertEqual('F');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020135 end');
    });

    /**
     * @tc.name   testFieldVolume020136
     * @tc.number SUB_Contact_FIELD_0136
     * @tc.desc   合法：大写 G 首字母保持 G
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020136 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'G' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('G'));
      expect(result).assertEqual('G');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020136 end');
    });

    /**
     * @tc.name   testFieldVolume020137
     * @tc.number SUB_Contact_FIELD_0137
     * @tc.desc   合法：大写 H 首字母保持 H
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020137 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'H' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('H'));
      expect(result).assertEqual('H');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020137 end');
    });

    /**
     * @tc.name   testFieldVolume020138
     * @tc.number SUB_Contact_FIELD_0138
     * @tc.desc   合法：大写 I 首字母保持 I
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020138 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'I' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('I'));
      expect(result).assertEqual('I');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020138 end');
    });

    /**
     * @tc.name   testFieldVolume020139
     * @tc.number SUB_Contact_FIELD_0139
     * @tc.desc   合法：大写 J 首字母保持 J
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020139 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'J' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('J'));
      expect(result).assertEqual('J');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020139 end');
    });

    /**
     * @tc.name   testFieldVolume020140
     * @tc.number SUB_Contact_FIELD_0140
     * @tc.desc   合法：大写 K 首字母保持 K
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020140 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'K' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('K'));
      expect(result).assertEqual('K');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020140 end');
    });

    /**
     * @tc.name   testFieldVolume020141
     * @tc.number SUB_Contact_FIELD_0141
     * @tc.desc   合法：大写 L 首字母保持 L
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020141 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'L' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('L'));
      expect(result).assertEqual('L');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020141 end');
    });

    /**
     * @tc.name   testFieldVolume020142
     * @tc.number SUB_Contact_FIELD_0142
     * @tc.desc   合法：大写 M 首字母保持 M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020142 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'M' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('M'));
      expect(result).assertEqual('M');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020142 end');
    });

    /**
     * @tc.name   testFieldVolume020143
     * @tc.number SUB_Contact_FIELD_0143
     * @tc.desc   合法：大写 N 首字母保持 N
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020143 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'N' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('N'));
      expect(result).assertEqual('N');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020143 end');
    });

    /**
     * @tc.name   testFieldVolume020144
     * @tc.number SUB_Contact_FIELD_0144
     * @tc.desc   合法：大写 O 首字母保持 O
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020144 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'O' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('O'));
      expect(result).assertEqual('O');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020144 end');
    });

    /**
     * @tc.name   testFieldVolume020145
     * @tc.number SUB_Contact_FIELD_0145
     * @tc.desc   合法：大写 P 首字母保持 P
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020145 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'P' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('P'));
      expect(result).assertEqual('P');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020145 end');
    });

    /**
     * @tc.name   testFieldVolume020146
     * @tc.number SUB_Contact_FIELD_0146
     * @tc.desc   合法：大写 Q 首字母保持 Q
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020146 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'Q' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Q'));
      expect(result).assertEqual('Q');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020146 end');
    });

    /**
     * @tc.name   testFieldVolume020147
     * @tc.number SUB_Contact_FIELD_0147
     * @tc.desc   合法：大写 R 首字母保持 R
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020147 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'R' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('R'));
      expect(result).assertEqual('R');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020147 end');
    });

    /**
     * @tc.name   testFieldVolume020148
     * @tc.number SUB_Contact_FIELD_0148
     * @tc.desc   合法：大写 S 首字母保持 S
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020148 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'S' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('S'));
      expect(result).assertEqual('S');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020148 end');
    });

    /**
     * @tc.name   testFieldVolume020149
     * @tc.number SUB_Contact_FIELD_0149
     * @tc.desc   合法：大写 T 首字母保持 T
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020149 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'T' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('T'));
      expect(result).assertEqual('T');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020149 end');
    });

    /**
     * @tc.name   testFieldVolume020150
     * @tc.number SUB_Contact_FIELD_0150
     * @tc.desc   合法：大写 U 首字母保持 U
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020150 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'U' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('U'));
      expect(result).assertEqual('U');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020150 end');
    });

    /**
     * @tc.name   testFieldVolume020151
     * @tc.number SUB_Contact_FIELD_0151
     * @tc.desc   合法：大写 V 首字母保持 V
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020151 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'V' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('V'));
      expect(result).assertEqual('V');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020151 end');
    });

    /**
     * @tc.name   testFieldVolume020152
     * @tc.number SUB_Contact_FIELD_0152
     * @tc.desc   合法：大写 W 首字母保持 W
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume020152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020152 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} : { name: { fullName: 'W' } };
      const result: string = ContactFieldExtractor.firstLetter(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('W'));
      expect(result).assertEqual('W');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume020152 end');
    });

  });
}
