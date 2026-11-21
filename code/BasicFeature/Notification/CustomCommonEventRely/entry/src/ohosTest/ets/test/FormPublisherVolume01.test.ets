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

import { afterEach, describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { FormEventService } from '../../../main/ets/feature/FormEventService';
import { EventSource } from '../../../main/ets/util/Constants';
import { FakePublisher, defaultFormPublisher } from './util/ModelSupport';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function formPublisherVolume01Test() {
  describe('FormPublisherVolume01Test', () => {
    afterEach(() => {
      FormEventService.setPublisher(defaultFormPublisher());
    });


    /**
     * @tc.name   testFormPublisher0001
     * @tc.number SUB_CCER_FORMPUB_01_0001
     * @tc.desc   页面数据透传到注入发布器
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormPublisher0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0001 begin');
      const fake: FakePublisher = new FakePublisher(false);
      FormEventService.setPublisher(fake);
      FormEventService.publishFromForm('{"data":"InApp"}');
      const result: string = fake.getLastData();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('InApp'));
      expect(result).assertEqual('InApp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fake.getLastSourceCode() === 1001));
      expect(fake.getLastSourceCode() === 1001).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fake.getCalls() === 1));
      expect(fake.getCalls() === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0001 end');
    })

    /**
     * @tc.name   testFormPublisher0002
     * @tc.number SUB_CCER_FORMPUB_01_0002
     * @tc.desc   应用外数据透传到注入发布器
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormPublisher0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0002 begin');
      const fake: FakePublisher = new FakePublisher(false);
      FormEventService.setPublisher(fake);
      FormEventService.publishFromForm('{"data":"OutApp"}');
      const result: string = fake.getLastData();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('OutApp'));
      expect(result).assertEqual('OutApp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fake.getLastSourceCode() === 1001));
      expect(fake.getLastSourceCode() === 1001).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fake.getCalls() === 1));
      expect(fake.getCalls() === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0002 end');
    })

    /**
     * @tc.name   testFormPublisher0003
     * @tc.number SUB_CCER_FORMPUB_01_0003
     * @tc.desc   自定义文本透传到注入发布器
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormPublisher0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0003 begin');
      const fake: FakePublisher = new FakePublisher(false);
      FormEventService.setPublisher(fake);
      FormEventService.publishFromForm('{"data":"Custom 文本"}');
      const result: string = fake.getLastData();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Custom 文本'));
      expect(result).assertEqual('Custom 文本');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fake.getLastSourceCode() === 1001));
      expect(fake.getLastSourceCode() === 1001).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fake.getCalls() === 1));
      expect(fake.getCalls() === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0003 end');
    })

    /**
     * @tc.name   testFormPublisher0004
     * @tc.number SUB_CCER_FORMPUB_01_0004
     * @tc.desc   引号数据透传到注入发布器
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormPublisher0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0004 begin');
      const fake: FakePublisher = new FakePublisher(false);
      FormEventService.setPublisher(fake);
      FormEventService.publishFromForm('{"data":"say \\"hi\\""}');
      const result: string = fake.getLastData();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('say "hi"'));
      expect(result).assertEqual('say "hi"');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fake.getLastSourceCode() === 1001));
      expect(fake.getLastSourceCode() === 1001).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fake.getCalls() === 1));
      expect(fake.getCalls() === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0004 end');
    })

    /**
     * @tc.name   testFormPublisher0005
     * @tc.number SUB_CCER_FORMPUB_01_0005
     * @tc.desc   反斜杠数据透传到注入发布器
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormPublisher0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0005 begin');
      const fake: FakePublisher = new FakePublisher(false);
      FormEventService.setPublisher(fake);
      FormEventService.publishFromForm('{"data":"back\\\\slash"}');
      const result: string = fake.getLastData();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('back\\slash'));
      expect(result).assertEqual('back\\slash');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fake.getLastSourceCode() === 1001));
      expect(fake.getLastSourceCode() === 1001).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fake.getCalls() === 1));
      expect(fake.getCalls() === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0005 end');
    })

    /**
     * @tc.name   testFormPublisher0006
     * @tc.number SUB_CCER_FORMPUB_01_0006
     * @tc.desc   换行数据透传到注入发布器
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormPublisher0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0006 begin');
      const fake: FakePublisher = new FakePublisher(false);
      FormEventService.setPublisher(fake);
      FormEventService.publishFromForm('{"data":"line1\\nline2"}');
      const result: string = fake.getLastData();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('line1\nline2'));
      expect(result).assertEqual('line1\nline2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fake.getLastSourceCode() === 1001));
      expect(fake.getLastSourceCode() === 1001).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fake.getCalls() === 1));
      expect(fake.getCalls() === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0006 end');
    })

    /**
     * @tc.name   testFormPublisher0007
     * @tc.number SUB_CCER_FORMPUB_01_0007
     * @tc.desc   表情符号数据透传到注入发布器
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormPublisher0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0007 begin');
      const fake: FakePublisher = new FakePublisher(false);
      FormEventService.setPublisher(fake);
      FormEventService.publishFromForm('{"data":"🚀 emoji"}');
      const result: string = fake.getLastData();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('🚀 emoji'));
      expect(result).assertEqual('🚀 emoji');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fake.getLastSourceCode() === 1001));
      expect(fake.getLastSourceCode() === 1001).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fake.getCalls() === 1));
      expect(fake.getCalls() === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0007 end');
    })

    /**
     * @tc.name   testFormPublisher0008
     * @tc.number SUB_CCER_FORMPUB_01_0008
     * @tc.desc   中文数据透传到注入发布器
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormPublisher0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0008 begin');
      const fake: FakePublisher = new FakePublisher(false);
      FormEventService.setPublisher(fake);
      FormEventService.publishFromForm('{"data":"中文名"}');
      const result: string = fake.getLastData();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('中文名'));
      expect(result).assertEqual('中文名');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fake.getLastSourceCode() === 1001));
      expect(fake.getLastSourceCode() === 1001).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fake.getCalls() === 1));
      expect(fake.getCalls() === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0008 end');
    })

    /**
     * @tc.name   testFormPublisher0009
     * @tc.number SUB_CCER_FORMPUB_01_0009
     * @tc.desc   带空格数据透传到注入发布器
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormPublisher0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0009 begin');
      const fake: FakePublisher = new FakePublisher(false);
      FormEventService.setPublisher(fake);
      FormEventService.publishFromForm('{"data":"a b c"}');
      const result: string = fake.getLastData();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a b c'));
      expect(result).assertEqual('a b c');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fake.getLastSourceCode() === 1001));
      expect(fake.getLastSourceCode() === 1001).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fake.getCalls() === 1));
      expect(fake.getCalls() === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0009 end');
    })

    /**
     * @tc.name   testFormPublisher0010
     * @tc.number SUB_CCER_FORMPUB_01_0010
     * @tc.desc   数字文本透传到注入发布器
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormPublisher0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0010 begin');
      const fake: FakePublisher = new FakePublisher(false);
      FormEventService.setPublisher(fake);
      FormEventService.publishFromForm('{"data":"127"}');
      const result: string = fake.getLastData();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('127'));
      expect(result).assertEqual('127');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fake.getLastSourceCode() === 1001));
      expect(fake.getLastSourceCode() === 1001).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fake.getCalls() === 1));
      expect(fake.getCalls() === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0010 end');
    })

    /**
     * @tc.name   testFormPublisher0011
     * @tc.number SUB_CCER_FORMPUB_01_0011
     * @tc.desc   前导空白消息解析后透传到注入发布器
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormPublisher0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0011 begin');
      const fake: FakePublisher = new FakePublisher(false);
      FormEventService.setPublisher(fake);
      FormEventService.publishFromForm('  {"data":"InApp"}');
      const result: string = fake.getLastData();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('InApp'));
      expect(result).assertEqual('InApp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fake.getLastSourceCode() === 1001));
      expect(fake.getLastSourceCode() === 1001).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fake.getCalls() === 1));
      expect(fake.getCalls() === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0011 end');
    })

    /**
     * @tc.name   testFormPublisher0012
     * @tc.number SUB_CCER_FORMPUB_01_0012
     * @tc.desc   空消息回退为 OutApp 后送入注入发布器
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormPublisher0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0012 begin');
      const fake: FakePublisher = new FakePublisher(false);
      FormEventService.setPublisher(fake);
      FormEventService.publishFromForm('');
      const result: string = fake.getLastData();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('OutApp'));
      expect(result).assertEqual('OutApp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fake.getLastSourceCode() === 1001));
      expect(fake.getLastSourceCode() === 1001).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fake.getCalls() === 1));
      expect(fake.getCalls() === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0012 end');
    })

    /**
     * @tc.name   testFormPublisher0013
     * @tc.number SUB_CCER_FORMPUB_01_0013
     * @tc.desc   非法 JSON 回退为 OutApp 后送入注入发布器
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormPublisher0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0013 begin');
      const fake: FakePublisher = new FakePublisher(false);
      FormEventService.setPublisher(fake);
      FormEventService.publishFromForm('{');
      const result: string = fake.getLastData();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('OutApp'));
      expect(result).assertEqual('OutApp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fake.getLastSourceCode() === 1001));
      expect(fake.getLastSourceCode() === 1001).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fake.getCalls() === 1));
      expect(fake.getCalls() === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0013 end');
    })

    /**
     * @tc.name   testFormPublisher0014
     * @tc.number SUB_CCER_FORMPUB_01_0014
     * @tc.desc   缺少 data 字段回退为 OutApp 后送入注入发布器
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormPublisher0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0014 begin');
      const fake: FakePublisher = new FakePublisher(false);
      FormEventService.setPublisher(fake);
      FormEventService.publishFromForm('{"other":"x"}');
      const result: string = fake.getLastData();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('OutApp'));
      expect(result).assertEqual('OutApp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fake.getLastSourceCode() === 1001));
      expect(fake.getLastSourceCode() === 1001).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fake.getCalls() === 1));
      expect(fake.getCalls() === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0014 end');
    })

    /**
     * @tc.name   testFormPublisher0015
     * @tc.number SUB_CCER_FORMPUB_01_0015
     * @tc.desc   非字符串 data 回退为 OutApp 后送入注入发布器
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormPublisher0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0015 begin');
      const fake: FakePublisher = new FakePublisher(false);
      FormEventService.setPublisher(fake);
      FormEventService.publishFromForm('{"data":5}');
      const result: string = fake.getLastData();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('OutApp'));
      expect(result).assertEqual('OutApp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fake.getLastSourceCode() === 1001));
      expect(fake.getLastSourceCode() === 1001).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fake.getCalls() === 1));
      expect(fake.getCalls() === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0015 end');
    })

    /**
     * @tc.name   testFormPublisher0016
     * @tc.number SUB_CCER_FORMPUB_01_0016
     * @tc.desc   空 data 回退为 OutApp 后送入注入发布器
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormPublisher0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0016 begin');
      const fake: FakePublisher = new FakePublisher(false);
      FormEventService.setPublisher(fake);
      FormEventService.publishFromForm('{"data":""}');
      const result: string = fake.getLastData();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('OutApp'));
      expect(result).assertEqual('OutApp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fake.getLastSourceCode() === 1001));
      expect(fake.getLastSourceCode() === 1001).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fake.getCalls() === 1));
      expect(fake.getCalls() === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0016 end');
    })

    /**
     * @tc.name   testFormPublisher0017
     * @tc.number SUB_CCER_FORMPUB_01_0017
     * @tc.desc   纯文本消息回退为 OutApp 后送入注入发布器
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormPublisher0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0017 begin');
      const fake: FakePublisher = new FakePublisher(false);
      FormEventService.setPublisher(fake);
      FormEventService.publishFromForm('click');
      const result: string = fake.getLastData();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('OutApp'));
      expect(result).assertEqual('OutApp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fake.getLastSourceCode() === 1001));
      expect(fake.getLastSourceCode() === 1001).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fake.getCalls() === 1));
      expect(fake.getCalls() === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0017 end');
    })

    /**
     * @tc.name   testFormPublisher0018
     * @tc.number SUB_CCER_FORMPUB_01_0018
     * @tc.desc   注入发布器固定收到卡片来源码 1001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormPublisher0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0018 begin');
      const fake: FakePublisher = new FakePublisher(false);
      FormEventService.setPublisher(fake);
      FormEventService.publishFromForm('{"data":"InApp"}');
      const result: string = String(fake.getLastSourceCode());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1001'));
      expect(result).assertEqual('1001');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fake.getLastSourceCode() === EventSource.FORM));
      expect(fake.getLastSourceCode() === EventSource.FORM).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fake.getCalls() === 1));
      expect(fake.getCalls() === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0018 end');
    })

    /**
     * @tc.name   testFormPublisher0019
     * @tc.number SUB_CCER_FORMPUB_01_0019
     * @tc.desc   注入发布器固定收到卡片来源码 1001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormPublisher0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0019 begin');
      const fake: FakePublisher = new FakePublisher(false);
      FormEventService.setPublisher(fake);
      FormEventService.publishFromForm('{"data":"OutApp"}');
      const result: string = String(fake.getLastSourceCode());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1001'));
      expect(result).assertEqual('1001');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fake.getLastSourceCode() === EventSource.FORM));
      expect(fake.getLastSourceCode() === EventSource.FORM).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fake.getCalls() === 1));
      expect(fake.getCalls() === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0019 end');
    })

    /**
     * @tc.name   testFormPublisher0020
     * @tc.number SUB_CCER_FORMPUB_01_0020
     * @tc.desc   发布走查时注入发布器的 Promise 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormPublisher0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0020 begin');
      const fake: FakePublisher = new FakePublisher(false);
      FormEventService.setPublisher(fake);
      const outcome: Object = FormEventService.publishFromForm('{"data":"InApp"}');
      const result: string = String(outcome instanceof Promise);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fake.getCalls() === 1));
      expect(fake.getCalls() === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fake.getLastData().length > 0));
      expect(fake.getLastData().length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0020 end');
    })

    /**
     * @tc.name   testFormPublisher0021
     * @tc.number SUB_CCER_FORMPUB_01_0021
     * @tc.desc   发布走查时注入发布器的 Promise 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormPublisher0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0021 begin');
      const fake: FakePublisher = new FakePublisher(false);
      FormEventService.setPublisher(fake);
      const outcome: Object = FormEventService.publishFromForm('{"data":"Custom"}');
      const result: string = String(outcome instanceof Promise);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fake.getCalls() === 1));
      expect(fake.getCalls() === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fake.getLastData().length > 0));
      expect(fake.getLastData().length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0021 end');
    })

    /**
     * @tc.name   testFormPublisher0022
     * @tc.number SUB_CCER_FORMPUB_01_0022
     * @tc.desc   发布走查时注入发布器的 Promise 原样返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormPublisher0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0022 begin');
      const fake: FakePublisher = new FakePublisher(false);
      FormEventService.setPublisher(fake);
      const outcome: Object = FormEventService.publishFromForm('{"data":"中文名"}');
      const result: string = String(outcome instanceof Promise);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fake.getCalls() === 1));
      expect(fake.getCalls() === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fake.getLastData().length > 0));
      expect(fake.getLastData().length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0022 end');
    })

    /**
     * @tc.name   testFormPublisher0023
     * @tc.number SUB_CCER_FORMPUB_01_0023
     * @tc.desc   两次发布均送入同一注入发布器
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormPublisher0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0023 begin');
      const fake: FakePublisher = new FakePublisher(false);
      FormEventService.setPublisher(fake);
      FormEventService.publishFromForm('{"data":"A"}'); FormEventService.publishFromForm('{"data":"B"}');
      const result: string = String(fake.getCalls());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(fake.getLastData()), String('B'));
      expect(fake.getLastData()).assertEqual('B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fake.getLastSourceCode() === 1001));
      expect(fake.getLastSourceCode() === 1001).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0023 end');
    })

    /**
     * @tc.name   testFormPublisher0024
     * @tc.number SUB_CCER_FORMPUB_01_0024
     * @tc.desc   三次发布均送入同一注入发布器
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormPublisher0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0024 begin');
      const fake: FakePublisher = new FakePublisher(false);
      FormEventService.setPublisher(fake);
      FormEventService.publishFromForm('{"data":"A"}'); FormEventService.publishFromForm('{"data":"B"}');
        FormEventService.publishFromForm('{"data":"C"}');
      const result: string = String(fake.getCalls());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual('3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(fake.getLastData()), String('C'));
      expect(fake.getLastData()).assertEqual('C');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fake.getLastSourceCode() === 1001));
      expect(fake.getLastSourceCode() === 1001).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0024 end');
    })

    /**
     * @tc.name   testFormPublisher0025
     * @tc.number SUB_CCER_FORMPUB_01_0025
     * @tc.desc   合法与非法消息交替发布时后值覆盖前值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormPublisher0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0025 begin');
      const fake: FakePublisher = new FakePublisher(false);
      FormEventService.setPublisher(fake);
      FormEventService.publishFromForm('{"data":"Valid"}'); FormEventService.publishFromForm('bad');
      const result: string = String(fake.getCalls());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(fake.getLastData()), String('OutApp'));
      expect(fake.getLastData()).assertEqual('OutApp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fake.getLastSourceCode() === 1001));
      expect(fake.getLastSourceCode() === 1001).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0025 end');
    })

    /**
     * @tc.name   testFormPublisher0026
     * @tc.number SUB_CCER_FORMPUB_01_0026
     * @tc.desc   注入发布器按调用顺序收到解析后的两条数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormPublisher0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0026 begin');
      const fake: FakePublisher = new FakePublisher(false);
      FormEventService.setPublisher(fake);
      FormEventService.publishFromForm('{"data":"第一条"}'); FormEventService.publishFromForm('{"data":"第二条"}');
      const result: string = String(fake.getCalls());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2'));
      expect(result).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(fake.getLastData()), String('第二条'));
      expect(fake.getLastData()).assertEqual('第二条');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fake.getLastSourceCode() === 1001));
      expect(fake.getLastSourceCode() === 1001).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormPublisher0026 end');
    })

  })
}
