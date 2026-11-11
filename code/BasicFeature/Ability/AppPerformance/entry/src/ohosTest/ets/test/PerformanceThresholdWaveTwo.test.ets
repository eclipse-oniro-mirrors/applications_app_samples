import { describe, expect, it } from '@ohos/hypium';
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
        expect(evaluateFlowThresholds(flow).failed()).assertEqual(0);
        flow.steps[3].elapsed++;
        const report = evaluateFlowThresholds(flow);
        expect(report.criticalFailures()).assertEqual(1);
        expect(report.failures()[0].key).assertEqual('stage.evict.ms');
        expect(resultFor(report, 'success.ratio').observed).assertEqual(100);
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
        expect(partial.missing()).assertEqual(5);
        expect(resultFor(partial, 'stage.config.ms').passed).assertTrue();
        platform.advance(17); service.cancelExperiment(); await running;
        const cancelled = service.getState().maintenance;
        if (cancelled === undefined) { throw new Error('Missing cancelled production flow'); }
        const terminal = evaluateFlowThresholds(cancelled);
        expect(terminal.missing()).assertEqual(3);
        expect(resultFor(terminal, 'stage.warm.ms').observed).assertEqual(17);
        expect(resultFor(terminal, 'success.ratio').observed).assertEqual(33.3);
        expect(terminal.failed()).assertEqual(1);
      } finally {
        platform.reply.resolve(new Uint8Array([65, 66, 67])); await waveDrain(); service.dispose();
      }
    });
  });
}
