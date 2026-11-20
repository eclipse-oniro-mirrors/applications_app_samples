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
  describe('ParseMessageVolume02Test', () => {

    /**
     * @tc.name   testParseMessage020001
     * @tc.number SUB_CCER_PARSEFMT_02_0001
     * @tc.desc   非法 JSON 消息 { 回落 OutApp 并给出原因
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage020001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020001 begin');
      const result: ParseResult = FormEventService.parseMessage("{");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(false));
      expect(result.valid).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('invalid-json'));
      expect(result.reason).assertEqual('invalid-json');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020001 end');
    })

    /**
     * @tc.name   testParseMessage020002
     * @tc.number SUB_CCER_PARSEFMT_02_0002
     * @tc.desc   非法 JSON 消息 } 回落 OutApp 并给出原因
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage020002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020002 begin');
      const result: ParseResult = FormEventService.parseMessage("}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(false));
      expect(result.valid).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('invalid-json'));
      expect(result.reason).assertEqual('invalid-json');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020002 end');
    })

    /**
     * @tc.name   testParseMessage020003
     * @tc.number SUB_CCER_PARSEFMT_02_0003
     * @tc.desc   非法 JSON 消息 {"data": 回落 OutApp 并给出原因
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage020003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020003 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"data\":");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(false));
      expect(result.valid).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('invalid-json'));
      expect(result.reason).assertEqual('invalid-json');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020003 end');
    })

    /**
     * @tc.name   testParseMessage020004
     * @tc.number SUB_CCER_PARSEFMT_02_0004
     * @tc.desc   非法 JSON 消息 abc 回落 OutApp 并给出原因
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage020004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020004 begin');
      const result: ParseResult = FormEventService.parseMessage("abc");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(false));
      expect(result.valid).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('invalid-json'));
      expect(result.reason).assertEqual('invalid-json');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020004 end');
    })

    /**
     * @tc.name   testParseMessage020005
     * @tc.number SUB_CCER_PARSEFMT_02_0005
     * @tc.desc   非法 JSON 消息 {"data":"InApp",} 回落 OutApp 并给出原因
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage020005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020005 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"data\":\"InApp\",}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(false));
      expect(result.valid).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('invalid-json'));
      expect(result.reason).assertEqual('invalid-json');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020005 end');
    })

    /**
     * @tc.name   testParseMessage020006
     * @tc.number SUB_CCER_PARSEFMT_02_0006
     * @tc.desc   非法 JSON 消息 {"data" "InApp"} 回落 OutApp 并给出原因
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage020006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020006 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"data\" \"InApp\"}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(false));
      expect(result.valid).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('invalid-json'));
      expect(result.reason).assertEqual('invalid-json');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020006 end');
    })

    /**
     * @tc.name   testParseMessage020007
     * @tc.number SUB_CCER_PARSEFMT_02_0007
     * @tc.desc   非法 JSON 消息 [1,2 回落 OutApp 并给出原因
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage020007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020007 begin');
      const result: ParseResult = FormEventService.parseMessage("[1,2");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(false));
      expect(result.valid).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('invalid-json'));
      expect(result.reason).assertEqual('invalid-json');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020007 end');
    })

    /**
     * @tc.name   testParseMessage020008
     * @tc.number SUB_CCER_PARSEFMT_02_0008
     * @tc.desc   非法 JSON 消息 {data:"InApp"} 回落 OutApp 并给出原因
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage020008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020008 begin');
      const result: ParseResult = FormEventService.parseMessage("{data:\"InApp\"}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(false));
      expect(result.valid).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('invalid-json'));
      expect(result.reason).assertEqual('invalid-json');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020008 end');
    })

    /**
     * @tc.name   testParseMessage020009
     * @tc.number SUB_CCER_PARSEFMT_02_0009
     * @tc.desc   非法 JSON 消息 {"data":"InApp" 回落 OutApp 并给出原因
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage020009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020009 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"data\":\"InApp\"");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(false));
      expect(result.valid).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('invalid-json'));
      expect(result.reason).assertEqual('invalid-json');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020009 end');
    })

    /**
     * @tc.name   testParseMessage020010
     * @tc.number SUB_CCER_PARSEFMT_02_0010
     * @tc.desc   非法 JSON 消息 {"data":"x"}} 回落 OutApp 并给出原因
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage020010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020010 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"data\":\"x\"}}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(false));
      expect(result.valid).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('invalid-json'));
      expect(result.reason).assertEqual('invalid-json');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020010 end');
    })

    /**
     * @tc.name   testParseMessage020011
     * @tc.number SUB_CCER_PARSEFMT_02_0011
     * @tc.desc   非法 JSON 消息 {] 回落 OutApp 并给出原因
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage020011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020011 begin');
      const result: ParseResult = FormEventService.parseMessage("{]");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(false));
      expect(result.valid).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('invalid-json'));
      expect(result.reason).assertEqual('invalid-json');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020011 end');
    })

    /**
     * @tc.name   testParseMessage020012
     * @tc.number SUB_CCER_PARSEFMT_02_0012
     * @tc.desc   非法 JSON 消息 {"data":"x" "y"} 回落 OutApp 并给出原因
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage020012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020012 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"data\":\"x\" \"y\"}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(false));
      expect(result.valid).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('invalid-json'));
      expect(result.reason).assertEqual('invalid-json');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020012 end');
    })

    /**
     * @tc.name   testParseMessage020013
     * @tc.number SUB_CCER_PARSEFMT_02_0013
     * @tc.desc   非法 JSON 消息 undefined 回落 OutApp 并给出原因
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage020013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020013 begin');
      const result: ParseResult = FormEventService.parseMessage("undefined");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(false));
      expect(result.valid).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('invalid-json'));
      expect(result.reason).assertEqual('invalid-json');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020013 end');
    })

    /**
     * @tc.name   testParseMessage020014
     * @tc.number SUB_CCER_PARSEFMT_02_0014
     * @tc.desc   非法 JSON 消息 NaN 回落 OutApp 并给出原因
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage020014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020014 begin');
      const result: ParseResult = FormEventService.parseMessage("NaN");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(false));
      expect(result.valid).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('invalid-json'));
      expect(result.reason).assertEqual('invalid-json');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020014 end');
    })

    /**
     * @tc.name   testParseMessage020015
     * @tc.number SUB_CCER_PARSEFMT_02_0015
     * @tc.desc   非法 JSON 消息 {"a":1,,} 回落 OutApp 并给出原因
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage020015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020015 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"a\":1,,}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(false));
      expect(result.valid).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('invalid-json'));
      expect(result.reason).assertEqual('invalid-json');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020015 end');
    })

    /**
     * @tc.name   testParseMessage020016
     * @tc.number SUB_CCER_PARSEFMT_02_0016
     * @tc.desc   非法 JSON 消息 {"a":01} 回落 OutApp 并给出原因
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage020016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020016 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"a\":01}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(false));
      expect(result.valid).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('invalid-json'));
      expect(result.reason).assertEqual('invalid-json');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020016 end');
    })

    /**
     * @tc.name   testParseMessage020017
     * @tc.number SUB_CCER_PARSEFMT_02_0017
     * @tc.desc   非法 JSON 消息 {'data':'InApp'} 回落 OutApp 并给出原因
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage020017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020017 begin');
      const result: ParseResult = FormEventService.parseMessage("{'data':'InApp'}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(false));
      expect(result.valid).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('invalid-json'));
      expect(result.reason).assertEqual('invalid-json');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020017 end');
    })

    /**
     * @tc.name   testParseMessage020018
     * @tc.number SUB_CCER_PARSEFMT_02_0018
     * @tc.desc   非法 JSON 消息 {"data":InApp} 回落 OutApp 并给出原因
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage020018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020018 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"data\":InApp}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(false));
      expect(result.valid).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('invalid-json'));
      expect(result.reason).assertEqual('invalid-json');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020018 end');
    })

    /**
     * @tc.name   testParseMessage020019
     * @tc.number SUB_CCER_PARSEFMT_02_0019
     * @tc.desc   空消息回落 OutApp 并标记 empty-message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage020019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020019 begin');
      const result: ParseResult = FormEventService.parseMessage("");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(false));
      expect(result.valid).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('empty-message'));
      expect(result.reason).assertEqual('empty-message');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020019 end');
    })

    /**
     * @tc.name   testParseMessage020020
     * @tc.number SUB_CCER_PARSEFMT_02_0020
     * @tc.desc   空白消息 " " 被视为非法 JSON
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage020020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020020 begin');
      const result: ParseResult = FormEventService.parseMessage(" ");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(false));
      expect(result.valid).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('invalid-json'));
      expect(result.reason).assertEqual('invalid-json');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020020 end');
    })

    /**
     * @tc.name   testParseMessage020021
     * @tc.number SUB_CCER_PARSEFMT_02_0021
     * @tc.desc   空白消息 "\t" 被视为非法 JSON
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage020021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020021 begin');
      const result: ParseResult = FormEventService.parseMessage("\t");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(false));
      expect(result.valid).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('invalid-json'));
      expect(result.reason).assertEqual('invalid-json');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020021 end');
    })

    /**
     * @tc.name   testParseMessage020022
     * @tc.number SUB_CCER_PARSEFMT_02_0022
     * @tc.desc   空白消息 "\n" 被视为非法 JSON
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage020022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020022 begin');
      const result: ParseResult = FormEventService.parseMessage("\n");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(false));
      expect(result.valid).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('invalid-json'));
      expect(result.reason).assertEqual('invalid-json');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020022 end');
    })

    /**
     * @tc.name   testParseMessage020023
     * @tc.number SUB_CCER_PARSEFMT_02_0023
     * @tc.desc   顶层 null 消息 "null" 被视为非法 JSON
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage020023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020023 begin');
      const result: ParseResult = FormEventService.parseMessage("null");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(false));
      expect(result.valid).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('invalid-json'));
      expect(result.reason).assertEqual('invalid-json');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020023 end');
    })

    /**
     * @tc.name   testParseMessage020024
     * @tc.number SUB_CCER_PARSEFMT_02_0024
     * @tc.desc   顶层 null 消息 "null " 被视为非法 JSON
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage020024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020024 begin');
      const result: ParseResult = FormEventService.parseMessage("null ");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data),
        String(CommonEventConstants.DATA_OUT_APP));
      expect(result.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(false));
      expect(result.valid).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('invalid-json'));
      expect(result.reason).assertEqual('invalid-json');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020024 end');
    })

    /**
     * @tc.name   testParseMessage020025
     * @tc.number SUB_CCER_PARSEFMT_02_0025
     * @tc.desc   长度为 1024 的数据字段解析为可用数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage020025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020025 begin');
      const result: ParseResult = FormEventService.parseMessage('{"data":"' + 'a'.repeat(1024) + '"}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data.length),
        String(1024));
      expect(result.data.length).assertEqual(1024);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020025 end');
    })

    /**
     * @tc.name   testParseMessage020026
     * @tc.number SUB_CCER_PARSEFMT_02_0026
     * @tc.desc   长度为 4096 的数据字段解析为可用数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage020026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020026 begin');
      const result: ParseResult = FormEventService.parseMessage('{"data":"' + 'a'.repeat(4096) + '"}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data.length),
        String(4096));
      expect(result.data.length).assertEqual(4096);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020026 end');
    })

    /**
     * @tc.name   testParseMessage020027
     * @tc.number SUB_CCER_PARSEFMT_02_0027
     * @tc.desc   长度为 65535 的数据字段解析为可用数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage020027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020027 begin');
      const result: ParseResult = FormEventService.parseMessage('{"data":"' + 'a'.repeat(65535) + '"}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data.length),
        String(65535));
      expect(result.data.length).assertEqual(65535);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020027 end');
    })

    /**
     * @tc.name   testParseMessage020028
     * @tc.number SUB_CCER_PARSEFMT_02_0028
     * @tc.desc   长度为 65536 的数据字段解析为可用数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage020028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020028 begin');
      const result: ParseResult = FormEventService.parseMessage('{"data":"' + 'a'.repeat(65536) + '"}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data.length),
        String(65536));
      expect(result.data.length).assertEqual(65536);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020028 end');
    })

    /**
     * @tc.name   testParseMessage020029
     * @tc.number SUB_CCER_PARSEFMT_02_0029
     * @tc.desc   长度为 65537 的数据字段解析为可用数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage020029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020029 begin');
      const result: ParseResult = FormEventService.parseMessage('{"data":"' + 'a'.repeat(65537) + '"}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data.length),
        String(65537));
      expect(result.data.length).assertEqual(65537);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020029 end');
    })

    /**
     * @tc.name   testParseMessage020030
     * @tc.number SUB_CCER_PARSEFMT_02_0030
     * @tc.desc   长度为 100000 的数据字段解析为可用数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage020030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020030 begin');
      const result: ParseResult = FormEventService.parseMessage('{"data":"' + 'a'.repeat(100000) + '"}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data.length),
        String(100000));
      expect(result.data.length).assertEqual(100000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020030 end');
    })

    /**
     * @tc.name   testParseMessage020031
     * @tc.number SUB_CCER_PARSEFMT_02_0031
     * @tc.desc   长度为 200000 的数据字段解析为可用数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage020031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020031 begin');
      const result: ParseResult = FormEventService.parseMessage('{"data":"' + 'a'.repeat(200000) + '"}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data.length),
        String(200000));
      expect(result.data.length).assertEqual(200000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020031 end');
    })

    /**
     * @tc.name   testParseMessage020032
     * @tc.number SUB_CCER_PARSEFMT_02_0032
     * @tc.desc   长度为 1000000 的数据字段解析为可用数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage020032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020032 begin');
      const result: ParseResult = FormEventService.parseMessage('{"data":"' + 'a'.repeat(1000000) + '"}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data.length),
        String(1000000));
      expect(result.data.length).assertEqual(1000000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020032 end');
    })

    /**
     * @tc.name   testParseMessage020033
     * @tc.number SUB_CCER_PARSEFMT_02_0033
     * @tc.desc   第 1 条消息的 parseEventData 结果与结构化结果一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage020033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020033 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"data\":\"InApp\"}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(FormEventService.parseEventData("{\"data\":\"InApp\"}")), String(result.data));
      expect(FormEventService.parseEventData("{\"data\":\"InApp\"}")).assertEqual(result.data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data.length > 0),
        String(true));
      expect(result.data.length > 0).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.valid === (result.reason.length === 0)), String(true));
      expect(result.valid === (result.reason.length === 0)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020033 end');
    })

    /**
     * @tc.name   testParseMessage020034
     * @tc.number SUB_CCER_PARSEFMT_02_0034
     * @tc.desc   第 2 条消息的 parseEventData 结果与结构化结果一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage020034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020034 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"data\":\"OutApp\"}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(FormEventService.parseEventData("{\"data\":\"OutApp\"}")), String(result.data));
      expect(FormEventService.parseEventData("{\"data\":\"OutApp\"}")).assertEqual(result.data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data.length > 0),
        String(true));
      expect(result.data.length > 0).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.valid === (result.reason.length === 0)), String(true));
      expect(result.valid === (result.reason.length === 0)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020034 end');
    })

    /**
     * @tc.name   testParseMessage020035
     * @tc.number SUB_CCER_PARSEFMT_02_0035
     * @tc.desc   第 3 条消息的 parseEventData 结果与结构化结果一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage020035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020035 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"data\":\"Custom_Consistent\"}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(FormEventService.parseEventData("{\"data\":\"Custom_Consistent\"}")), String(result.data));
      expect(FormEventService.parseEventData("{\"data\":\"Custom_Consistent\"}")).assertEqual(result.data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data.length > 0),
        String(true));
      expect(result.data.length > 0).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.valid === (result.reason.length === 0)), String(true));
      expect(result.valid === (result.reason.length === 0)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020035 end');
    })

    /**
     * @tc.name   testParseMessage020036
     * @tc.number SUB_CCER_PARSEFMT_02_0036
     * @tc.desc   第 4 条消息的 parseEventData 结果与结构化结果一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage020036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020036 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"data\":\"\"}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(FormEventService.parseEventData("{\"data\":\"\"}")), String(result.data));
      expect(FormEventService.parseEventData("{\"data\":\"\"}")).assertEqual(result.data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data.length > 0),
        String(true));
      expect(result.data.length > 0).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.valid === (result.reason.length === 0)), String(true));
      expect(result.valid === (result.reason.length === 0)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020036 end');
    })

    /**
     * @tc.name   testParseMessage020037
     * @tc.number SUB_CCER_PARSEFMT_02_0037
     * @tc.desc   第 5 条消息的 parseEventData 结果与结构化结果一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage020037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020037 begin');
      const result: ParseResult = FormEventService.parseMessage("{}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(FormEventService.parseEventData("{}")), String(result.data));
      expect(FormEventService.parseEventData("{}")).assertEqual(result.data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data.length > 0),
        String(true));
      expect(result.data.length > 0).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.valid === (result.reason.length === 0)), String(true));
      expect(result.valid === (result.reason.length === 0)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020037 end');
    })

    /**
     * @tc.name   testParseMessage020038
     * @tc.number SUB_CCER_PARSEFMT_02_0038
     * @tc.desc   第 6 条消息的 parseEventData 结果与结构化结果一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage020038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020038 begin');
      const result: ParseResult = FormEventService.parseMessage("{}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(FormEventService.parseEventData("{}")), String(result.data));
      expect(FormEventService.parseEventData("{}")).assertEqual(result.data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data.length > 0),
        String(true));
      expect(result.data.length > 0).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.valid === (result.reason.length === 0)), String(true));
      expect(result.valid === (result.reason.length === 0)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020038 end');
    })

    /**
     * @tc.name   testParseMessage020039
     * @tc.number SUB_CCER_PARSEFMT_02_0039
     * @tc.desc   第 7 条消息的 parseEventData 结果与结构化结果一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage020039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020039 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"data\":123}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(FormEventService.parseEventData("{\"data\":123}")), String(result.data));
      expect(FormEventService.parseEventData("{\"data\":123}")).assertEqual(result.data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data.length > 0),
        String(true));
      expect(result.data.length > 0).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.valid === (result.reason.length === 0)), String(true));
      expect(result.valid === (result.reason.length === 0)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020039 end');
    })

    /**
     * @tc.name   testParseMessage020040
     * @tc.number SUB_CCER_PARSEFMT_02_0040
     * @tc.desc   第 8 条消息的 parseEventData 结果与结构化结果一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage020040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020040 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"data\":null}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(FormEventService.parseEventData("{\"data\":null}")), String(result.data));
      expect(FormEventService.parseEventData("{\"data\":null}")).assertEqual(result.data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data.length > 0),
        String(true));
      expect(result.data.length > 0).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.valid === (result.reason.length === 0)), String(true));
      expect(result.valid === (result.reason.length === 0)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020040 end');
    })

    /**
     * @tc.name   testParseMessage020041
     * @tc.number SUB_CCER_PARSEFMT_02_0041
     * @tc.desc   第 9 条消息的 parseEventData 结果与结构化结果一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage020041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020041 begin');
      const result: ParseResult = FormEventService.parseMessage("{");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(FormEventService.parseEventData("{")), String(result.data));
      expect(FormEventService.parseEventData("{")).assertEqual(result.data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data.length > 0),
        String(true));
      expect(result.data.length > 0).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.valid === (result.reason.length === 0)), String(true));
      expect(result.valid === (result.reason.length === 0)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020041 end');
    })

    /**
     * @tc.name   testParseMessage020042
     * @tc.number SUB_CCER_PARSEFMT_02_0042
     * @tc.desc   第 10 条消息的 parseEventData 结果与结构化结果一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage020042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020042 begin');
      const result: ParseResult = FormEventService.parseMessage("abc");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(FormEventService.parseEventData("abc")), String(result.data));
      expect(FormEventService.parseEventData("abc")).assertEqual(result.data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data.length > 0),
        String(true));
      expect(result.data.length > 0).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.valid === (result.reason.length === 0)), String(true));
      expect(result.valid === (result.reason.length === 0)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020042 end');
    })

    /**
     * @tc.name   testParseMessage020043
     * @tc.number SUB_CCER_PARSEFMT_02_0043
     * @tc.desc   第 11 条消息的 parseEventData 结果与结构化结果一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage020043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020043 begin');
      const result: ParseResult = FormEventService.parseMessage("null");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(FormEventService.parseEventData("null")), String(result.data));
      expect(FormEventService.parseEventData("null")).assertEqual(result.data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data.length > 0),
        String(true));
      expect(result.data.length > 0).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.valid === (result.reason.length === 0)), String(true));
      expect(result.valid === (result.reason.length === 0)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020043 end');
    })

    /**
     * @tc.name   testParseMessage020044
     * @tc.number SUB_CCER_PARSEFMT_02_0044
     * @tc.desc   第 12 条消息的 parseEventData 结果与结构化结果一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage020044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020044 begin');
      const result: ParseResult = FormEventService.parseMessage("{\"data\":\"   \"}");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(FormEventService.parseEventData("{\"data\":\"   \"}")), String(result.data));
      expect(FormEventService.parseEventData("{\"data\":\"   \"}")).assertEqual(result.data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data.length > 0),
        String(true));
      expect(result.data.length > 0).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.valid === (result.reason.length === 0)), String(true));
      expect(result.valid === (result.reason.length === 0)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020044 end');
    })

    /**
     * @tc.name   testParseMessage020045
     * @tc.number SUB_CCER_PARSEFMT_02_0045
     * @tc.desc   64 KB 载荷解析成功且与便捷方法一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage020045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020045 begin');
      const result: ParseResult = FormEventService.parseMessage('{"data":"' + 'a'.repeat(65536) + '"}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.valid), String(true));
      expect(result.valid).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.data.length),
        String(65536));
      expect(result.data.length).assertEqual(65536);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(FormEventService.parseEventData('{"data":"' + 'a'.repeat(65536) + '"}')), String(result.data));
      expect(FormEventService.parseEventData('{"data":"' + 'a'.repeat(65536) + '"}')).assertEqual(result.data);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage020045 end');
    })

  })
}
