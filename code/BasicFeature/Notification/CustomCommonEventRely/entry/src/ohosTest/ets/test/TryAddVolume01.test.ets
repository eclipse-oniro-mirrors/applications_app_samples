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
import { AddResult, EventRecord, EventRecordManager } from '../../../main/ets/feature/EventRecordManager';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function tryAddTest() {
  describe('TryAddVolume01Test', () => {

    /**
     * @tc.name   testTryAdd0001
     * @tc.number SUB_CCER_TRYADD_01_0001
     * @tc.desc   合法数据 Data_01 与来源码 0 被接纳
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0001 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('Data_01', 0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record !== null));
      expect(result.record !== null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0001 end');
    })

    /**
     * @tc.name   testTryAdd0002
     * @tc.number SUB_CCER_TRYADD_01_0002
     * @tc.desc   合法数据 Data_02 与来源码 1001 被接纳
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0002 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('Data_02', 1001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record !== null));
      expect(result.record !== null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0002 end');
    })

    /**
     * @tc.name   testTryAdd0003
     * @tc.number SUB_CCER_TRYADD_01_0003
     * @tc.desc   合法数据 Data_03 与来源码 1002 被接纳
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0003 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('Data_03', 1002);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record !== null));
      expect(result.record !== null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0003 end');
    })

    /**
     * @tc.name   testTryAdd0004
     * @tc.number SUB_CCER_TRYADD_01_0004
     * @tc.desc   合法数据 Data_04 与来源码 2001 被接纳
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0004 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('Data_04', 2001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record !== null));
      expect(result.record !== null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0004 end');
    })

    /**
     * @tc.name   testTryAdd0005
     * @tc.number SUB_CCER_TRYADD_01_0005
     * @tc.desc   合法数据 Data_05 与来源码 -1 被接纳
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0005 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('Data_05', -1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record !== null));
      expect(result.record !== null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0005 end');
    })

    /**
     * @tc.name   testTryAdd0006
     * @tc.number SUB_CCER_TRYADD_01_0006
     * @tc.desc   合法数据 Data_06 与来源码 7 被接纳
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0006 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('Data_06', 7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record !== null));
      expect(result.record !== null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0006 end');
    })

    /**
     * @tc.name   testTryAdd0007
     * @tc.number SUB_CCER_TRYADD_01_0007
     * @tc.desc   合法数据 Data_07 与来源码 0 被接纳
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0007 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('Data_07', 0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record !== null));
      expect(result.record !== null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0007 end');
    })

    /**
     * @tc.name   testTryAdd0008
     * @tc.number SUB_CCER_TRYADD_01_0008
     * @tc.desc   合法数据 Data_08 与来源码 1001 被接纳
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0008 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('Data_08', 1001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record !== null));
      expect(result.record !== null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0008 end');
    })

    /**
     * @tc.name   testTryAdd0009
     * @tc.number SUB_CCER_TRYADD_01_0009
     * @tc.desc   合法数据 Data_09 与来源码 1002 被接纳
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0009 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('Data_09', 1002);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record !== null));
      expect(result.record !== null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0009 end');
    })

    /**
     * @tc.name   testTryAdd0010
     * @tc.number SUB_CCER_TRYADD_01_0010
     * @tc.desc   合法数据 Data_10 与来源码 2001 被接纳
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0010 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('Data_10', 2001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record !== null));
      expect(result.record !== null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0010 end');
    })

    /**
     * @tc.name   testTryAdd0011
     * @tc.number SUB_CCER_TRYADD_01_0011
     * @tc.desc   合法数据 Data_11 与来源码 -1 被接纳
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0011 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('Data_11', -1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record !== null));
      expect(result.record !== null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0011 end');
    })

    /**
     * @tc.name   testTryAdd0012
     * @tc.number SUB_CCER_TRYADD_01_0012
     * @tc.desc   合法数据 Data_12 与来源码 7 被接纳
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0012 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('Data_12', 7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record !== null));
      expect(result.record !== null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0012 end');
    })

    /**
     * @tc.name   testTryAdd0013
     * @tc.number SUB_CCER_TRYADD_01_0013
     * @tc.desc   合法数据 Data_13 与来源码 0 被接纳
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0013 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('Data_13', 0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record !== null));
      expect(result.record !== null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0013 end');
    })

    /**
     * @tc.name   testTryAdd0014
     * @tc.number SUB_CCER_TRYADD_01_0014
     * @tc.desc   合法数据 Data_14 与来源码 1001 被接纳
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0014 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('Data_14', 1001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record !== null));
      expect(result.record !== null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0014 end');
    })

    /**
     * @tc.name   testTryAdd0015
     * @tc.number SUB_CCER_TRYADD_01_0015
     * @tc.desc   合法数据 Data_15 与来源码 1002 被接纳
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0015 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('Data_15', 1002);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record !== null));
      expect(result.record !== null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0015 end');
    })

    /**
     * @tc.name   testTryAdd0016
     * @tc.number SUB_CCER_TRYADD_01_0016
     * @tc.desc   合法数据 Data_16 与来源码 2001 被接纳
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0016 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('Data_16', 2001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record !== null));
      expect(result.record !== null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0016 end');
    })

    /**
     * @tc.name   testTryAdd0017
     * @tc.number SUB_CCER_TRYADD_01_0017
     * @tc.desc   合法数据 Data_17 与来源码 -1 被接纳
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0017 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('Data_17', -1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record !== null));
      expect(result.record !== null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0017 end');
    })

    /**
     * @tc.name   testTryAdd0018
     * @tc.number SUB_CCER_TRYADD_01_0018
     * @tc.desc   合法数据 Data_18 与来源码 7 被接纳
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0018 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('Data_18', 7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record !== null));
      expect(result.record !== null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0018 end');
    })

    /**
     * @tc.name   testTryAdd0019
     * @tc.number SUB_CCER_TRYADD_01_0019
     * @tc.desc   合法数据 Data_19 与来源码 0 被接纳
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0019 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('Data_19', 0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record !== null));
      expect(result.record !== null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0019 end');
    })

    /**
     * @tc.name   testTryAdd0020
     * @tc.number SUB_CCER_TRYADD_01_0020
     * @tc.desc   合法数据 Data_20 与来源码 1001 被接纳
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0020 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('Data_20', 1001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record !== null));
      expect(result.record !== null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0020 end');
    })

    /**
     * @tc.name   testTryAdd0021
     * @tc.number SUB_CCER_TRYADD_01_0021
     * @tc.desc   合法数据 Data_21 与来源码 1002 被接纳
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0021 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('Data_21', 1002);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record !== null));
      expect(result.record !== null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0021 end');
    })

    /**
     * @tc.name   testTryAdd0022
     * @tc.number SUB_CCER_TRYADD_01_0022
     * @tc.desc   合法数据 Data_22 与来源码 2001 被接纳
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0022 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('Data_22', 2001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record !== null));
      expect(result.record !== null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0022 end');
    })

    /**
     * @tc.name   testTryAdd0023
     * @tc.number SUB_CCER_TRYADD_01_0023
     * @tc.desc   合法数据 Data_23 与来源码 -1 被接纳
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0023 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('Data_23', -1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record !== null));
      expect(result.record !== null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0023 end');
    })

    /**
     * @tc.name   testTryAdd0024
     * @tc.number SUB_CCER_TRYADD_01_0024
     * @tc.desc   合法数据 Data_24 与来源码 7 被接纳
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0024 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('Data_24', 7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record !== null));
      expect(result.record !== null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0024 end');
    })

    /**
     * @tc.name   testTryAdd0025
     * @tc.number SUB_CCER_TRYADD_01_0025
     * @tc.desc   合法数据 Data_25 与来源码 0 被接纳
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0025 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('Data_25', 0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record !== null));
      expect(result.record !== null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0025 end');
    })

    /**
     * @tc.name   testTryAdd0026
     * @tc.number SUB_CCER_TRYADD_01_0026
     * @tc.desc   合法数据 Data_26 与来源码 1001 被接纳
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0026 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('Data_26', 1001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record !== null));
      expect(result.record !== null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0026 end');
    })

    /**
     * @tc.name   testTryAdd0027
     * @tc.number SUB_CCER_TRYADD_01_0027
     * @tc.desc   合法数据 Data_27 与来源码 1002 被接纳
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0027 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('Data_27', 1002);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record !== null));
      expect(result.record !== null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0027 end');
    })

    /**
     * @tc.name   testTryAdd0028
     * @tc.number SUB_CCER_TRYADD_01_0028
     * @tc.desc   合法数据 Data_28 与来源码 2001 被接纳
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0028 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('Data_28', 2001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record !== null));
      expect(result.record !== null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0028 end');
    })

    /**
     * @tc.name   testTryAdd0029
     * @tc.number SUB_CCER_TRYADD_01_0029
     * @tc.desc   合法数据 Data_29 与来源码 -1 被接纳
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0029 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('Data_29', -1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record !== null));
      expect(result.record !== null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0029 end');
    })

    /**
     * @tc.name   testTryAdd0030
     * @tc.number SUB_CCER_TRYADD_01_0030
     * @tc.desc   合法数据 Data_30 与来源码 7 被接纳
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0030 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('Data_30', 7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record !== null));
      expect(result.record !== null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0030 end');
    })

    /**
     * @tc.name   testTryAdd0031
     * @tc.number SUB_CCER_TRYADD_01_0031
     * @tc.desc   合法数据 Data_31 与来源码 0 被接纳
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0031 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('Data_31', 0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record !== null));
      expect(result.record !== null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0031 end');
    })

    /**
     * @tc.name   testTryAdd0032
     * @tc.number SUB_CCER_TRYADD_01_0032
     * @tc.desc   合法数据 Data_32 与来源码 1001 被接纳
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0032 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('Data_32', 1001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record !== null));
      expect(result.record !== null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0032 end');
    })

    /**
     * @tc.name   testTryAdd0033
     * @tc.number SUB_CCER_TRYADD_01_0033
     * @tc.desc   空数据被拒，来源码 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0033 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('', 0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String('empty'));
      expect(result.reason).assertContain('empty');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record === null));
      expect(result.record === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0033 end');
    })

    /**
     * @tc.name   testTryAdd0034
     * @tc.number SUB_CCER_TRYADD_01_0034
     * @tc.desc   空数据被拒，来源码 1001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0034 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('', 1001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String('empty'));
      expect(result.reason).assertContain('empty');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record === null));
      expect(result.record === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0034 end');
    })

    /**
     * @tc.name   testTryAdd0035
     * @tc.number SUB_CCER_TRYADD_01_0035
     * @tc.desc   空数据被拒，来源码 1002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0035 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('', 1002);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String('empty'));
      expect(result.reason).assertContain('empty');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record === null));
      expect(result.record === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0035 end');
    })

    /**
     * @tc.name   testTryAdd0036
     * @tc.number SUB_CCER_TRYADD_01_0036
     * @tc.desc   空数据被拒，来源码 2001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0036 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('', 2001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String('empty'));
      expect(result.reason).assertContain('empty');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record === null));
      expect(result.record === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0036 end');
    })

    /**
     * @tc.name   testTryAdd0037
     * @tc.number SUB_CCER_TRYADD_01_0037
     * @tc.desc   空数据被拒，来源码 -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0037 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('', -1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String('empty'));
      expect(result.reason).assertContain('empty');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record === null));
      expect(result.record === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0037 end');
    })

    /**
     * @tc.name   testTryAdd0038
     * @tc.number SUB_CCER_TRYADD_01_0038
     * @tc.desc   长度为 65535 的数据被接纳
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0038 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('a'.repeat(65535), 1001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record !== null));
      expect(result.record !== null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0038 end');
    })

    /**
     * @tc.name   testTryAdd0039
     * @tc.number SUB_CCER_TRYADD_01_0039
     * @tc.desc   长度为 65536 的数据被接纳
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0039 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('a'.repeat(65536), 1001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String(''));
      expect(result.reason.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record !== null));
      expect(result.record !== null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0039 end');
    })

    /**
     * @tc.name   testTryAdd0040
     * @tc.number SUB_CCER_TRYADD_01_0040
     * @tc.desc   长度为 65537 的数据被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0040 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('a'.repeat(65537), 1001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String('64 KB'));
      expect(result.reason).assertContain('64 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record === null));
      expect(result.record === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0040 end');
    })

    /**
     * @tc.name   testTryAdd0041
     * @tc.number SUB_CCER_TRYADD_01_0041
     * @tc.desc   长度为 65540 的数据被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0041 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('a'.repeat(65540), 1001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String('64 KB'));
      expect(result.reason).assertContain('64 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record === null));
      expect(result.record === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0041 end');
    })

    /**
     * @tc.name   testTryAdd0042
     * @tc.number SUB_CCER_TRYADD_01_0042
     * @tc.desc   长度为 66000 的数据被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0042 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('a'.repeat(66000), 1001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String('64 KB'));
      expect(result.reason).assertContain('64 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record === null));
      expect(result.record === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0042 end');
    })

    /**
     * @tc.name   testTryAdd0043
     * @tc.number SUB_CCER_TRYADD_01_0043
     * @tc.desc   长度为 70000 的数据被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0043 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('a'.repeat(70000), 1001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String('64 KB'));
      expect(result.reason).assertContain('64 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record === null));
      expect(result.record === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0043 end');
    })

    /**
     * @tc.name   testTryAdd0044
     * @tc.number SUB_CCER_TRYADD_01_0044
     * @tc.desc   长度为 100000 的数据被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0044 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('a'.repeat(100000), 1001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String('64 KB'));
      expect(result.reason).assertContain('64 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record === null));
      expect(result.record === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0044 end');
    })

    /**
     * @tc.name   testTryAdd0045
     * @tc.number SUB_CCER_TRYADD_01_0045
     * @tc.desc   长度为 131072 的数据被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0045 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('a'.repeat(131072), 1001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String('64 KB'));
      expect(result.reason).assertContain('64 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record === null));
      expect(result.record === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0045 end');
    })

    /**
     * @tc.name   testTryAdd0046
     * @tc.number SUB_CCER_TRYADD_01_0046
     * @tc.desc   长度为 200000 的数据被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0046 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('a'.repeat(200000), 1001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String('64 KB'));
      expect(result.reason).assertContain('64 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record === null));
      expect(result.record === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0046 end');
    })

    /**
     * @tc.name   testTryAdd0047
     * @tc.number SUB_CCER_TRYADD_01_0047
     * @tc.desc   长度为 262144 的数据被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0047 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('a'.repeat(262144), 1001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String('64 KB'));
      expect(result.reason).assertContain('64 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record === null));
      expect(result.record === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0047 end');
    })

    /**
     * @tc.name   testTryAdd0048
     * @tc.number SUB_CCER_TRYADD_01_0048
     * @tc.desc   非整数来源码 1.5 被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0048 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('InApp', 1.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('integer'));
      expect(result.reason).assertContain('integer');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record === null));
      expect(result.record === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0048 end');
    })

    /**
     * @tc.name   testTryAdd0049
     * @tc.number SUB_CCER_TRYADD_01_0049
     * @tc.desc   非整数来源码 2.25 被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0049 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('InApp', 2.25);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('integer'));
      expect(result.reason).assertContain('integer');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record === null));
      expect(result.record === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0049 end');
    })

    /**
     * @tc.name   testTryAdd0050
     * @tc.number SUB_CCER_TRYADD_01_0050
     * @tc.desc   非整数来源码 1001.5 被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0050 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('InApp', 1001.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('integer'));
      expect(result.reason).assertContain('integer');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record === null));
      expect(result.record === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0050 end');
    })

    /**
     * @tc.name   testTryAdd0051
     * @tc.number SUB_CCER_TRYADD_01_0051
     * @tc.desc   非整数来源码 -0.5 被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0051 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('InApp', -0.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('integer'));
      expect(result.reason).assertContain('integer');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record === null));
      expect(result.record === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0051 end');
    })

    /**
     * @tc.name   testTryAdd0052
     * @tc.number SUB_CCER_TRYADD_01_0052
     * @tc.desc   非整数来源码 0.1 被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0052 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('InApp', 0.1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('integer'));
      expect(result.reason).assertContain('integer');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record === null));
      expect(result.record === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0052 end');
    })

    /**
     * @tc.name   testTryAdd0053
     * @tc.number SUB_CCER_TRYADD_01_0053
     * @tc.desc   非整数来源码 1e-7 被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0053 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('InApp', 1e-7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('integer'));
      expect(result.reason).assertContain('integer');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record === null));
      expect(result.record === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0053 end');
    })

    /**
     * @tc.name   testTryAdd0054
     * @tc.number SUB_CCER_TRYADD_01_0054
     * @tc.desc   非整数来源码 NaN 被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0054 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('InApp', NaN);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('integer'));
      expect(result.reason).assertContain('integer');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record === null));
      expect(result.record === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0054 end');
    })

    /**
     * @tc.name   testTryAdd0055
     * @tc.number SUB_CCER_TRYADD_01_0055
     * @tc.desc   非整数来源码 Infinity 被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0055 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('InApp', Infinity);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('integer'));
      expect(result.reason).assertContain('integer');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record === null));
      expect(result.record === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0055 end');
    })

    /**
     * @tc.name   testTryAdd0056
     * @tc.number SUB_CCER_TRYADD_01_0056
     * @tc.desc   非整数来源码 -Infinity 被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0056 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('InApp', -Infinity);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('integer'));
      expect(result.reason).assertContain('integer');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record === null));
      expect(result.record === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0056 end');
    })

    /**
     * @tc.name   testTryAdd0057
     * @tc.number SUB_CCER_TRYADD_01_0057
     * @tc.desc   非整数来源码 3.0000001 被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0057 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('InApp', 3.0000001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('integer'));
      expect(result.reason).assertContain('integer');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record === null));
      expect(result.record === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0057 end');
    })

    /**
     * @tc.name   testTryAdd0058
     * @tc.number SUB_CCER_TRYADD_01_0058
     * @tc.desc   空数据与非整数来源码同时出现时数据先被校验
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0058 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('', 1.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String('empty'));
      expect(result.reason).assertContain('empty');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record === null));
      expect(result.record === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0058 end');
    })

    /**
     * @tc.name   testTryAdd0059
     * @tc.number SUB_CCER_TRYADD_01_0059
     * @tc.desc   超长数据与非整数来源码同时出现时数据先被校验
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0059 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('a'.repeat(70000), 1.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason), String('64 KB'));
      expect(result.reason).assertContain('64 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record === null));
      expect(result.record === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0059 end');
    })

    /**
     * @tc.name   testTryAdd0060
     * @tc.number SUB_CCER_TRYADD_01_0060
     * @tc.desc   非整数来源码保留整数校验文案
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0060 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('InApp', 2.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.reason),
        String('source code'));
      expect(result.reason).assertContain('source code');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.record === null));
      expect(result.record === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0060 end');
    })

    /**
     * @tc.name   testTryAdd0061
     * @tc.number SUB_CCER_TRYADD_01_0061
     * @tc.desc   合法数据入库后记录数与序号可读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTryAdd0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0061 begin');
      const manager: EventRecordManager = new EventRecordManager(CommonEventConstants.MAX_RECORD_COUNT);
      const result: AddResult = manager.tryAdd('Data_Boundary', 1001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.accepted));
      expect(result.accepted).assertTrue();
      const record: EventRecord | null = result.record;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(record === null));
      expect(record === null).assertFalse();
      let sequence: number = -1;
      if (record !== null) {
        sequence = record.sequence;
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sequence), String(1));
      expect(sequence).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(manager.getCount()), String(1));
      expect(manager.getCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTryAdd0061 end');
    })

  })
}
