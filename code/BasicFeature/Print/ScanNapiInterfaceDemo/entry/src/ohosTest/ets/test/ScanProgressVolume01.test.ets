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
import { ScanProgressAggregator, ScanProgressSnapshot } from '../../../main/ets/scan/model/ScanProgressAggregator';
import { ScanProgressSummary } from '../../../main/ets/scan/model/ScanProgressAggregator';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ScanNapiInterfaceDemo]';

export default function scanProgressSummaryTest() {
  describe('ScanProgressSummary', () => {

    /**
     * @tc.name   testProgressSummary0001
     * @tc.number SUB_SCAN_PROGRESS_01_0001
     * @tc.desc   ScanProgressSummary case 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0001 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 0, isFinal: false }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(1);
      expect(result.completed).assertEqual(0);
      expect(result.percent).assertEqual(0);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0001 end');
    });

    /**
     * @tc.name   testProgressSummary0002
     * @tc.number SUB_SCAN_PROGRESS_01_0002
     * @tc.desc   ScanProgressSummary case 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0002 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 0, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(1);
      expect(result.completed).assertEqual(0);
      expect(result.percent).assertEqual(0);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0002 end');
    });

    /**
     * @tc.name   testProgressSummary0003
     * @tc.number SUB_SCAN_PROGRESS_01_0003
     * @tc.desc   ScanProgressSummary case 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0003 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 25, isFinal: false }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(1);
      expect(result.completed).assertEqual(0);
      expect(result.percent).assertEqual(25);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0003 end');
    });

    /**
     * @tc.name   testProgressSummary0004
     * @tc.number SUB_SCAN_PROGRESS_01_0004
     * @tc.desc   ScanProgressSummary case 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0004 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 25, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(1);
      expect(result.completed).assertEqual(0);
      expect(result.percent).assertEqual(25);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0004 end');
    });

    /**
     * @tc.name   testProgressSummary0005
     * @tc.number SUB_SCAN_PROGRESS_01_0005
     * @tc.desc   ScanProgressSummary case 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0005 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 50, isFinal: false }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(1);
      expect(result.completed).assertEqual(0);
      expect(result.percent).assertEqual(50);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0005 end');
    });

    /**
     * @tc.name   testProgressSummary0006
     * @tc.number SUB_SCAN_PROGRESS_01_0006
     * @tc.desc   ScanProgressSummary case 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0006 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 50, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(1);
      expect(result.completed).assertEqual(0);
      expect(result.percent).assertEqual(50);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0006 end');
    });

    /**
     * @tc.name   testProgressSummary0007
     * @tc.number SUB_SCAN_PROGRESS_01_0007
     * @tc.desc   ScanProgressSummary case 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0007 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 75, isFinal: false }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(1);
      expect(result.completed).assertEqual(0);
      expect(result.percent).assertEqual(75);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0007 end');
    });

    /**
     * @tc.name   testProgressSummary0008
     * @tc.number SUB_SCAN_PROGRESS_01_0008
     * @tc.desc   ScanProgressSummary case 8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0008 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 75, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(1);
      expect(result.completed).assertEqual(0);
      expect(result.percent).assertEqual(75);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0008 end');
    });

    /**
     * @tc.name   testProgressSummary0009
     * @tc.number SUB_SCAN_PROGRESS_01_0009
     * @tc.desc   ScanProgressSummary case 9
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0009 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 99, isFinal: false }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(1);
      expect(result.completed).assertEqual(0);
      expect(result.percent).assertEqual(99);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0009 end');
    });

    /**
     * @tc.name   testProgressSummary0010
     * @tc.number SUB_SCAN_PROGRESS_01_0010
     * @tc.desc   ScanProgressSummary case 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0010 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 99, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(1);
      expect(result.completed).assertEqual(0);
      expect(result.percent).assertEqual(99);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0010 end');
    });

    /**
     * @tc.name   testProgressSummary0011
     * @tc.number SUB_SCAN_PROGRESS_01_0011
     * @tc.desc   ScanProgressSummary case 11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0011 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 100, isFinal: false }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(1);
      expect(result.completed).assertEqual(1);
      expect(result.percent).assertEqual(100);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0011 end');
    });

    /**
     * @tc.name   testProgressSummary0012
     * @tc.number SUB_SCAN_PROGRESS_01_0012
     * @tc.desc   ScanProgressSummary case 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0012 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 100, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(1);
      expect(result.completed).assertEqual(1);
      expect(result.percent).assertEqual(100);
      expect(result.finished).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0012 end');
    });

    /**
     * @tc.name   testProgressSummary0013
     * @tc.number SUB_SCAN_PROGRESS_01_0013
     * @tc.desc   ScanProgressSummary case 13
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0013 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 120, isFinal: false }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(1);
      expect(result.completed).assertEqual(1);
      expect(result.percent).assertEqual(100);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0013 end');
    });

    /**
     * @tc.name   testProgressSummary0014
     * @tc.number SUB_SCAN_PROGRESS_01_0014
     * @tc.desc   ScanProgressSummary case 14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0014 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 120, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(1);
      expect(result.completed).assertEqual(1);
      expect(result.percent).assertEqual(100);
      expect(result.finished).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0014 end');
    });

    /**
     * @tc.name   testProgressSummary0015
     * @tc.number SUB_SCAN_PROGRESS_01_0015
     * @tc.desc   ScanProgressSummary case 15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0015 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: -5, isFinal: false }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(1);
      expect(result.completed).assertEqual(0);
      expect(result.percent).assertEqual(0);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0015 end');
    });

    /**
     * @tc.name   testProgressSummary0016
     * @tc.number SUB_SCAN_PROGRESS_01_0016
     * @tc.desc   ScanProgressSummary case 16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0016 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: -5, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(1);
      expect(result.completed).assertEqual(0);
      expect(result.percent).assertEqual(0);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0016 end');
    });

    /**
     * @tc.name   testProgressSummary0017
     * @tc.number SUB_SCAN_PROGRESS_01_0017
     * @tc.desc   ScanProgressSummary case 17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0017 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 0, isFinal: false }, { progress: 0, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(2);
      expect(result.completed).assertEqual(0);
      expect(result.percent).assertEqual(0);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0017 end');
    });

    /**
     * @tc.name   testProgressSummary0018
     * @tc.number SUB_SCAN_PROGRESS_01_0018
     * @tc.desc   ScanProgressSummary case 18
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0018 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 0, isFinal: true }, { progress: 0, isFinal: false }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(2);
      expect(result.completed).assertEqual(0);
      expect(result.percent).assertEqual(0);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0018 end');
    });

    /**
     * @tc.name   testProgressSummary0019
     * @tc.number SUB_SCAN_PROGRESS_01_0019
     * @tc.desc   ScanProgressSummary case 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0019 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 0, isFinal: false }, { progress: 50, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(2);
      expect(result.completed).assertEqual(0);
      expect(result.percent).assertEqual(50);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0019 end');
    });

    /**
     * @tc.name   testProgressSummary0020
     * @tc.number SUB_SCAN_PROGRESS_01_0020
     * @tc.desc   ScanProgressSummary case 20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0020 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 0, isFinal: true }, { progress: 50, isFinal: false }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(2);
      expect(result.completed).assertEqual(0);
      expect(result.percent).assertEqual(50);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0020 end');
    });

    /**
     * @tc.name   testProgressSummary0021
     * @tc.number SUB_SCAN_PROGRESS_01_0021
     * @tc.desc   ScanProgressSummary case 21
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0021 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 0, isFinal: false }, { progress: 100, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(2);
      expect(result.completed).assertEqual(1);
      expect(result.percent).assertEqual(100);
      expect(result.finished).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0021 end');
    });

    /**
     * @tc.name   testProgressSummary0022
     * @tc.number SUB_SCAN_PROGRESS_01_0022
     * @tc.desc   ScanProgressSummary case 22
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0022 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 0, isFinal: true }, { progress: 100, isFinal: false }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(2);
      expect(result.completed).assertEqual(1);
      expect(result.percent).assertEqual(100);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0022 end');
    });

    /**
     * @tc.name   testProgressSummary0023
     * @tc.number SUB_SCAN_PROGRESS_01_0023
     * @tc.desc   ScanProgressSummary case 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0023 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 25, isFinal: false }, { progress: 0, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(2);
      expect(result.completed).assertEqual(0);
      expect(result.percent).assertEqual(0);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0023 end');
    });

    /**
     * @tc.name   testProgressSummary0024
     * @tc.number SUB_SCAN_PROGRESS_01_0024
     * @tc.desc   ScanProgressSummary case 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0024 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 25, isFinal: true }, { progress: 0, isFinal: false }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(2);
      expect(result.completed).assertEqual(0);
      expect(result.percent).assertEqual(0);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0024 end');
    });

    /**
     * @tc.name   testProgressSummary0025
     * @tc.number SUB_SCAN_PROGRESS_01_0025
     * @tc.desc   ScanProgressSummary case 25
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0025 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 25, isFinal: false }, { progress: 50, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(2);
      expect(result.completed).assertEqual(0);
      expect(result.percent).assertEqual(50);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0025 end');
    });

    /**
     * @tc.name   testProgressSummary0026
     * @tc.number SUB_SCAN_PROGRESS_01_0026
     * @tc.desc   ScanProgressSummary case 26
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0026 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 25, isFinal: true }, { progress: 50, isFinal: false }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(2);
      expect(result.completed).assertEqual(0);
      expect(result.percent).assertEqual(50);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0026 end');
    });

    /**
     * @tc.name   testProgressSummary0027
     * @tc.number SUB_SCAN_PROGRESS_01_0027
     * @tc.desc   ScanProgressSummary case 27
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0027 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 25, isFinal: false }, { progress: 100, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(2);
      expect(result.completed).assertEqual(1);
      expect(result.percent).assertEqual(100);
      expect(result.finished).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0027 end');
    });

    /**
     * @tc.name   testProgressSummary0028
     * @tc.number SUB_SCAN_PROGRESS_01_0028
     * @tc.desc   ScanProgressSummary case 28
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0028 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 25, isFinal: true }, { progress: 100, isFinal: false }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(2);
      expect(result.completed).assertEqual(1);
      expect(result.percent).assertEqual(100);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0028 end');
    });

    /**
     * @tc.name   testProgressSummary0029
     * @tc.number SUB_SCAN_PROGRESS_01_0029
     * @tc.desc   ScanProgressSummary case 29
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0029 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 50, isFinal: false }, { progress: 0, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(2);
      expect(result.completed).assertEqual(0);
      expect(result.percent).assertEqual(0);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0029 end');
    });

    /**
     * @tc.name   testProgressSummary0030
     * @tc.number SUB_SCAN_PROGRESS_01_0030
     * @tc.desc   ScanProgressSummary case 30
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0030 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 50, isFinal: true }, { progress: 0, isFinal: false }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(2);
      expect(result.completed).assertEqual(0);
      expect(result.percent).assertEqual(0);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0030 end');
    });

    /**
     * @tc.name   testProgressSummary0031
     * @tc.number SUB_SCAN_PROGRESS_01_0031
     * @tc.desc   ScanProgressSummary case 31
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0031 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 50, isFinal: false }, { progress: 50, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(2);
      expect(result.completed).assertEqual(0);
      expect(result.percent).assertEqual(50);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0031 end');
    });

    /**
     * @tc.name   testProgressSummary0032
     * @tc.number SUB_SCAN_PROGRESS_01_0032
     * @tc.desc   ScanProgressSummary case 32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0032 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 50, isFinal: true }, { progress: 50, isFinal: false }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(2);
      expect(result.completed).assertEqual(0);
      expect(result.percent).assertEqual(50);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0032 end');
    });

    /**
     * @tc.name   testProgressSummary0033
     * @tc.number SUB_SCAN_PROGRESS_01_0033
     * @tc.desc   ScanProgressSummary case 33
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0033 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 50, isFinal: false }, { progress: 100, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(2);
      expect(result.completed).assertEqual(1);
      expect(result.percent).assertEqual(100);
      expect(result.finished).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0033 end');
    });

    /**
     * @tc.name   testProgressSummary0034
     * @tc.number SUB_SCAN_PROGRESS_01_0034
     * @tc.desc   ScanProgressSummary case 34
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0034 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 50, isFinal: true }, { progress: 100, isFinal: false }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(2);
      expect(result.completed).assertEqual(1);
      expect(result.percent).assertEqual(100);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0034 end');
    });

    /**
     * @tc.name   testProgressSummary0035
     * @tc.number SUB_SCAN_PROGRESS_01_0035
     * @tc.desc   ScanProgressSummary case 35
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0035 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 75, isFinal: false }, { progress: 0, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(2);
      expect(result.completed).assertEqual(0);
      expect(result.percent).assertEqual(0);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0035 end');
    });

    /**
     * @tc.name   testProgressSummary0036
     * @tc.number SUB_SCAN_PROGRESS_01_0036
     * @tc.desc   ScanProgressSummary case 36
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0036 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 75, isFinal: true }, { progress: 0, isFinal: false }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(2);
      expect(result.completed).assertEqual(0);
      expect(result.percent).assertEqual(0);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0036 end');
    });

    /**
     * @tc.name   testProgressSummary0037
     * @tc.number SUB_SCAN_PROGRESS_01_0037
     * @tc.desc   ScanProgressSummary case 37
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0037 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 75, isFinal: false }, { progress: 50, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(2);
      expect(result.completed).assertEqual(0);
      expect(result.percent).assertEqual(50);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0037 end');
    });

    /**
     * @tc.name   testProgressSummary0038
     * @tc.number SUB_SCAN_PROGRESS_01_0038
     * @tc.desc   ScanProgressSummary case 38
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0038 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 75, isFinal: true }, { progress: 50, isFinal: false }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(2);
      expect(result.completed).assertEqual(0);
      expect(result.percent).assertEqual(50);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0038 end');
    });

    /**
     * @tc.name   testProgressSummary0039
     * @tc.number SUB_SCAN_PROGRESS_01_0039
     * @tc.desc   ScanProgressSummary case 39
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0039 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 75, isFinal: false }, { progress: 100, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(2);
      expect(result.completed).assertEqual(1);
      expect(result.percent).assertEqual(100);
      expect(result.finished).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0039 end');
    });

    /**
     * @tc.name   testProgressSummary0040
     * @tc.number SUB_SCAN_PROGRESS_01_0040
     * @tc.desc   ScanProgressSummary case 40
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0040 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 75, isFinal: true }, { progress: 100, isFinal: false }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(2);
      expect(result.completed).assertEqual(1);
      expect(result.percent).assertEqual(100);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0040 end');
    });

    /**
     * @tc.name   testProgressSummary0041
     * @tc.number SUB_SCAN_PROGRESS_01_0041
     * @tc.desc   ScanProgressSummary case 41
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0041 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 99, isFinal: false }, { progress: 0, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(2);
      expect(result.completed).assertEqual(0);
      expect(result.percent).assertEqual(0);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0041 end');
    });

    /**
     * @tc.name   testProgressSummary0042
     * @tc.number SUB_SCAN_PROGRESS_01_0042
     * @tc.desc   ScanProgressSummary case 42
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0042 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 99, isFinal: true }, { progress: 0, isFinal: false }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(2);
      expect(result.completed).assertEqual(0);
      expect(result.percent).assertEqual(0);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0042 end');
    });

    /**
     * @tc.name   testProgressSummary0043
     * @tc.number SUB_SCAN_PROGRESS_01_0043
     * @tc.desc   ScanProgressSummary case 43
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0043 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 99, isFinal: false }, { progress: 50, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(2);
      expect(result.completed).assertEqual(0);
      expect(result.percent).assertEqual(50);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0043 end');
    });

    /**
     * @tc.name   testProgressSummary0044
     * @tc.number SUB_SCAN_PROGRESS_01_0044
     * @tc.desc   ScanProgressSummary case 44
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0044 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 99, isFinal: true }, { progress: 50, isFinal: false }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(2);
      expect(result.completed).assertEqual(0);
      expect(result.percent).assertEqual(50);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0044 end');
    });

    /**
     * @tc.name   testProgressSummary0045
     * @tc.number SUB_SCAN_PROGRESS_01_0045
     * @tc.desc   ScanProgressSummary case 45
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0045 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 99, isFinal: false }, { progress: 100, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(2);
      expect(result.completed).assertEqual(1);
      expect(result.percent).assertEqual(100);
      expect(result.finished).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0045 end');
    });

    /**
     * @tc.name   testProgressSummary0046
     * @tc.number SUB_SCAN_PROGRESS_01_0046
     * @tc.desc   ScanProgressSummary case 46
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0046 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 99, isFinal: true }, { progress: 100, isFinal: false }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(2);
      expect(result.completed).assertEqual(1);
      expect(result.percent).assertEqual(100);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0046 end');
    });

    /**
     * @tc.name   testProgressSummary0047
     * @tc.number SUB_SCAN_PROGRESS_01_0047
     * @tc.desc   ScanProgressSummary case 47
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0047 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 100, isFinal: false }, { progress: 0, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(2);
      expect(result.completed).assertEqual(1);
      expect(result.percent).assertEqual(0);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0047 end');
    });

    /**
     * @tc.name   testProgressSummary0048
     * @tc.number SUB_SCAN_PROGRESS_01_0048
     * @tc.desc   ScanProgressSummary case 48
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0048 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 100, isFinal: true }, { progress: 0, isFinal: false }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(2);
      expect(result.completed).assertEqual(1);
      expect(result.percent).assertEqual(0);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0048 end');
    });

    /**
     * @tc.name   testProgressSummary0049
     * @tc.number SUB_SCAN_PROGRESS_01_0049
     * @tc.desc   ScanProgressSummary case 49
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0049 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 100, isFinal: false }, { progress: 50, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(2);
      expect(result.completed).assertEqual(1);
      expect(result.percent).assertEqual(50);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0049 end');
    });

    /**
     * @tc.name   testProgressSummary0050
     * @tc.number SUB_SCAN_PROGRESS_01_0050
     * @tc.desc   ScanProgressSummary case 50
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0050 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 100, isFinal: true }, { progress: 50, isFinal: false }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(2);
      expect(result.completed).assertEqual(1);
      expect(result.percent).assertEqual(50);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0050 end');
    });

    /**
     * @tc.name   testProgressSummary0051
     * @tc.number SUB_SCAN_PROGRESS_01_0051
     * @tc.desc   ScanProgressSummary case 51
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0051 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 100, isFinal: false }, { progress: 100, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(2);
      expect(result.completed).assertEqual(2);
      expect(result.percent).assertEqual(100);
      expect(result.finished).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0051 end');
    });

    /**
     * @tc.name   testProgressSummary0052
     * @tc.number SUB_SCAN_PROGRESS_01_0052
     * @tc.desc   ScanProgressSummary case 52
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0052 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 100, isFinal: true }, { progress: 100, isFinal: false }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(2);
      expect(result.completed).assertEqual(2);
      expect(result.percent).assertEqual(100);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0052 end');
    });

    /**
     * @tc.name   testProgressSummary0053
     * @tc.number SUB_SCAN_PROGRESS_01_0053
     * @tc.desc   ScanProgressSummary case 53
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0053 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 120, isFinal: false }, { progress: 0, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(2);
      expect(result.completed).assertEqual(1);
      expect(result.percent).assertEqual(0);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0053 end');
    });

    /**
     * @tc.name   testProgressSummary0054
     * @tc.number SUB_SCAN_PROGRESS_01_0054
     * @tc.desc   ScanProgressSummary case 54
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0054 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 120, isFinal: true }, { progress: 0, isFinal: false }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(2);
      expect(result.completed).assertEqual(1);
      expect(result.percent).assertEqual(0);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0054 end');
    });

    /**
     * @tc.name   testProgressSummary0055
     * @tc.number SUB_SCAN_PROGRESS_01_0055
     * @tc.desc   ScanProgressSummary case 55
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0055 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 120, isFinal: false }, { progress: 50, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(2);
      expect(result.completed).assertEqual(1);
      expect(result.percent).assertEqual(50);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0055 end');
    });

    /**
     * @tc.name   testProgressSummary0056
     * @tc.number SUB_SCAN_PROGRESS_01_0056
     * @tc.desc   ScanProgressSummary case 56
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0056 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 120, isFinal: true }, { progress: 50, isFinal: false }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(2);
      expect(result.completed).assertEqual(1);
      expect(result.percent).assertEqual(50);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0056 end');
    });

    /**
     * @tc.name   testProgressSummary0057
     * @tc.number SUB_SCAN_PROGRESS_01_0057
     * @tc.desc   ScanProgressSummary case 57
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0057 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 120, isFinal: false }, { progress: 100, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(2);
      expect(result.completed).assertEqual(2);
      expect(result.percent).assertEqual(100);
      expect(result.finished).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0057 end');
    });

    /**
     * @tc.name   testProgressSummary0058
     * @tc.number SUB_SCAN_PROGRESS_01_0058
     * @tc.desc   ScanProgressSummary case 58
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0058 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 120, isFinal: true }, { progress: 100, isFinal: false }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(2);
      expect(result.completed).assertEqual(2);
      expect(result.percent).assertEqual(100);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0058 end');
    });

    /**
     * @tc.name   testProgressSummary0059
     * @tc.number SUB_SCAN_PROGRESS_01_0059
     * @tc.desc   ScanProgressSummary case 59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0059 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: -5, isFinal: false }, { progress: 0, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(2);
      expect(result.completed).assertEqual(0);
      expect(result.percent).assertEqual(0);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0059 end');
    });

    /**
     * @tc.name   testProgressSummary0060
     * @tc.number SUB_SCAN_PROGRESS_01_0060
     * @tc.desc   ScanProgressSummary case 60
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0060 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: -5, isFinal: true }, { progress: 0, isFinal: false }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(2);
      expect(result.completed).assertEqual(0);
      expect(result.percent).assertEqual(0);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0060 end');
    });

    /**
     * @tc.name   testProgressSummary0061
     * @tc.number SUB_SCAN_PROGRESS_01_0061
     * @tc.desc   ScanProgressSummary case 61
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0061 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: -5, isFinal: false }, { progress: 50, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(2);
      expect(result.completed).assertEqual(0);
      expect(result.percent).assertEqual(50);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0061 end');
    });

    /**
     * @tc.name   testProgressSummary0062
     * @tc.number SUB_SCAN_PROGRESS_01_0062
     * @tc.desc   ScanProgressSummary case 62
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0062 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: -5, isFinal: true }, { progress: 50, isFinal: false }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(2);
      expect(result.completed).assertEqual(0);
      expect(result.percent).assertEqual(50);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0062 end');
    });

    /**
     * @tc.name   testProgressSummary0063
     * @tc.number SUB_SCAN_PROGRESS_01_0063
     * @tc.desc   ScanProgressSummary case 63
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0063 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: -5, isFinal: false }, { progress: 100, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(2);
      expect(result.completed).assertEqual(1);
      expect(result.percent).assertEqual(100);
      expect(result.finished).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0063 end');
    });

    /**
     * @tc.name   testProgressSummary0064
     * @tc.number SUB_SCAN_PROGRESS_01_0064
     * @tc.desc   ScanProgressSummary case 64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0064 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: -5, isFinal: true }, { progress: 100, isFinal: false }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(2);
      expect(result.completed).assertEqual(1);
      expect(result.percent).assertEqual(100);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0064 end');
    });

    /**
     * @tc.name   testProgressSummary0065
     * @tc.number SUB_SCAN_PROGRESS_01_0065
     * @tc.desc   ScanProgressSummary case 65
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0065 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 0, isFinal: false }, { progress: 50, isFinal: false }, { progress: 100, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(3);
      expect(result.completed).assertEqual(1);
      expect(result.percent).assertEqual(100);
      expect(result.finished).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0065 end');
    });

    /**
     * @tc.name   testProgressSummary0066
     * @tc.number SUB_SCAN_PROGRESS_01_0066
     * @tc.desc   ScanProgressSummary case 66
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0066 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 0, isFinal: true }, { progress: 50, isFinal: true }, { progress: 100, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(3);
      expect(result.completed).assertEqual(1);
      expect(result.percent).assertEqual(100);
      expect(result.finished).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0066 end');
    });

    /**
     * @tc.name   testProgressSummary0067
     * @tc.number SUB_SCAN_PROGRESS_01_0067
     * @tc.desc   ScanProgressSummary case 67
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0067 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 10, isFinal: false }, { progress: 60, isFinal: false }, { progress: 99, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(3);
      expect(result.completed).assertEqual(0);
      expect(result.percent).assertEqual(99);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0067 end');
    });

    /**
     * @tc.name   testProgressSummary0068
     * @tc.number SUB_SCAN_PROGRESS_01_0068
     * @tc.desc   ScanProgressSummary case 68
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0068 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 10, isFinal: true }, { progress: 60, isFinal: true }, { progress: 99, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(3);
      expect(result.completed).assertEqual(0);
      expect(result.percent).assertEqual(99);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0068 end');
    });

    /**
     * @tc.name   testProgressSummary0069
     * @tc.number SUB_SCAN_PROGRESS_01_0069
     * @tc.desc   ScanProgressSummary case 69
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0069 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 100, isFinal: false }, { progress: 100, isFinal: false }, { progress: 100, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(3);
      expect(result.completed).assertEqual(3);
      expect(result.percent).assertEqual(100);
      expect(result.finished).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0069 end');
    });

    /**
     * @tc.name   testProgressSummary0070
     * @tc.number SUB_SCAN_PROGRESS_01_0070
     * @tc.desc   ScanProgressSummary case 70
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0070 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 100, isFinal: true }, { progress: 100, isFinal: true }, { progress: 100, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(3);
      expect(result.completed).assertEqual(3);
      expect(result.percent).assertEqual(100);
      expect(result.finished).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0070 end');
    });

    /**
     * @tc.name   testProgressSummary0071
     * @tc.number SUB_SCAN_PROGRESS_01_0071
     * @tc.desc   ScanProgressSummary case 71
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0071 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 99, isFinal: false }, { progress: 100, isFinal: false }, { progress: 100, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(3);
      expect(result.completed).assertEqual(2);
      expect(result.percent).assertEqual(100);
      expect(result.finished).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0071 end');
    });

    /**
     * @tc.name   testProgressSummary0072
     * @tc.number SUB_SCAN_PROGRESS_01_0072
     * @tc.desc   ScanProgressSummary case 72
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0072 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 99, isFinal: true }, { progress: 100, isFinal: true }, { progress: 100, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(3);
      expect(result.completed).assertEqual(2);
      expect(result.percent).assertEqual(100);
      expect(result.finished).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0072 end');
    });

    /**
     * @tc.name   testProgressSummary0073
     * @tc.number SUB_SCAN_PROGRESS_01_0073
     * @tc.desc   ScanProgressSummary case 73
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0073 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 0, isFinal: false }, { progress: 0, isFinal: false }, { progress: 0, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(3);
      expect(result.completed).assertEqual(0);
      expect(result.percent).assertEqual(0);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0073 end');
    });

    /**
     * @tc.name   testProgressSummary0074
     * @tc.number SUB_SCAN_PROGRESS_01_0074
     * @tc.desc   ScanProgressSummary case 74
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0074 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 0, isFinal: true }, { progress: 0, isFinal: true }, { progress: 0, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(3);
      expect(result.completed).assertEqual(0);
      expect(result.percent).assertEqual(0);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0074 end');
    });

    /**
     * @tc.name   testProgressSummary0075
     * @tc.number SUB_SCAN_PROGRESS_01_0075
     * @tc.desc   ScanProgressSummary case 75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0075 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 50, isFinal: false }, { progress: 50, isFinal: false }, { progress: 100, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(3);
      expect(result.completed).assertEqual(1);
      expect(result.percent).assertEqual(100);
      expect(result.finished).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0075 end');
    });

    /**
     * @tc.name   testProgressSummary0076
     * @tc.number SUB_SCAN_PROGRESS_01_0076
     * @tc.desc   ScanProgressSummary case 76
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0076 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 50, isFinal: true }, { progress: 50, isFinal: true }, { progress: 100, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(3);
      expect(result.completed).assertEqual(1);
      expect(result.percent).assertEqual(100);
      expect(result.finished).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0076 end');
    });

    /**
     * @tc.name   testProgressSummary0077
     * @tc.number SUB_SCAN_PROGRESS_01_0077
     * @tc.desc   ScanProgressSummary case 77
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0077 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 120, isFinal: false }, { progress: 150, isFinal: false }, { progress: 100, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(3);
      expect(result.completed).assertEqual(3);
      expect(result.percent).assertEqual(100);
      expect(result.finished).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0077 end');
    });

    /**
     * @tc.name   testProgressSummary0078
     * @tc.number SUB_SCAN_PROGRESS_01_0078
     * @tc.desc   ScanProgressSummary case 78
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0078 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 120, isFinal: true }, { progress: 150, isFinal: true }, { progress: 100, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(3);
      expect(result.completed).assertEqual(3);
      expect(result.percent).assertEqual(100);
      expect(result.finished).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0078 end');
    });

    /**
     * @tc.name   testProgressSummary0079
     * @tc.number SUB_SCAN_PROGRESS_01_0079
     * @tc.desc   ScanProgressSummary case 79
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0079 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: -1, isFinal: false }, { progress: 0, isFinal: false }, { progress: 100, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(3);
      expect(result.completed).assertEqual(1);
      expect(result.percent).assertEqual(100);
      expect(result.finished).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0079 end');
    });

    /**
     * @tc.name   testProgressSummary0080
     * @tc.number SUB_SCAN_PROGRESS_01_0080
     * @tc.desc   ScanProgressSummary case 80
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0080 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: -1, isFinal: true }, { progress: 0, isFinal: true }, { progress: 100, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(3);
      expect(result.completed).assertEqual(1);
      expect(result.percent).assertEqual(100);
      expect(result.finished).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0080 end');
    });

    /**
     * @tc.name   testProgressSummary0081
     * @tc.number SUB_SCAN_PROGRESS_01_0081
     * @tc.desc   ScanProgressSummary case 81
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0081 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 25, isFinal: false }, { progress: 75, isFinal: false }, { progress: 100, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(3);
      expect(result.completed).assertEqual(1);
      expect(result.percent).assertEqual(100);
      expect(result.finished).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0081 end');
    });

    /**
     * @tc.name   testProgressSummary0082
     * @tc.number SUB_SCAN_PROGRESS_01_0082
     * @tc.desc   ScanProgressSummary case 82
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0082 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 25, isFinal: true }, { progress: 75, isFinal: true }, { progress: 100, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(3);
      expect(result.completed).assertEqual(1);
      expect(result.percent).assertEqual(100);
      expect(result.finished).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0082 end');
    });

    /**
     * @tc.name   testProgressSummary0083
     * @tc.number SUB_SCAN_PROGRESS_01_0083
     * @tc.desc   ScanProgressSummary case 83
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0083 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 33, isFinal: false }, { progress: 66, isFinal: false }, { progress: 100, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(3);
      expect(result.completed).assertEqual(1);
      expect(result.percent).assertEqual(100);
      expect(result.finished).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0083 end');
    });

    /**
     * @tc.name   testProgressSummary0084
     * @tc.number SUB_SCAN_PROGRESS_01_0084
     * @tc.desc   ScanProgressSummary case 84
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0084 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 33, isFinal: true }, { progress: 66, isFinal: true }, { progress: 100, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(3);
      expect(result.completed).assertEqual(1);
      expect(result.percent).assertEqual(100);
      expect(result.finished).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0084 end');
    });

    /**
     * @tc.name   testProgressSummary0085
     * @tc.number SUB_SCAN_PROGRESS_01_0085
     * @tc.desc   ScanProgressSummary case 85
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0085 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 1, isFinal: false }, { progress: 2, isFinal: false }, { progress: 3, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(3);
      expect(result.completed).assertEqual(0);
      expect(result.percent).assertEqual(3);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0085 end');
    });

    /**
     * @tc.name   testProgressSummary0086
     * @tc.number SUB_SCAN_PROGRESS_01_0086
     * @tc.desc   ScanProgressSummary case 86
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0086 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 1, isFinal: true }, { progress: 2, isFinal: true }, { progress: 3, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(3);
      expect(result.completed).assertEqual(0);
      expect(result.percent).assertEqual(3);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0086 end');
    });

    /**
     * @tc.name   testProgressSummary0087
     * @tc.number SUB_SCAN_PROGRESS_01_0087
     * @tc.desc   ScanProgressSummary case 87
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0087 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 100, isFinal: false }, { progress: 0, isFinal: false }, { progress: 100, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(3);
      expect(result.completed).assertEqual(2);
      expect(result.percent).assertEqual(100);
      expect(result.finished).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0087 end');
    });

    /**
     * @tc.name   testProgressSummary0088
     * @tc.number SUB_SCAN_PROGRESS_01_0088
     * @tc.desc   ScanProgressSummary case 88
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0088 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 100, isFinal: true }, { progress: 0, isFinal: true }, { progress: 100, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(3);
      expect(result.completed).assertEqual(2);
      expect(result.percent).assertEqual(100);
      expect(result.finished).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0088 end');
    });

    /**
     * @tc.name   testProgressSummary0089
     * @tc.number SUB_SCAN_PROGRESS_01_0089
     * @tc.desc   ScanProgressSummary case 89
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0089 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: -10, isFinal: false }, { progress: -20, isFinal: false }, { progress: -30, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(3);
      expect(result.completed).assertEqual(0);
      expect(result.percent).assertEqual(0);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0089 end');
    });

    /**
     * @tc.name   testProgressSummary0090
     * @tc.number SUB_SCAN_PROGRESS_01_0090
     * @tc.desc   ScanProgressSummary case 90
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressSummary0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0090 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: -10, isFinal: true }, { progress: -20, isFinal: true }, { progress: -30, isFinal: true }];
      const result: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(result.total).assertEqual(3);
      expect(result.completed).assertEqual(0);
      expect(result.percent).assertEqual(0);
      expect(result.finished).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressSummary0090 end');
    });

  });
}
