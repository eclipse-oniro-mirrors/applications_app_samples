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
import { AppService } from '../../../main/ets/core/AppService';
import { SeriesPhase } from '../../../main/ets/core/ExperimentSeries';
import { buildSeriesPanelView } from '../../../main/ets/core/SeriesPresentation';
import { workloadOf } from '../../../main/ets/core/WorkloadCatalog';
import { MemoryStore } from '../support/FakePlatform';
import { SeriesIoPlatform, requiredSeries, waitSeries, finishSeriesFixture } from '../support/SeriesFixtures';

export default function seriesStateFeatureTests(): void {
  describe('SeriesStateFeature', (): void => {
    /**
     * @tc.number SUB_PERFORMANCE_SERIESSTATEFEATURE_0100
     * @tc.name testPerformanceSeriesStateFeature0001
     * @tc.desc 订阅者修改系列快照不能伪造进度、改变模式或取消真实运行
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceSeriesStateFeature0001', 0, async (): Promise<void> => {
      const platform = new SeriesIoPlatform(); platform.pauseReadAt = 1;
      const service = AppService.fromPlatform(platform);
      const start = service.startExperimentSeries('W-TEXT', 'control');
      try {
        await waitSeries((): boolean => platform.resourceCalls === 1, 'snapshot isolation');
        const external = requiredSeries(service);
        external.recordIds.push('foreign'); external.startedCount = 100;
        external.phase = SeriesPhase.COMPLETED; external.mode = 'files'; external.cancelRequested = true;
        const fresh = requiredSeries(service);
        expect(fresh.recordIds.length).assertEqual(0);
        expect(fresh.startedCount).assertEqual(1);
        expect(fresh.mode).assertEqual('control');
        expect(fresh.phase).assertEqual(SeriesPhase.RUNNING);
        platform.releaseRead(); await service.whenSeriesFinished(start.ownerId);
        expect(requiredSeries(service).recordIds.length).assertEqual(3);
        expect(platform.fileCalls.length).assertEqual(0);
      } finally { await finishSeriesFixture(service, platform, start.ownerId); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIESSTATEFEATURE_0200
     * @tc.name testPerformanceSeriesStateFeature0002
     * @tc.desc 系列记录与账本深拷贝隔离，外部改阶段、字节和缺口不污染原始事实
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceSeriesStateFeature0002', 0, async (): Promise<void> => {
      const platform = new SeriesIoPlatform(); const service = AppService.fromPlatform(platform);
      const start = service.startExperimentSeries('W-TEXT', 'control', 1);
      try {
        await service.whenSeriesFinished(start.ownerId);
        const external = service.seriesRecords(start.ownerId)[0];
        external.stages[0].status = '失败'; external.beforeBytes = 900; external.missing.push('outside-only');
        const actual = service.seriesRecords(start.ownerId)[0];
        expect(actual.complete()).assertTrue();
        expect(actual.beforeBytes).assertEqual(3);
        expect(actual.missing.indexOf('outside-only')).assertEqual(-1);
        expect(service.ledgerRecords()[0].stages[0].status).assertEqual('成功');
      } finally { await finishSeriesFixture(service, platform, start.ownerId); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIESSTATEFEATURE_0300
     * @tc.name testPerformanceSeriesStateFeature0003
     * @tc.desc 展示模型按系列真实身份筛选，不能把传入的全部旧账本混入统计
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceSeriesStateFeature0003', 0, async (): Promise<void> => {
      const platform = new SeriesIoPlatform(); const service = AppService.fromPlatform(platform);
      await service.runExperiment('W-TEXT', 'control');
      const start = service.startExperimentSeries('W-TEXT', 'control', 2);
      try {
        await service.whenSeriesFinished(start.ownerId);
        const view = buildSeriesPanelView(service.seriesState(), service.ledgerRecords(), 2, false, false);
        expect(view.referenceText).assertEqual('可用 2 / 2 条，缺失 0 条');
        expect(view.statistics[0].indexOf('｜2 次｜有效 2｜失败/缺失 0') >= 0).assertTrue();
        expect(view.scopeText).assertEqual('结果来源：W-TEXT / control；计划 2 次');
        expect(view.canCopyReport).assertTrue();
        expect(service.ledgerRecords().length).assertEqual(3);
      } finally { await finishSeriesFixture(service, platform, start.ownerId); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIESSTATEFEATURE_0400
     * @tc.name testPerformanceSeriesStateFeature0004
     * @tc.desc 历史系列记录已清除时展示缺失并禁用报告，不用零耗时填补统计
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceSeriesStateFeature0004', 0, async (): Promise<void> => {
      const platform = new SeriesIoPlatform(); const service = AppService.fromPlatform(platform);
      const start = service.startExperimentSeries('W-TEXT', 'control');
      try {
        await service.whenSeriesFinished(start.ownerId); service.clearLedger();
        const view = buildSeriesPanelView(service.seriesState(), service.seriesRecords(start.ownerId));
        expect(view.statistics.length).assertEqual(0);
        expect(view.referenceText).assertEqual('可用 0 / 3 条，缺失 3 条');
        expect(view.canCopyReport).assertFalse();
        expect(view.phaseText).assertEqual('已完成');
      } finally { await finishSeriesFixture(service, platform, start.ownerId); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIESSTATEFEATURE_0500
     * @tc.name testPerformanceSeriesStateFeature0005
     * @tc.desc 元信息引用已存在的其他负载记录时拒绝坏系列，正式账本不被删除
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceSeriesStateFeature0005', 0, async (): Promise<void> => {
      const platform = new SeriesIoPlatform(); const source = AppService.fromPlatform(platform);
      const start = source.startExperimentSeries('W-TEXT', 'control', 1);
      await source.whenSeriesFinished(start.ownerId);
      const raw = JSON.parse(platform.store.value) as Record<string, Object>;
      (raw['series'] as Record<string, Object>)['workloadId'] = 'W-NOTES'; source.dispose();
      const copied = new MemoryStore(); copied.value = JSON.stringify(raw);
      const nextPlatform = new SeriesIoPlatform(copied); const reopened = AppService.fromPlatform(nextPlatform);
      try {
        expect(reopened.seriesState()).assertUndefined();
        expect(reopened.ledgerRecords()[0].workloadId).assertEqual('W-TEXT');
        expect(await reopened.copySeriesAnalysisReport(start.ownerId)).assertFalse();
        expect(nextPlatform.copiedTexts.length).assertEqual(0);
        expect(nextPlatform.resourceCalls).assertEqual(0);
      } finally { reopened.dispose(); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIESSTATEFEATURE_0600
     * @tc.name testPerformanceSeriesStateFeature0006
     * @tc.desc 空完成声明不能让UI显示三次已完成，坏元信息不影响已有真实样本
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceSeriesStateFeature0006', 0, async (): Promise<void> => {
      const platform = new SeriesIoPlatform(); const source = AppService.fromPlatform(platform);
      const start = source.startExperimentSeries('W-TEXT', 'control', 1);
      await source.whenSeriesFinished(start.ownerId);
      const raw = JSON.parse(platform.store.value) as Record<string, Object>;
      const metadata = raw['series'] as Record<string, Object>;
      metadata['repetitions'] = 3; metadata['startedCount'] = 0;
      metadata['recordIds'] = []; metadata['baselineRecordId'] = ''; metadata['endedAt'] = 0;
      source.dispose();
      const copied = new MemoryStore(); copied.value = JSON.stringify(raw);
      const nextPlatform = new SeriesIoPlatform(copied); const reopened = AppService.fromPlatform(nextPlatform);
      try {
        expect(reopened.seriesState()).assertUndefined();
        expect(reopened.ledgerRecords()[0].complete()).assertTrue();
        expect(nextPlatform.resourceCalls).assertEqual(0);
        expect(buildSeriesPanelView(reopened.seriesState(), reopened.ledgerRecords()).phaseText).assertEqual('未开始');
      } finally { reopened.dispose(); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIESSTATEFEATURE_0700
     * @tc.name testPerformanceSeriesStateFeature0007
     * @tc.desc 原有手工资源读取在途时系列不能抢占，完成后才允许显式新开始
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceSeriesStateFeature0007', 0, async (): Promise<void> => {
      const platform = new SeriesIoPlatform(); platform.pauseReadAt = 1;
      const service = AppService.fromPlatform(platform); const reading = service.readResource();
      try {
        expect(service.startExperimentSeries('W-TEXT', 'control').accepted).assertFalse();
        expect(service.seriesState()).assertUndefined();
        platform.releaseRead(); await reading;
        expect(service.getState().resourceText).assertEqual('3 字节 · ABC');
        const start = service.startExperimentSeries('W-TEXT', 'control', 1);
        await service.whenSeriesFinished(start.ownerId);
        expect(requiredSeries(service).phase).assertEqual(SeriesPhase.COMPLETED);
        expect(platform.resourceCalls).assertEqual(3);
      } finally { platform.releaseRead(); await reading; service.dispose(); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIESSTATEFEATURE_0800
     * @tc.name testPerformanceSeriesStateFeature0008
     * @tc.desc 选择列表负载和模块模式后各次都把正式资源身份传入实际执行路径
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceSeriesStateFeature0008', 0, async (): Promise<void> => {
      const platform = new SeriesIoPlatform();
      const text = 'First|Body|2026-11-05\nSecond|Another body|2026-11-06';
      platform.resource = new Uint8Array(text.length);
      for (let index = 0; index < text.length; index++) { platform.resource[index] = text.charCodeAt(index); }
      const spec = workloadOf('W-NOTES');
      if (spec === undefined) { throw new Error('Missing official workload'); }
      const service = AppService.fromPlatform(platform);
      const start = service.startExperimentSeries('W-NOTES', 'modules', 2);
      try {
        await service.whenSeriesFinished(start.ownerId);
        expect(requiredSeries(service).phase).assertEqual(SeriesPhase.COMPLETED);
        expect(platform.resourceNames.every((name: string): boolean => name === spec.rawFile)).assertTrue();
        expect(platform.moduleCalls.length).assertEqual(2);
        expect(platform.fileCalls.length).assertEqual(0);
        expect(service.seriesRecords(start.ownerId).every((record): boolean =>
          record.workloadId === 'W-NOTES' && record.mode === 'modules')).assertTrue();
      } finally { await finishSeriesFixture(service, platform, start.ownerId); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIESSTATEFEATURE_0900
     * @tc.name testPerformanceSeriesStateFeature0009
     * @tc.desc 模块能力不可用与已下发拒绝都停止系列，但保留不同的系统请求事实
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceSeriesStateFeature0009', 0, async (): Promise<void> => {
      const absent = new SeriesIoPlatform(); absent.moduleAvailable = false;
      const first = AppService.fromPlatform(absent); const notSent = first.startExperimentSeries('W-TEXT', 'modules');
      try {
        await first.whenSeriesFinished(notSent.ownerId);
        expect(absent.moduleCalls.length).assertEqual(0);
        expect(first.getState().latestMemory?.kind).assertEqual('blocked');
        expect(requiredSeries(first).startedCount).assertEqual(1);
      } finally { await finishSeriesFixture(first, absent, notSent.ownerId); }
      const rejected = new SeriesIoPlatform(); rejected.moduleErrorCode = 182303;
      const second = AppService.fromPlatform(rejected); const sent = second.startExperimentSeries('W-TEXT', 'modules');
      try {
        await second.whenSeriesFinished(sent.ownerId);
        expect(rejected.moduleCalls.length).assertEqual(1);
        expect(second.getState().latestMemory?.code).assertEqual(182303);
        expect(rejected.resourceCalls).assertEqual(1);
        expect(requiredSeries(second).phase).assertEqual(SeriesPhase.FAILED);
      } finally { await finishSeriesFixture(second, rejected, sent.ownerId); }
    });
  });
}
