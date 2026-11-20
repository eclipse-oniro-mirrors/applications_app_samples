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
 

import { describe, beforeAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { PerfTimer } from '../../../main/ets/model/utils/PerfTimer';

/**
 * PerfTimer 性能计时工具类设备侧测试
 * 覆盖：静态 time() 返回值透传与耗时日志、实例采样统计
 * （count/avg/min/max）、report 输出、reset 清空。
 */
export default function perfTimerTest() {
  describe('perfTimerTest', () => {
    beforeAll(() => {
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PERFTIMER_0100
     * @tc.name timeReturnsFnResult001
     * @tc.desc Verify static time passes through the numeric result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('time_returnsFnResult', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number = PerfTimer.time('Test', '加法', (): number => {
        return 1 + 2;
      });
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PERFTIMER_0200
     * @tc.name timeWorksForObject002
     * @tc.desc Verify static time passes through non-numeric results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('time_worksForObject', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: string = PerfTimer.time('Test', '字符串', (): string => {
        return 'ok';
      });
      expect(result).assertEqual('ok');
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PERFTIMER_0300
     * @tc.name instanceSamples003
     * @tc.desc Verify an instance records one non-negative sample
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('instance_samples', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const t: PerfTimer = new PerfTimer();
      t.start();
      const cost: number = t.stop();
      // 耗时非负
      expect(cost >= 0).assertTrue();
      expect(t.count()).assertEqual(1);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PERFTIMER_0400
     * @tc.name instanceStatistics004
     * @tc.desc Verify count, avg, min and max agree across three samples
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('instance_statistics', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const t: PerfTimer = new PerfTimer();
      // 模拟 3 次采样（start/stop 间隔极短，统计逻辑正确性为主）
      t.start();
      t.stop();
      t.start();
      t.stop();
      t.start();
      t.stop();
      expect(t.count()).assertEqual(3);
      expect(t.avg() >= 0).assertTrue();
      expect(t.min() <= t.avg()).assertTrue();
      expect(t.max() >= t.avg()).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PERFTIMER_0500
     * @tc.name emptyStatisticsReturnZero005
     * @tc.desc Verify empty statistics report zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('empty_statistics_returnZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const t: PerfTimer = new PerfTimer();
      expect(t.count()).assertEqual(0);
      expect(t.avg()).assertEqual(0);
      expect(t.min()).assertEqual(0);
      expect(t.max()).assertEqual(0);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PERFTIMER_0600
     * @tc.name resetClearsSamples006
     * @tc.desc Verify reset drops recorded samples
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('reset_clearsSamples', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const t: PerfTimer = new PerfTimer();
      t.start();
      t.stop();
      expect(t.count()).assertEqual(1);
      t.reset();
      expect(t.count()).assertEqual(0);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PERFTIMER_0700
     * @tc.name reportContainsKeywords007
     * @tc.desc Verify the report includes the label and sample count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('report_containsKeywords', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const t: PerfTimer = new PerfTimer();
      t.start();
      t.stop();
      const line: string = t.report('测试场景');
      expect(line.includes('测试场景')).assertTrue();
      expect(line.includes('1 samples')).assertTrue();
    });
  });
}
