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

import { traceParameter } from '../support/TestLog';
import { describe, expect } from '@ohos/hypium';
import { loggedIt as it } from '../support/TestLog';
import { AppService } from '../../../main/ets/core/AppService';
import { evaluateFlowThresholds, flowThresholds } from '../../../main/ets/core/FlowMetrics';
import { ThresholdReport, ThresholdResult } from '../../../main/ets/core/ThresholdCatalog';
import { FakePlatform } from '../support/FakePlatform';
import { WaveResourcePlatform, waveDrain } from '../support/PerformanceWaveOneFixtures';

function resultFor(report: ThresholdReport, key: string): ThresholdResult {
  const result = report.results.find((item: ThresholdResult): boolean => item.key === key);
  if (result === undefined) { throw new Error(`Missing threshold result ${key}`); }
  return result;
}

export default function performanceThresholdWaveTwoTests(): void {
  describe('PerformanceThresholdWaveTwo', (): void => {
    /**
     * @tc.number SUB_PERFORMANCE_THRESHOLDWAVETWO_0100
     * @tc.name testPerformanceThresholdWaveTwo0001
     * @tc.desc 真实六阶段阈值区分等值与单阶段超预算，不被百分百成功率掩盖
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceThresholdWaveTwo0001', 0, async (): Promise<void> => {
      const service = AppService.fromPlatform(new FakePlatform());
      try {
        await service.runMaintenanceFlow('control');
        const flow = service.getState().maintenance;
        const budget = flowThresholds().find((entry): boolean => entry.key === 'stage.evict.ms');
        if (flow === undefined || budget === undefined) { throw new Error('Missing real flow or stage budget'); }
        flow.steps[3].elapsed = budget.value;
        expect(traceParameter('com.samples.appperformance_PerformanceThresholdWaveTwo_0001 PerformanceThresholdWaveTwo.test:47 assertEqual actual', evaluateFlowThresholds(flow).failed())).assertEqual(traceParameter('com.samples.appperformance_PerformanceThresholdWaveTwo_0001 PerformanceThresholdWaveTwo.test:47 assertEqual expected', 0));
        flow.steps[3].elapsed++;
        const report = evaluateFlowThresholds(flow);
        expect(traceParameter('com.samples.appperformance_PerformanceThresholdWaveTwo_0001 PerformanceThresholdWaveTwo.test:50 assertEqual actual', report.criticalFailures())).assertEqual(traceParameter('com.samples.appperformance_PerformanceThresholdWaveTwo_0001 PerformanceThresholdWaveTwo.test:50 assertEqual expected', 1));
        expect(traceParameter('com.samples.appperformance_PerformanceThresholdWaveTwo_0001 PerformanceThresholdWaveTwo.test:51 assertEqual actual', report.failures()[0].key)).assertEqual(traceParameter('com.samples.appperformance_PerformanceThresholdWaveTwo_0001 PerformanceThresholdWaveTwo.test:51 assertEqual expected', 'stage.evict.ms'));
        expect(traceParameter('com.samples.appperformance_PerformanceThresholdWaveTwo_0001 PerformanceThresholdWaveTwo.test:52 assertEqual actual', resultFor(report, 'success.ratio').observed)).assertEqual(traceParameter('com.samples.appperformance_PerformanceThresholdWaveTwo_0001 PerformanceThresholdWaveTwo.test:52 assertEqual expected', 100));
      } finally { service.dispose(); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_THRESHOLDWAVETWO_0200
     * @tc.name testPerformanceThresholdWaveTwo0002
     * @tc.desc 运行中与跳过阶段登记缺少观测，取消阶段保留真实耗时而总体成功率失败
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceThresholdWaveTwo0002', 0, async (): Promise<void> => {
      const platform = new WaveResourcePlatform();
      const service = AppService.fromPlatform(platform);
      try {
        const running = service.runExperiment('W-TEXT', 'files'); await waveDrain();
        const active = service.getState().maintenance;
        if (active === undefined) { throw new Error('Missing active production flow'); }
        const partial = evaluateFlowThresholds(active);
        expect(traceParameter('com.samples.appperformance_PerformanceThresholdWaveTwo_0002 PerformanceThresholdWaveTwo.test:72 assertEqual actual', partial.missing())).assertEqual(traceParameter('com.samples.appperformance_PerformanceThresholdWaveTwo_0002 PerformanceThresholdWaveTwo.test:72 assertEqual expected', 5));
        expect(traceParameter('com.samples.appperformance_PerformanceThresholdWaveTwo_0002 PerformanceThresholdWaveTwo.test:73 assertTrue actual', resultFor(partial, 'stage.config.ms').passed)).assertTrue();
        platform.advance(17); service.cancelExperiment(); await running;
        const cancelled = service.getState().maintenance;
        if (cancelled === undefined) { throw new Error('Missing cancelled production flow'); }
        const terminal = evaluateFlowThresholds(cancelled);
        expect(traceParameter('com.samples.appperformance_PerformanceThresholdWaveTwo_0002 PerformanceThresholdWaveTwo.test:78 assertEqual actual', terminal.missing())).assertEqual(traceParameter('com.samples.appperformance_PerformanceThresholdWaveTwo_0002 PerformanceThresholdWaveTwo.test:78 assertEqual expected', 3));
        expect(traceParameter('com.samples.appperformance_PerformanceThresholdWaveTwo_0002 PerformanceThresholdWaveTwo.test:79 assertEqual actual', resultFor(terminal, 'stage.warm.ms').observed)).assertEqual(traceParameter('com.samples.appperformance_PerformanceThresholdWaveTwo_0002 PerformanceThresholdWaveTwo.test:79 assertEqual expected', 17));
        expect(traceParameter('com.samples.appperformance_PerformanceThresholdWaveTwo_0002 PerformanceThresholdWaveTwo.test:80 assertEqual actual', resultFor(terminal, 'success.ratio').observed)).assertEqual(traceParameter('com.samples.appperformance_PerformanceThresholdWaveTwo_0002 PerformanceThresholdWaveTwo.test:80 assertEqual expected', 33.3));
        expect(traceParameter('com.samples.appperformance_PerformanceThresholdWaveTwo_0002 PerformanceThresholdWaveTwo.test:81 assertEqual actual', terminal.failed())).assertEqual(traceParameter('com.samples.appperformance_PerformanceThresholdWaveTwo_0002 PerformanceThresholdWaveTwo.test:81 assertEqual expected', 1));
      } finally {
        platform.reply.resolve(new Uint8Array([65, 66, 67])); await waveDrain(); service.dispose();
      }
    });
  });
}
