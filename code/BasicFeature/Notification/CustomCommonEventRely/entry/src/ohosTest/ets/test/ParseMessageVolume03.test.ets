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
import { FormEventService, ParseResult } from '../../../main/ets/feature/FormEventService';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function parseMessageVolume03Test() {
  describe('ParseMessageVolume03Test', () => {

    /**
     * @tc.name   testParseContent0001
     * @tc.number SUB_CCER_PARSEFMT_03_0001
     * @tc.desc   内容域 双引号载荷 解析为可用数据且原因字段为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseContent0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0001 begin');
      const message: string = '{"data":"say \\"hi\\""}';

      const result: ParseResult = FormEventService.parseMessage(message);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data), String('say "hi"'));
      expect(result.data).assertEqual('say "hi"');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0001 end');
    })

    /**
     * @tc.name   testParseContent0002
     * @tc.number SUB_CCER_PARSEFMT_03_0002
     * @tc.desc   内容域 单引号载荷 解析为可用数据且原因字段为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseContent0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0002 begin');
      const message: string = '{"data":"it\'s here"}';

      const result: ParseResult = FormEventService.parseMessage(message);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String('it\'s here'));
      expect(result.data).assertEqual('it\'s here');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0002 end');
    })

    /**
     * @tc.name   testParseContent0003
     * @tc.number SUB_CCER_PARSEFMT_03_0003
     * @tc.desc   内容域 单反斜杠载荷 解析为可用数据且原因字段为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseContent0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0003 begin');
      const message: string = '{"data":"back\\\\slash"}';

      const result: ParseResult = FormEventService.parseMessage(message);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String('back\\slash'));
      expect(result.data).assertEqual('back\\slash');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0003 end');
    })

    /**
     * @tc.name   testParseContent0004
     * @tc.number SUB_CCER_PARSEFMT_03_0004
     * @tc.desc   内容域 双反斜杠载荷 解析为可用数据且原因字段为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseContent0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0004 begin');
      const message: string = '{"data":"deep\\\\\\\\path"}';

      const result: ParseResult = FormEventService.parseMessage(message);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String('deep\\\\path'));
      expect(result.data).assertEqual('deep\\\\path');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0004 end');
    })

    /**
     * @tc.name   testParseContent0005
     * @tc.number SUB_CCER_PARSEFMT_03_0005
     * @tc.desc   内容域 换行载荷 解析为可用数据且原因字段为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseContent0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0005 begin');
      const message: string = '{"data":"multi\\nline"}';

      const result: ParseResult = FormEventService.parseMessage(message);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String('multi\nline'));
      expect(result.data).assertEqual('multi\nline');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0005 end');
    })

    /**
     * @tc.name   testParseContent0006
     * @tc.number SUB_CCER_PARSEFMT_03_0006
     * @tc.desc   内容域 制表符载荷 解析为可用数据且原因字段为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseContent0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0006 begin');
      const message: string = '{"data":"tab\\tvalue"}';

      const result: ParseResult = FormEventService.parseMessage(message);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String('tab\tvalue'));
      expect(result.data).assertEqual('tab\tvalue');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0006 end');
    })

    /**
     * @tc.name   testParseContent0007
     * @tc.number SUB_CCER_PARSEFMT_03_0007
     * @tc.desc   内容域 类 JSON 文本载荷 解析为可用数据且原因字段为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseContent0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0007 begin');
      const message: string = '{"data":"{json:\\"like\\"}"}';

      const result: ParseResult = FormEventService.parseMessage(message);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String('{json:"like"}'));
      expect(result.data).assertEqual('{json:"like"}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0007 end');
    })

    /**
     * @tc.name   testParseContent0008
     * @tc.number SUB_CCER_PARSEFMT_03_0008
     * @tc.desc   内容域 数组文本载荷 解析为可用数据且原因字段为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseContent0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0008 begin');
      const message: string = '{"data":"[array,like]"}';

      const result: ParseResult = FormEventService.parseMessage(message);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String('[array,like]'));
      expect(result.data).assertEqual('[array,like]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0008 end');
    })

    /**
     * @tc.name   testParseContent0009
     * @tc.number SUB_CCER_PARSEFMT_03_0009
     * @tc.desc   内容域 逗号载荷 解析为可用数据且原因字段为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseContent0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0009 begin');
      const message: string = '{"data":"comma,no,space"}';

      const result: ParseResult = FormEventService.parseMessage(message);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String('comma,no,space'));
      expect(result.data).assertEqual('comma,no,space');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0009 end');
    })

    /**
     * @tc.name   testParseContent0010
     * @tc.number SUB_CCER_PARSEFMT_03_0010
     * @tc.desc   内容域 等号载荷 解析为可用数据且原因字段为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseContent0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0010 begin');
      const message: string = '{"data":"key=value pair"}';

      const result: ParseResult = FormEventService.parseMessage(message);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String('key=value pair'));
      expect(result.data).assertEqual('key=value pair');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0010 end');
    })

    /**
     * @tc.name   testParseContent0011
     * @tc.number SUB_CCER_PARSEFMT_03_0011
     * @tc.desc   内容域 表情符号载荷 解析为可用数据且原因字段为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseContent0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0011 begin');
      const message: string = '{"data":"rocket 🚀 flying"}';

      const result: ParseResult = FormEventService.parseMessage(message);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String('rocket 🚀 flying'));
      expect(result.data).assertEqual('rocket 🚀 flying');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0011 end');
    })

    /**
     * @tc.name   testParseContent0012
     * @tc.number SUB_CCER_PARSEFMT_03_0012
     * @tc.desc   内容域 中英混合载荷 解析为可用数据且原因字段为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseContent0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0012 begin');
      const message: string = '{"data":"中英混排 payload"}';

      const result: ParseResult = FormEventService.parseMessage(message);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String('中英混排 payload'));
      expect(result.data).assertEqual('中英混排 payload');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0012 end');
    })

    /**
     * @tc.name   testParseContent0013
     * @tc.number SUB_CCER_PARSEFMT_03_0013
     * @tc.desc   内容域 日文载荷 解析为可用数据且原因字段为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseContent0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0013 begin');
      const message: string = '{"data":"日本語メッセージ"}';

      const result: ParseResult = FormEventService.parseMessage(message);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data), String('日本語メッセージ'));
      expect(result.data).assertEqual('日本語メッセージ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0013 end');
    })

    /**
     * @tc.name   testParseContent0014
     * @tc.number SUB_CCER_PARSEFMT_03_0014
     * @tc.desc   内容域 重音字符载荷 解析为可用数据且原因字段为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseContent0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0014 begin');
      const message: string = '{"data":"café übernommen"}';

      const result: ParseResult = FormEventService.parseMessage(message);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String('café übernommen'));
      expect(result.data).assertEqual('café übernommen');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0014 end');
    })

    /**
     * @tc.name   testParseContent0015
     * @tc.number SUB_CCER_PARSEFMT_03_0015
     * @tc.desc   内容域 两端空格载荷 解析为可用数据且原因字段为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseContent0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0015 begin');
      const message: string = '{"data":"padded both   "}';

      const result: ParseResult = FormEventService.parseMessage(message);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String('padded both   '));
      expect(result.data).assertEqual('padded both   ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0015 end');
    })

    /**
     * @tc.name   testParseContent0016
     * @tc.number SUB_CCER_PARSEFMT_03_0016
     * @tc.desc   内容域 null 文本载荷 解析为可用数据且原因字段为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseContent0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0016 begin');
      const message: string = '{"data":"null-ish text"}';

      const result: ParseResult = FormEventService.parseMessage(message);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String('null-ish text'));
      expect(result.data).assertEqual('null-ish text');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0016 end');
    })

    /**
     * @tc.name   testParseContent0017
     * @tc.number SUB_CCER_PARSEFMT_03_0017
     * @tc.desc   内容域 小数载荷 解析为可用数据且原因字段为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseContent0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0017 begin');
      const message: string = '{"data":"3.14159"}';

      const result: ParseResult = FormEventService.parseMessage(message);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data), String('3.14159'));
      expect(result.data).assertEqual('3.14159');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0017 end');
    })

    /**
     * @tc.name   testParseContent0018
     * @tc.number SUB_CCER_PARSEFMT_03_0018
     * @tc.desc   内容域 负数载荷 解析为可用数据且原因字段为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseContent0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0018 begin');
      const message: string = '{"data":"-273.15"}';

      const result: ParseResult = FormEventService.parseMessage(message);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data), String('-273.15'));
      expect(result.data).assertEqual('-273.15');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0018 end');
    })

    /**
     * @tc.name   testParseContent0019
     * @tc.number SUB_CCER_PARSEFMT_03_0019
     * @tc.desc   内容域 布尔文本载荷 解析为可用数据且原因字段为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseContent0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0019 begin');
      const message: string = '{"data":"trueOrFalse"}';

      const result: ParseResult = FormEventService.parseMessage(message);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String('trueOrFalse'));
      expect(result.data).assertEqual('trueOrFalse');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0019 end');
    })

    /**
     * @tc.name   testParseContent0020
     * @tc.number SUB_CCER_PARSEFMT_03_0020
     * @tc.desc   内容域 HTML 标签载荷 解析为可用数据且原因字段为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseContent0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0020 begin');
      const message: string = '{"data":"<html>escape</html>"}';

      const result: ParseResult = FormEventService.parseMessage(message);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String('<html>escape</html>'));
      expect(result.data).assertEqual('<html>escape</html>');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0020 end');
    })

    /**
     * @tc.name   testParseContent0021
     * @tc.number SUB_CCER_PARSEFMT_03_0021
     * @tc.desc   内容域 实体字符载荷 解析为可用数据且原因字段为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseContent0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0021 begin');
      const message: string = '{"data":"&amp;entity;"}';

      const result: ParseResult = FormEventService.parseMessage(message);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String('&amp;entity;'));
      expect(result.data).assertEqual('&amp;entity;');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0021 end');
    })

    /**
     * @tc.name   testParseContent0022
     * @tc.number SUB_CCER_PARSEFMT_03_0022
     * @tc.desc   内容域 格式占位载荷 解析为可用数据且原因字段为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseContent0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0022 begin');
      const message: string = '{"data":"%s %{public}s"}';

      const result: ParseResult = FormEventService.parseMessage(message);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String('%s %{public}s'));
      expect(result.data).assertEqual('%s %{public}s');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0022 end');
    })

    /**
     * @tc.name   testParseContent0023
     * @tc.number SUB_CCER_PARSEFMT_03_0023
     * @tc.desc   内容域 分号载荷 解析为可用数据且原因字段为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseContent0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0023 begin');
      const message: string = '{"data":"a=b;c=d"}';

      const result: ParseResult = FormEventService.parseMessage(message);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data), String('a=b;c=d'));
      expect(result.data).assertEqual('a=b;c=d');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0023 end');
    })

    /**
     * @tc.name   testParseContent0024
     * @tc.number SUB_CCER_PARSEFMT_03_0024
     * @tc.desc   内容域 井号载荷 解析为可用数据且原因字段为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseContent0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0024 begin');
      const message: string = '{"data":"#fragment"}';

      const result: ParseResult = FormEventService.parseMessage(message);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String('#fragment'));
      expect(result.data).assertEqual('#fragment');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0024 end');
    })

    /**
     * @tc.name   testParseContent0025
     * @tc.number SUB_CCER_PARSEFMT_03_0025
     * @tc.desc   内容域 混合内容载荷 解析为可用数据且原因字段为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseContent0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0025 begin');
      const message: string = '{"data":"Mixed 中文 & 🎉 combo"}';

      const result: ParseResult = FormEventService.parseMessage(message);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String('Mixed 中文 & 🎉 combo'));
      expect(result.data).assertEqual('Mixed 中文 & 🎉 combo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0025 end');
    })

    /**
     * @tc.name   testParseContent0026
     * @tc.number SUB_CCER_PARSEFMT_03_0026
     * @tc.desc   内容域 多重制表载荷 解析为可用数据且原因字段为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseContent0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0026 begin');
      const message: string = '{"data":"x\\ty\\tz"}';

      const result: ParseResult = FormEventService.parseMessage(message);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data), String('x\ty\tz'));
      expect(result.data).assertEqual('x\ty\tz');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0026 end');
    })

    /**
     * @tc.name   testParseContent0027
     * @tc.number SUB_CCER_PARSEFMT_03_0027
     * @tc.desc   结构域 带 message 字段的消息 解析出顶层 data 字段
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseContent0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0027 begin');
      const message: string = '{"message":"click","data":"WithMessage"}';

      const result: ParseResult = FormEventService.parseMessage(message);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String('WithMessage'));
      expect(result.data).assertEqual('WithMessage');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0027 end');
    })

    /**
     * @tc.name   testParseContent0028
     * @tc.number SUB_CCER_PARSEFMT_03_0028
     * @tc.desc   结构域 深层嵌套字段的消息 解析出顶层 data 字段
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseContent0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0028 begin');
      const message: string = '{"data":"DeepTop","nested":{"a":{"b":{"c":[1,2]}}}}';

      const result: ParseResult = FormEventService.parseMessage(message);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data), String('DeepTop'));
      expect(result.data).assertEqual('DeepTop');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0028 end');
    })

    /**
     * @tc.name   testParseContent0029
     * @tc.number SUB_CCER_PARSEFMT_03_0029
     * @tc.desc   结构域 数组与计数字段的消息 解析出顶层 data 字段
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseContent0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0029 begin');
      const message: string = '{"data":"ListTop","list":[1,2,3],"count":3}';

      const result: ParseResult = FormEventService.parseMessage(message);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data), String('ListTop'));
      expect(result.data).assertEqual('ListTop');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0029 end');
    })

    /**
     * @tc.name   testParseContent0030
     * @tc.number SUB_CCER_PARSEFMT_03_0030
     * @tc.desc   结构域 含空格中文载荷的消息 解析出顶层 data 字段
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseContent0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0030 begin');
      const message: string = '{"data":"有空格 的数据"}';

      const result: ParseResult = FormEventService.parseMessage(message);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data), String('有空格 的数据'));
      expect(result.data).assertEqual('有空格 的数据');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0030 end');
    })

    /**
     * @tc.name   testParseContent0031
     * @tc.number SUB_CCER_PARSEFMT_03_0031
     * @tc.desc   结构域 尾部空格载荷的消息 解析出顶层 data 字段
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseContent0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0031 begin');
      const message: string = '{"data":"TrailingSpace "}';

      const result: ParseResult = FormEventService.parseMessage(message);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String('TrailingSpace '));
      expect(result.data).assertEqual('TrailingSpace ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0031 end');
    })

    /**
     * @tc.name   testParseContent0032
     * @tc.number SUB_CCER_PARSEFMT_03_0032
     * @tc.desc   结构域 前导空格载荷的消息 解析出顶层 data 字段
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseContent0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0032 begin');
      const message: string = '{"data":" LeadingSpace"}';

      const result: ParseResult = FormEventService.parseMessage(message);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String(' LeadingSpace'));
      expect(result.data).assertEqual(' LeadingSpace');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0032 end');
    })

    /**
     * @tc.name   testParseContent0033
     * @tc.number SUB_CCER_PARSEFMT_03_0033
     * @tc.desc   消息内 Unicode 转义序列按转义后的值解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseContent0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0033 begin');
      const message: string = '{"data":"\\u0041\\u0042\\u0043"}';

      const result: ParseResult = FormEventService.parseMessage(message);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data), String('ABC'));
      expect(result.data).assertEqual('ABC');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0033 end');
    })

    /**
     * @tc.name   testParseContent0034
     * @tc.number SUB_CCER_PARSEFMT_03_0034
     * @tc.desc   载荷内转义引号按转义后的值解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseContent0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0034 begin');
      const message: string = '{"data":"quote:\\"inside\\""}';

      const result: ParseResult = FormEventService.parseMessage(message);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String('quote:"inside"'));
      expect(result.data).assertEqual('quote:"inside"');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0034 end');
    })

    /**
     * @tc.name   testParseContent0035
     * @tc.number SUB_CCER_PARSEFMT_03_0035
     * @tc.desc   引号内容与结构化消息解析结果各自独立
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseContent0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0035 begin');
      const message: string = '{"data":"say \\"hi\\""}';
      const second: ParseResult = FormEventService.parseMessage('{"data":"第二条"}');
        const third: ParseResult = FormEventService.parseMessage('{"data":"第三条","extra":1}');
      const result: ParseResult = FormEventService.parseMessage(message);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data), String('say "hi"'));
      expect(result.data).assertEqual('say "hi"');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(second.valid), String(true));
      expect(second.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(third.data), String('第三条'));
      expect(third.data).assertEqual('第三条');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseContent0035 end');
    })

  })
}
