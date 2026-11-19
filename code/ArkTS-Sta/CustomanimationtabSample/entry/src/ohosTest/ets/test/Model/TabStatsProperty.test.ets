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
import { describe, expect, it } from '@ohos/hypium';
import {
  TabAccessLog,
  TabOperationStatistics,
  TabOperationType,
  TabPerformanceSampler,
} from '../Shared/CustomAnimationTabFixtures';

/** Property suite for statistics counters, access logs and the sampler. */
export default function tabStatsPropertyTest(): void {
  describe('TabStatsPropertyTest', (): void => {
    // @tc.number SUB_CUSTOM_ANIMATION_TAB_STATPROP_0100
    // @tc.name tabStatsPropertyTest001
    // @tc.desc Verify empty statistics and sampler report zero.
    it('tabStatsPropertyTest001', 0, (): void => {
      const stats: TabOperationStatistics = new TabOperationStatistics();
      const sampler: TabPerformanceSampler = new TabPerformanceSampler();
      expect(stats.total()).assertEqual(0);
      expect(stats.accepted()).assertEqual(0);
      expect(stats.rejected()).assertEqual(0);
      expect(stats.distinctOperations()).assertEqual(0);
      expect(sampler.count()).assertEqual(0);
      expect(sampler.average()).assertEqual(0);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_STATPROP_0200
    // @tc.name tabStatsPropertyTest002
    // @tc.desc Verify 100 records produce a total of 100.
    it('tabStatsPropertyTest002', 0, (): void => {
      const stats: TabOperationStatistics = new TabOperationStatistics();
      for (let step: number = 0; step < 100; step++) {
        stats.record(step % 5, true);
      }
      expect(stats.total()).assertEqual(100);
      expect(stats.accepted()).assertEqual(100);
      expect(stats.rejected()).assertEqual(0);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_STATPROP_0300
    // @tc.name tabStatsPropertyTest003
    // @tc.desc Verify accepted plus rejected always equals total.
    it('tabStatsPropertyTest003', 0, (): void => {
      const stats: TabOperationStatistics = new TabOperationStatistics();
      for (let step: number = 0; step < 200; step++) {
        stats.record(step % 5, step % 2 === 0);
      }
      expect(stats.accepted() + stats.rejected()).assertEqual(stats.total());
      expect(stats.accepted()).assertEqual(100);
      expect(stats.rejected()).assertEqual(100);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_STATPROP_0400
    // @tc.name tabStatsPropertyTest004
    // @tc.desc Verify the per-type counts sum to total.
    it('tabStatsPropertyTest004', 0, (): void => {
      const stats: TabOperationStatistics = new TabOperationStatistics();
      for (let operation: number = 0; operation < 5; operation++) {
        for (let count: number = 0; count < 10; count++) {
          stats.record(operation, true);
        }
      }
      let sum: number = 0;
      for (let operation: number = 0; operation < 5; operation++) {
        sum += stats.countFor(operation);
      }
      expect(sum).assertEqual(stats.total());
      expect(stats.distinctOperations()).assertEqual(5);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_STATPROP_0500
    // @tc.name tabStatsPropertyTest005
    // @tc.desc Verify distinct operation count never exceeds five.
    it('tabStatsPropertyTest005', 0, (): void => {
      const stats: TabOperationStatistics = new TabOperationStatistics();
      for (let step: number = 0; step < 50; step++) {
        stats.record(step % 9, false);
      }
      expect(
        stats.distinctOperations() <= TabOperationType.RESET + 1,
      ).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_STATPROP_0600
    // @tc.name tabStatsPropertyTest006
    // @tc.desc Verify reset clears counters after heavy use.
    it('tabStatsPropertyTest006', 0, (): void => {
      const stats: TabOperationStatistics = new TabOperationStatistics();
      for (let step: number = 0; step < 300; step++) {
        stats.record(step % 5, step % 3 === 0);
      }
      stats.reset();
      expect(stats.total()).assertEqual(0);
      expect(stats.accepted()).assertEqual(0);
      expect(stats.rejected()).assertEqual(0);
      expect(stats.distinctOperations()).assertEqual(0);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_STATPROP_0700
    // @tc.name tabStatsPropertyTest007
    // @tc.desc Verify access log read and write bookkeeping.
    it('tabStatsPropertyTest007', 0, (): void => {
      const log: TabAccessLog = new TabAccessLog();
      log.recordRead('index');
      log.recordRead('yellow');
      log.recordWrite('displacement');
      expect(log.readCount()).assertEqual(2);
      expect(log.writeCount()).assertEqual(1);
      expect(log.hasRead('index')).assertTrue();
      expect(log.hasWrite('displacement')).assertTrue();
      expect(log.hasWrite('index')).assertFalse();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_STATPROP_0800
    // @tc.name tabStatsPropertyTest008
    // @tc.desc Verify access log clear removes all entries.
    it('tabStatsPropertyTest008', 0, (): void => {
      const log: TabAccessLog = new TabAccessLog();
      for (let step: number = 0; step < 20; step++) {
        log.recordRead('field' + String(step));
        log.recordWrite('field' + String(step));
      }
      log.clear();
      expect(log.readCount()).assertEqual(0);
      expect(log.writeCount()).assertEqual(0);
      expect(log.hasRead('field0')).assertFalse();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_STATPROP_0900
    // @tc.name tabStatsPropertyTest009
    // @tc.desc Verify sampler average, peak and minimum on known samples.
    it('tabStatsPropertyTest009', 0, (): void => {
      const sampler: TabPerformanceSampler = new TabPerformanceSampler();
      const values: Array<number> = [5, 15, 10, 25, 20];
      for (let i: number = 0; i < values.length; i++) {
        sampler.record(values[i]);
      }
      expect(sampler.count()).assertEqual(5);
      expect(sampler.total()).assertEqual(75);
      expect(sampler.average()).assertEqual(15);
      expect(sampler.peak()).assertEqual(25);
      expect(sampler.minimum()).assertEqual(5);
      expect(sampler.isStable(25)).assertTrue();
      expect(sampler.isStable(24)).assertFalse();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_STATPROP_1000
    // @tc.name tabStatsPropertyTest010
    // @tc.desc Verify sampler reset returns to an empty state.
    it('tabStatsPropertyTest010', 0, (): void => {
      const sampler: TabPerformanceSampler = new TabPerformanceSampler();
      sampler.record(99);
      sampler.record(1);
      sampler.reset();
      expect(sampler.count()).assertEqual(0);
      expect(sampler.total()).assertEqual(0);
      expect(sampler.average()).assertEqual(0);
      expect(sampler.peak()).assertEqual(0);
      expect(sampler.minimum()).assertEqual(0);
    });
  });
}
