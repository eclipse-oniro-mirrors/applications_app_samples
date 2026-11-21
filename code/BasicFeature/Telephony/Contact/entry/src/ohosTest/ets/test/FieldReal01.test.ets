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
import { ContactLetterComparator } from '../../../main/ets/utils/ContactLetterComparator';
import { ContactFieldExtractor } from '../../../main/ets/utils/ContactFieldExtractor';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_Contact]';

export default function fieldReal01Test() {
  describe('FieldReal01Test', () => {
    /**
     * @tc.name   testFieldReal010001
     * @tc.number SUB_Contact_FIELDR_0001
     * @tc.desc   fullName 合法值：输入 {name:{fullName:'zhangsan'}}，期望原样返回 'zhangsan'（提取语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010001 begin');
      const info: contact.Contact = { name: { fullName: 'zhangsan' } };
      const result: string = ContactFieldExtractor.fullName(info);
      expect(result).assertEqual('zhangsan');
      expect(result.length).assertEqual(8);
      expect(result === 'zhangsanx').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010001 end');
    });
    /**
     * @tc.name   testFieldReal010002
     * @tc.number SUB_Contact_FIELDR_0002
     * @tc.desc   fullName 合法值：输入 {name:{fullName:'Zhang San'}}，期望原样返回 'Zhang San'（提取语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010002 begin');
      const info: contact.Contact = { name: { fullName: 'Zhang San' } };
      const result: string = ContactFieldExtractor.fullName(info);
      expect(result).assertEqual('Zhang San');
      expect(result.length).assertEqual(9);
      expect(result === 'Zhang  San').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010002 end');
    });
    /**
     * @tc.name   testFieldReal010003
     * @tc.number SUB_Contact_FIELDR_0003
     * @tc.desc   fullName 合法值：输入 {name:{fullName:'ZS'}}，期望原样返回 'ZS'（提取语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010003 begin');
      const info: contact.Contact = { name: { fullName: 'ZS' } };
      const result: string = ContactFieldExtractor.fullName(info);
      expect(result).assertEqual('ZS');
      expect(result.length).assertEqual(2);
      expect(result === 'zs').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010003 end');
    });
    /**
     * @tc.name   testFieldReal010004
     * @tc.number SUB_Contact_FIELDR_0004
     * @tc.desc   fullName 合法值：输入 {name:{fullName:'lisi'}}，期望原样返回 'lisi'（提取语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010004 begin');
      const info: contact.Contact = { name: { fullName: 'lisi' } };
      const result: string = ContactFieldExtractor.fullName(info);
      expect(result).assertEqual('lisi');
      expect(result.length).assertEqual(4);
      expect(result === 'lisi ').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010004 end');
    });
    /**
     * @tc.name   testFieldReal010005
     * @tc.number SUB_Contact_FIELDR_0005
     * @tc.desc   fullName 合法值：输入 {name:{fullName:'Contact'}}，期望原样返回 'Contact'（提取语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010005 begin');
      const info: contact.Contact = { name: { fullName: 'Contact' } };
      const result: string = ContactFieldExtractor.fullName(info);
      expect(result).assertEqual('Contact');
      expect(result.length).assertEqual(7);
      expect(result === 'contact').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010005 end');
    });
    /**
     * @tc.name   testFieldReal010006
     * @tc.number SUB_Contact_FIELDR_0006
     * @tc.desc   fullName 合法值：输入 {name:{fullName:'OpenHarmony'}}，期望原样返回 'OpenHarmony'（提取语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010006 begin');
      const info: contact.Contact = { name: { fullName: 'OpenHarmony' } };
      const result: string = ContactFieldExtractor.fullName(info);
      expect(result).assertEqual('OpenHarmony');
      expect(result.length).assertEqual(11);
      expect(result === 'OpenHarmony ').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010006 end');
    });
    /**
     * @tc.name   testFieldReal010007
     * @tc.number SUB_Contact_FIELDR_0007
     * @tc.desc   fullName 合法值：输入 {name:{fullName:'张三'}}，期望原样返回 '张三'（提取语义，中文不做转换）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010007 begin');
      const info: contact.Contact = { name: { fullName: '张三' } };
      const result: string = ContactFieldExtractor.fullName(info);
      expect(result).assertEqual('张三');
      expect(result.length).assertEqual(2);
      expect(result === '张三三').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010007 end');
    });
    /**
     * @tc.name   testFieldReal010008
     * @tc.number SUB_Contact_FIELDR_0008
     * @tc.desc   fullName 合法值：输入 {name:{fullName:'李四'}}，期望原样返回 '李四'（提取语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010008 begin');
      const info: contact.Contact = { name: { fullName: '李四' } };
      const result: string = ContactFieldExtractor.fullName(info);
      expect(result).assertEqual('李四');
      expect(result.length).assertEqual(2);
      expect(result === '李').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010008 end');
    });
    /**
     * @tc.name   testFieldReal010009
     * @tc.number SUB_Contact_FIELDR_0009
     * @tc.desc   fullName 合法值：输入 {name:{fullName:'王五'}}，期望原样返回 '王五'（提取语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010009 begin');
      const info: contact.Contact = { name: { fullName: '王五' } };
      const result: string = ContactFieldExtractor.fullName(info);
      expect(result).assertEqual('王五');
      expect(result.length).assertEqual(2);
      expect(result === '王五五').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010009 end');
    });
    /**
     * @tc.name   testFieldReal010010
     * @tc.number SUB_Contact_FIELDR_0010
     * @tc.desc   fullName 合法值：输入 {name:{fullName:'zhang三'}}，期望原样返回 'zhang三'（提取语义，中英混合）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010010 begin');
      const info: contact.Contact = { name: { fullName: 'zhang三' } };
      const result: string = ContactFieldExtractor.fullName(info);
      expect(result).assertEqual('zhang三');
      expect(result.length).assertEqual(6);
      expect(result === 'zhang').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010010 end');
    });
    /**
     * @tc.name   testFieldReal010011
     * @tc.number SUB_Contact_FIELDR_0011
     * @tc.desc   fullName 合法值：输入 {name:{fullName:'李si'}}，期望原样返回 '李si'（提取语义，中英混合）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010011 begin');
      const info: contact.Contact = { name: { fullName: '李si' } };
      const result: string = ContactFieldExtractor.fullName(info);
      expect(result).assertEqual('李si');
      expect(result.length).assertEqual(3);
      expect(result === '李s').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010011 end');
    });
    /**
     * @tc.name   testFieldReal010012
     * @tc.number SUB_Contact_FIELDR_0012
     * @tc.desc   fullName 合法值：输入 {name:{fullName:'Wang Wu'}}，期望原样返回 'Wang Wu'（提取语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010012 begin');
      const info: contact.Contact = { name: { fullName: 'Wang Wu' } };
      const result: string = ContactFieldExtractor.fullName(info);
      expect(result).assertEqual('Wang Wu');
      expect(result.length).assertEqual(7);
      expect(result === 'WangWu').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010012 end');
    });
    /**
     * @tc.name   testFieldReal010013
     * @tc.number SUB_Contact_FIELDR_0013
     * @tc.desc   fullName 合法值：输入 {name:{fullName:'Zhao Liu'}}，期望原样返回 'Zhao Liu'（提取语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010013 begin');
      const info: contact.Contact = { name: { fullName: 'Zhao Liu' } };
      const result: string = ContactFieldExtractor.fullName(info);
      expect(result).assertEqual('Zhao Liu');
      expect(result.length).assertEqual(8);
      expect(result === 'zhao liu').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010013 end');
    });
    /**
     * @tc.name   testFieldReal010014
     * @tc.number SUB_Contact_FIELDR_0014
     * @tc.desc   fullName 合法值：输入 {name:{fullName:'小明'}}，期望原样返回 '小明'（提取语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010014 begin');
      const info: contact.Contact = { name: { fullName: '小明' } };
      const result: string = ContactFieldExtractor.fullName(info);
      expect(result).assertEqual('小明');
      expect(result.length).assertEqual(2);
      expect(result === '大明').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010014 end');
    });
    /**
     * @tc.name   testFieldReal010015
     * @tc.number SUB_Contact_FIELDR_0015
     * @tc.desc   fullName 合法值：输入 {name:{fullName:'ZHANG'}}，期望原样返回 'ZHANG'（提取语义，不做小写归一）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010015 begin');
      const info: contact.Contact = { name: { fullName: 'ZHANG' } };
      const result: string = ContactFieldExtractor.fullName(info);
      expect(result).assertEqual('ZHANG');
      expect(result.length).assertEqual(5);
      expect(result === 'ZHAN').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010015 end');
    });
    /**
     * @tc.name   testFieldReal010016
     * @tc.number SUB_Contact_FIELDR_0016
     * @tc.desc   fullName 边界值：输入 {name:{fullName:''}}，期望返回 ''（提取语义，空串原样返回）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010016 begin');
      const info: contact.Contact = { name: { fullName: '' } };
      const result: string = ContactFieldExtractor.fullName(info);
      expect(result).assertEqual('');
      expect(result.length).assertEqual(0);
      expect(result === ' ').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010016 end');
    });
    /**
     * @tc.name   testFieldReal010017
     * @tc.number SUB_Contact_FIELDR_0017
     * @tc.desc   fullName 边界值：输入 {name:{fullName:'A'}} 单字符，期望返回 'A'（提取语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010017 begin');
      const info: contact.Contact = { name: { fullName: 'A' } };
      const result: string = ContactFieldExtractor.fullName(info);
      expect(result).assertEqual('A');
      expect(result.length).assertEqual(1);
      expect(result === 'a').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010017 end');
    });
    /**
     * @tc.name   testFieldReal010018
     * @tc.number SUB_Contact_FIELDR_0018
     * @tc.desc   fullName 边界值：输入 {name:{fullName:' '}} 单个空格，期望返回 ' '（提取语义，空格不裁剪）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010018 begin');
      const info: contact.Contact = { name: { fullName: ' ' } };
      const result: string = ContactFieldExtractor.fullName(info);
      expect(result).assertEqual(' ');
      expect(result.length).assertEqual(1);
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010018 end');
    });
    /**
     * @tc.name   testFieldReal010019
     * @tc.number SUB_Contact_FIELDR_0019
     * @tc.desc   fullName 边界值：输入 {name:{fullName:'x'x100}} 100 字符，期望原样返回且长度 100（提取语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010019 begin');
      const longName: string = 'x'.repeat(100);
      const info: contact.Contact = { name: { fullName: longName } };
      const result: string = ContactFieldExtractor.fullName(info);
      expect(result).assertEqual(longName);
      expect(result.length).assertEqual(100);
      expect(result === 'x'.repeat(99)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010019 end');
    });
    /**
     * @tc.name   testFieldReal010020
     * @tc.number SUB_Contact_FIELDR_0020
     * @tc.desc   fullName 边界值：输入 {name:{fullName:'中'}} 单汉字，期望返回 '中' 且长度 1（提取语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010020 begin');
      const info: contact.Contact = { name: { fullName: '中' } };
      const result: string = ContactFieldExtractor.fullName(info);
      expect(result).assertEqual('中');
      expect(result.length).assertEqual(1);
      expect(result === '国').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010020 end');
    });
    /**
     * @tc.name   testFieldReal010021
     * @tc.number SUB_Contact_FIELDR_0021
     * @tc.desc   fullName 守卫：输入 {}（name 缺失），期望返回 ''（提取语义，name 为 undefined 走守卫分支）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010021 begin');
      const info: contact.Contact = {};
      const result: string = ContactFieldExtractor.fullName(info);
      expect(result).assertEqual('');
      expect(result.length).assertEqual(0);
      expect(result === 'x').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010021 end');
    });
    /**
     * @tc.name   testFieldReal010022
     * @tc.number SUB_Contact_FIELDR_0022
     * @tc.desc   fullName 守卫：输入 {phoneNumbers: []}（name 缺失），期望返回 ''（提取语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010022 begin');
      const info: contact.Contact = { phoneNumbers: [] };
      const result: string = ContactFieldExtractor.fullName(info);
      expect(result).assertEqual('');
      expect(result.length).assertEqual(0);
      expect(result === '13800000000').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010022 end');
    });
    /**
     * @tc.name   testFieldReal010023
     * @tc.number SUB_Contact_FIELDR_0023
     * @tc.desc   fullName 守卫：输入 {phoneNumbers:[{phoneNumber:'13800000000'}]}（有号码无姓名），期望返回 '' 不把号码当姓名（提取语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010023 begin');
      const info: contact.Contact = { phoneNumbers: [{ phoneNumber: '13800000000' }] };
      const result: string = ContactFieldExtractor.fullName(info);
      expect(result).assertEqual('');
      expect(result.length).assertEqual(0);
      expect(result === '13800000000').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010023 end');
    });
    /**
     * @tc.name   testFieldReal010024
     * @tc.number SUB_Contact_FIELDR_0024
     * @tc.desc   fullName 守卫：输入 {phoneNumbers:[{phoneNumber:''}]}（空号码无姓名），期望返回 ''（提取语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010024 begin');
      const info: contact.Contact = { phoneNumbers: [{ phoneNumber: '' }] };
      const result: string = ContactFieldExtractor.fullName(info);
      expect(result).assertEqual('');
      expect(result.length).assertEqual(0);
      expect(result === '0').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010024 end');
    });
    /**
     * @tc.name   testFieldReal010025
     * @tc.number SUB_Contact_FIELDR_0025
     * @tc.desc   fullName 守卫：输入 {} 连续两次提取，期望两次均为 '' 且互等（提取语义，守卫分支稳定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010025 begin');
      const info: contact.Contact = {};
      const firstCall: string = ContactFieldExtractor.fullName(info);
      const secondCall: string = ContactFieldExtractor.fullName(info);
      expect(firstCall).assertEqual('');
      expect(secondCall).assertEqual(firstCall);
      expect(firstCall.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010025 end');
    });
    /**
     * @tc.name   testFieldReal010026
     * @tc.number SUB_Contact_FIELDR_0026
     * @tc.desc   firstLetter 合法值：输入 {name:{fullName:'zhangsan'}}，期望 'Z'（首字符 substr(0,1).toUpperCase，提取语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010026 begin');
      const info: contact.Contact = { name: { fullName: 'zhangsan' } };
      const result: string = ContactFieldExtractor.firstLetter(info);
      expect(result).assertEqual('Z');
      expect(result === result.toUpperCase()).assertTrue();
      expect(result === 'z').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010026 end');
    });
    /**
     * @tc.name   testFieldReal010027
     * @tc.number SUB_Contact_FIELDR_0027
     * @tc.desc   firstLetter 合法值：输入 {name:{fullName:'abc'}}，期望 'A'（小写首字母转大写，提取语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010027 begin');
      const info: contact.Contact = { name: { fullName: 'abc' } };
      const result: string = ContactFieldExtractor.firstLetter(info);
      expect(result).assertEqual('A');
      expect(result === result.toUpperCase()).assertTrue();
      expect(result === 'a').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010027 end');
    });
    /**
     * @tc.name   testFieldReal010028
     * @tc.number SUB_Contact_FIELDR_0028
     * @tc.desc   firstLetter 合法值：输入 {name:{fullName:'mike'}}，期望 'M'（小写首字母转大写，提取语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010028 begin');
      const info: contact.Contact = { name: { fullName: 'mike' } };
      const result: string = ContactFieldExtractor.firstLetter(info);
      expect(result).assertEqual('M');
      expect(result === result.toUpperCase()).assertTrue();
      expect(result === 'm').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010028 end');
    });
    /**
     * @tc.name   testFieldReal010029
     * @tc.number SUB_Contact_FIELDR_0029
     * @tc.desc   firstLetter 合法值：输入 {name:{fullName:'Zhangsan'}}，期望 'Z'（大写首字母保持，提取语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010029 begin');
      const info: contact.Contact = { name: { fullName: 'Zhangsan' } };
      const result: string = ContactFieldExtractor.firstLetter(info);
      expect(result).assertEqual('Z');
      expect(result === result.toUpperCase()).assertTrue();
      expect(result === 'z').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010029 end');
    });
    /**
     * @tc.name   testFieldReal010030
     * @tc.number SUB_Contact_FIELDR_0030
     * @tc.desc   firstLetter 合法值：输入 {name:{fullName:'ABC'}}，期望 'A'（取首字符而非末字符，提取语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010030 begin');
      const info: contact.Contact = { name: { fullName: 'ABC' } };
      const result: string = ContactFieldExtractor.firstLetter(info);
      expect(result).assertEqual('A');
      expect(result === result.toUpperCase()).assertTrue();
      expect(result === 'B').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010030 end');
    });
    /**
     * @tc.name   testFieldReal010031
     * @tc.number SUB_Contact_FIELDR_0031
     * @tc.desc   firstLetter 数字开头：输入 {name:{fullName:'1abc'}}，期望 '1'（数字无大小写转换，提取语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010031 begin');
      const info: contact.Contact = { name: { fullName: '1abc' } };
      const result: string = ContactFieldExtractor.firstLetter(info);
      expect(result).assertEqual('1');
      expect(result.length).assertEqual(1);
      expect(result === 'a').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010031 end');
    });
    /**
     * @tc.name   testFieldReal010032
     * @tc.number SUB_Contact_FIELDR_0032
     * @tc.desc   firstLetter 符号开头：输入 {name:{fullName:'!abc'}}，期望 '!'（符号无大小写转换，提取语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010032 begin');
      const info: contact.Contact = { name: { fullName: '!abc' } };
      const result: string = ContactFieldExtractor.firstLetter(info);
      expect(result).assertEqual('!');
      expect(result.length).assertEqual(1);
      expect(result === 'a').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010032 end');
    });
    /**
     * @tc.name   testFieldReal010033
     * @tc.number SUB_Contact_FIELDR_0033
     * @tc.desc   firstLetter 中文开头：输入 {name:{fullName:'张三'}}，期望 '张'（汉字无大小写转换，提取语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010033 begin');
      const info: contact.Contact = { name: { fullName: '张三' } };
      const result: string = ContactFieldExtractor.firstLetter(info);
      expect(result).assertEqual('张');
      expect(result.length).assertEqual(1);
      expect(result === '三').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010033 end');
    });
    /**
     * @tc.name   testFieldReal010034
     * @tc.number SUB_Contact_FIELDR_0034
     * @tc.desc   firstLetter 边界空串：输入 {name:{fullName:''}}，期望 ''（空名首字母为空，提取语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010034 begin');
      const info: contact.Contact = { name: { fullName: '' } };
      const result: string = ContactFieldExtractor.firstLetter(info);
      expect(result).assertEqual('');
      expect(result.length).assertEqual(0);
      expect(result === 'Z').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010034 end');
    });
    /**
     * @tc.name   testFieldReal010035
     * @tc.number SUB_Contact_FIELDR_0035
     * @tc.desc   firstLetter 守卫：输入 {}（name 缺失），期望 ''（fullName 守卫为空后首字母为空，提取语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010035 begin');
      const info: contact.Contact = {};
      const result: string = ContactFieldExtractor.firstLetter(info);
      expect(result).assertEqual('');
      expect(result.length).assertEqual(0);
      expect(result === 'Z').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010035 end');
    });
    /**
     * @tc.name   testFieldReal010036
     * @tc.number SUB_Contact_FIELDR_0036
     * @tc.desc   firstLetter 极值超长：输入 {name:{fullName:'z'x100}}，期望 'Z'（只取首字符，提取语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010036 begin');
      const info: contact.Contact = { name: { fullName: 'z'.repeat(100) } };
      const result: string = ContactFieldExtractor.firstLetter(info);
      expect(result).assertEqual('Z');
      expect(result === result.toUpperCase()).assertTrue();
      expect(result === 'z').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010036 end');
    });
    /**
     * @tc.name   testFieldReal010037
     * @tc.number SUB_Contact_FIELDR_0037
     * @tc.desc   firstLetter 极值超长：输入 {name:{fullName:'x'x500}}，期望 'X'（只取首字符，提取语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010037 begin');
      const info: contact.Contact = { name: { fullName: 'x'.repeat(500) } };
      const result: string = ContactFieldExtractor.firstLetter(info);
      expect(result).assertEqual('X');
      expect(result === result.toUpperCase()).assertTrue();
      expect(result === 'x').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010037 end');
    });
    /**
     * @tc.name   testFieldReal010038
     * @tc.number SUB_Contact_FIELDR_0038
     * @tc.desc   firstLetter 组合值：输入 {name:{fullName:'a1'}}，期望 'A'（首字符为字母时转大写，提取语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010038 begin');
      const info: contact.Contact = { name: { fullName: 'a1' } };
      const result: string = ContactFieldExtractor.firstLetter(info);
      expect(result).assertEqual('A');
      expect(result === result.toUpperCase()).assertTrue();
      expect(result === '1').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010038 end');
    });
    /**
     * @tc.name   testFieldReal010039
     * @tc.number SUB_Contact_FIELDR_0039
     * @tc.desc   firstLetter 合法值：输入 {name:{fullName:'hello'}}，期望 'H'（小写首字母转大写，提取语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010039 begin');
      const info: contact.Contact = { name: { fullName: 'hello' } };
      const result: string = ContactFieldExtractor.firstLetter(info);
      expect(result).assertEqual('H');
      expect(result === result.toUpperCase()).assertTrue();
      expect(result === 'h').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010039 end');
    });
    /**
     * @tc.name   testFieldReal010040
     * @tc.number SUB_Contact_FIELDR_0040
     * @tc.desc   firstLetter 合法值：输入 {name:{fullName:'OpenHarmony'}}，期望 'O'（大写首字母保持，提取语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010040 begin');
      const info: contact.Contact = { name: { fullName: 'OpenHarmony' } };
      const result: string = ContactFieldExtractor.firstLetter(info);
      expect(result).assertEqual('O');
      expect(result === result.toUpperCase()).assertTrue();
      expect(result === 'o').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010040 end');
    });
    /**
     * @tc.name   testFieldReal010041
     * @tc.number SUB_Contact_FIELDR_0041
     * @tc.desc   firstPhone 合法值：输入 {phoneNumbers:[{phoneNumber:'13800000000'}]}，期望 '13800000000'（提取语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010041 begin');
      const info: contact.Contact = { phoneNumbers: [{ phoneNumber: '13800000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(info);
      expect(result).assertEqual('13800000000');
      expect(result.length).assertEqual(11);
      expect(result === '13900000000').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010041 end');
    });
    /**
     * @tc.name   testFieldReal010042
     * @tc.number SUB_Contact_FIELDR_0042
     * @tc.desc   firstPhone 合法值：输入 {phoneNumbers:[{phoneNumber:'13912345678'}]}，期望 '13912345678'（提取语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010042 begin');
      const info: contact.Contact = { phoneNumbers: [{ phoneNumber: '13912345678' }] };
      const result: string = ContactFieldExtractor.firstPhone(info);
      expect(result).assertEqual('13912345678');
      expect(result.length).assertEqual(11);
      expect(result === '13800000000').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010042 end');
    });
    /**
     * @tc.name   testFieldReal010043
     * @tc.number SUB_Contact_FIELDR_0043
     * @tc.desc   firstPhone 合法值：输入 {phoneNumbers:[{phoneNumber:'15012345678'}]}，期望 '15012345678'（提取语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010043 begin');
      const info: contact.Contact = { phoneNumbers: [{ phoneNumber: '15012345678' }] };
      const result: string = ContactFieldExtractor.firstPhone(info);
      expect(result).assertEqual('15012345678');
      expect(result.length).assertEqual(11);
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010043 end');
    });
    /**
     * @tc.name   testFieldReal010044
     * @tc.number SUB_Contact_FIELDR_0044
     * @tc.desc   firstPhone 合法值：输入 {phoneNumbers:[{phoneNumber:'18612345678'}]}，期望 '18612345678'（提取语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010044 begin');
      const info: contact.Contact = { phoneNumbers: [{ phoneNumber: '18612345678' }] };
      const result: string = ContactFieldExtractor.firstPhone(info);
      expect(result).assertEqual('18612345678');
      expect(result.length).assertEqual(11);
      expect(result === '1861234567').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010044 end');
    });
    /**
     * @tc.name   testFieldReal010045
     * @tc.number SUB_Contact_FIELDR_0045
     * @tc.desc   firstPhone 合法值：输入 {phoneNumbers:[{phoneNumber:'19987654321'}]}，期望 '19987654321'（提取语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010045 begin');
      const info: contact.Contact = { phoneNumbers: [{ phoneNumber: '19987654321' }] };
      const result: string = ContactFieldExtractor.firstPhone(info);
      expect(result).assertEqual('19987654321');
      expect(result.length).assertEqual(11);
      expect(result === '199876543210').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010045 end');
    });
    /**
     * @tc.name   testFieldReal010046
     * @tc.number SUB_Contact_FIELDR_0046
     * @tc.desc   firstPhone 边界空串号码：输入 {phoneNumbers:[{phoneNumber:''}]}，期望 ''（提取语义，空号码原样返回）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010046 begin');
      const info: contact.Contact = { phoneNumbers: [{ phoneNumber: '' }] };
      const result: string = ContactFieldExtractor.firstPhone(info);
      expect(result).assertEqual('');
      expect(result.length).assertEqual(0);
      expect(result === '1').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010046 end');
    });
    /**
     * @tc.name   testFieldReal010047
     * @tc.number SUB_Contact_FIELDR_0047
     * @tc.desc   firstPhone 守卫：输入 {}（phoneNumbers 缺失），期望 ''（提取语义，undefined 走守卫分支）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010047 begin');
      const info: contact.Contact = {};
      const result: string = ContactFieldExtractor.firstPhone(info);
      expect(result).assertEqual('');
      expect(result.length).assertEqual(0);
      expect(result === '138').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010047 end');
    });
    /**
     * @tc.name   testFieldReal010048
     * @tc.number SUB_Contact_FIELDR_0048
     * @tc.desc   firstPhone 守卫：输入 {phoneNumbers: []}（空数组），期望 ''（提取语义，length 为 0 走守卫分支）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010048 begin');
      const info: contact.Contact = { phoneNumbers: [] };
      const result: string = ContactFieldExtractor.firstPhone(info);
      expect(result).assertEqual('');
      expect(result.length).assertEqual(0);
      expect(result === '0').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010048 end');
    });
    /**
     * @tc.name   testFieldReal010049
     * @tc.number SUB_Contact_FIELDR_0049
     * @tc.desc   firstPhone 组合多元素取首：输入 ['13800000000','13911111111']，期望 '13800000000'（提取语义，只取 [0]）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010049 begin');
      const info: contact.Contact = { phoneNumbers: [{ phoneNumber: '13800000000' }, { phoneNumber: '13911111111' }] };
      const result: string = ContactFieldExtractor.firstPhone(info);
      expect(result).assertEqual('13800000000');
      expect(result.length).assertEqual(11);
      expect(result === '13911111111').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010049 end');
    });
    /**
     * @tc.name   testFieldReal010050
     * @tc.number SUB_Contact_FIELDR_0050
     * @tc.desc   firstPhone 组合多元素取首：输入 ['15000000000','15100000000']，期望 '15000000000'（提取语义，只取 [0]）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010050 begin');
      const info: contact.Contact = { phoneNumbers: [{ phoneNumber: '15000000000' }, { phoneNumber: '15100000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(info);
      expect(result).assertEqual('15000000000');
      expect(result.length).assertEqual(11);
      expect(result === '15100000000').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010050 end');
    });
    /**
     * @tc.name   testFieldReal010051
     * @tc.number SUB_Contact_FIELDR_0051
     * @tc.desc   firstPhone 组合多元素取首：输入 ['18800000000','18900000000']，期望 '18800000000'（提取语义，只取 [0]）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010051 begin');
      const info: contact.Contact = { phoneNumbers: [{ phoneNumber: '18800000000' }, { phoneNumber: '18900000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(info);
      expect(result).assertEqual('18800000000');
      expect(result.length).assertEqual(11);
      expect(result === '18900000000').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010051 end');
    });
    /**
     * @tc.name   testFieldReal010052
     * @tc.number SUB_Contact_FIELDR_0052
     * @tc.desc   firstPhone 组合多元素取首：输入 ['17700000000','17800000000']，期望 '17700000000'（提取语义，只取 [0]）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010052 begin');
      const info: contact.Contact = { phoneNumbers: [{ phoneNumber: '17700000000' }, { phoneNumber: '17800000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(info);
      expect(result).assertEqual('17700000000');
      expect(result.length).assertEqual(11);
      expect(result === '17800000000').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010052 end');
    });
    /**
     * @tc.name   testFieldReal010053
     * @tc.number SUB_Contact_FIELDR_0053
     * @tc.desc   firstPhone 组合多元素取首：输入 ['16600000000','16700000000']，期望 '16600000000'（提取语义，只取 [0]）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010053 begin');
      const info: contact.Contact = { phoneNumbers: [{ phoneNumber: '16600000000' }, { phoneNumber: '16700000000' }] };
      const result: string = ContactFieldExtractor.firstPhone(info);
      expect(result).assertEqual('16600000000');
      expect(result.length).assertEqual(11);
      expect(result === '16700000000').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010053 end');
    });
    /**
     * @tc.name   testFieldReal010054
     * @tc.number SUB_Contact_FIELDR_0054
     * @tc.desc   firstPhone 极值超长号码：输入 {phoneNumbers:[{phoneNumber:'1'x300}]}，期望原样返回且长度 300（提取语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010054 begin');
      const longPhone: string = '1'.repeat(300);
      const info: contact.Contact = { phoneNumbers: [{ phoneNumber: longPhone }] };
      const result: string = ContactFieldExtractor.firstPhone(info);
      expect(result).assertEqual(longPhone);
      expect(result.length).assertEqual(300);
      expect(result === '1'.repeat(299)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010054 end');
    });
    /**
     * @tc.name   testFieldReal010055
     * @tc.number SUB_Contact_FIELDR_0055
     * @tc.desc   firstPhone 组合固话号码：输入 {phoneNumbers:[{phoneNumber:'010-12345678'}]}，期望原样返回含连字符（提取语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010055 begin');
      const info: contact.Contact = { phoneNumbers: [{ phoneNumber: '010-12345678' }] };
      const result: string = ContactFieldExtractor.firstPhone(info);
      expect(result).assertEqual('010-12345678');
      expect(result.length).assertEqual(12);
      expect(result === '12345678').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010055 end');
    });
    /**
     * @tc.name   testFieldReal010056
     * @tc.number SUB_Contact_FIELDR_0056
     * @tc.desc   letterDiffers 同首：输入 'zhang'/'zhao'，期望 false（首字符相同，提取语义），并与异首 'zhang'/'wang' 为 true 对照
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010056 begin');
      const mainResult: boolean = ContactFieldExtractor.letterDiffers('zhang', 'zhao');
      const symmetricResult: boolean = ContactFieldExtractor.letterDiffers('zhao', 'zhang');
      const contrastResult: boolean = ContactFieldExtractor.letterDiffers('zhang', 'wang');
      expect(mainResult).assertFalse();
      expect(symmetricResult).assertEqual(mainResult);
      expect(contrastResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010056 end');
    });
    /**
     * @tc.name   testFieldReal010057
     * @tc.number SUB_Contact_FIELDR_0057
     * @tc.desc   letterDiffers 同首：输入 'A'/'A'，期望 false（首字符相同，提取语义），并与异首 'A'/'B' 为 true 对照
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010057 begin');
      const mainResult: boolean = ContactFieldExtractor.letterDiffers('A', 'A');
      const symmetricResult: boolean = ContactFieldExtractor.letterDiffers('A', 'A');
      const contrastResult: boolean = ContactFieldExtractor.letterDiffers('A', 'B');
      expect(mainResult).assertFalse();
      expect(symmetricResult).assertEqual(mainResult);
      expect(contrastResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010057 end');
    });
    /**
     * @tc.name   testFieldReal010058
     * @tc.number SUB_Contact_FIELDR_0058
     * @tc.desc   letterDiffers 同首边界：输入 ''/''，期望 false（空串首字符均为空，提取语义），并与异首 ''/'A' 为 true 对照
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010058 begin');
      const mainResult: boolean = ContactFieldExtractor.letterDiffers('', '');
      const symmetricResult: boolean = ContactFieldExtractor.letterDiffers('', '');
      const contrastResult: boolean = ContactFieldExtractor.letterDiffers('', 'A');
      expect(mainResult).assertFalse();
      expect(symmetricResult).assertEqual(mainResult);
      expect(contrastResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010058 end');
    });
    /**
     * @tc.name   testFieldReal010059
     * @tc.number SUB_Contact_FIELDR_0059
     * @tc.desc   letterDiffers 异首：输入 'zhang'/'wang'，期望 true（首字符 z 与 w 不同，提取语义），并与同首 'zhang'/'zhao' 为 false 对照
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010059 begin');
      const mainResult: boolean = ContactFieldExtractor.letterDiffers('zhang', 'wang');
      const symmetricResult: boolean = ContactFieldExtractor.letterDiffers('wang', 'zhang');
      const contrastResult: boolean = ContactFieldExtractor.letterDiffers('zhang', 'zhao');
      expect(mainResult).assertTrue();
      expect(symmetricResult).assertEqual(mainResult);
      expect(contrastResult).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010059 end');
    });
    /**
     * @tc.name   testFieldReal010060
     * @tc.number SUB_Contact_FIELDR_0060
     * @tc.desc   letterDiffers 异首：输入 'A'/'B'，期望 true（首字符不同，提取语义），并与同首 'A'/'A' 为 false 对照
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010060 begin');
      const mainResult: boolean = ContactFieldExtractor.letterDiffers('A', 'B');
      const symmetricResult: boolean = ContactFieldExtractor.letterDiffers('B', 'A');
      const contrastResult: boolean = ContactFieldExtractor.letterDiffers('A', 'A');
      expect(mainResult).assertTrue();
      expect(symmetricResult).assertEqual(mainResult);
      expect(contrastResult).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010060 end');
    });
    /**
     * @tc.name   testFieldReal010061
     * @tc.number SUB_Contact_FIELDR_0061
     * @tc.desc   letterDiffers 异首边界：输入 ''/'A'，期望 true（空串首字符与 'A' 不同，提取语义），并与同首 ''/'' 为 false 对照
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010061 begin');
      const mainResult: boolean = ContactFieldExtractor.letterDiffers('', 'A');
      const symmetricResult: boolean = ContactFieldExtractor.letterDiffers('A', '');
      const contrastResult: boolean = ContactFieldExtractor.letterDiffers('', '');
      expect(mainResult).assertTrue();
      expect(symmetricResult).assertEqual(mainResult);
      expect(contrastResult).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010061 end');
    });
    /**
     * @tc.name   testFieldReal010062
     * @tc.number SUB_Contact_FIELDR_0062
     * @tc.desc   letterDiffers 大小写敏感：输入 'a'/'A'，期望 true（'a' 与 'A' 码元不同，提取语义不做归一），并与 'a'/'a' 为 false 对照
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010062 begin');
      const mainResult: boolean = ContactFieldExtractor.letterDiffers('a', 'A');
      const symmetricResult: boolean = ContactFieldExtractor.letterDiffers('A', 'a');
      const contrastResult: boolean = ContactFieldExtractor.letterDiffers('a', 'a');
      expect(mainResult).assertTrue();
      expect(symmetricResult).assertEqual(mainResult);
      expect(contrastResult).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010062 end');
    });
    /**
     * @tc.name   testFieldReal010063
     * @tc.number SUB_Contact_FIELDR_0063
     * @tc.desc   letterDiffers 大小写敏感：输入 'Abc'/'abc'，期望 true（首字符 'A' 与 'a' 码元不同，提取语义），并与 'Abc'/'Abc' 为 false 对照
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010063 begin');
      const mainResult: boolean = ContactFieldExtractor.letterDiffers('Abc', 'abc');
      const symmetricResult: boolean = ContactFieldExtractor.letterDiffers('abc', 'Abc');
      const contrastResult: boolean = ContactFieldExtractor.letterDiffers('Abc', 'Abc');
      expect(mainResult).assertTrue();
      expect(symmetricResult).assertEqual(mainResult);
      expect(contrastResult).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010063 end');
    });
    /**
     * @tc.name   testFieldReal010064
     * @tc.number SUB_Contact_FIELDR_0064
     * @tc.desc   letterDiffers 中文：输入 '张'/'李'，期望 true（首字符不同，提取语义），并与 '张'/'张' 为 false 对照
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010064 begin');
      const mainResult: boolean = ContactFieldExtractor.letterDiffers('张', '李');
      const symmetricResult: boolean = ContactFieldExtractor.letterDiffers('李', '张');
      const contrastResult: boolean = ContactFieldExtractor.letterDiffers('张', '张');
      expect(mainResult).assertTrue();
      expect(symmetricResult).assertEqual(mainResult);
      expect(contrastResult).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010064 end');
    });
    /**
     * @tc.name   testFieldReal010065
     * @tc.number SUB_Contact_FIELDR_0065
     * @tc.desc   letterDiffers 数字与多字符同首：输入 '0'/'1' 期望 true、'1'/'1' 期望 false、'abc'/'abd' 期望 false（提取语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010065 begin');
      const mainResult: boolean = ContactFieldExtractor.letterDiffers('0', '1');
      const symmetricResult: boolean = ContactFieldExtractor.letterDiffers('1', '0');
      const sameDigit: boolean = ContactFieldExtractor.letterDiffers('1', '1');
      const samePrefix: boolean = ContactFieldExtractor.letterDiffers('abc', 'abd');
      expect(mainResult).assertTrue();
      expect(symmetricResult).assertEqual(mainResult);
      expect(sameDigit).assertFalse();
      expect(samePrefix).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010065 end');
    });
    /**
     * @tc.name   testFieldReal010066
     * @tc.number SUB_Contact_FIELDR_0066
     * @tc.desc   fullName 与 firstPhone 交叉：输入 name+phone 双字段，期望两字段各自正确提取且首字母为 'Z'（提取语义互不干扰）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010066 begin');
      const info: contact.Contact = { name: { fullName: 'zhangsan' }, phoneNumbers: [{ phoneNumber: '13800000000' }] };
      const extractedName: string = ContactFieldExtractor.fullName(info);
      const extractedPhone: string = ContactFieldExtractor.firstPhone(info);
      expect(extractedName).assertEqual('zhangsan');
      expect(extractedPhone).assertEqual('13800000000');
      expect(ContactFieldExtractor.firstLetter(info)).assertEqual('Z');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010066 end');
    });
    /**
     * @tc.name   testFieldReal010067
     * @tc.number SUB_Contact_FIELDR_0067
     * @tc.desc   fullName 与 firstPhone 交叉：输入仅 name，期望 fullName 有值、firstPhone 为空（提取语义互不干扰）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010067 begin');
      const info: contact.Contact = { name: { fullName: 'lisi' } };
      const extractedName: string = ContactFieldExtractor.fullName(info);
      const extractedPhone: string = ContactFieldExtractor.firstPhone(info);
      expect(extractedName).assertEqual('lisi');
      expect(extractedPhone).assertEqual('');
      expect(extractedPhone.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010067 end');
    });
    /**
     * @tc.name   testFieldReal010068
     * @tc.number SUB_Contact_FIELDR_0068
     * @tc.desc   fullName 与 firstPhone 交叉：输入仅 phone，期望 fullName 为空、firstPhone 有值（提取语义互不干扰）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010068 begin');
      const info: contact.Contact = { phoneNumbers: [{ phoneNumber: '13900000000' }] };
      const extractedName: string = ContactFieldExtractor.fullName(info);
      const extractedPhone: string = ContactFieldExtractor.firstPhone(info);
      expect(extractedName).assertEqual('');
      expect(extractedPhone).assertEqual('13900000000');
      expect(extractedName.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010068 end');
    });
    /**
     * @tc.name   testFieldReal010069
     * @tc.number SUB_Contact_FIELDR_0069
     * @tc.desc   fullName 与 firstPhone 交叉：输入 {} 双字段都缺，期望两字段均为空且互等（提取语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010069 begin');
      const info: contact.Contact = {};
      const extractedName: string = ContactFieldExtractor.fullName(info);
      const extractedPhone: string = ContactFieldExtractor.firstPhone(info);
      expect(extractedName).assertEqual('');
      expect(extractedPhone).assertEqual('');
      expect(extractedName === extractedPhone).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010069 end');
    });
    /**
     * @tc.name   testFieldReal010070
     * @tc.number SUB_Contact_FIELDR_0070
     * @tc.desc   fullName 与 firstPhone 交叉：输入 name 为空串 + phone 有值，期望 fullName 为空、firstPhone 有值、首字母为空（提取语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010070 begin');
      const info: contact.Contact = { name: { fullName: '' }, phoneNumbers: [{ phoneNumber: '15000000000' }] };
      const extractedName: string = ContactFieldExtractor.fullName(info);
      const extractedPhone: string = ContactFieldExtractor.firstPhone(info);
      expect(extractedName).assertEqual('');
      expect(extractedPhone).assertEqual('15000000000');
      expect(ContactFieldExtractor.firstLetter(info) === '').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010070 end');
    });
    /**
     * @tc.name   testFieldReal010071
     * @tc.number SUB_Contact_FIELDR_0071
     * @tc.desc   状态替代幂等：同一 contact 连续 3 次提取 fullName 均为 'zhangsan'（提取语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010071 begin');
      const info: contact.Contact = { name: { fullName: 'zhangsan' } };
      const firstCall: string = ContactFieldExtractor.fullName(info);
      const secondCall: string = ContactFieldExtractor.fullName(info);
      const thirdCall: string = ContactFieldExtractor.fullName(info);
      expect(firstCall).assertEqual('zhangsan');
      expect(secondCall).assertEqual(firstCall);
      expect(thirdCall).assertEqual(firstCall);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010071 end');
    });
    /**
     * @tc.name   testFieldReal010072
     * @tc.number SUB_Contact_FIELDR_0072
     * @tc.desc   状态替代幂等：同一 contact 连续 3 次提取 firstLetter 均为 'Z'（提取语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010072 begin');
      const info: contact.Contact = { name: { fullName: 'zhangsan' } };
      const firstCall: string = ContactFieldExtractor.firstLetter(info);
      const secondCall: string = ContactFieldExtractor.firstLetter(info);
      const thirdCall: string = ContactFieldExtractor.firstLetter(info);
      expect(firstCall).assertEqual('Z');
      expect(secondCall).assertEqual(firstCall);
      expect(thirdCall).assertEqual(firstCall);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010072 end');
    });
    /**
     * @tc.name   testFieldReal010073
     * @tc.number SUB_Contact_FIELDR_0073
     * @tc.desc   状态替代幂等：同一 contact 连续 3 次提取 firstPhone 均为 '13800000000'（提取语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010073 begin');
      const info: contact.Contact = { phoneNumbers: [{ phoneNumber: '13800000000' }] };
      const firstCall: string = ContactFieldExtractor.firstPhone(info);
      const secondCall: string = ContactFieldExtractor.firstPhone(info);
      const thirdCall: string = ContactFieldExtractor.firstPhone(info);
      expect(firstCall).assertEqual('13800000000');
      expect(secondCall).assertEqual(firstCall);
      expect(thirdCall).assertEqual(firstCall);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010073 end');
    });
    /**
     * @tc.name   testFieldReal010074
     * @tc.number SUB_Contact_FIELDR_0074
     * @tc.desc   状态替代幂等：letterDiffers('zhang','wang') 连续 3 次均为 true，并与 letterDiffers('zhang','zhang') 为 false 对照（提取语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010074 begin');
      const firstCall: boolean = ContactFieldExtractor.letterDiffers('zhang', 'wang');
      const secondCall: boolean = ContactFieldExtractor.letterDiffers('zhang', 'wang');
      const thirdCall: boolean = ContactFieldExtractor.letterDiffers('zhang', 'wang');
      const contrastCall: boolean = ContactFieldExtractor.letterDiffers('zhang', 'zhang');
      expect(firstCall).assertTrue();
      expect(secondCall).assertEqual(firstCall);
      expect(thirdCall).assertEqual(firstCall);
      expect(contrastCall).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010074 end');
    });
    /**
     * @tc.name   testFieldReal010075
     * @tc.number SUB_Contact_FIELDR_0075
     * @tc.desc   状态替代幂等：同一 contact 连续 3 次同时提取 fullName 与 firstPhone 结果均一致（提取语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010075 begin');
      const info: contact.Contact = { name: { fullName: 'lisi' }, phoneNumbers: [{ phoneNumber: '13900000000' }] };
      const name1: string = ContactFieldExtractor.fullName(info);
      const phone1: string = ContactFieldExtractor.firstPhone(info);
      const name2: string = ContactFieldExtractor.fullName(info);
      const phone2: string = ContactFieldExtractor.firstPhone(info);
      const name3: string = ContactFieldExtractor.fullName(info);
      const phone3: string = ContactFieldExtractor.firstPhone(info);
      expect(name1).assertEqual('lisi');
      expect(phone1).assertEqual('13900000000');
      expect(name2).assertEqual(name1);
      expect(phone3).assertEqual(phone1);
      expect(name3).assertEqual(name1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010075 end');
    });
    /**
     * @tc.name   testFieldReal010076
     * @tc.number SUB_Contact_FIELDR_0076
     * @tc.desc   表基线 v1：输入 {name:{fullName:'zhangsan'}}，期望 fullName='zhangsan'、firstLetter='Z'、firstPhone=''（提取语义基线）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010076 begin');
      const info: contact.Contact = { name: { fullName: 'zhangsan' } };
      expect(ContactFieldExtractor.fullName(info)).assertEqual('zhangsan');
      expect(ContactFieldExtractor.firstLetter(info)).assertEqual('Z');
      expect(ContactFieldExtractor.firstPhone(info)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010076 end');
    });
    /**
     * @tc.name   testFieldReal010077
     * @tc.number SUB_Contact_FIELDR_0077
     * @tc.desc   表基线 v1：输入 {phoneNumbers:[{phoneNumber:'13800000000'}]}，期望 firstPhone='13800000000'（提取语义基线）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010077 begin');
      const info: contact.Contact = { phoneNumbers: [{ phoneNumber: '13800000000' }] };
      expect(ContactFieldExtractor.fullName(info)).assertEqual('');
      expect(ContactFieldExtractor.firstLetter(info)).assertEqual('');
      expect(ContactFieldExtractor.firstPhone(info)).assertEqual('13800000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010077 end');
    });
    /**
     * @tc.name   testFieldReal010078
     * @tc.number SUB_Contact_FIELDR_0078
     * @tc.desc   表基线 v1：输入 {} 空对象，期望 fullName=''、firstLetter=''、firstPhone=''（提取语义基线）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010078 begin');
      const info: contact.Contact = {};
      expect(ContactFieldExtractor.fullName(info)).assertEqual('');
      expect(ContactFieldExtractor.firstLetter(info)).assertEqual('');
      expect(ContactFieldExtractor.firstPhone(info)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010078 end');
    });
    /**
     * @tc.name   testFieldReal010079
     * @tc.number SUB_Contact_FIELDR_0079
     * @tc.desc   表基线 v1：输入含 fullName='Zhang三' 与 phoneNumber='13900000000'，期望 'Zhang三'/'13900000000'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010079 begin');
      const info: contact.Contact = { name: { fullName: 'Zhang三' }, phoneNumbers: [{ phoneNumber: '13900000000' }] };
      expect(ContactFieldExtractor.fullName(info)).assertEqual('Zhang三');
      expect(ContactFieldExtractor.firstLetter(info)).assertEqual('Z');
      expect(ContactFieldExtractor.firstPhone(info)).assertEqual('13900000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010079 end');
    });
    /**
     * @tc.name   testFieldReal010080
     * @tc.number SUB_Contact_FIELDR_0080
     * @tc.desc   表基线 v1：输入 {name:{fullName:'李四'}, phoneNumbers:[{phoneNumber:'15012345678'}]}，期望 '李四'/'15012345678'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldReal010080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010080 begin');
      const info: contact.Contact = { name: { fullName: '李四' }, phoneNumbers: [{ phoneNumber: '15012345678' }] };
      expect(ContactFieldExtractor.fullName(info)).assertEqual('李四');
      expect(ContactFieldExtractor.firstLetter(info)).assertEqual('李');
      expect(ContactFieldExtractor.firstPhone(info)).assertEqual('15012345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldReal010080 end');
    });
  });
}
