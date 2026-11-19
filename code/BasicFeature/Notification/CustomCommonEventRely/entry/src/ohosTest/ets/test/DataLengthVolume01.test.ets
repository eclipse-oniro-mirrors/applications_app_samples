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
import { CommonEventPublisher } from '../../../main/ets/feature/CommonEventPublisher';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function dataLengthTest() {
  describe('DataLengthVolume01Test', () => {

    /**
     * @tc.name   testLengthGate0001
     * @tc.number SUB_CCER_DLEN_0001
     * @tc.desc   长度为 0 的事件数据校验结果为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLengthGate0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0001 begin');
      const data: string = 'a'.repeat(0);
      const result: boolean = CommonEventPublisher.isDataLengthValid(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data + 'a')), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data + 'a')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data.substring(1))), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data.substring(1))).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0001 end');
    })

    /**
     * @tc.name   testLengthGate0002
     * @tc.number SUB_CCER_DLEN_0002
     * @tc.desc   长度为 1 的事件数据校验结果为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLengthGate0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0002 begin');
      const data: string = 'a'.repeat(1);
      const result: boolean = CommonEventPublisher.isDataLengthValid(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data + 'a')), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data + 'a')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data.substring(1))), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data.substring(1))).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0002 end');
    })

    /**
     * @tc.name   testLengthGate0003
     * @tc.number SUB_CCER_DLEN_0003
     * @tc.desc   长度为 2 的事件数据校验结果为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLengthGate0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0003 begin');
      const data: string = 'a'.repeat(2);
      const result: boolean = CommonEventPublisher.isDataLengthValid(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data + 'a')), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data + 'a')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data.substring(1))), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data.substring(1))).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0003 end');
    })

    /**
     * @tc.name   testLengthGate0004
     * @tc.number SUB_CCER_DLEN_0004
     * @tc.desc   长度为 3 的事件数据校验结果为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLengthGate0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0004 begin');
      const data: string = 'a'.repeat(3);
      const result: boolean = CommonEventPublisher.isDataLengthValid(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data + 'a')), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data + 'a')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data.substring(1))), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data.substring(1))).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0004 end');
    })

    /**
     * @tc.name   testLengthGate0005
     * @tc.number SUB_CCER_DLEN_0005
     * @tc.desc   长度为 4 的事件数据校验结果为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLengthGate0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0005 begin');
      const data: string = 'a'.repeat(4);
      const result: boolean = CommonEventPublisher.isDataLengthValid(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data + 'a')), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data + 'a')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data.substring(1))), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data.substring(1))).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0005 end');
    })

    /**
     * @tc.name   testLengthGate0006
     * @tc.number SUB_CCER_DLEN_0006
     * @tc.desc   长度为 7 的事件数据校验结果为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLengthGate0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0006 begin');
      const data: string = 'a'.repeat(7);
      const result: boolean = CommonEventPublisher.isDataLengthValid(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data + 'a')), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data + 'a')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data.substring(1))), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data.substring(1))).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0006 end');
    })

    /**
     * @tc.name   testLengthGate0007
     * @tc.number SUB_CCER_DLEN_0007
     * @tc.desc   长度为 8 的事件数据校验结果为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLengthGate0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0007 begin');
      const data: string = 'a'.repeat(8);
      const result: boolean = CommonEventPublisher.isDataLengthValid(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data + 'a')), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data + 'a')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data.substring(1))), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data.substring(1))).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0007 end');
    })

    /**
     * @tc.name   testLengthGate0008
     * @tc.number SUB_CCER_DLEN_0008
     * @tc.desc   长度为 15 的事件数据校验结果为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLengthGate0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0008 begin');
      const data: string = 'a'.repeat(15);
      const result: boolean = CommonEventPublisher.isDataLengthValid(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data + 'a')), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data + 'a')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data.substring(1))), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data.substring(1))).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0008 end');
    })

    /**
     * @tc.name   testLengthGate0009
     * @tc.number SUB_CCER_DLEN_0009
     * @tc.desc   长度为 16 的事件数据校验结果为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLengthGate0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0009 begin');
      const data: string = 'a'.repeat(16);
      const result: boolean = CommonEventPublisher.isDataLengthValid(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data + 'a')), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data + 'a')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data.substring(1))), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data.substring(1))).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0009 end');
    })

    /**
     * @tc.name   testLengthGate0010
     * @tc.number SUB_CCER_DLEN_0010
     * @tc.desc   长度为 63 的事件数据校验结果为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLengthGate0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0010 begin');
      const data: string = 'a'.repeat(63);
      const result: boolean = CommonEventPublisher.isDataLengthValid(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data + 'a')), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data + 'a')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data.substring(1))), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data.substring(1))).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0010 end');
    })

    /**
     * @tc.name   testLengthGate0011
     * @tc.number SUB_CCER_DLEN_0011
     * @tc.desc   长度为 64 的事件数据校验结果为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLengthGate0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0011 begin');
      const data: string = 'a'.repeat(64);
      const result: boolean = CommonEventPublisher.isDataLengthValid(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data + 'a')), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data + 'a')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data.substring(1))), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data.substring(1))).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0011 end');
    })

    /**
     * @tc.name   testLengthGate0012
     * @tc.number SUB_CCER_DLEN_0012
     * @tc.desc   长度为 100 的事件数据校验结果为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLengthGate0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0012 begin');
      const data: string = 'a'.repeat(100);
      const result: boolean = CommonEventPublisher.isDataLengthValid(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data + 'a')), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data + 'a')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data.substring(1))), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data.substring(1))).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0012 end');
    })

    /**
     * @tc.name   testLengthGate0013
     * @tc.number SUB_CCER_DLEN_0013
     * @tc.desc   长度为 127 的事件数据校验结果为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLengthGate0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0013 begin');
      const data: string = 'a'.repeat(127);
      const result: boolean = CommonEventPublisher.isDataLengthValid(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data + 'a')), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data + 'a')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data.substring(1))), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data.substring(1))).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0013 end');
    })

    /**
     * @tc.name   testLengthGate0014
     * @tc.number SUB_CCER_DLEN_0014
     * @tc.desc   长度为 128 的事件数据校验结果为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLengthGate0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0014 begin');
      const data: string = 'a'.repeat(128);
      const result: boolean = CommonEventPublisher.isDataLengthValid(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data + 'a')), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data + 'a')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data.substring(1))), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data.substring(1))).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0014 end');
    })

    /**
     * @tc.name   testLengthGate0015
     * @tc.number SUB_CCER_DLEN_0015
     * @tc.desc   长度为 255 的事件数据校验结果为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLengthGate0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0015 begin');
      const data: string = 'a'.repeat(255);
      const result: boolean = CommonEventPublisher.isDataLengthValid(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data + 'a')), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data + 'a')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data.substring(1))), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data.substring(1))).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0015 end');
    })

    /**
     * @tc.name   testLengthGate0016
     * @tc.number SUB_CCER_DLEN_0016
     * @tc.desc   长度为 256 的事件数据校验结果为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLengthGate0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0016 begin');
      const data: string = 'a'.repeat(256);
      const result: boolean = CommonEventPublisher.isDataLengthValid(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data + 'a')), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data + 'a')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data.substring(1))), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data.substring(1))).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0016 end');
    })

    /**
     * @tc.name   testLengthGate0017
     * @tc.number SUB_CCER_DLEN_0017
     * @tc.desc   长度为 511 的事件数据校验结果为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLengthGate0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0017 begin');
      const data: string = 'a'.repeat(511);
      const result: boolean = CommonEventPublisher.isDataLengthValid(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data + 'a')), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data + 'a')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data.substring(1))), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data.substring(1))).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0017 end');
    })

    /**
     * @tc.name   testLengthGate0018
     * @tc.number SUB_CCER_DLEN_0018
     * @tc.desc   长度为 512 的事件数据校验结果为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLengthGate0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0018 begin');
      const data: string = 'a'.repeat(512);
      const result: boolean = CommonEventPublisher.isDataLengthValid(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data + 'a')), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data + 'a')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data.substring(1))), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data.substring(1))).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0018 end');
    })

    /**
     * @tc.name   testLengthGate0019
     * @tc.number SUB_CCER_DLEN_0019
     * @tc.desc   长度为 1023 的事件数据校验结果为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLengthGate0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0019 begin');
      const data: string = 'a'.repeat(1023);
      const result: boolean = CommonEventPublisher.isDataLengthValid(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data + 'a')), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data + 'a')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data.substring(1))), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data.substring(1))).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0019 end');
    })

    /**
     * @tc.name   testLengthGate0020
     * @tc.number SUB_CCER_DLEN_0020
     * @tc.desc   长度为 1024 的事件数据校验结果为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLengthGate0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0020 begin');
      const data: string = 'a'.repeat(1024);
      const result: boolean = CommonEventPublisher.isDataLengthValid(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data + 'a')), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data + 'a')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data.substring(1))), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data.substring(1))).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0020 end');
    })

    /**
     * @tc.name   testLengthGate0021
     * @tc.number SUB_CCER_DLEN_0021
     * @tc.desc   长度为 2047 的事件数据校验结果为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLengthGate0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0021 begin');
      const data: string = 'a'.repeat(2047);
      const result: boolean = CommonEventPublisher.isDataLengthValid(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data + 'a')), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data + 'a')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data.substring(1))), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data.substring(1))).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0021 end');
    })

    /**
     * @tc.name   testLengthGate0022
     * @tc.number SUB_CCER_DLEN_0022
     * @tc.desc   长度为 2048 的事件数据校验结果为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLengthGate0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0022 begin');
      const data: string = 'a'.repeat(2048);
      const result: boolean = CommonEventPublisher.isDataLengthValid(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data + 'a')), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data + 'a')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data.substring(1))), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data.substring(1))).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0022 end');
    })

    /**
     * @tc.name   testLengthGate0023
     * @tc.number SUB_CCER_DLEN_0023
     * @tc.desc   长度为 4095 的事件数据校验结果为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLengthGate0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0023 begin');
      const data: string = 'a'.repeat(4095);
      const result: boolean = CommonEventPublisher.isDataLengthValid(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data + 'a')), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data + 'a')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data.substring(1))), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data.substring(1))).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0023 end');
    })

    /**
     * @tc.name   testLengthGate0024
     * @tc.number SUB_CCER_DLEN_0024
     * @tc.desc   长度为 4096 的事件数据校验结果为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLengthGate0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0024 begin');
      const data: string = 'a'.repeat(4096);
      const result: boolean = CommonEventPublisher.isDataLengthValid(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data + 'a')), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data + 'a')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data.substring(1))), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data.substring(1))).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0024 end');
    })

    /**
     * @tc.name   testLengthGate0025
     * @tc.number SUB_CCER_DLEN_0025
     * @tc.desc   长度为 8191 的事件数据校验结果为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLengthGate0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0025 begin');
      const data: string = 'a'.repeat(8191);
      const result: boolean = CommonEventPublisher.isDataLengthValid(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data + 'a')), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data + 'a')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data.substring(1))), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data.substring(1))).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0025 end');
    })

    /**
     * @tc.name   testLengthGate0026
     * @tc.number SUB_CCER_DLEN_0026
     * @tc.desc   长度为 8192 的事件数据校验结果为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLengthGate0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0026 begin');
      const data: string = 'a'.repeat(8192);
      const result: boolean = CommonEventPublisher.isDataLengthValid(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data + 'a')), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data + 'a')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data.substring(1))), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data.substring(1))).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0026 end');
    })

    /**
     * @tc.name   testLengthGate0027
     * @tc.number SUB_CCER_DLEN_0027
     * @tc.desc   长度为 16383 的事件数据校验结果为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLengthGate0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0027 begin');
      const data: string = 'a'.repeat(16383);
      const result: boolean = CommonEventPublisher.isDataLengthValid(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data + 'a')), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data + 'a')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data.substring(1))), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data.substring(1))).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0027 end');
    })

    /**
     * @tc.name   testLengthGate0028
     * @tc.number SUB_CCER_DLEN_0028
     * @tc.desc   长度为 16384 的事件数据校验结果为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLengthGate0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0028 begin');
      const data: string = 'a'.repeat(16384);
      const result: boolean = CommonEventPublisher.isDataLengthValid(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data + 'a')), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data + 'a')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data.substring(1))), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data.substring(1))).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0028 end');
    })

    /**
     * @tc.name   testLengthGate0029
     * @tc.number SUB_CCER_DLEN_0029
     * @tc.desc   长度为 32767 的事件数据校验结果为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLengthGate0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0029 begin');
      const data: string = 'a'.repeat(32767);
      const result: boolean = CommonEventPublisher.isDataLengthValid(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data + 'a')), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data + 'a')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data.substring(1))), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data.substring(1))).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0029 end');
    })

    /**
     * @tc.name   testLengthGate0030
     * @tc.number SUB_CCER_DLEN_0030
     * @tc.desc   长度为 32768 的事件数据校验结果为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLengthGate0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0030 begin');
      const data: string = 'a'.repeat(32768);
      const result: boolean = CommonEventPublisher.isDataLengthValid(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data + 'a')), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data + 'a')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data.substring(1))), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data.substring(1))).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0030 end');
    })

    /**
     * @tc.name   testLengthGate0031
     * @tc.number SUB_CCER_DLEN_0031
     * @tc.desc   长度为 49152 的事件数据校验结果为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLengthGate0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0031 begin');
      const data: string = 'a'.repeat(49152);
      const result: boolean = CommonEventPublisher.isDataLengthValid(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data + 'a')), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data + 'a')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data.substring(1))), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data.substring(1))).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0031 end');
    })

    /**
     * @tc.name   testLengthGate0032
     * @tc.number SUB_CCER_DLEN_0032
     * @tc.desc   长度为 65534 的事件数据校验结果为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLengthGate0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0032 begin');
      const data: string = 'a'.repeat(65534);
      const result: boolean = CommonEventPublisher.isDataLengthValid(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data + 'a')), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data + 'a')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data.substring(1))), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data.substring(1))).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0032 end');
    })

    /**
     * @tc.name   testLengthGate0033
     * @tc.number SUB_CCER_DLEN_0033
     * @tc.desc   长度为 65535 的事件数据校验结果为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLengthGate0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0033 begin');
      const data: string = 'a'.repeat(65535);
      const result: boolean = CommonEventPublisher.isDataLengthValid(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data + 'a')), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data + 'a')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data.substring(1))), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data.substring(1))).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0033 end');
    })

    /**
     * @tc.name   testLengthGate0034
     * @tc.number SUB_CCER_DLEN_0034
     * @tc.desc   长度为 65536 的事件数据校验结果为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLengthGate0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0034 begin');
      const data: string = 'a'.repeat(65536);
      const result: boolean = CommonEventPublisher.isDataLengthValid(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data + 'a')), String(false));
      expect(CommonEventPublisher.isDataLengthValid(data + 'a')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data.substring(1))), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data.substring(1))).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0034 end');
    })

    /**
     * @tc.name   testLengthGate0035
     * @tc.number SUB_CCER_DLEN_0035
     * @tc.desc   长度为 65537 的事件数据校验结果为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLengthGate0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0035 begin');
      const data: string = 'a'.repeat(65537);
      const result: boolean = CommonEventPublisher.isDataLengthValid(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data + 'a')), String(false));
      expect(CommonEventPublisher.isDataLengthValid(data + 'a')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data.substring(1))), String(true));
      expect(CommonEventPublisher.isDataLengthValid(data.substring(1))).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0035 end');
    })

    /**
     * @tc.name   testLengthGate0036
     * @tc.number SUB_CCER_DLEN_0036
     * @tc.desc   长度为 65538 的事件数据校验结果为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLengthGate0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0036 begin');
      const data: string = 'a'.repeat(65538);
      const result: boolean = CommonEventPublisher.isDataLengthValid(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data + 'a')), String(false));
      expect(CommonEventPublisher.isDataLengthValid(data + 'a')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data.substring(1))), String(false));
      expect(CommonEventPublisher.isDataLengthValid(data.substring(1))).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0036 end');
    })

    /**
     * @tc.name   testLengthGate0037
     * @tc.number SUB_CCER_DLEN_0037
     * @tc.desc   长度为 70000 的事件数据校验结果为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLengthGate0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0037 begin');
      const data: string = 'a'.repeat(70000);
      const result: boolean = CommonEventPublisher.isDataLengthValid(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data + 'a')), String(false));
      expect(CommonEventPublisher.isDataLengthValid(data + 'a')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data.substring(1))), String(false));
      expect(CommonEventPublisher.isDataLengthValid(data.substring(1))).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0037 end');
    })

    /**
     * @tc.name   testLengthGate0038
     * @tc.number SUB_CCER_DLEN_0038
     * @tc.desc   长度为 98304 的事件数据校验结果为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLengthGate0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0038 begin');
      const data: string = 'a'.repeat(98304);
      const result: boolean = CommonEventPublisher.isDataLengthValid(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data + 'a')), String(false));
      expect(CommonEventPublisher.isDataLengthValid(data + 'a')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data.substring(1))), String(false));
      expect(CommonEventPublisher.isDataLengthValid(data.substring(1))).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0038 end');
    })

    /**
     * @tc.name   testLengthGate0039
     * @tc.number SUB_CCER_DLEN_0039
     * @tc.desc   长度为 131072 的事件数据校验结果为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLengthGate0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0039 begin');
      const data: string = 'a'.repeat(131072);
      const result: boolean = CommonEventPublisher.isDataLengthValid(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data + 'a')), String(false));
      expect(CommonEventPublisher.isDataLengthValid(data + 'a')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data.substring(1))), String(false));
      expect(CommonEventPublisher.isDataLengthValid(data.substring(1))).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0039 end');
    })

    /**
     * @tc.name   testLengthGate0040
     * @tc.number SUB_CCER_DLEN_0040
     * @tc.desc   长度为 200000 的事件数据校验结果为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLengthGate0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0040 begin');
      const data: string = 'a'.repeat(200000);
      const result: boolean = CommonEventPublisher.isDataLengthValid(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data + 'a')), String(false));
      expect(CommonEventPublisher.isDataLengthValid(data + 'a')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isDataLengthValid(data.substring(1))), String(false));
      expect(CommonEventPublisher.isDataLengthValid(data.substring(1))).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0040 end');
    })

    /**
     * @tc.name   testLengthGate0041
     * @tc.number SUB_CCER_DLEN_0041
     * @tc.desc   64 KiB 边界正反两侧与多字节字符的长度口径同例校验
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLengthGate0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0041 begin');
      const limit: number = CommonEventConstants.MAX_EVENT_DATA_LENGTH;
      const boundary: string = 'a'.repeat(limit);
      const overflow: string = 'a'.repeat(limit + 1);
      const multiByte: string = '中'.repeat(limit);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'limit=%{public}d', limit);
      expect(CommonEventPublisher.isDataLengthValid(boundary)).assertTrue();
      expect(CommonEventPublisher.isDataLengthValid(overflow)).assertFalse();
      expect(CommonEventPublisher.isDataLengthValid(multiByte)).assertTrue();
      expect(CommonEventPublisher.isDataLengthValid(CommonEventConstants.EMPTY_VALUE)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLengthGate0041 end');
    })
  })
}
