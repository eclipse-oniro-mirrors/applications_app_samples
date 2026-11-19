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
import { CommonEventConstants } from '../../../main/ets/util/Constants';
import { FormEventService, ParseResult } from '../../../main/ets/feature/FormEventService';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function parseMessageTest() {
  describe('ParseMessageVolume01Test', () => {

    /**
     * @tc.name   testParseMessage010001
     * @tc.number SUB_CCER_PARSEFMT_01_0001
     * @tc.desc   合法消息 {"data":"InApp"} 解析为可用数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010001 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"data\":\"InApp\"}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_IN_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_IN_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010001 end');
    })

    /**
     * @tc.name   testParseMessage010002
     * @tc.number SUB_CCER_PARSEFMT_01_0002
     * @tc.desc   合法消息 {"data":"OutApp"} 解析为可用数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010002 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"data\":\"OutApp\"}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010002 end');
    })

    /**
     * @tc.name   testParseMessage010003
     * @tc.number SUB_CCER_PARSEFMT_01_0003
     * @tc.desc   合法消息 {"data":"Custom_01"} 解析为可用数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010003 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"data\":\"Custom_01\"}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String('Custom_01'));
      expect(result.data).assertEqual('Custom_01');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010003 end');
    })

    /**
     * @tc.name   testParseMessage010004
     * @tc.number SUB_CCER_PARSEFMT_01_0004
     * @tc.desc   合法消息 {"data":"Custom_02"} 解析为可用数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010004 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"data\":\"Custom_02\"}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String('Custom_02'));
      expect(result.data).assertEqual('Custom_02');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010004 end');
    })

    /**
     * @tc.name   testParseMessage010005
     * @tc.number SUB_CCER_PARSEFMT_01_0005
     * @tc.desc   合法消息 {"data":"Custom_03"} 解析为可用数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010005 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"data\":\"Custom_03\"}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String('Custom_03'));
      expect(result.data).assertEqual('Custom_03');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010005 end');
    })

    /**
     * @tc.name   testParseMessage010006
     * @tc.number SUB_CCER_PARSEFMT_01_0006
     * @tc.desc   合法消息 {"message":"click","data":"InApp"} 解析为可用数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010006 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"message\":\"click\",\"data\":\"InApp\"}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_IN_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_IN_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010006 end');
    })

    /**
     * @tc.name   testParseMessage010007
     * @tc.number SUB_CCER_PARSEFMT_01_0007
     * @tc.desc   合法消息 {"message":"onClick","data":"OutApp"} 解析为可用数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010007 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"message\":\"onClick\",\"data\":\"OutApp\"}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010007 end');
    })

    /**
     * @tc.name   testParseMessage010008
     * @tc.number SUB_CCER_PARSEFMT_01_0008
     * @tc.desc   合法消息 {"data":" 空格 "} 解析为可用数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010008 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"data\":\" 空格 \"}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data), String(' 空格 '));
      expect(result.data).assertEqual(' 空格 ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010008 end');
    })

    /**
     * @tc.name   testParseMessage010009
     * @tc.number SUB_CCER_PARSEFMT_01_0009
     * @tc.desc   合法消息 {"data":"中文载荷"} 解析为可用数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010009 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"data\":\"中文载荷\"}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data), String('中文载荷'));
      expect(result.data).assertEqual('中文载荷');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010009 end');
    })

    /**
     * @tc.name   testParseMessage010010
     * @tc.number SUB_CCER_PARSEFMT_01_0010
     * @tc.desc   合法消息 {"data":"a:b"} 解析为可用数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010010 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"data\":\"a:b\"}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data), String('a:b'));
      expect(result.data).assertEqual('a:b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010010 end');
    })

    /**
     * @tc.name   testParseMessage010011
     * @tc.number SUB_CCER_PARSEFMT_01_0011
     * @tc.desc   合法消息 {"data":"{\"k\":\"v\"}"} 解析为可用数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010011 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"data\":\"{\\\"k\\\":\\\"v\\\"}\"}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String('{"k":"v"}'));
      expect(result.data).assertEqual('{"k":"v"}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010011 end');
    })

    /**
     * @tc.name   testParseMessage010012
     * @tc.number SUB_CCER_PARSEFMT_01_0012
     * @tc.desc   合法消息 {"data":"line1\nline2"} 解析为可用数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010012 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"data\":\"line1\\nline2\"}");
      const lineBreak: string = 'line1\nline2';
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String(lineBreak));
      expect(result.data).assertEqual(lineBreak);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010012 end');
    })

    /**
     * @tc.name   testParseMessage010013
     * @tc.number SUB_CCER_PARSEFMT_01_0013
     * @tc.desc   合法消息 {"data":"tab\there"} 解析为可用数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010013 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"data\":\"tab\\there\"}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data), String('tab	here'));
      expect(result.data).assertEqual('tab	here');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010013 end');
    })

    /**
     * @tc.name   testParseMessage010014
     * @tc.number SUB_CCER_PARSEFMT_01_0014
     * @tc.desc   合法消息 {"data":"0"} 解析为可用数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010014 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"data\":\"0\"}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data), String('0'));
      expect(result.data).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010014 end');
    })

    /**
     * @tc.name   testParseMessage010015
     * @tc.number SUB_CCER_PARSEFMT_01_0015
     * @tc.desc   合法消息 {"data":"false"} 解析为可用数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010015 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"data\":\"false\"}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data), String('false'));
      expect(result.data).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010015 end');
    })

    /**
     * @tc.name   testParseMessage010016
     * @tc.number SUB_CCER_PARSEFMT_01_0016
     * @tc.desc   合法消息 {"data":"null"} 解析为可用数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010016 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"data\":\"null\"}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data), String('null'));
      expect(result.data).assertEqual('null');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010016 end');
    })

    /**
     * @tc.name   testParseMessage010017
     * @tc.number SUB_CCER_PARSEFMT_01_0017
     * @tc.desc   合法消息 {"nested":{"a":1},"data":"InApp"} 解析为可用数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage010017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010017 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"nested\":{\"a\":1},\"data\":\"InApp\"}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_IN_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_IN_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010017 end');
    })

    /**
     * @tc.name   testParseMessage010018
     * @tc.number SUB_CCER_PARSEFMT_01_0018
     * @tc.desc   合法消息 {"data":"InApp","extra":true} 解析为可用数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage010018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010018 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"data\":\"InApp\",\"extra\":true}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_IN_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_IN_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010018 end');
    })

    /**
     * @tc.name   testParseMessage010019
     * @tc.number SUB_CCER_PARSEFMT_01_0019
     * @tc.desc   合法消息 {"data":"Custom_04","count":3} 解析为可用数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage010019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010019 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"data\":\"Custom_04\",\"count\":3}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String('Custom_04'));
      expect(result.data).assertEqual('Custom_04');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010019 end');
    })

    /**
     * @tc.name   testParseMessage010020
     * @tc.number SUB_CCER_PARSEFMT_01_0020
     * @tc.desc   合法消息 {"data":"Custom_05","list":[1,2,3]} 解析为可用数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage010020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010020 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"data\":\"Custom_05\",\"list\":[1,2,3]}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String('Custom_05'));
      expect(result.data).assertEqual('Custom_05');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010020 end');
    })

    /**
     * @tc.name   testParseMessage010021
     * @tc.number SUB_CCER_PARSEFMT_01_0021
     * @tc.desc   缺少 data 字段的消息 {} 回落 OutApp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage010021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010021 begin');
      const result: ParseResult = FormEventService.parseMessage("{}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(false));
      expect(result.valid).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('missing-data'));
      expect(result.reason).assertEqual('missing-data');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010021 end');
    })

    /**
     * @tc.name   testParseMessage010022
     * @tc.number SUB_CCER_PARSEFMT_01_0022
     * @tc.desc   缺少 data 字段的消息 {"message":"click"} 回落 OutApp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage010022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010022 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"message\":\"click\"}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(false));
      expect(result.valid).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('missing-data'));
      expect(result.reason).assertEqual('missing-data');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010022 end');
    })

    /**
     * @tc.name   testParseMessage010023
     * @tc.number SUB_CCER_PARSEFMT_01_0023
     * @tc.desc   缺少 data 字段的消息 {"count":1} 回落 OutApp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage010023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010023 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"count\":1}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(false));
      expect(result.valid).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('missing-data'));
      expect(result.reason).assertEqual('missing-data');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010023 end');
    })

    /**
     * @tc.name   testParseMessage010024
     * @tc.number SUB_CCER_PARSEFMT_01_0024
     * @tc.desc   缺少 data 字段的消息 {"Data":"InApp"} 回落 OutApp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage010024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010024 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"Data\":\"InApp\"}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(false));
      expect(result.valid).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('missing-data'));
      expect(result.reason).assertEqual('missing-data');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010024 end');
    })

    /**
     * @tc.name   testParseMessage010025
     * @tc.number SUB_CCER_PARSEFMT_01_0025
     * @tc.desc   缺少 data 字段的消息 {" data":"InApp"} 回落 OutApp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage010025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010025 begin');
      const result: ParseResult = FormEventService.parseMessage("{\" data\":\"InApp\"}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(false));
      expect(result.valid).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('missing-data'));
      expect(result.reason).assertEqual('missing-data');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010025 end');
    })

    /**
     * @tc.name   testParseMessage010026
     * @tc.number SUB_CCER_PARSEFMT_01_0026
     * @tc.desc   缺少 data 字段的消息 {"datax":"InApp"} 回落 OutApp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage010026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010026 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"datax\":\"InApp\"}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(false));
      expect(result.valid).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('missing-data'));
      expect(result.reason).assertEqual('missing-data');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010026 end');
    })

    /**
     * @tc.name   testParseMessage010027
     * @tc.number SUB_CCER_PARSEFMT_01_0027
     * @tc.desc   缺少 data 字段的消息 [] 回落 OutApp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage010027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010027 begin');
      const result: ParseResult = FormEventService.parseMessage("[]");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(false));
      expect(result.valid).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('missing-data'));
      expect(result.reason).assertEqual('missing-data');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010027 end');
    })

    /**
     * @tc.name   testParseMessage010028
     * @tc.number SUB_CCER_PARSEFMT_01_0028
     * @tc.desc   缺少 data 字段的消息 123 回落 OutApp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage010028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010028 begin');
      const result: ParseResult = FormEventService.parseMessage("123");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(false));
      expect(result.valid).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('missing-data'));
      expect(result.reason).assertEqual('missing-data');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010028 end');
    })

    /**
     * @tc.name   testParseMessage010029
     * @tc.number SUB_CCER_PARSEFMT_01_0029
     * @tc.desc   缺少 data 字段的消息 "text" 回落 OutApp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage010029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010029 begin');
      const result: ParseResult = FormEventService.parseMessage("\"text\"");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(false));
      expect(result.valid).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('missing-data'));
      expect(result.reason).assertEqual('missing-data');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010029 end');
    })

    /**
     * @tc.name   testParseMessage010030
     * @tc.number SUB_CCER_PARSEFMT_01_0030
     * @tc.desc   缺少 data 字段的消息 true 回落 OutApp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage010030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010030 begin');
      const result: ParseResult = FormEventService.parseMessage("true");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(false));
      expect(result.valid).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('missing-data'));
      expect(result.reason).assertEqual('missing-data');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010030 end');
    })

    /**
     * @tc.name   testParseMessage010031
     * @tc.number SUB_CCER_PARSEFMT_01_0031
     * @tc.desc   空 data 字段的消息 {"data":""} 回落 OutApp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage010031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010031 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"data\":\"\"}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(false));
      expect(result.valid).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('empty-data'));
      expect(result.reason).assertEqual('empty-data');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010031 end');
    })

    /**
     * @tc.name   testParseMessage010032
     * @tc.number SUB_CCER_PARSEFMT_01_0032
     * @tc.desc   空 data 字段的消息 {"data":"","message":"c"} 回落 OutApp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage010032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010032 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"data\":\"\",\"message\":\"c\"}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(false));
      expect(result.valid).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('empty-data'));
      expect(result.reason).assertEqual('empty-data');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010032 end');
    })

    /**
     * @tc.name   testParseMessage010033
     * @tc.number SUB_CCER_PARSEFMT_01_0033
     * @tc.desc   空 data 字段的消息 {"data":"" ,"other":1} 回落 OutApp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage010033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010033 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"data\":\"\" ,\"other\":1}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(false));
      expect(result.valid).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('empty-data'));
      expect(result.reason).assertEqual('empty-data');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010033 end');
    })

    /**
     * @tc.name   testParseMessage010034
     * @tc.number SUB_CCER_PARSEFMT_01_0034
     * @tc.desc   空 data 字段的消息 {"other":1,"data":""} 回落 OutApp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage010034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010034 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"other\":1,\"data\":\"\"}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(false));
      expect(result.valid).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('empty-data'));
      expect(result.reason).assertEqual('empty-data');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010034 end');
    })

    /**
     * @tc.name   testParseMessage010035
     * @tc.number SUB_CCER_PARSEFMT_01_0035
     * @tc.desc   空 data 字段的消息 {"data":"","nested":{"a":1}} 回落 OutApp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage010035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010035 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"data\":\"\",\"nested\":{\"a\":1}}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(false));
      expect(result.valid).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('empty-data'));
      expect(result.reason).assertEqual('empty-data');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010035 end');
    })

    /**
     * @tc.name   testParseMessage010036
     * @tc.number SUB_CCER_PARSEFMT_01_0036
     * @tc.desc   非字符串 data 字段的消息 {"data":123} 回落 OutApp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage010036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010036 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"data\":123}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(false));
      expect(result.valid).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('non-string-data'));
      expect(result.reason).assertEqual('non-string-data');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010036 end');
    })

    /**
     * @tc.name   testParseMessage010037
     * @tc.number SUB_CCER_PARSEFMT_01_0037
     * @tc.desc   非字符串 data 字段的消息 {"data":true} 回落 OutApp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage010037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010037 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"data\":true}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(false));
      expect(result.valid).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('non-string-data'));
      expect(result.reason).assertEqual('non-string-data');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010037 end');
    })

    /**
     * @tc.name   testParseMessage010038
     * @tc.number SUB_CCER_PARSEFMT_01_0038
     * @tc.desc   非字符串 data 字段的消息 {"data":null} 回落 OutApp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage010038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010038 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"data\":null}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(false));
      expect(result.valid).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('non-string-data'));
      expect(result.reason).assertEqual('non-string-data');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010038 end');
    })

    /**
     * @tc.name   testParseMessage010039
     * @tc.number SUB_CCER_PARSEFMT_01_0039
     * @tc.desc   非字符串 data 字段的消息 {"data":[]} 回落 OutApp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage010039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010039 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"data\":[]}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(false));
      expect(result.valid).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('non-string-data'));
      expect(result.reason).assertEqual('non-string-data');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010039 end');
    })

    /**
     * @tc.name   testParseMessage010040
     * @tc.number SUB_CCER_PARSEFMT_01_0040
     * @tc.desc   非字符串 data 字段的消息 {"data":{}} 回落 OutApp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage010040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010040 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"data\":{}}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(false));
      expect(result.valid).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('non-string-data'));
      expect(result.reason).assertEqual('non-string-data');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010040 end');
    })

    /**
     * @tc.name   testParseMessage010041
     * @tc.number SUB_CCER_PARSEFMT_01_0041
     * @tc.desc   非字符串 data 字段的消息 {"data":1.5} 回落 OutApp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage010041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010041 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"data\":1.5}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(false));
      expect(result.valid).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('non-string-data'));
      expect(result.reason).assertEqual('non-string-data');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010041 end');
    })

    /**
     * @tc.name   testParseMessage010042
     * @tc.number SUB_CCER_PARSEFMT_01_0042
     * @tc.desc   非字符串 data 字段的消息 {"data":-1} 回落 OutApp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage010042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010042 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"data\":-1}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(false));
      expect(result.valid).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('non-string-data'));
      expect(result.reason).assertEqual('non-string-data');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010042 end');
    })

    /**
     * @tc.name   testParseMessage010043
     * @tc.number SUB_CCER_PARSEFMT_01_0043
     * @tc.desc   非字符串 data 字段的消息 {"data":0} 回落 OutApp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage010043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010043 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"data\":0}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(false));
      expect(result.valid).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('non-string-data'));
      expect(result.reason).assertEqual('non-string-data');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010043 end');
    })

    /**
     * @tc.name   testParseMessage010044
     * @tc.number SUB_CCER_PARSEFMT_01_0044
     * @tc.desc   非字符串 data 字段的消息 {"data":false} 回落 OutApp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage010044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010044 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"data\":false}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(false));
      expect(result.valid).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('non-string-data'));
      expect(result.reason).assertEqual('non-string-data');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010044 end');
    })

    /**
     * @tc.name   testParseMessage010045
     * @tc.number SUB_CCER_PARSEFMT_01_0045
     * @tc.desc   非字符串 data 字段的消息 {"data":{"x":"y"}} 回落 OutApp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage010045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010045 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"data\":{\"x\":\"y\"}}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(false));
      expect(result.valid).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('non-string-data'));
      expect(result.reason).assertEqual('non-string-data');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010045 end');
    })

    /**
     * @tc.name   testParseMessage010046
     * @tc.number SUB_CCER_PARSEFMT_01_0046
     * @tc.desc   点击消息携带 OutApp 时解析成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage010046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010046 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"message\":\"click\",\"data\":\"OutApp\"}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(FormEventService.parseEventData("{\"message\":\"click\",\"data\":\"OutApp\"}")), String(result.data));
      expect(FormEventService.parseEventData("{\"message\":\"click\",\"data\":\"OutApp\"}")).assertEqual(result.data);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage010046 end');
    })

  })
}
