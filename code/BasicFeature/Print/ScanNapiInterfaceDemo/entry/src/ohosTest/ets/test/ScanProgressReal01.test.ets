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

export default function scanProgressRealTest() {
  describe('ScanProgressAggregator', () => {

    /**
     * @tc.name   testProgressReal0001
     * @tc.number SUB_SCAN_PROGRESS_02_0001
     * @tc.desc   normalizeProgress clamps out of range values into 0..100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressReal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressReal0001 begin');
      const inputs: number[] = [-100, -1, 0, 100, 101, 1000];
      const expected: number[] = [0, 0, 0, 100, 100, 100];
      let matched: number = 0;
      for (let index = 0; index < inputs.length; index++) {
        if (ScanProgressAggregator.normalizeProgress(inputs[index]) === expected[index]) {
          matched++;
        }
      }
      expect(matched).assertEqual(6);
      expect(ScanProgressAggregator.normalizeProgress(-1)).assertEqual(0);
      expect(ScanProgressAggregator.normalizeProgress(1000)).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressReal0001 end');
    });

    /**
     * @tc.name   testProgressReal0002
     * @tc.number SUB_SCAN_PROGRESS_02_0002
     * @tc.desc   normalizeProgress rounds to the nearest integer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressReal0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressReal0002 begin');
      expect(ScanProgressAggregator.normalizeProgress(49.4)).assertEqual(49);
      expect(ScanProgressAggregator.normalizeProgress(49.5)).assertEqual(50);
      expect(ScanProgressAggregator.normalizeProgress(99.4)).assertEqual(99);
      expect(ScanProgressAggregator.normalizeProgress(99.6)).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressReal0002 end');
    });

    /**
     * @tc.name   testProgressReal0003
     * @tc.number SUB_SCAN_PROGRESS_02_0003
     * @tc.desc   NaN and infinities degrade to the clamp bounds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressReal0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressReal0003 begin');
      expect(ScanProgressAggregator.normalizeProgress(Number.NaN)).assertEqual(0);
      expect(ScanProgressAggregator.normalizeProgress(Number.POSITIVE_INFINITY)).assertEqual(100);
      expect(ScanProgressAggregator.normalizeProgress(Number.NEGATIVE_INFINITY)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressReal0003 end');
    });

    /**
     * @tc.name   testProgressReal0004
     * @tc.number SUB_SCAN_PROGRESS_02_0004
     * @tc.desc   countCompleted counts snapshots that normalize to one hundred
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressReal0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressReal0004 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 100, isFinal: false }, { progress: 99.6, isFinal: false }, { progress: 99, isFinal: false }];
      expect(ScanProgressAggregator.countCompleted(list)).assertEqual(2);
      expect(ScanProgressAggregator.countFinalized(list)).assertEqual(0);
      expect(ScanProgressAggregator.isFinished(list)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressReal0004 end');
    });

    /**
     * @tc.name   testProgressReal0005
     * @tc.number SUB_SCAN_PROGRESS_02_0005
     * @tc.desc   countCompleted stays zero when every snapshot is below one hundred
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressReal0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressReal0005 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 0, isFinal: true }, { progress: 50, isFinal: false }, { progress: 99, isFinal: true }];
      expect(ScanProgressAggregator.countCompleted(list)).assertEqual(0);
      expect(ScanProgressAggregator.countFinalized(list)).assertEqual(2);
      expect(ScanProgressAggregator.isFinished(list)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressReal0005 end');
    });

    /**
     * @tc.name   testProgressReal0006
     * @tc.number SUB_SCAN_PROGRESS_02_0006
     * @tc.desc   empty snapshot list reports zero counters and never finishes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressReal0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressReal0006 begin');
      const list: ScanProgressSnapshot[] = [];
      expect(ScanProgressAggregator.countCompleted(list)).assertEqual(0);
      expect(ScanProgressAggregator.countFinalized(list)).assertEqual(0);
      expect(ScanProgressAggregator.isFinished(list)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressReal0006 end');
    });

    /**
     * @tc.name   testProgressReal0007
     * @tc.number SUB_SCAN_PROGRESS_02_0007
     * @tc.desc   countFinalized only looks at the isFinal flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressReal0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressReal0007 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 50, isFinal: true }, { progress: 50, isFinal: false }, { progress: 100, isFinal: true }];
      expect(ScanProgressAggregator.countFinalized(list)).assertEqual(2);
      expect(ScanProgressAggregator.countCompleted(list)).assertEqual(1);
      expect(ScanProgressAggregator.isFinished(list)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressReal0007 end');
    });

    /**
     * @tc.name   testProgressReal0008
     * @tc.number SUB_SCAN_PROGRESS_02_0008
     * @tc.desc   a single hundred percent snapshot finishes only when final
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressReal0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressReal0008 begin');
      const open: ScanProgressSnapshot[] = [{ progress: 100, isFinal: false }];
      const closed: ScanProgressSnapshot[] = [{ progress: 100, isFinal: true }];
      expect(ScanProgressAggregator.isFinished(open)).assertFalse();
      expect(ScanProgressAggregator.isFinished(closed)).assertTrue();
      expect(ScanProgressAggregator.countCompleted(closed)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressReal0008 end');
    });

    /**
     * @tc.name   testProgressReal0009
     * @tc.number SUB_SCAN_PROGRESS_02_0009
     * @tc.desc   a late snapshot after one hundred percent keeps the scan open
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressReal0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressReal0009 begin');
      const list: ScanProgressSnapshot[] = [{ progress: 100, isFinal: true }, { progress: 50, isFinal: false }];
      expect(ScanProgressAggregator.isFinished(list)).assertFalse();
      expect(ScanProgressAggregator.countFinalized(list)).assertEqual(1);
      expect(ScanProgressAggregator.countCompleted(list)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressReal0009 end');
    });

    /**
     * @tc.name   testProgressReal0010
     * @tc.number SUB_SCAN_PROGRESS_02_0010
     * @tc.desc   values above one hundred normalize before the finish check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressReal0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressReal0010 begin');
      const list: ScanProgressSnapshot[] = [{ progress: 50, isFinal: true }, { progress: 120, isFinal: true }];
      expect(ScanProgressAggregator.isFinished(list)).assertTrue();
      expect(ScanProgressAggregator.countCompleted(list)).assertEqual(1);
      expect(ScanProgressAggregator.countFinalized(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressReal0010 end');
    });

    /**
     * @tc.name   testProgressReal0011
     * @tc.number SUB_SCAN_PROGRESS_02_0011
     * @tc.desc   summarize on an empty list keeps every field neutral
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressReal0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressReal0011 begin');
      const summary: ScanProgressSummary = ScanProgressAggregator.summarize([]);
      expect(summary.total).assertEqual(0);
      expect(summary.completed).assertEqual(0);
      expect(summary.finalized).assertEqual(0);
      expect(summary.percent).assertEqual(0);
      expect(summary.finished).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressReal0011 end');
    });

    /**
     * @tc.name   testProgressReal0012
     * @tc.number SUB_SCAN_PROGRESS_02_0012
     * @tc.desc   summarize reports the full aggregate of a finished batch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressReal0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressReal0012 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 0, isFinal: false }, { progress: 50, isFinal: false }, { progress: 100, isFinal: true }];
      const summary: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(summary.total).assertEqual(3);
      expect(summary.completed).assertEqual(1);
      expect(summary.finalized).assertEqual(1);
      expect(summary.percent).assertEqual(100);
      expect(summary.finished).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressReal0012 end');
    });

    /**
     * @tc.name   testProgressReal0013
     * @tc.number SUB_SCAN_PROGRESS_02_0013
     * @tc.desc   summarize uses only the last snapshot for the percent field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressReal0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressReal0013 begin');
      const list: ScanProgressSnapshot[] = [{ progress: 100, isFinal: true }, { progress: 99.6, isFinal: false }];
      const summary: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(summary.percent).assertEqual(100);
      expect(summary.completed).assertEqual(2);
      expect(summary.finalized).assertEqual(1);
      expect(summary.finished).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressReal0013 end');
    });

    /**
     * @tc.name   testProgressReal0014
     * @tc.number SUB_SCAN_PROGRESS_02_0014
     * @tc.desc   mergePercent never lets the progress bar move backwards
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressReal0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressReal0014 begin');
      expect(ScanProgressAggregator.mergePercent(30, 70)).assertEqual(70);
      expect(ScanProgressAggregator.mergePercent(70, 30)).assertEqual(70);
      expect(ScanProgressAggregator.mergePercent(70, 70)).assertEqual(70);
      expect(ScanProgressAggregator.mergePercent(0, 0)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressReal0014 end');
    });

    /**
     * @tc.name   testProgressReal0015
     * @tc.number SUB_SCAN_PROGRESS_02_0015
     * @tc.desc   mergePercent normalizes both sides before comparing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressReal0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressReal0015 begin');
      expect(ScanProgressAggregator.mergePercent(Number.NaN, 40)).assertEqual(40);
      expect(ScanProgressAggregator.mergePercent(Number.NEGATIVE_INFINITY, -1)).assertEqual(0);
      expect(ScanProgressAggregator.mergePercent(120, 150)).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressReal0015 end');
    });

    /**
     * @tc.name   testProgressReal0016
     * @tc.number SUB_SCAN_PROGRESS_02_0016
     * @tc.desc   mergePercent keeps one hundred once reached
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressReal0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressReal0016 begin');
      expect(ScanProgressAggregator.mergePercent(100, 0)).assertEqual(100);
      expect(ScanProgressAggregator.mergePercent(99, 100)).assertEqual(100);
      expect(ScanProgressAggregator.mergePercent(1000, -1000)).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressReal0016 end');
    });

    /**
     * @tc.name   testProgressReal0017
     * @tc.number SUB_SCAN_PROGRESS_02_0017
     * @tc.desc   getPollDelay stops polling only after the scan finished
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressReal0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressReal0017 begin');
      expect(ScanProgressAggregator.getPollDelay(true)).assertEqual(-1);
      expect(ScanProgressAggregator.getPollDelay(false)).assertEqual(500);
      expect(ScanProgressAggregator.getPollDelay(false) > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressReal0017 end');
    });

    /**
     * @tc.name   testProgressReal0018
     * @tc.number SUB_SCAN_PROGRESS_02_0018
     * @tc.desc   toPercentText renders the normalized value with a percent sign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressReal0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressReal0018 begin');
      expect(ScanProgressAggregator.toPercentText(49.6)).assertEqual('50%');
      expect(ScanProgressAggregator.toPercentText(0)).assertEqual('0%');
      expect(ScanProgressAggregator.toPercentText(100)).assertEqual('100%');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressReal0018 end');
    });

    /**
     * @tc.name   testProgressReal0019
     * @tc.number SUB_SCAN_PROGRESS_02_0019
     * @tc.desc   toPercentText clamps out of range input before rendering
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressReal0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressReal0019 begin');
      expect(ScanProgressAggregator.toPercentText(-10)).assertEqual('0%');
      expect(ScanProgressAggregator.toPercentText(150)).assertEqual('100%');
      expect(ScanProgressAggregator.toPercentText(Number.NaN)).assertEqual('0%');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressReal0019 end');
    });

    /**
     * @tc.name   testProgressReal0020
     * @tc.number SUB_SCAN_PROGRESS_02_0020
     * @tc.desc   documented constants stay stable for the polling loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressReal0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressReal0020 begin');
      expect(ScanProgressAggregator.PERCENT_MIN).assertEqual(0);
      expect(ScanProgressAggregator.PERCENT_MAX).assertEqual(100);
      expect(ScanProgressAggregator.POLL_DELAY_MS).assertEqual(500);
      expect(ScanProgressAggregator.STOP_DELAY_MS).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressReal0020 end');
    });

    /**
     * @tc.name   testProgressReal0021
     * @tc.number SUB_SCAN_PROGRESS_02_0021
     * @tc.desc   polling loop stops as soon as the summary reports finished
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressReal0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressReal0021 begin');
      const list: ScanProgressSnapshot[] = [{ progress: 40, isFinal: false }, { progress: 120, isFinal: true }];
      const summary: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(summary.finished).assertTrue();
      expect(summary.percent).assertEqual(100);
      expect(ScanProgressAggregator.getPollDelay(summary.finished)).assertEqual(-1);
      expect(ScanProgressAggregator.mergePercent(30, summary.percent)).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressReal0021 end');
    });

    /**
     * @tc.name   testProgressReal0022
     * @tc.number SUB_SCAN_PROGRESS_02_0022
     * @tc.desc   completed count uses the clamped value for oversized input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressReal0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressReal0022 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 150, isFinal: false }, { progress: 1000, isFinal: false }, { progress: 99, isFinal: false }];
      expect(ScanProgressAggregator.countCompleted(list)).assertEqual(2);
      expect(ScanProgressAggregator.countFinalized(list)).assertEqual(0);
      expect(ScanProgressAggregator.normalizeProgress(150)).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressReal0022 end');
    });

    /**
     * @tc.name   testProgressReal0023
     * @tc.number SUB_SCAN_PROGRESS_02_0023
     * @tc.desc   negative progress normalizes to zero and never completes a snapshot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressReal0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressReal0023 begin');
      const list: ScanProgressSnapshot[] = [{ progress: -20, isFinal: true }, { progress: -1, isFinal: false }];
      expect(ScanProgressAggregator.countCompleted(list)).assertEqual(0);
      expect(ScanProgressAggregator.isFinished(list)).assertFalse();
      expect(ScanProgressAggregator.normalizeProgress(-20)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressReal0023 end');
    });

    /**
     * @tc.name   testProgressReal0024
     * @tc.number SUB_SCAN_PROGRESS_02_0024
     * @tc.desc   summarize keeps counting after a final flag appears in the middle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProgressReal0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressReal0024 begin');
      const list: ScanProgressSnapshot[] = [
        { progress: 50, isFinal: false }, { progress: 100, isFinal: true }, { progress: 100, isFinal: false }];
      const summary: ScanProgressSummary = ScanProgressAggregator.summarize(list);
      expect(summary.total).assertEqual(3);
      expect(summary.completed).assertEqual(2);
      expect(summary.finalized).assertEqual(1);
      expect(summary.finished).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testProgressReal0024 end');
    });
  });
}
