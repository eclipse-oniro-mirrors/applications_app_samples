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
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0001 SeriesStateFeature.test:44 assertEqual actual', fresh.recordIds.length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0001 SeriesStateFeature.test:44 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0001 SeriesStateFeature.test:45 assertEqual actual', fresh.startedCount)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0001 SeriesStateFeature.test:45 assertEqual expected', 1));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0001 SeriesStateFeature.test:46 assertEqual actual', fresh.mode)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0001 SeriesStateFeature.test:46 assertEqual expected', 'control'));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0001 SeriesStateFeature.test:47 assertEqual actual', fresh.phase)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0001 SeriesStateFeature.test:47 assertEqual expected', SeriesPhase.RUNNING));
        platform.releaseRead(); await service.whenSeriesFinished(start.ownerId);
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0001 SeriesStateFeature.test:49 assertEqual actual', requiredSeries(service).recordIds.length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0001 SeriesStateFeature.test:49 assertEqual expected', 3));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0001 SeriesStateFeature.test:50 assertEqual actual', platform.fileCalls.length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0001 SeriesStateFeature.test:50 assertEqual expected', 0));
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
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0002 SeriesStateFeature.test:70 assertTrue actual', actual.complete())).assertTrue();
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0002 SeriesStateFeature.test:71 assertEqual actual', actual.beforeBytes)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0002 SeriesStateFeature.test:71 assertEqual expected', 3));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0002 SeriesStateFeature.test:72 assertEqual actual', actual.missing.indexOf('outside-only'))).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0002 SeriesStateFeature.test:72 assertEqual expected', -1));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0002 SeriesStateFeature.test:73 assertEqual actual', service.ledgerRecords()[0].stages[0].status)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0002 SeriesStateFeature.test:73 assertEqual expected', '成功'));
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
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0003 SeriesStateFeature.test:92 assertEqual actual', view.referenceText)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0003 SeriesStateFeature.test:92 assertEqual expected', '可用 2 / 2 条，缺失 0 条'));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0003 SeriesStateFeature.test:93 assertTrue actual', view.statistics[0].indexOf('｜2 次｜有效 2｜失败/缺失 0') >= 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0003 SeriesStateFeature.test:94 assertEqual actual', view.scopeText)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0003 SeriesStateFeature.test:94 assertEqual expected', '结果来源：W-TEXT / 对照组；计划 2 次'));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0003 SeriesStateFeature.test:95 assertTrue actual', view.canCopyReport)).assertTrue();
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0003 SeriesStateFeature.test:96 assertEqual actual', service.ledgerRecords().length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0003 SeriesStateFeature.test:96 assertEqual expected', 3));
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
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0004 SeriesStateFeature.test:114 assertEqual actual', view.statistics.length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0004 SeriesStateFeature.test:114 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0004 SeriesStateFeature.test:115 assertEqual actual', view.referenceText)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0004 SeriesStateFeature.test:115 assertEqual expected', '可用 0 / 3 条，缺失 3 条'));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0004 SeriesStateFeature.test:116 assertFalse actual', view.canCopyReport)).assertFalse();
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0004 SeriesStateFeature.test:117 assertEqual actual', view.phaseText)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0004 SeriesStateFeature.test:117 assertEqual expected', '已完成'));
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
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0005 SeriesStateFeature.test:138 assertUndefined actual', reopened.seriesState())).assertUndefined();
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0005 SeriesStateFeature.test:139 assertEqual actual', reopened.ledgerRecords()[0].workloadId)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0005 SeriesStateFeature.test:139 assertEqual expected', 'W-TEXT'));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0005 SeriesStateFeature.test:140 assertFalse actual', await reopened.copySeriesAnalysisReport(start.ownerId))).assertFalse();
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0005 SeriesStateFeature.test:141 assertEqual actual', nextPlatform.copiedTexts.length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0005 SeriesStateFeature.test:141 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0005 SeriesStateFeature.test:142 assertEqual actual', nextPlatform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0005 SeriesStateFeature.test:142 assertEqual expected', 0));
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
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0006 SeriesStateFeature.test:166 assertUndefined actual', reopened.seriesState())).assertUndefined();
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0006 SeriesStateFeature.test:167 assertTrue actual', reopened.ledgerRecords()[0].complete())).assertTrue();
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0006 SeriesStateFeature.test:168 assertEqual actual', nextPlatform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0006 SeriesStateFeature.test:168 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0006 SeriesStateFeature.test:169 assertEqual actual', buildSeriesPanelView(reopened.seriesState(), reopened.ledgerRecords()).phaseText)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0006 SeriesStateFeature.test:169 assertEqual expected', '未开始'));
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
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0007 SeriesStateFeature.test:185 assertFalse actual', service.startExperimentSeries('W-TEXT', 'control').accepted)).assertFalse();
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0007 SeriesStateFeature.test:186 assertUndefined actual', service.seriesState())).assertUndefined();
        platform.releaseRead(); await reading;
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0007 SeriesStateFeature.test:188 assertEqual actual', service.getState().resourceText)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0007 SeriesStateFeature.test:188 assertEqual expected', '3 字节 · ABC'));
        const start = service.startExperimentSeries('W-TEXT', 'control', 1);
        await service.whenSeriesFinished(start.ownerId);
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0007 SeriesStateFeature.test:191 assertEqual actual', requiredSeries(service).phase)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0007 SeriesStateFeature.test:191 assertEqual expected', SeriesPhase.COMPLETED));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0007 SeriesStateFeature.test:192 assertEqual actual', platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0007 SeriesStateFeature.test:192 assertEqual expected', 3));
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
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0008 SeriesStateFeature.test:215 assertEqual actual', requiredSeries(service).phase)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0008 SeriesStateFeature.test:215 assertEqual expected', SeriesPhase.COMPLETED));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0008 SeriesStateFeature.test:216 assertTrue actual', platform.resourceNames.every((name: string): boolean => name === spec.rawFile))).assertTrue();
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0008 SeriesStateFeature.test:217 assertEqual actual', platform.moduleCalls.length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0008 SeriesStateFeature.test:217 assertEqual expected', 2));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0008 SeriesStateFeature.test:218 assertEqual actual', platform.fileCalls.length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0008 SeriesStateFeature.test:218 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0008 SeriesStateFeature.test:219 assertTrue actual', service.seriesRecords(start.ownerId).every((record): boolean =>
          record.workloadId === 'W-NOTES' && record.mode === 'modules'))).assertTrue();
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
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0009 SeriesStateFeature.test:237 assertEqual actual', absent.moduleCalls.length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0009 SeriesStateFeature.test:237 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0009 SeriesStateFeature.test:238 assertEqual actual', first.getState().latestMemory?.kind)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0009 SeriesStateFeature.test:238 assertEqual expected', 'blocked'));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0009 SeriesStateFeature.test:239 assertEqual actual', requiredSeries(first).startedCount)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0009 SeriesStateFeature.test:239 assertEqual expected', 1));
      } finally { await finishSeriesFixture(first, absent, notSent.ownerId); }
      const rejected = new SeriesIoPlatform(); rejected.moduleErrorCode = 182303;
      const second = AppService.fromPlatform(rejected); const sent = second.startExperimentSeries('W-TEXT', 'modules');
      try {
        await second.whenSeriesFinished(sent.ownerId);
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0009 SeriesStateFeature.test:245 assertEqual actual', rejected.moduleCalls.length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0009 SeriesStateFeature.test:245 assertEqual expected', 1));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0009 SeriesStateFeature.test:246 assertEqual actual', second.getState().latestMemory?.code)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0009 SeriesStateFeature.test:246 assertEqual expected', 182303));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0009 SeriesStateFeature.test:247 assertEqual actual', rejected.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0009 SeriesStateFeature.test:247 assertEqual expected', 1));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0009 SeriesStateFeature.test:248 assertEqual actual', requiredSeries(second).phase)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesStateFeature_0009 SeriesStateFeature.test:248 assertEqual expected', SeriesPhase.FAILED));
      } finally { await finishSeriesFixture(second, rejected, sent.ownerId); }
    });
  });
}
