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
import { CommonEventConstants, EventSource } from '../../../main/ets/util/Constants';
import { FormEventService } from '../../../main/ets/feature/FormEventService';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function parseMessageTest() {
  describe('ParseEventDataVolume01Test', () => {

    /**
     * @tc.name   testParseMessage0001
     * @tc.number SUB_CCER_PARSE_0001
     * @tc.desc   消息 "{\"data\":\"InApp\"}" 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0001 begin');
      const result: string = FormEventService.parseEventData('{"data":"InApp"}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(CommonEventConstants.DATA_IN_APP));
      expect(result).assertEqual(CommonEventConstants.DATA_IN_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String(CommonEventConstants.DATA_IN_APP.length));
      expect(result.length).assertEqual(CommonEventConstants.DATA_IN_APP.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_OUT_APP));
      expect(result === CommonEventConstants.DATA_OUT_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0001 end');
    })

    /**
     * @tc.name   testParseMessage0002
     * @tc.number SUB_CCER_PARSE_0002
     * @tc.desc   消息 "{\"data\":\"OutApp\"}" 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0002 begin');
      const result: string = FormEventService.parseEventData('{"data":"OutApp"}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(CommonEventConstants.DATA_OUT_APP));
      expect(result).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String(CommonEventConstants.DATA_OUT_APP.length));
      expect(result.length).assertEqual(CommonEventConstants.DATA_OUT_APP.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_IN_APP));
      expect(result === CommonEventConstants.DATA_IN_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0002 end');
    })

    /**
     * @tc.name   testParseMessage0003
     * @tc.number SUB_CCER_PARSE_0003
     * @tc.desc   消息 "{\"data\":\"Custom\"}" 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0003 begin');
      const result: string = FormEventService.parseEventData('{"data":"Custom"}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Custom'));
      expect(result).assertEqual('Custom');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String('Custom'.length));
      expect(result.length).assertEqual('Custom'.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_OUT_APP));
      expect(result === CommonEventConstants.DATA_OUT_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0003 end');
    })

    /**
     * @tc.name   testParseMessage0004
     * @tc.number SUB_CCER_PARSE_0004
     * @tc.desc   消息 "{\"data\":\"A\"}" 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0004 begin');
      const result: string = FormEventService.parseEventData('{"data":"A"}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('A'));
      expect(result).assertEqual('A');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String('A'.length));
      expect(result.length).assertEqual('A'.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_OUT_APP));
      expect(result === CommonEventConstants.DATA_OUT_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0004 end');
    })

    /**
     * @tc.name   testParseMessage0005
     * @tc.number SUB_CCER_PARSE_0005
     * @tc.desc   消息 "{\"data\":\"AB\"}" 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0005 begin');
      const result: string = FormEventService.parseEventData('{"data":"AB"}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('AB'));
      expect(result).assertEqual('AB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String('AB'.length));
      expect(result.length).assertEqual('AB'.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_OUT_APP));
      expect(result === CommonEventConstants.DATA_OUT_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0005 end');
    })

    /**
     * @tc.name   testParseMessage0006
     * @tc.number SUB_CCER_PARSE_0006
     * @tc.desc   消息 "{\"data\":\"abc\"}" 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0006 begin');
      const result: string = FormEventService.parseEventData('{"data":"abc"}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('abc'));
      expect(result).assertEqual('abc');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String('abc'.length));
      expect(result.length).assertEqual('abc'.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_OUT_APP));
      expect(result === CommonEventConstants.DATA_OUT_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0006 end');
    })

    /**
     * @tc.name   testParseMessage0007
     * @tc.number SUB_CCER_PARSE_0007
     * @tc.desc   消息 "{\"data\":\"0123\"}" 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0007 begin');
      const result: string = FormEventService.parseEventData('{"data":"0123"}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0123'));
      expect(result).assertEqual('0123');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String('0123'.length));
      expect(result.length).assertEqual('0123'.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_OUT_APP));
      expect(result === CommonEventConstants.DATA_OUT_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0007 end');
    })

    /**
     * @tc.name   testParseMessage0008
     * @tc.number SUB_CCER_PARSE_0008
     * @tc.desc   消息 "{\"data\":\"0\"}" 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0008 begin');
      const result: string = FormEventService.parseEventData('{"data":"0"}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(result).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String('0'.length));
      expect(result.length).assertEqual('0'.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_OUT_APP));
      expect(result === CommonEventConstants.DATA_OUT_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0008 end');
    })

    /**
     * @tc.name   testParseMessage0009
     * @tc.number SUB_CCER_PARSE_0009
     * @tc.desc   消息 "{\"data\":\"false\"}" 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0009 begin');
      const result: string = FormEventService.parseEventData('{"data":"false"}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String('false'.length));
      expect(result.length).assertEqual('false'.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_OUT_APP));
      expect(result === CommonEventConstants.DATA_OUT_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0009 end');
    })

    /**
     * @tc.name   testParseMessage0010
     * @tc.number SUB_CCER_PARSE_0010
     * @tc.desc   消息 "{\"data\":\"null\"}" 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0010 begin');
      const result: string = FormEventService.parseEventData('{"data":"null"}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('null'));
      expect(result).assertEqual('null');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String('null'.length));
      expect(result.length).assertEqual('null'.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_OUT_APP));
      expect(result === CommonEventConstants.DATA_OUT_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0010 end');
    })

    /**
     * @tc.name   testParseMessage0011
     * @tc.number SUB_CCER_PARSE_0011
     * @tc.desc   消息 "{\"data\":\"a b\"}" 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0011 begin');
      const result: string = FormEventService.parseEventData('{"data":"a b"}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a b'));
      expect(result).assertEqual('a b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String('a b'.length));
      expect(result.length).assertEqual('a b'.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_OUT_APP));
      expect(result === CommonEventConstants.DATA_OUT_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0011 end');
    })

    /**
     * @tc.name   testParseMessage0012
     * @tc.number SUB_CCER_PARSE_0012
     * @tc.desc   消息 "{\"data\":\"a  b\"}" 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0012 begin');
      const result: string = FormEventService.parseEventData('{"data":"a  b"}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a  b'));
      expect(result).assertEqual('a  b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String('a  b'.length));
      expect(result.length).assertEqual('a  b'.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_OUT_APP));
      expect(result === CommonEventConstants.DATA_OUT_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0012 end');
    })

    /**
     * @tc.name   testParseMessage0013
     * @tc.number SUB_CCER_PARSE_0013
     * @tc.desc   消息 "{\"data\":\" x \"}" 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0013 begin');
      const result: string = FormEventService.parseEventData('{"data":" x "}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(' x '));
      expect(result).assertEqual(' x ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String(' x '.length));
      expect(result.length).assertEqual(' x '.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_OUT_APP));
      expect(result === CommonEventConstants.DATA_OUT_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0013 end');
    })

    /**
     * @tc.name   testParseMessage0014
     * @tc.number SUB_CCER_PARSE_0014
     * @tc.desc   消息 "{\"data\":\"InApp \"}" 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0014 begin');
      const result: string = FormEventService.parseEventData('{"data":"InApp "}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('InApp '));
      expect(result).assertEqual('InApp ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String('InApp '.length));
      expect(result.length).assertEqual('InApp '.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_OUT_APP));
      expect(result === CommonEventConstants.DATA_OUT_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0014 end');
    })

    /**
     * @tc.name   testParseMessage0015
     * @tc.number SUB_CCER_PARSE_0015
     * @tc.desc   消息 "{\"data\":\" InApp\"}" 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0015 begin');
      const result: string = FormEventService.parseEventData('{"data":" InApp"}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(' InApp'));
      expect(result).assertEqual(' InApp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String(' InApp'.length));
      expect(result.length).assertEqual(' InApp'.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_OUT_APP));
      expect(result === CommonEventConstants.DATA_OUT_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0015 end');
    })

    /**
     * @tc.name   testParseMessage0016
     * @tc.number SUB_CCER_PARSE_0016
     * @tc.desc   消息 "{\"data\":\"inapp\"}" 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0016 begin');
      const result: string = FormEventService.parseEventData('{"data":"inapp"}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('inapp'));
      expect(result).assertEqual('inapp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String('inapp'.length));
      expect(result.length).assertEqual('inapp'.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_OUT_APP));
      expect(result === CommonEventConstants.DATA_OUT_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0016 end');
    })

    /**
     * @tc.name   testParseMessage0017
     * @tc.number SUB_CCER_PARSE_0017
     * @tc.desc   消息 "{\"data\":\"INAPP\"}" 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0017 begin');
      const result: string = FormEventService.parseEventData('{"data":"INAPP"}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('INAPP'));
      expect(result).assertEqual('INAPP');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String('INAPP'.length));
      expect(result.length).assertEqual('INAPP'.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_OUT_APP));
      expect(result === CommonEventConstants.DATA_OUT_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0017 end');
    })

    /**
     * @tc.name   testParseMessage0018
     * @tc.number SUB_CCER_PARSE_0018
     * @tc.desc   消息 "{\"data\":\"OutApp \"}" 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0018 begin');
      const result: string = FormEventService.parseEventData('{"data":"OutApp "}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('OutApp '));
      expect(result).assertEqual('OutApp ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String('OutApp '.length));
      expect(result.length).assertEqual('OutApp '.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_OUT_APP));
      expect(result === CommonEventConstants.DATA_OUT_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0018 end');
    })

    /**
     * @tc.name   testParseMessage0019
     * @tc.number SUB_CCER_PARSE_0019
     * @tc.desc   消息 "{\"data\":\"OutAppX\"}" 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0019 begin');
      const result: string = FormEventService.parseEventData('{"data":"OutAppX"}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('OutAppX'));
      expect(result).assertEqual('OutAppX');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String('OutAppX'.length));
      expect(result.length).assertEqual('OutAppX'.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_OUT_APP));
      expect(result === CommonEventConstants.DATA_OUT_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0019 end');
    })

    /**
     * @tc.name   testParseMessage0020
     * @tc.number SUB_CCER_PARSE_0020
     * @tc.desc   消息 "{\"data\":\"OutAp\"}" 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0020 begin');
      const result: string = FormEventService.parseEventData('{"data":"OutAp"}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('OutAp'));
      expect(result).assertEqual('OutAp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String('OutAp'.length));
      expect(result.length).assertEqual('OutAp'.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_OUT_APP));
      expect(result === CommonEventConstants.DATA_OUT_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0020 end');
    })

    /**
     * @tc.name   testParseMessage0021
     * @tc.number SUB_CCER_PARSE_0021
     * @tc.desc   消息 "{\"data\":\"中文数据\"}" 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0021 begin');
      const result: string = FormEventService.parseEventData('{"data":"中文数据"}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('中文数据'));
      expect(result).assertEqual('中文数据');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String('中文数据'.length));
      expect(result.length).assertEqual('中文数据'.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_OUT_APP));
      expect(result === CommonEventConstants.DATA_OUT_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0021 end');
    })

    /**
     * @tc.name   testParseMessage0022
     * @tc.number SUB_CCER_PARSE_0022
     * @tc.desc   消息 "{\"data\":\"emoji\"}" 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0022 begin');
      const result: string = FormEventService.parseEventData('{"data":"emoji"}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('emoji'));
      expect(result).assertEqual('emoji');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String('emoji'.length));
      expect(result.length).assertEqual('emoji'.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_OUT_APP));
      expect(result === CommonEventConstants.DATA_OUT_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0022 end');
    })

    /**
     * @tc.name   testParseMessage0023
     * @tc.number SUB_CCER_PARSE_0023
     * @tc.desc   消息 "{\"data\":\"{{}}\"}" 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0023 begin');
      const result: string = FormEventService.parseEventData('{"data":"{{}}"}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('{{}}'));
      expect(result).assertEqual('{{}}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String('{{}}'.length));
      expect(result.length).assertEqual('{{}}'.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_OUT_APP));
      expect(result === CommonEventConstants.DATA_OUT_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0023 end');
    })

    /**
     * @tc.name   testParseMessage0024
     * @tc.number SUB_CCER_PARSE_0024
     * @tc.desc   消息 "{\"data\":\"a:b\"}" 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0024 begin');
      const result: string = FormEventService.parseEventData('{"data":"a:b"}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a:b'));
      expect(result).assertEqual('a:b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String('a:b'.length));
      expect(result.length).assertEqual('a:b'.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_OUT_APP));
      expect(result === CommonEventConstants.DATA_OUT_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0024 end');
    })

    /**
     * @tc.name   testParseMessage0025
     * @tc.number SUB_CCER_PARSE_0025
     * @tc.desc   消息 "{\"data\":\"a,b\"}" 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0025 begin');
      const result: string = FormEventService.parseEventData('{"data":"a,b"}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a,b'));
      expect(result).assertEqual('a,b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String('a,b'.length));
      expect(result.length).assertEqual('a,b'.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_OUT_APP));
      expect(result === CommonEventConstants.DATA_OUT_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0025 end');
    })

    /**
     * @tc.name   testParseMessage0026
     * @tc.number SUB_CCER_PARSE_0026
     * @tc.desc   消息 "{\"message\":\"click\",\"data\":\"InApp\"}" 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0026 begin');
      const result: string = FormEventService.parseEventData('{"message":"click","data":"InApp"}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(CommonEventConstants.DATA_IN_APP));
      expect(result).assertEqual(CommonEventConstants.DATA_IN_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String(CommonEventConstants.DATA_IN_APP.length));
      expect(result.length).assertEqual(CommonEventConstants.DATA_IN_APP.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_OUT_APP));
      expect(result === CommonEventConstants.DATA_OUT_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0026 end');
    })

    /**
     * @tc.name   testParseMessage0027
     * @tc.number SUB_CCER_PARSE_0027
     * @tc.desc   消息 "{\"message\":\"click\",\"data\":\"OutApp\"}" 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0027 begin');
      const result: string = FormEventService.parseEventData('{"message":"click","data":"OutApp"}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(CommonEventConstants.DATA_OUT_APP));
      expect(result).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String(CommonEventConstants.DATA_OUT_APP.length));
      expect(result.length).assertEqual(CommonEventConstants.DATA_OUT_APP.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_IN_APP));
      expect(result === CommonEventConstants.DATA_IN_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0027 end');
    })

    /**
     * @tc.name   testParseMessage0028
     * @tc.number SUB_CCER_PARSE_0028
     * @tc.desc   消息 "{\"code\":1001,\"data\":\"InApp\"}" 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0028 begin');
      const result: string = FormEventService.parseEventData('{"code":1001,"data":"InApp"}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(CommonEventConstants.DATA_IN_APP));
      expect(result).assertEqual(CommonEventConstants.DATA_IN_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String(CommonEventConstants.DATA_IN_APP.length));
      expect(result.length).assertEqual(CommonEventConstants.DATA_IN_APP.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_OUT_APP));
      expect(result === CommonEventConstants.DATA_OUT_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0028 end');
    })

    /**
     * @tc.name   testParseMessage0029
     * @tc.number SUB_CCER_PARSE_0029
     * @tc.desc   消息 "{\"data\":\"InApp\",\"code\":1002}" 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0029 begin');
      const result: string = FormEventService.parseEventData('{"data":"InApp","code":1002}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(CommonEventConstants.DATA_IN_APP));
      expect(result).assertEqual(CommonEventConstants.DATA_IN_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String(CommonEventConstants.DATA_IN_APP.length));
      expect(result.length).assertEqual(CommonEventConstants.DATA_IN_APP.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_OUT_APP));
      expect(result === CommonEventConstants.DATA_OUT_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0029 end');
    })

    /**
     * @tc.name   testParseMessage0030
     * @tc.number SUB_CCER_PARSE_0030
     * @tc.desc   消息 "{\"code\":1001,\"message\":\"m\",\"data\":\"X\"}" 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0030 begin');
      const result: string = FormEventService.parseEventData('{"code":1001,"message":"m","data":"X"}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('X'));
      expect(result).assertEqual('X');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String('X'.length));
      expect(result.length).assertEqual('X'.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_OUT_APP));
      expect(result === CommonEventConstants.DATA_OUT_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0030 end');
    })

    /**
     * @tc.name   testParseMessage0031
     * @tc.number SUB_CCER_PARSE_0031
     * @tc.desc   消息 "{ \"data\" : \"InApp\" }" 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0031 begin');
      const result: string = FormEventService.parseEventData('{ "data" : "InApp" }');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(CommonEventConstants.DATA_IN_APP));
      expect(result).assertEqual(CommonEventConstants.DATA_IN_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String(CommonEventConstants.DATA_IN_APP.length));
      expect(result.length).assertEqual(CommonEventConstants.DATA_IN_APP.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_OUT_APP));
      expect(result === CommonEventConstants.DATA_OUT_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0031 end');
    })

    /**
     * @tc.name   testParseMessage0032
     * @tc.number SUB_CCER_PARSE_0032
     * @tc.desc   消息 "{ \"data\":\"OutApp\" }" 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0032 begin');
      const result: string = FormEventService.parseEventData('{ "data":"OutApp" }');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(CommonEventConstants.DATA_OUT_APP));
      expect(result).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String(CommonEventConstants.DATA_OUT_APP.length));
      expect(result.length).assertEqual(CommonEventConstants.DATA_OUT_APP.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_IN_APP));
      expect(result === CommonEventConstants.DATA_IN_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0032 end');
    })

    /**
     * @tc.name   testParseMessage0033
     * @tc.number SUB_CCER_PARSE_0033
     * @tc.desc   消息 "{\"data\" :\"A\"}" 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0033 begin');
      const result: string = FormEventService.parseEventData('{"data" :"A"}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('A'));
      expect(result).assertEqual('A');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String('A'.length));
      expect(result.length).assertEqual('A'.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_OUT_APP));
      expect(result === CommonEventConstants.DATA_OUT_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0033 end');
    })

    /**
     * @tc.name   testParseMessage0034
     * @tc.number SUB_CCER_PARSE_0034
     * @tc.desc   消息 "{}" 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0034 begin');
      const result: string = FormEventService.parseEventData('{}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(CommonEventConstants.DATA_OUT_APP));
      expect(result).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String(CommonEventConstants.DATA_OUT_APP.length));
      expect(result.length).assertEqual(CommonEventConstants.DATA_OUT_APP.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_IN_APP));
      expect(result === CommonEventConstants.DATA_IN_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0034 end');
    })

    /**
     * @tc.name   testParseMessage0035
     * @tc.number SUB_CCER_PARSE_0035
     * @tc.desc   消息 "{\"message\":\"only\"}" 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0035 begin');
      const result: string = FormEventService.parseEventData('{"message":"only"}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(CommonEventConstants.DATA_OUT_APP));
      expect(result).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String(CommonEventConstants.DATA_OUT_APP.length));
      expect(result.length).assertEqual(CommonEventConstants.DATA_OUT_APP.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_IN_APP));
      expect(result === CommonEventConstants.DATA_IN_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0035 end');
    })

    /**
     * @tc.name   testParseMessage0036
     * @tc.number SUB_CCER_PARSE_0036
     * @tc.desc   消息 "{\"code\":1001}" 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0036 begin');
      const result: string = FormEventService.parseEventData('{"code":1001}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(CommonEventConstants.DATA_OUT_APP));
      expect(result).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String(CommonEventConstants.DATA_OUT_APP.length));
      expect(result.length).assertEqual(CommonEventConstants.DATA_OUT_APP.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_IN_APP));
      expect(result === CommonEventConstants.DATA_IN_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0036 end');
    })

    /**
     * @tc.name   testParseMessage0037
     * @tc.number SUB_CCER_PARSE_0037
     * @tc.desc   消息 "{\"message\":\"\",\"code\":0}" 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0037 begin');
      const result: string = FormEventService.parseEventData('{"message":"","code":0}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(CommonEventConstants.DATA_OUT_APP));
      expect(result).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String(CommonEventConstants.DATA_OUT_APP.length));
      expect(result.length).assertEqual(CommonEventConstants.DATA_OUT_APP.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_IN_APP));
      expect(result === CommonEventConstants.DATA_IN_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0037 end');
    })

    /**
     * @tc.name   testParseMessage0038
     * @tc.number SUB_CCER_PARSE_0038
     * @tc.desc   消息 "{\"data\":\"\"}" 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0038 begin');
      const result: string = FormEventService.parseEventData('{"data":""}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(CommonEventConstants.DATA_OUT_APP));
      expect(result).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String(CommonEventConstants.DATA_OUT_APP.length));
      expect(result.length).assertEqual(CommonEventConstants.DATA_OUT_APP.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_IN_APP));
      expect(result === CommonEventConstants.DATA_IN_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0038 end');
    })

    /**
     * @tc.name   testParseMessage0039
     * @tc.number SUB_CCER_PARSE_0039
     * @tc.desc   消息 "{\"data\":\"\",\"message\":\"x\"}" 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0039 begin');
      const result: string = FormEventService.parseEventData('{"data":"","message":"x"}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(CommonEventConstants.DATA_OUT_APP));
      expect(result).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String(CommonEventConstants.DATA_OUT_APP.length));
      expect(result.length).assertEqual(CommonEventConstants.DATA_OUT_APP.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_IN_APP));
      expect(result === CommonEventConstants.DATA_IN_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0039 end');
    })

    /**
     * @tc.name   testParseMessage0040
     * @tc.number SUB_CCER_PARSE_0040
     * @tc.desc   消息 "{\"data\":\"\" ,\"code\":1}" 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0040 begin');
      const result: string = FormEventService.parseEventData('{"data":"" ,"code":1}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(CommonEventConstants.DATA_OUT_APP));
      expect(result).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String(CommonEventConstants.DATA_OUT_APP.length));
      expect(result.length).assertEqual(CommonEventConstants.DATA_OUT_APP.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_IN_APP));
      expect(result === CommonEventConstants.DATA_IN_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0040 end');
    })

    /**
     * @tc.name   testParseMessage0041
     * @tc.number SUB_CCER_PARSE_0041
     * @tc.desc   消息 "{\"Data\":\"InApp\"}" 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0041 begin');
      const result: string = FormEventService.parseEventData('{"Data":"InApp"}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(CommonEventConstants.DATA_OUT_APP));
      expect(result).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String(CommonEventConstants.DATA_OUT_APP.length));
      expect(result.length).assertEqual(CommonEventConstants.DATA_OUT_APP.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_IN_APP));
      expect(result === CommonEventConstants.DATA_IN_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0041 end');
    })

    /**
     * @tc.name   testParseMessage0042
     * @tc.number SUB_CCER_PARSE_0042
     * @tc.desc   消息 "{\"DATA\":\"InApp\"}" 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0042 begin');
      const result: string = FormEventService.parseEventData('{"DATA":"InApp"}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(CommonEventConstants.DATA_OUT_APP));
      expect(result).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String(CommonEventConstants.DATA_OUT_APP.length));
      expect(result.length).assertEqual(CommonEventConstants.DATA_OUT_APP.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_IN_APP));
      expect(result === CommonEventConstants.DATA_IN_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0042 end');
    })

    /**
     * @tc.name   testParseMessage0043
     * @tc.number SUB_CCER_PARSE_0043
     * @tc.desc   消息 "{\"a\":{\"data\":\"InApp\"}}" 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0043 begin');
      const result: string = FormEventService.parseEventData('{"a":{"data":"InApp"}}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(CommonEventConstants.DATA_OUT_APP));
      expect(result).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String(CommonEventConstants.DATA_OUT_APP.length));
      expect(result.length).assertEqual(CommonEventConstants.DATA_OUT_APP.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_IN_APP));
      expect(result === CommonEventConstants.DATA_IN_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0043 end');
    })

    /**
     * @tc.name   testParseMessage0044
     * @tc.number SUB_CCER_PARSE_0044
     * @tc.desc   消息 "{\"data\":\"InApp\"} extra" 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0044 begin');
      const result: string = FormEventService.parseEventData('{"data":"InApp"} extra');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(CommonEventConstants.DATA_OUT_APP));
      expect(result).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String(CommonEventConstants.DATA_OUT_APP.length));
      expect(result.length).assertEqual(CommonEventConstants.DATA_OUT_APP.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_IN_APP));
      expect(result === CommonEventConstants.DATA_IN_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0044 end');
    })

    /**
     * @tc.name   testParseMessage0045
     * @tc.number SUB_CCER_PARSE_0045
     * @tc.desc   消息 "{\"data\":\"InApp\"" 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0045 begin');
      const result: string = FormEventService.parseEventData('{"data":"InApp"');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(CommonEventConstants.DATA_OUT_APP));
      expect(result).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String(CommonEventConstants.DATA_OUT_APP.length));
      expect(result.length).assertEqual(CommonEventConstants.DATA_OUT_APP.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_IN_APP));
      expect(result === CommonEventConstants.DATA_IN_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0045 end');
    })

    /**
     * @tc.name   testParseMessage0046
     * @tc.number SUB_CCER_PARSE_0046
     * @tc.desc   消息 "{\"data\":" 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0046 begin');
      const result: string = FormEventService.parseEventData('{"data":');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(CommonEventConstants.DATA_OUT_APP));
      expect(result).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String(CommonEventConstants.DATA_OUT_APP.length));
      expect(result.length).assertEqual(CommonEventConstants.DATA_OUT_APP.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_IN_APP));
      expect(result === CommonEventConstants.DATA_IN_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0046 end');
    })

    /**
     * @tc.name   testParseMessage0047
     * @tc.number SUB_CCER_PARSE_0047
     * @tc.desc   消息 "{" 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0047 begin');
      const result: string = FormEventService.parseEventData('{');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(CommonEventConstants.DATA_OUT_APP));
      expect(result).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String(CommonEventConstants.DATA_OUT_APP.length));
      expect(result.length).assertEqual(CommonEventConstants.DATA_OUT_APP.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_IN_APP));
      expect(result === CommonEventConstants.DATA_IN_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0047 end');
    })

    /**
     * @tc.name   testParseMessage0048
     * @tc.number SUB_CCER_PARSE_0048
     * @tc.desc   消息 "not json" 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0048 begin');
      const result: string = FormEventService.parseEventData('not json');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(CommonEventConstants.DATA_OUT_APP));
      expect(result).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String(CommonEventConstants.DATA_OUT_APP.length));
      expect(result.length).assertEqual(CommonEventConstants.DATA_OUT_APP.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_IN_APP));
      expect(result === CommonEventConstants.DATA_IN_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0048 end');
    })

    /**
     * @tc.name   testParseMessage0049
     * @tc.number SUB_CCER_PARSE_0049
     * @tc.desc   消息 "" 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0049 begin');
      const result: string = FormEventService.parseEventData('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(CommonEventConstants.DATA_OUT_APP));
      expect(result).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String(CommonEventConstants.DATA_OUT_APP.length));
      expect(result.length).assertEqual(CommonEventConstants.DATA_OUT_APP.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_IN_APP));
      expect(result === CommonEventConstants.DATA_IN_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0049 end');
    })

    /**
     * @tc.name   testParseMessage0050
     * @tc.number SUB_CCER_PARSE_0050
     * @tc.desc   消息 " " 的解析结果符合规则
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0050 begin');
      const result: string = FormEventService.parseEventData(' ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(CommonEventConstants.DATA_OUT_APP));
      expect(result).assertEqual(CommonEventConstants.DATA_OUT_APP);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.length), String(CommonEventConstants.DATA_OUT_APP.length));
      expect(result.length).assertEqual(CommonEventConstants.DATA_OUT_APP.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === CommonEventConstants.DATA_IN_APP));
      expect(result === CommonEventConstants.DATA_IN_APP).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0050 end');
    })

    /**
     * @tc.name   testParseMessage0051
     * @tc.number SUB_CCER_PARSE_0051
     * @tc.desc   非法类型、非对象 JSON 与单空格数据同例校验回落分支
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMessage0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0051 begin');
      const nullData: string = FormEventService.parseEventData('{"data":null}');
      expect(nullData).assertEqual(CommonEventConstants.DATA_OUT_APP);
      const arrayMessage: string = FormEventService.parseEventData('[1,2,3]');
      expect(arrayMessage).assertEqual(CommonEventConstants.DATA_OUT_APP);
      const primitive: string = FormEventService.parseEventData('"OutApp"');
      expect(primitive).assertEqual(CommonEventConstants.DATA_OUT_APP);
      const blank: string = FormEventService.parseEventData('{"data":" "}');
      expect(blank).assertEqual(' ');
      expect(blank.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseMessage0051 end');
    })
  })
}
