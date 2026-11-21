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

export default function fieldVolume05Test() {
  describe('FieldVolume05Test', () => {

    /**
     * @tc.name   testFieldVolume05Anchor01
     * @tc.number SUB_Contact_FIELD_0305
     * @tc.desc   name 与 phone 提取互不干扰，缺 name 仅 phone 存在时各走各的守卫
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume05Anchor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume05Anchor01 begin');
      const onlyPhone: contact.Contact = { phoneNumbers: [{ phoneNumber: '13900000000' }] };
      const onlyName: contact.Contact = { name: { fullName: 'lisi' } };
      expect(ContactFieldExtractor.fullName(onlyPhone)).assertEqual('');
      expect(ContactFieldExtractor.firstPhone(onlyPhone)).assertEqual('13900000000');
      expect(ContactFieldExtractor.firstPhone(onlyName)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume05Anchor01 end');
    });
    /**
     * @tc.name   testFieldVolume050306
     * @tc.number SUB_Contact_FIELD_0306
     * @tc.desc   组合：name=zhangsan 且 phoneNumbers 第 1 项为 13000000000，两提取互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050306', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050306 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: 'zhangsan' }] } :
        String('false') === 'name-only' ?
        { name: { fullName: 'zhangsan' } } :
         { name: { fullName: 'zhangsan' }, phoneNumbers: [{ phoneNumber: '13000000000' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('zhangsan'));
      expect(result).assertEqual('zhangsan');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(13000000000));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('13000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050306 end');
    });

    /**
     * @tc.name   testFieldVolume050307
     * @tc.number SUB_Contact_FIELD_0307
     * @tc.desc   组合：name=lisi 且 phoneNumbers 第 1 项为 13100000000，两提取互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050307', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050307 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: 'lisi' }] } :
        String('false') === 'name-only' ?
        { name: { fullName: 'lisi' } } :
         { name: { fullName: 'lisi' }, phoneNumbers: [{ phoneNumber: '13100000000' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('lisi'));
      expect(result).assertEqual('lisi');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(13100000000));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('13100000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050307 end');
    });

    /**
     * @tc.name   testFieldVolume050308
     * @tc.number SUB_Contact_FIELD_0308
     * @tc.desc   组合：name=wangwu 且 phoneNumbers 第 1 项为 13200000000，两提取互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050308', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050308 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: 'wangwu' }] } :
        String('false') === 'name-only' ?
        { name: { fullName: 'wangwu' } } :
         { name: { fullName: 'wangwu' }, phoneNumbers: [{ phoneNumber: '13200000000' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('wangwu'));
      expect(result).assertEqual('wangwu');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(13200000000));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('13200000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050308 end');
    });

    /**
     * @tc.name   testFieldVolume050309
     * @tc.number SUB_Contact_FIELD_0309
     * @tc.desc   组合：name=zhaoliu 且 phoneNumbers 第 1 项为 13300000000，两提取互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050309', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050309 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: 'zhaoliu' }] } :
        String('false') === 'name-only' ?
        { name: { fullName: 'zhaoliu' } } :
         { name: { fullName: 'zhaoliu' }, phoneNumbers: [{ phoneNumber: '13300000000' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('zhaoliu'));
      expect(result).assertEqual('zhaoliu');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(13300000000));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('13300000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050309 end');
    });

    /**
     * @tc.name   testFieldVolume050310
     * @tc.number SUB_Contact_FIELD_0310
     * @tc.desc   组合：name=sunqi 且 phoneNumbers 第 1 项为 13400000000，两提取互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050310 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: 'sunqi' }] } :
        String('false') === 'name-only' ?
        { name: { fullName: 'sunqi' } } :
         { name: { fullName: 'sunqi' }, phoneNumbers: [{ phoneNumber: '13400000000' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('sunqi'));
      expect(result).assertEqual('sunqi');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(13400000000));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('13400000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050310 end');
    });

    /**
     * @tc.name   testFieldVolume050311
     * @tc.number SUB_Contact_FIELD_0311
     * @tc.desc   组合：name=zhouba 且 phoneNumbers 第 1 项为 13500000000，两提取互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050311', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050311 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: 'zhouba' }] } :
        String('false') === 'name-only' ?
        { name: { fullName: 'zhouba' } } :
         { name: { fullName: 'zhouba' }, phoneNumbers: [{ phoneNumber: '13500000000' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('zhouba'));
      expect(result).assertEqual('zhouba');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(13500000000));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('13500000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050311 end');
    });

    /**
     * @tc.name   testFieldVolume050312
     * @tc.number SUB_Contact_FIELD_0312
     * @tc.desc   组合：name=wujiu 且 phoneNumbers 第 1 项为 13600000000，两提取互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050312', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050312 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: 'wujiu' }] } :
        String('false') === 'name-only' ?
        { name: { fullName: 'wujiu' } } :
         { name: { fullName: 'wujiu' }, phoneNumbers: [{ phoneNumber: '13600000000' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('wujiu'));
      expect(result).assertEqual('wujiu');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(13600000000));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('13600000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050312 end');
    });

    /**
     * @tc.name   testFieldVolume050313
     * @tc.number SUB_Contact_FIELD_0313
     * @tc.desc   组合：name=zhengshi 且 phoneNumbers 第 1 项为 13700000000，两提取互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050313', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050313 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: 'zhengshi' }] } :
        String('false') === 'name-only' ?
        { name: { fullName: 'zhengshi' } } :
         { name: { fullName: 'zhengshi' }, phoneNumbers: [{ phoneNumber: '13700000000' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('zhengshi'));
      expect(result).assertEqual('zhengshi');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(13700000000));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('13700000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050313 end');
    });

    /**
     * @tc.name   testFieldVolume050314
     * @tc.number SUB_Contact_FIELD_0314
     * @tc.desc   组合：name=张三 且 phoneNumbers 第 1 项为 13800000000，两提取互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050314', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050314 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: '张三' }] } :
        String('false') === 'name-only' ?
        { name: { fullName: '张三' } } :
         { name: { fullName: '张三' }, phoneNumbers: [{ phoneNumber: '13800000000' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('张三'));
      expect(result).assertEqual('张三');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(13800000000));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('13800000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050314 end');
    });

    /**
     * @tc.name   testFieldVolume050315
     * @tc.number SUB_Contact_FIELD_0315
     * @tc.desc   组合：name=李四 且 phoneNumbers 第 1 项为 13900000000，两提取互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050315', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050315 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: '李四' }] } :
        String('false') === 'name-only' ?
        { name: { fullName: '李四' } } :
         { name: { fullName: '李四' }, phoneNumbers: [{ phoneNumber: '13900000000' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('李四'));
      expect(result).assertEqual('李四');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(13900000000));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('13900000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050315 end');
    });

    /**
     * @tc.name   testFieldVolume050316
     * @tc.number SUB_Contact_FIELD_0316
     * @tc.desc   组合：name=王五 且 phoneNumbers 第 1 项为 13000000000，两提取互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050316', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050316 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: '王五' }] } :
        String('false') === 'name-only' ?
        { name: { fullName: '王五' } } :
         { name: { fullName: '王五' }, phoneNumbers: [{ phoneNumber: '13000000000' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('王五'));
      expect(result).assertEqual('王五');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(13000000000));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('13000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050316 end');
    });

    /**
     * @tc.name   testFieldVolume050317
     * @tc.number SUB_Contact_FIELD_0317
     * @tc.desc   组合：name=赵六 且 phoneNumbers 第 1 项为 13100000000，两提取互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050317', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050317 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: '赵六' }] } :
        String('false') === 'name-only' ?
        { name: { fullName: '赵六' } } :
         { name: { fullName: '赵六' }, phoneNumbers: [{ phoneNumber: '13100000000' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('赵六'));
      expect(result).assertEqual('赵六');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(13100000000));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('13100000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050317 end');
    });

    /**
     * @tc.name   testFieldVolume050318
     * @tc.number SUB_Contact_FIELD_0318
     * @tc.desc   组合：name=孙七 且 phoneNumbers 第 1 项为 13200000000，两提取互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050318', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050318 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: '孙七' }] } :
        String('false') === 'name-only' ?
        { name: { fullName: '孙七' } } :
         { name: { fullName: '孙七' }, phoneNumbers: [{ phoneNumber: '13200000000' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('孙七'));
      expect(result).assertEqual('孙七');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(13200000000));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('13200000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050318 end');
    });

    /**
     * @tc.name   testFieldVolume050319
     * @tc.number SUB_Contact_FIELD_0319
     * @tc.desc   组合：name=周八 且 phoneNumbers 第 1 项为 13300000000，两提取互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050319', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050319 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: '周八' }] } :
        String('false') === 'name-only' ?
        { name: { fullName: '周八' } } :
         { name: { fullName: '周八' }, phoneNumbers: [{ phoneNumber: '13300000000' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('周八'));
      expect(result).assertEqual('周八');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(13300000000));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('13300000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050319 end');
    });

    /**
     * @tc.name   testFieldVolume050320
     * @tc.number SUB_Contact_FIELD_0320
     * @tc.desc   组合：name=吴九 且 phoneNumbers 第 1 项为 13400000000，两提取互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050320 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: '吴九' }] } :
        String('false') === 'name-only' ?
        { name: { fullName: '吴九' } } :
         { name: { fullName: '吴九' }, phoneNumbers: [{ phoneNumber: '13400000000' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('吴九'));
      expect(result).assertEqual('吴九');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(13400000000));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('13400000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050320 end');
    });

    /**
     * @tc.name   testFieldVolume050321
     * @tc.number SUB_Contact_FIELD_0321
     * @tc.desc   组合：name=郑十 且 phoneNumbers 第 1 项为 13500000000，两提取互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050321', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050321 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: '郑十' }] } :
        String('false') === 'name-only' ?
        { name: { fullName: '郑十' } } :
         { name: { fullName: '郑十' }, phoneNumbers: [{ phoneNumber: '13500000000' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('郑十'));
      expect(result).assertEqual('郑十');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(13500000000));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('13500000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050321 end');
    });

    /**
     * @tc.name   testFieldVolume050322
     * @tc.number SUB_Contact_FIELD_0322
     * @tc.desc   组合：name=QQ 且 phoneNumbers 第 1 项为 13600000000，两提取互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050322', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050322 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: 'QQ' }] } :
        String('false') === 'name-only' ?
        { name: { fullName: 'QQ' } } :
         { name: { fullName: 'QQ' }, phoneNumbers: [{ phoneNumber: '13600000000' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('QQ'));
      expect(result).assertEqual('QQ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(13600000000));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('13600000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050322 end');
    });

    /**
     * @tc.name   testFieldVolume050323
     * @tc.number SUB_Contact_FIELD_0323
     * @tc.desc   组合：name=BB 且 phoneNumbers 第 1 项为 13700000000，两提取互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050323', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050323 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: 'BB' }] } :
        String('false') === 'name-only' ?
        { name: { fullName: 'BB' } } :
         { name: { fullName: 'BB' }, phoneNumbers: [{ phoneNumber: '13700000000' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('BB'));
      expect(result).assertEqual('BB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(13700000000));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('13700000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050323 end');
    });

    /**
     * @tc.name   testFieldVolume050324
     * @tc.number SUB_Contact_FIELD_0324
     * @tc.desc   组合：name=CC 且 phoneNumbers 第 1 项为 13800000000，两提取互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050324', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050324 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: 'CC' }] } :
        String('false') === 'name-only' ?
        { name: { fullName: 'CC' } } :
         { name: { fullName: 'CC' }, phoneNumbers: [{ phoneNumber: '13800000000' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('CC'));
      expect(result).assertEqual('CC');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(13800000000));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('13800000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050324 end');
    });

    /**
     * @tc.name   testFieldVolume050325
     * @tc.number SUB_Contact_FIELD_0325
     * @tc.desc   组合：name=DD 且 phoneNumbers 第 1 项为 13900000000，两提取互不干扰
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050325', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050325 begin');
      const contactInfo: contact.Contact = String('false') === 'true' ? {} :
        String('false') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: 'DD' }] } :
        String('false') === 'name-only' ?
        { name: { fullName: 'DD' } } :
         { name: { fullName: 'DD' }, phoneNumbers: [{ phoneNumber: '13900000000' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('DD'));
      expect(result).assertEqual('DD');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(13900000000));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('13900000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050325 end');
    });

    /**
     * @tc.name   testFieldVolume050326
     * @tc.number SUB_Contact_FIELD_0326
     * @tc.desc   守卫组合：仅 phoneNumbers（13000000000），fullName 走缺失守卫返回空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050326', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050326 begin');
      const contactInfo: contact.Contact = String('phone-only') === 'true' ? {} :
        String('phone-only') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: '13000000000' }] } :
        String('phone-only') === 'name-only' ?
        { name: { fullName: '13000000000' } } :
         { name: { fullName: '13000000000' }, phoneNumbers: [{ phoneNumber: '' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String());
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(13000000000));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('13000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'X'));
      expect(result === 'X').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050326 end');
    });

    /**
     * @tc.name   testFieldVolume050327
     * @tc.number SUB_Contact_FIELD_0327
     * @tc.desc   守卫组合：仅 phoneNumbers（13100000000），fullName 走缺失守卫返回空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050327', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050327 begin');
      const contactInfo: contact.Contact = String('phone-only') === 'true' ? {} :
        String('phone-only') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: '13100000000' }] } :
        String('phone-only') === 'name-only' ?
        { name: { fullName: '13100000000' } } :
         { name: { fullName: '13100000000' }, phoneNumbers: [{ phoneNumber: '' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String());
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(13100000000));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('13100000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'X'));
      expect(result === 'X').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050327 end');
    });

    /**
     * @tc.name   testFieldVolume050328
     * @tc.number SUB_Contact_FIELD_0328
     * @tc.desc   守卫组合：仅 phoneNumbers（13200000000），fullName 走缺失守卫返回空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050328', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050328 begin');
      const contactInfo: contact.Contact = String('phone-only') === 'true' ? {} :
        String('phone-only') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: '13200000000' }] } :
        String('phone-only') === 'name-only' ?
        { name: { fullName: '13200000000' } } :
         { name: { fullName: '13200000000' }, phoneNumbers: [{ phoneNumber: '' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String());
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(13200000000));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('13200000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'X'));
      expect(result === 'X').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050328 end');
    });

    /**
     * @tc.name   testFieldVolume050329
     * @tc.number SUB_Contact_FIELD_0329
     * @tc.desc   守卫组合：仅 phoneNumbers（13300000000），fullName 走缺失守卫返回空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050329', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050329 begin');
      const contactInfo: contact.Contact = String('phone-only') === 'true' ? {} :
        String('phone-only') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: '13300000000' }] } :
        String('phone-only') === 'name-only' ?
        { name: { fullName: '13300000000' } } :
         { name: { fullName: '13300000000' }, phoneNumbers: [{ phoneNumber: '' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String());
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(13300000000));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('13300000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'X'));
      expect(result === 'X').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050329 end');
    });

    /**
     * @tc.name   testFieldVolume050330
     * @tc.number SUB_Contact_FIELD_0330
     * @tc.desc   守卫组合：仅 phoneNumbers（13400000000），fullName 走缺失守卫返回空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050330 begin');
      const contactInfo: contact.Contact = String('phone-only') === 'true' ? {} :
        String('phone-only') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: '13400000000' }] } :
        String('phone-only') === 'name-only' ?
        { name: { fullName: '13400000000' } } :
         { name: { fullName: '13400000000' }, phoneNumbers: [{ phoneNumber: '' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String());
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(13400000000));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('13400000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'X'));
      expect(result === 'X').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050330 end');
    });

    /**
     * @tc.name   testFieldVolume050331
     * @tc.number SUB_Contact_FIELD_0331
     * @tc.desc   守卫组合：仅 phoneNumbers（13500000000），fullName 走缺失守卫返回空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050331', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050331 begin');
      const contactInfo: contact.Contact = String('phone-only') === 'true' ? {} :
        String('phone-only') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: '13500000000' }] } :
        String('phone-only') === 'name-only' ?
        { name: { fullName: '13500000000' } } :
         { name: { fullName: '13500000000' }, phoneNumbers: [{ phoneNumber: '' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String());
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(13500000000));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('13500000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'X'));
      expect(result === 'X').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050331 end');
    });

    /**
     * @tc.name   testFieldVolume050332
     * @tc.number SUB_Contact_FIELD_0332
     * @tc.desc   守卫组合：仅 phoneNumbers（13600000000），fullName 走缺失守卫返回空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050332', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050332 begin');
      const contactInfo: contact.Contact = String('phone-only') === 'true' ? {} :
        String('phone-only') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: '13600000000' }] } :
        String('phone-only') === 'name-only' ?
        { name: { fullName: '13600000000' } } :
         { name: { fullName: '13600000000' }, phoneNumbers: [{ phoneNumber: '' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String());
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(13600000000));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('13600000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'X'));
      expect(result === 'X').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050332 end');
    });

    /**
     * @tc.name   testFieldVolume050333
     * @tc.number SUB_Contact_FIELD_0333
     * @tc.desc   守卫组合：仅 phoneNumbers（13700000000），fullName 走缺失守卫返回空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050333', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050333 begin');
      const contactInfo: contact.Contact = String('phone-only') === 'true' ? {} :
        String('phone-only') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: '13700000000' }] } :
        String('phone-only') === 'name-only' ?
        { name: { fullName: '13700000000' } } :
         { name: { fullName: '13700000000' }, phoneNumbers: [{ phoneNumber: '' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String());
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(13700000000));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('13700000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'X'));
      expect(result === 'X').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050333 end');
    });

    /**
     * @tc.name   testFieldVolume050334
     * @tc.number SUB_Contact_FIELD_0334
     * @tc.desc   守卫组合：仅 phoneNumbers（13800000000），fullName 走缺失守卫返回空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050334', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050334 begin');
      const contactInfo: contact.Contact = String('phone-only') === 'true' ? {} :
        String('phone-only') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: '13800000000' }] } :
        String('phone-only') === 'name-only' ?
        { name: { fullName: '13800000000' } } :
         { name: { fullName: '13800000000' }, phoneNumbers: [{ phoneNumber: '' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String());
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(13800000000));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('13800000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'X'));
      expect(result === 'X').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050334 end');
    });

    /**
     * @tc.name   testFieldVolume050335
     * @tc.number SUB_Contact_FIELD_0335
     * @tc.desc   守卫组合：仅 phoneNumbers（13900000000），fullName 走缺失守卫返回空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050335', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050335 begin');
      const contactInfo: contact.Contact = String('phone-only') === 'true' ? {} :
        String('phone-only') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: '13900000000' }] } :
        String('phone-only') === 'name-only' ?
        { name: { fullName: '13900000000' } } :
         { name: { fullName: '13900000000' }, phoneNumbers: [{ phoneNumber: '' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String());
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String(13900000000));
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('13900000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'X'));
      expect(result === 'X').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050335 end');
    });

    /**
     * @tc.name   testFieldVolume050336
     * @tc.number SUB_Contact_FIELD_0336
     * @tc.desc   守卫组合：仅 name（guard0），firstPhone 走缺失守卫返回空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050336', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050336 begin');
      const contactInfo: contact.Contact = String('name-only') === 'true' ? {} :
        String('name-only') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: 'guard0' }] } :
        String('name-only') === 'name-only' ?
        { name: { fullName: 'guard0' } } :
         { name: { fullName: 'guard0' }, phoneNumbers: [{ phoneNumber: '' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('guard0'));
      expect(result).assertEqual('guard0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String());
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050336 end');
    });

    /**
     * @tc.name   testFieldVolume050337
     * @tc.number SUB_Contact_FIELD_0337
     * @tc.desc   守卫组合：仅 name（guard1），firstPhone 走缺失守卫返回空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050337', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050337 begin');
      const contactInfo: contact.Contact = String('name-only') === 'true' ? {} :
        String('name-only') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: 'guard1' }] } :
        String('name-only') === 'name-only' ?
        { name: { fullName: 'guard1' } } :
         { name: { fullName: 'guard1' }, phoneNumbers: [{ phoneNumber: '' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('guard1'));
      expect(result).assertEqual('guard1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String());
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050337 end');
    });

    /**
     * @tc.name   testFieldVolume050338
     * @tc.number SUB_Contact_FIELD_0338
     * @tc.desc   守卫组合：仅 name（guard2），firstPhone 走缺失守卫返回空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050338', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050338 begin');
      const contactInfo: contact.Contact = String('name-only') === 'true' ? {} :
        String('name-only') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: 'guard2' }] } :
        String('name-only') === 'name-only' ?
        { name: { fullName: 'guard2' } } :
         { name: { fullName: 'guard2' }, phoneNumbers: [{ phoneNumber: '' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('guard2'));
      expect(result).assertEqual('guard2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String());
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050338 end');
    });

    /**
     * @tc.name   testFieldVolume050339
     * @tc.number SUB_Contact_FIELD_0339
     * @tc.desc   守卫组合：仅 name（guard3），firstPhone 走缺失守卫返回空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050339', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050339 begin');
      const contactInfo: contact.Contact = String('name-only') === 'true' ? {} :
        String('name-only') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: 'guard3' }] } :
        String('name-only') === 'name-only' ?
        { name: { fullName: 'guard3' } } :
         { name: { fullName: 'guard3' }, phoneNumbers: [{ phoneNumber: '' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('guard3'));
      expect(result).assertEqual('guard3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String());
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050339 end');
    });

    /**
     * @tc.name   testFieldVolume050340
     * @tc.number SUB_Contact_FIELD_0340
     * @tc.desc   守卫组合：仅 name（guard4），firstPhone 走缺失守卫返回空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050340 begin');
      const contactInfo: contact.Contact = String('name-only') === 'true' ? {} :
        String('name-only') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: 'guard4' }] } :
        String('name-only') === 'name-only' ?
        { name: { fullName: 'guard4' } } :
         { name: { fullName: 'guard4' }, phoneNumbers: [{ phoneNumber: '' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('guard4'));
      expect(result).assertEqual('guard4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String());
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050340 end');
    });

    /**
     * @tc.name   testFieldVolume050341
     * @tc.number SUB_Contact_FIELD_0341
     * @tc.desc   守卫组合：仅 name（guard5），firstPhone 走缺失守卫返回空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050341', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050341 begin');
      const contactInfo: contact.Contact = String('name-only') === 'true' ? {} :
        String('name-only') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: 'guard5' }] } :
        String('name-only') === 'name-only' ?
        { name: { fullName: 'guard5' } } :
         { name: { fullName: 'guard5' }, phoneNumbers: [{ phoneNumber: '' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('guard5'));
      expect(result).assertEqual('guard5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String());
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050341 end');
    });

    /**
     * @tc.name   testFieldVolume050342
     * @tc.number SUB_Contact_FIELD_0342
     * @tc.desc   守卫组合：仅 name（guard6），firstPhone 走缺失守卫返回空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume050342', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050342 begin');
      const contactInfo: contact.Contact = String('name-only') === 'true' ? {} :
        String('name-only') === 'phone-only' ?
        { phoneNumbers: [{ phoneNumber: 'guard6' }] } :
        String('name-only') === 'name-only' ?
        { name: { fullName: 'guard6' } } :
         { name: { fullName: 'guard6' }, phoneNumbers: [{ phoneNumber: '' }] };
      const result: string = ContactFieldExtractor.fullName(contactInfo);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('guard6'));
      expect(result).assertEqual('guard6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(ContactFieldExtractor.firstPhone(contactInfo)), String());
      expect(ContactFieldExtractor.firstPhone(contactInfo)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume050342 end');
    });


  });
}
