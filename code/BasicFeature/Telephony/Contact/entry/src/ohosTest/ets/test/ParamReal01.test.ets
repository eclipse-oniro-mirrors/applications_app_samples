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
import { ParamGuard } from '../../../main/ets/utils/ParamGuard';
import { ContactFieldExtractor } from '../../../main/ets/utils/ContactFieldExtractor';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_Contact]';

export default function paramReal01Test() {
  describe('ParamReal01Test', () => {

    /**
     * @tc.name   testParamReal010001
     * @tc.number SUB_Contact_PARAMR_0001
     * @tc.desc   合法：传入有效 contact 原样返回（转发语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParamReal010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010001 begin');
      const input: contact.Contact = { name: { fullName: 'zhangsan' } };
      const resolved: contact.Contact = ParamGuard.resolveContact(input);
      const hasValue: boolean = ParamGuard.hasContact(input);
      expect(hasValue).assertTrue();
      expect(ContactFieldExtractor.fullName(resolved)).assertEqual('zhangsan');
      expect(resolved === input).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010001 end');
    });

    /**
     * @tc.name   testParamReal010002
     * @tc.number SUB_Contact_PARAMR_0002
     * @tc.desc   合法：含 phoneNumbers 的 contact 原样返回，号码可提取
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParamReal010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010002 begin');
      const input: contact.Contact = { phoneNumbers: [{ phoneNumber: '13800000000' }] };
      const resolved: contact.Contact = ParamGuard.resolveContact(input);
      expect(ContactFieldExtractor.firstPhone(resolved)).assertEqual('13800000000');
      expect(ParamGuard.hasContact(input)).assertTrue();
      expect(resolved === input).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010002 end');
    });

    /**
     * @tc.name   testParamReal010003
     * @tc.number SUB_Contact_PARAMR_0003
     * @tc.desc   合法：多字段 contact 原样返回且各字段互不丢失
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParamReal010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010003 begin');
      const input: contact.Contact = { name: { fullName: 'lisi' }, phoneNumbers: [{ phoneNumber: '13900000000' }] };
      const resolved: contact.Contact = ParamGuard.resolveContact(input);
      expect(ContactFieldExtractor.fullName(resolved)).assertEqual('lisi');
      expect(ContactFieldExtractor.firstPhone(resolved)).assertEqual('13900000000');
      expect(resolved === input).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010003 end');
    });

    /**
     * @tc.name   testParamReal010004
     * @tc.number SUB_Contact_PARAMR_0004
     * @tc.desc   合法：hasContact 对非 undefined 对象一律返回 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParamReal010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010004 begin');
      const emptyObj: contact.Contact = {};
      const hasEmpty: boolean = ParamGuard.hasContact(emptyObj);
      expect(hasEmpty).assertTrue();
      expect(ParamGuard.hasContact({ name: { fullName: 'a' } })).assertTrue();
      expect(hasEmpty === false).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010004 end');
    });

    /**
     * @tc.name   testParamReal010005
     * @tc.number SUB_Contact_PARAMR_0005
     * @tc.desc   合法：空对象原样返回（非 undefined 走原样分支）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParamReal010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010005 begin');
      const emptyObj: contact.Contact = {};
      const resolved: contact.Contact = ParamGuard.resolveContact(emptyObj);
      expect(resolved === emptyObj).assertTrue();
      expect(ContactFieldExtractor.fullName(resolved)).assertEqual('');
      expect(ParamGuard.hasContact(resolved)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010005 end');
    });

    /**
     * @tc.name   testParamReal010006
     * @tc.number SUB_Contact_PARAMR_0006
     * @tc.desc   合法：中文姓名 contact 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParamReal010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010006 begin');
      const input: contact.Contact = { name: { fullName: '张三' } };
      const resolved: contact.Contact = ParamGuard.resolveContact(input);
      expect(ContactFieldExtractor.fullName(resolved)).assertEqual('张三');
      expect(ContactFieldExtractor.firstLetter(resolved)).assertEqual('张');
      expect(resolved === input).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010006 end');
    });

    /**
     * @tc.name   testParamReal010007
     * @tc.number SUB_Contact_PARAMR_0007
     * @tc.desc   合法：两元素号码表取第 1 项，守卫转发不改变元素顺序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParamReal010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010007 begin');
      const input: contact.Contact = { phoneNumbers: [{ phoneNumber: '13000000000' }, { phoneNumber: '13100000000' }] };
      const resolved: contact.Contact = ParamGuard.resolveContact(input);
      expect(ContactFieldExtractor.firstPhone(resolved)).assertEqual('13000000000');
      expect(ContactFieldExtractor.firstPhone(resolved) === '13100000000').assertFalse();
      expect(resolved === input).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010007 end');
    });

    /**
     * @tc.name   testParamReal010008
     * @tc.number SUB_Contact_PARAMR_0008
     * @tc.desc   合法：100 字符长姓名 contact 原样返回不截断
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParamReal010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010008 begin');
      const longName: string = 'n'.repeat(100);
      const input: contact.Contact = { name: { fullName: longName } };
      const resolved: contact.Contact = ParamGuard.resolveContact(input);
      expect(ContactFieldExtractor.fullName(resolved)).assertEqual(longName);
      expect(ContactFieldExtractor.fullName(resolved).length).assertEqual(100);
      expect(resolved === input).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010008 end');
    });

    /**
     * @tc.name   testParamReal010009
     * @tc.number SUB_Contact_PARAMR_0009
     * @tc.desc   合法：空串姓名 contact 原样返回，空串非 undefined 不走守卫
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParamReal010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010009 begin');
      const input: contact.Contact = { name: { fullName: '' } };
      const resolved: contact.Contact = ParamGuard.resolveContact(input);
      expect(resolved === input).assertTrue();
      expect(ContactFieldExtractor.fullName(resolved)).assertEqual('');
      expect(ParamGuard.hasContact(input)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010009 end');
    });

    /**
     * @tc.name   testParamReal010010
     * @tc.number SUB_Contact_PARAMR_0010
     * @tc.desc   合法：仅含空数组字段的 contact 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParamReal010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010010 begin');
      const input: contact.Contact = { phoneNumbers: [] };
      const resolved: contact.Contact = ParamGuard.resolveContact(input);
      expect(resolved === input).assertTrue();
      expect(ContactFieldExtractor.firstPhone(resolved)).assertEqual('');
      expect(ParamGuard.hasContact(input)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010010 end');
    });

    /**
     * @tc.name   testParamReal010011
     * @tc.number SUB_Contact_PARAMR_0011
     * @tc.desc   守卫：undefined 输入返回 fallback 对象，name 为空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParamReal010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010011 begin');
      const missing: contact.Contact | undefined = undefined;
      const fallback: contact.Contact = ParamGuard.resolveContact(missing);
      expect(ParamGuard.hasContact(missing)).assertFalse();
      expect(ContactFieldExtractor.fullName(fallback)).assertEqual('');
      expect(fallback === missing).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010011 end');
    });

    /**
     * @tc.name   testParamReal010012
     * @tc.number SUB_Contact_PARAMR_0012
     * @tc.desc   守卫：fallback 对象每次调用都是新对象（基线行为：fallback 构造在方法内）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParamReal010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010012 begin');
      const first: contact.Contact = ParamGuard.resolveContact(undefined);
      const second: contact.Contact = ParamGuard.resolveContact(undefined);
      expect(first === second).assertFalse();
      expect(ContactFieldExtractor.fullName(first)).assertEqual('');
      expect(ContactFieldExtractor.fullName(second)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010012 end');
    });

    /**
     * @tc.name   testParamReal010013
     * @tc.number SUB_Contact_PARAMR_0013
     * @tc.desc   守卫：fallback 不含号码，firstPhone 返回空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParamReal010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010013 begin');
      const fallback: contact.Contact = ParamGuard.resolveContact(undefined);
      expect(ContactFieldExtractor.firstPhone(fallback)).assertEqual('');
      expect(ContactFieldExtractor.firstPhone(fallback).length).assertEqual(0);
      expect(ParamGuard.hasContact(undefined)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010013 end');
    });

    /**
     * @tc.name   testParamReal010014
     * @tc.number SUB_Contact_PARAMR_0014
     * @tc.desc   守卫：hasContact 仅对 undefined 返回 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParamReal010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010014 begin');
      const missing: contact.Contact | undefined = undefined;
      const present: contact.Contact = {};
      expect(ParamGuard.hasContact(missing)).assertFalse();
      expect(ParamGuard.hasContact(present)).assertTrue();
      expect(ParamGuard.hasContact(missing) === ParamGuard.hasContact(present)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010014 end');
    });

    /**
     * @tc.name   testParamReal010015
     * @tc.number SUB_Contact_PARAMR_0015
     * @tc.desc   守卫：resolveContact 结果不可能是 undefined（返回类型不变量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParamReal010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010015 begin');
      const fromMissing: contact.Contact = ParamGuard.resolveContact(undefined);
      const fromPresent: contact.Contact = ParamGuard.resolveContact({ name: { fullName: 'x' } });
      expect(fromMissing === undefined).assertFalse();
      expect(fromPresent === undefined).assertFalse();
      expect(fromMissing === fromPresent).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010015 end');
    });

    /**
     * @tc.name   testParamReal010016
     * @tc.number SUB_Contact_PARAMR_0016
     * @tc.desc   边界：undefined 与空对象的守卫边界——空对象走原样分支
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParamReal010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010016 begin');
      const emptyObj: contact.Contact = {};
      const resolvedEmpty: contact.Contact = ParamGuard.resolveContact(emptyObj);
      const resolvedMissing: contact.Contact = ParamGuard.resolveContact(undefined);
      expect(resolvedEmpty === emptyObj).assertTrue();
      expect(resolvedMissing === emptyObj).assertFalse();
      expect(ParamGuard.hasContact(emptyObj)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010016 end');
    });

    /**
     * @tc.name   testParamReal010017
     * @tc.number SUB_Contact_PARAMR_0017
     * @tc.desc   组合：resolveContact 与两个提取器联动，有值路径全链路
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParamReal010017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010017 begin');
      const input: contact.Contact = { name: { fullName: 'wangwu' }, phoneNumbers: [{ phoneNumber: '18800000000' }] };
      const resolved: contact.Contact = ParamGuard.resolveContact(input);
      expect(ContactFieldExtractor.fullName(resolved)).assertEqual('wangwu');
      expect(ContactFieldExtractor.firstPhone(resolved)).assertEqual('18800000000');
      expect(ContactFieldExtractor.firstLetter(resolved)).assertEqual('W');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010017 end');
    });

    /**
     * @tc.name   testParamReal010018
     * @tc.number SUB_Contact_PARAMR_0018
     * @tc.desc   组合：fallback 路径与提取器联动，全部返回空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParamReal010018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010018 begin');
      const fallback: contact.Contact = ParamGuard.resolveContact(undefined);
      expect(ContactFieldExtractor.fullName(fallback)).assertEqual('');
      expect(ContactFieldExtractor.firstLetter(fallback)).assertEqual('');
      expect(ContactFieldExtractor.firstPhone(fallback)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010018 end');
    });

    /**
     * @tc.name   testParamReal010019
     * @tc.number SUB_Contact_PARAMR_0019
     * @tc.desc   组合：同一次调用先守卫后提取，结果与直接提取一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParamReal010019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010019 begin');
      const input: contact.Contact = { name: { fullName: 'zhaoliu' } };
      const viaGuard: string = ContactFieldExtractor.fullName(ParamGuard.resolveContact(input));
      const direct: string = ContactFieldExtractor.fullName(input);
      expect(viaGuard).assertEqual('zhaoliu');
      expect(direct).assertEqual('zhaoliu');
      expect(viaGuard === direct).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010019 end');
    });

    /**
     * @tc.name   testParamReal010020
     * @tc.number SUB_Contact_PARAMR_0020
     * @tc.desc   组合：有值路径不触发 fallback，返回引用与原输入相同
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParamReal010020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010020 begin');
      const input: contact.Contact = { nickName: { nickName: 'nn' } };
      const resolved: contact.Contact = ParamGuard.resolveContact(input);
      expect(resolved === input).assertTrue();
      expect(ParamGuard.hasContact(resolved)).assertTrue();
      expect(ContactFieldExtractor.fullName(resolved)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010020 end');
    });

    /**
     * @tc.name   testParamReal010021
     * @tc.number SUB_Contact_PARAMR_0021
     * @tc.desc   幂等：同一输入多次 resolveContact 返回同一引用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParamReal010021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010021 begin');
      const input: contact.Contact = { name: { fullName: 'idem' } };
      const first: contact.Contact = ParamGuard.resolveContact(input);
      const second: contact.Contact = ParamGuard.resolveContact(input);
      const third: contact.Contact = ParamGuard.resolveContact(input);
      expect(first === second).assertTrue();
      expect(second === third).assertTrue();
      expect(first === input).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010021 end');
    });

    /**
     * @tc.name   testParamReal010022
     * @tc.number SUB_Contact_PARAMR_0022
     * @tc.desc   幂等：hasContact 连续调用三次结果一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParamReal010022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010022 begin');
      const first: boolean = ParamGuard.hasContact(undefined);
      const second: boolean = ParamGuard.hasContact(undefined);
      const third: boolean = ParamGuard.hasContact(undefined);
      expect(first === second).assertTrue();
      expect(second === third).assertTrue();
      expect(first).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010022 end');
    });

    /**
     * @tc.name   testParamReal010023
     * @tc.number SUB_Contact_PARAMR_0023
     * @tc.desc   状态序列：有值→缺失→有值交替，各次结果互不污染（无状态 SUT）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParamReal010023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010023 begin');
      const present: contact.Contact = { name: { fullName: 'alt' } };
      const firstPass: contact.Contact = ParamGuard.resolveContact(present);
      const missingPass: contact.Contact = ParamGuard.resolveContact(undefined);
      const thirdPass: contact.Contact = ParamGuard.resolveContact(present);
      expect(firstPass === present).assertTrue();
      expect(missingPass === present).assertFalse();
      expect(thirdPass === present).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010023 end');
    });

    /**
     * @tc.name   testParamReal010024
     * @tc.number SUB_Contact_PARAMR_0024
     * @tc.desc   状态序列：连续两次 fallback 之间不共享引用，后续调用不受前次影响
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParamReal010024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010024 begin');
      const firstFallback: contact.Contact = ParamGuard.resolveContact(undefined);
      const realInput: contact.Contact = { name: { fullName: 'after' } };
      const realPass: contact.Contact = ParamGuard.resolveContact(realInput);
      const secondFallback: contact.Contact = ParamGuard.resolveContact(undefined);
      expect(firstFallback === secondFallback).assertFalse();
      expect(realPass === realInput).assertTrue();
      expect(ContactFieldExtractor.fullName(secondFallback)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010024 end');
    });

    /**
     * @tc.name   testParamReal010025
     * @tc.number SUB_Contact_PARAMR_0025
     * @tc.desc   数据表基线 v1：五条典型参数-结果对断言（表基线 v1）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParamReal010025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010025 begin');
      const a: contact.Contact = { name: { fullName: 'a' } };
      const b: contact.Contact = { phoneNumbers: [{ phoneNumber: '1' }] };
      expect(ParamGuard.hasContact(a)).assertTrue();
      expect(ParamGuard.hasContact(b)).assertTrue();
      expect(ParamGuard.hasContact(undefined)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010025 end');
    });

    /**
     * @tc.name   testParamReal010026
     * @tc.number SUB_Contact_PARAMR_0026
     * @tc.desc   数据表基线 v1：resolveContact 输出与提取期望成对固化（表基线 v1）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParamReal010026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010026 begin');
      const input: contact.Contact = { name: { fullName: 'baseline' } };
      const fallback: contact.Contact = ParamGuard.resolveContact(undefined);
      expect(ContactFieldExtractor.fullName(ParamGuard.resolveContact(input))).assertEqual('baseline');
      expect(ContactFieldExtractor.fullName(fallback)).assertEqual('');
      expect(ParamGuard.resolveContact(input) === input).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010026 end');
    });

    /**
     * @tc.name   testParamReal010027
     * @tc.number SUB_Contact_PARAMR_0027
     * @tc.desc   负向：fallback 的姓名提取不等于任意非空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParamReal010027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010027 begin');
      const fallback: contact.Contact = ParamGuard.resolveContact(undefined);
      const name: string = ContactFieldExtractor.fullName(fallback);
      expect(name).assertEqual('');
      expect(name === 'unknown').assertFalse();
      expect(name === ' ').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010027 end');
    });

    /**
     * @tc.name   testParamReal010028
     * @tc.number SUB_Contact_PARAMR_0028
     * @tc.desc   负向：守卫不会凭空构造号码，fallback 的 firstPhone 与首字母均为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParamReal010028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010028 begin');
      const fallback: contact.Contact = ParamGuard.resolveContact(undefined);
      const phone: string = ContactFieldExtractor.firstPhone(fallback);
      const letter: string = ContactFieldExtractor.firstLetter(fallback);
      expect(phone).assertEqual('');
      expect(letter).assertEqual('');
      expect(phone === letter).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010028 end');
    });

    /**
     * @tc.name   testParamReal010029
     * @tc.number SUB_Contact_PARAMR_0029
     * @tc.desc   组合：混合字段 contact 守卫后按字段独立提取（姓名有值号码缺失）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParamReal010029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010029 begin');
      const input: contact.Contact = { name: { fullName: 'mixed' } };
      const resolved: contact.Contact = ParamGuard.resolveContact(input);
      expect(ContactFieldExtractor.fullName(resolved)).assertEqual('mixed');
      expect(ContactFieldExtractor.firstPhone(resolved)).assertEqual('');
      expect(ContactFieldExtractor.fullName(resolved) === ContactFieldExtractor.firstPhone(resolved)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010029 end');
    });

    /**
     * @tc.name   testParamReal010030
     * @tc.number SUB_Contact_PARAMR_0030
     * @tc.desc   哨兵：守卫边界全景——undefined 走 fallback、空对象走原样、有值走原样
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParamReal010030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010030 begin');
      const missing: contact.Contact | undefined = undefined;
      const emptyObj: contact.Contact = {};
      const valued: contact.Contact = { name: { fullName: 'v' } };
      expect(ParamGuard.hasContact(missing)).assertFalse();
      expect(ParamGuard.hasContact(emptyObj)).assertTrue();
      expect(ParamGuard.resolveContact(valued) === valued).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamReal010030 end');
    });

  });
}
