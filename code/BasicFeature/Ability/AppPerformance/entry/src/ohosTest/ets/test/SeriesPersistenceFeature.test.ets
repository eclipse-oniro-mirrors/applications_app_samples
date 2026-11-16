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
import { MemoryStore } from '../support/FakePlatform';
import { SeriesIoPlatform, SeriesStore, requiredSeries, snapshotSeries, snapshotRecordCount,
  waitSeries, finishSeriesFixture } from '../support/SeriesFixtures';

export default function seriesPersistenceFeatureTests(): void {
  describe('SeriesPersistenceFeature', (): void => {
    /**
     * @tc.number SUB_PERFORMANCE_SERIESPERSISTENCEFEATURE_0100
     * @tc.name testPerformanceSeriesPersistenceFeature0001
     * @tc.desc 计划首写失败不执行任何样本，whenSaved排空不能伪装保存成功
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceSeriesPersistenceFeature0001', 0, async (): Promise<void> => {
      const store = new SeriesStore(); store.writeFailure = true;
      const platform = new SeriesIoPlatform(store); const service = AppService.fromPlatform(platform);
      const start = service.startExperimentSeries('W-TEXT', 'files');
      try {
        await service.whenSeriesFinished(start.ownerId); await service.whenSaved();
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0001 SeriesPersistenceFeature.test:39 assertEqual actual', requiredSeries(service).phase)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0001 SeriesPersistenceFeature.test:39 assertEqual expected', SeriesPhase.SAVE_FAILED));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0001 SeriesPersistenceFeature.test:40 assertEqual actual', requiredSeries(service).saveState)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0001 SeriesPersistenceFeature.test:40 assertEqual expected', 'failed'));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0001 SeriesPersistenceFeature.test:41 assertEqual actual', platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0001 SeriesPersistenceFeature.test:41 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0001 SeriesPersistenceFeature.test:42 assertEqual actual', requiredSeries(service).startedCount)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0001 SeriesPersistenceFeature.test:42 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0001 SeriesPersistenceFeature.test:43 assertEqual actual', store.value)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0001 SeriesPersistenceFeature.test:43 assertEqual expected', ''));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0001 SeriesPersistenceFeature.test:44 assertFalse actual', service.isExperimentBusy())).assertFalse();
      } finally { await finishSeriesFixture(service, platform, start.ownerId, store); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIESPERSISTENCEFEATURE_0200
     * @tc.name testPerformanceSeriesPersistenceFeature0002
     * @tc.desc 计划已保存但单次意图保存失败仍不得进入SDK或增加已开始次数
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceSeriesPersistenceFeature0002', 0, async (): Promise<void> => {
      const store = new SeriesStore(); store.pauseOnCommittedCount = 0;
      const platform = new SeriesIoPlatform(store); const service = AppService.fromPlatform(platform);
      const start = service.startExperimentSeries('W-TEXT', 'control');
      try {
        await waitSeries((): boolean => store.paused, 'saved plan boundary');
        store.failNextWrite = true; store.releaseWrite();
        await service.whenSeriesFinished(start.ownerId);
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0002 SeriesPersistenceFeature.test:64 assertEqual actual', requiredSeries(service).phase)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0002 SeriesPersistenceFeature.test:64 assertEqual expected', SeriesPhase.SAVE_FAILED));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0002 SeriesPersistenceFeature.test:65 assertEqual actual', requiredSeries(service).recordIds.length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0002 SeriesPersistenceFeature.test:65 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0002 SeriesPersistenceFeature.test:66 assertEqual actual', platform.calls.indexOf('bundleInfo'))).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0002 SeriesPersistenceFeature.test:66 assertEqual expected', -1));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0002 SeriesPersistenceFeature.test:67 assertEqual actual', requiredSeries(service).startedCount)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0002 SeriesPersistenceFeature.test:67 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0002 SeriesPersistenceFeature.test:68 assertEqual actual', store.writeCalls.length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0002 SeriesPersistenceFeature.test:68 assertEqual expected', 2));
      } finally { await finishSeriesFixture(service, platform, start.ownerId, store); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIESPERSISTENCEFEATURE_0300
     * @tc.name testPerformanceSeriesPersistenceFeature0003
     * @tc.desc 真实成功样本的提交写入失败后仅保留内存事实并停止后续次数
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceSeriesPersistenceFeature0003', 0, async (): Promise<void> => {
      const store = new SeriesStore(); store.failOnCommittedCount = 1;
      const platform = new SeriesIoPlatform(store); const service = AppService.fromPlatform(platform);
      const start = service.startExperimentSeries('W-TEXT', 'control');
      try {
        await service.whenSeriesFinished(start.ownerId);
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0003 SeriesPersistenceFeature.test:86 assertEqual actual', requiredSeries(service).phase)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0003 SeriesPersistenceFeature.test:86 assertEqual expected', SeriesPhase.SAVE_FAILED));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0003 SeriesPersistenceFeature.test:87 assertTrue actual', service.seriesRecords(start.ownerId)[0].complete())).assertTrue();
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0003 SeriesPersistenceFeature.test:88 assertEqual actual', requiredSeries(service).saveState)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0003 SeriesPersistenceFeature.test:88 assertEqual expected', 'failed'));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0003 SeriesPersistenceFeature.test:89 assertEqual actual', snapshotRecordCount(store.value))).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0003 SeriesPersistenceFeature.test:89 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0003 SeriesPersistenceFeature.test:90 assertEqual actual', platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0003 SeriesPersistenceFeature.test:90 assertEqual expected', 2));
      } finally { await finishSeriesFixture(service, platform, start.ownerId, store); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIESPERSISTENCEFEATURE_0400
     * @tc.name testPerformanceSeriesPersistenceFeature0004
     * @tc.desc 中途日志快照失败即锁存停止策略，后写成功不能清掉错误而继续采样
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceSeriesPersistenceFeature0004', 0, async (): Promise<void> => {
      const store = new SeriesStore(); const platform = new SeriesIoPlatform(store); platform.pauseReadAt = 1;
      const service = AppService.fromPlatform(platform);
      const start = service.startExperimentSeries('W-TEXT', 'control');
      try {
        await waitSeries((): boolean => platform.resourceCalls === 1, 'active read before transient write failure');
        await service.whenSaved(); store.failNextWrite = true;
        service.setSnapEnabled(true); await service.whenSaved();
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0004 SeriesPersistenceFeature.test:110 assertEqual actual', service.getState().storageMessage)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0004 SeriesPersistenceFeature.test:110 assertEqual expected', '存储写入失败'));
        platform.releaseRead(); await service.whenSeriesFinished(start.ownerId);
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0004 SeriesPersistenceFeature.test:112 assertEqual actual', requiredSeries(service).phase)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0004 SeriesPersistenceFeature.test:112 assertEqual expected', SeriesPhase.SAVE_FAILED));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0004 SeriesPersistenceFeature.test:113 assertEqual actual', requiredSeries(service).saveState)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0004 SeriesPersistenceFeature.test:113 assertEqual expected', 'saved'));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0004 SeriesPersistenceFeature.test:114 assertTrue actual', service.seriesRecords(start.ownerId)[0].complete())).assertTrue();
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0004 SeriesPersistenceFeature.test:115 assertEqual actual', platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0004 SeriesPersistenceFeature.test:115 assertEqual expected', 2));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0004 SeriesPersistenceFeature.test:116 assertEqual actual', snapshotRecordCount(store.value))).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0004 SeriesPersistenceFeature.test:116 assertEqual expected', 1));
      } finally { await finishSeriesFixture(service, platform, start.ownerId, store); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIESPERSISTENCEFEATURE_0500
     * @tc.name testPerformanceSeriesPersistenceFeature0005
     * @tc.desc 每个系列引用都与真实记录及进度出现在同一存储快照中
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceSeriesPersistenceFeature0005', 0, async (): Promise<void> => {
      const store = new SeriesStore(); const platform = new SeriesIoPlatform(store);
      const service = AppService.fromPlatform(platform);
      const start = service.startExperimentSeries('W-TEXT', 'control');
      try {
        await service.whenSeriesFinished(start.ownerId);
        const coherent = store.writeCalls.every((value: string): boolean => {
          const data = JSON.parse(value) as Record<string, Object>;
          const state = snapshotSeries(value);
          if (state === undefined) { return true; }
          const ids = state['recordIds'] as string[];
          const records = data['experiments'] as Record<string, Object>[];
          return ids.every((id: string): boolean =>
            records.some((record: Record<string, Object>): boolean => record['id'] === id)) &&
            (state['startedCount'] as number) >= ids.length;
        });
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0005 SeriesPersistenceFeature.test:144 assertTrue actual', coherent)).assertTrue();
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0005 SeriesPersistenceFeature.test:145 assertTrue actual', store.writeCalls.some((value: string): boolean => snapshotRecordCount(value) === 1))).assertTrue();
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0005 SeriesPersistenceFeature.test:146 assertEqual actual', snapshotRecordCount(store.value))).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0005 SeriesPersistenceFeature.test:146 assertEqual expected', 3));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0005 SeriesPersistenceFeature.test:147 assertEqual actual', (JSON.parse(store.value) as Record<string, Object>)['schema'])).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0005 SeriesPersistenceFeature.test:147 assertEqual expected', 2));
      } finally { await finishSeriesFixture(service, platform, start.ownerId, store); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIESPERSISTENCEFEATURE_0600
     * @tc.name testPerformanceSeriesPersistenceFeature0006
     * @tc.desc 只保存计划的进程恢复为中断，不自动补跑尚未执行的次数
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceSeriesPersistenceFeature0006', 0, async (): Promise<void> => {
      const store = new SeriesStore(); store.pauseOnCommittedCount = 0;
      const platform = new SeriesIoPlatform(store); const source = AppService.fromPlatform(platform);
      const start = source.startExperimentSeries('W-TEXT', 'control');
      try {
        await waitSeries((): boolean => store.paused, 'plan snapshot captured');
        const persisted = new MemoryStore(); persisted.value = store.writeCalls[0];
        const nextPlatform = new SeriesIoPlatform(persisted); const reopened = AppService.fromPlatform(nextPlatform);
        try {
          expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0006 SeriesPersistenceFeature.test:168 assertEqual actual', requiredSeries(reopened).phase)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0006 SeriesPersistenceFeature.test:168 assertEqual expected', SeriesPhase.INTERRUPTED));
          expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0006 SeriesPersistenceFeature.test:169 assertEqual actual', requiredSeries(reopened).startedCount)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0006 SeriesPersistenceFeature.test:169 assertEqual expected', 0));
          expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0006 SeriesPersistenceFeature.test:170 assertEqual actual', nextPlatform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0006 SeriesPersistenceFeature.test:170 assertEqual expected', 0));
          expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0006 SeriesPersistenceFeature.test:171 assertFalse actual', reopened.isExperimentBusy())).assertFalse();
        } finally { reopened.dispose(); }
      } finally { await finishSeriesFixture(source, platform, start.ownerId, store); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIESPERSISTENCEFEATURE_0700
     * @tc.name testPerformanceSeriesPersistenceFeature0007
     * @tc.desc 在途单次重开仅标结果未知，真实SDK不重放且不继承旧进程隔离租约
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceSeriesPersistenceFeature0007', 0, async (): Promise<void> => {
      const platform = new SeriesIoPlatform(); platform.pauseReadAt = 1;
      const source = AppService.fromPlatform(platform); const start = source.startExperimentSeries('W-TEXT', 'files');
      try {
        await waitSeries((): boolean => platform.resourceCalls === 1, 'in-flight persisted attempt');
        await source.whenSaved();
        const copied = new MemoryStore(); copied.value = platform.store.value;
        const nextPlatform = new SeriesIoPlatform(copied); const reopened = AppService.fromPlatform(nextPlatform);
        try {
          expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0007 SeriesPersistenceFeature.test:193 assertEqual actual', requiredSeries(reopened).phase)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0007 SeriesPersistenceFeature.test:193 assertEqual expected', SeriesPhase.INTERRUPTED));
          expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0007 SeriesPersistenceFeature.test:194 assertTrue actual', requiredSeries(reopened).message.indexOf('第 1 次结果未知') >= 0)).assertTrue();
          expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0007 SeriesPersistenceFeature.test:195 assertEqual actual', requiredSeries(reopened).recordIds.length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0007 SeriesPersistenceFeature.test:195 assertEqual expected', 0));
          expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0007 SeriesPersistenceFeature.test:196 assertEqual actual', nextPlatform.fileCalls.length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0007 SeriesPersistenceFeature.test:196 assertEqual expected', 0));
          expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0007 SeriesPersistenceFeature.test:197 assertFalse actual', requiredSeries(reopened).leaseHeld)).assertFalse();
        } finally { reopened.dispose(); }
      } finally { await finishSeriesFixture(source, platform, start.ownerId); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIESPERSISTENCEFEATURE_0800
     * @tc.name testPerformanceSeriesPersistenceFeature0008
     * @tc.desc 已完成系列重开保留执行顺序与真实记录，不反转也不再执行
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceSeriesPersistenceFeature0008', 0, async (): Promise<void> => {
      const store = new MemoryStore(); const platform = new SeriesIoPlatform(store);
      const source = AppService.fromPlatform(platform); const start = source.startExperimentSeries('W-TEXT', 'control');
      await source.whenSeriesFinished(start.ownerId);
      const before = requiredSeries(source).recordIds.join('|'); source.dispose();
      const nextPlatform = new SeriesIoPlatform(store); const reopened = AppService.fromPlatform(nextPlatform);
      try {
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0008 SeriesPersistenceFeature.test:217 assertEqual actual', requiredSeries(reopened).phase)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0008 SeriesPersistenceFeature.test:217 assertEqual expected', SeriesPhase.COMPLETED));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0008 SeriesPersistenceFeature.test:218 assertEqual actual', reopened.seriesRecords(start.ownerId).map((record): string => record.id).join('|'))).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0008 SeriesPersistenceFeature.test:218 assertEqual expected', before));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0008 SeriesPersistenceFeature.test:219 assertEqual actual', nextPlatform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0008 SeriesPersistenceFeature.test:219 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0008 SeriesPersistenceFeature.test:220 assertEqual actual', requiredSeries(reopened).saveState)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0008 SeriesPersistenceFeature.test:220 assertEqual expected', 'saved'));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0008 SeriesPersistenceFeature.test:221 assertFalse actual', reopened.isExperimentBusy())).assertFalse();
      } finally { reopened.dispose(); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIESPERSISTENCEFEATURE_0900
     * @tc.name testPerformanceSeriesPersistenceFeature0009
     * @tc.desc 本地取消的存档重开不恢复底层在途状态，也不把取消样本当成功
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceSeriesPersistenceFeature0009', 0, async (): Promise<void> => {
      const platform = new SeriesIoPlatform(); platform.pauseReadAt = 1;
      const source = AppService.fromPlatform(platform); const start = source.startExperimentSeries('W-TEXT', 'files');
      try {
        await waitSeries((): boolean => platform.resourceCalls === 1, 'cancel before restart');
        source.cancelExperimentSeries(start.ownerId); await source.whenSeriesFinished(start.ownerId);
        const copied = new MemoryStore(); copied.value = platform.store.value;
        const nextPlatform = new SeriesIoPlatform(copied); const reopened = AppService.fromPlatform(nextPlatform);
        try {
          expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0009 SeriesPersistenceFeature.test:242 assertEqual actual', requiredSeries(reopened).phase)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0009 SeriesPersistenceFeature.test:242 assertEqual expected', SeriesPhase.CANCELLED));
          expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0009 SeriesPersistenceFeature.test:243 assertFalse actual', reopened.seriesRecords(start.ownerId)[0].complete())).assertFalse();
          expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0009 SeriesPersistenceFeature.test:244 assertFalse actual', reopened.isQuarantined())).assertFalse();
          expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0009 SeriesPersistenceFeature.test:245 assertEqual actual', nextPlatform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0009 SeriesPersistenceFeature.test:245 assertEqual expected', 0));
        } finally { reopened.dispose(); }
      } finally { await finishSeriesFixture(source, platform, start.ownerId); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIESPERSISTENCEFEATURE_1000
     * @tc.name testPerformanceSeriesPersistenceFeature0010
     * @tc.desc 三十条账本逐步淘汰系列引用时先报告部分可用，再报告全部缺失而不补造记录
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceSeriesPersistenceFeature0010', 0, async (): Promise<void> => {
      const platform = new SeriesIoPlatform(); const service = AppService.fromPlatform(platform);
      const start = service.startExperimentSeries('W-TEXT', 'control');
      try {
        await service.whenSeriesFinished(start.ownerId);
        for (let index = 0; index < 28; index++) { await service.runExperiment('W-TEXT', 'control'); }
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0010 SeriesPersistenceFeature.test:264 assertEqual actual', service.seriesRecords(start.ownerId).length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0010 SeriesPersistenceFeature.test:264 assertEqual expected', 2));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0010 SeriesPersistenceFeature.test:265 assertEqual actual', requiredSeries(service).missingRecordIds.length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0010 SeriesPersistenceFeature.test:265 assertEqual expected', 1));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0010 SeriesPersistenceFeature.test:266 assertTrue actual', await service.copySeriesAnalysisReport(start.ownerId))).assertTrue();
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0010 SeriesPersistenceFeature.test:267 assertTrue actual', platform.copiedTexts[0].indexOf('记录：2 条') >= 0)).assertTrue();
        for (let index = 0; index < 3; index++) { await service.runExperiment('W-TEXT', 'control'); }
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0010 SeriesPersistenceFeature.test:269 assertEqual actual', service.ledgerRecords().length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0010 SeriesPersistenceFeature.test:269 assertEqual expected', 30));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0010 SeriesPersistenceFeature.test:270 assertEqual actual', service.seriesRecords(start.ownerId).length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0010 SeriesPersistenceFeature.test:270 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0010 SeriesPersistenceFeature.test:271 assertFalse actual', await service.copySeriesAnalysisReport(start.ownerId))).assertFalse();
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0010 SeriesPersistenceFeature.test:272 assertEqual actual', platform.copiedTexts.length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0010 SeriesPersistenceFeature.test:272 assertEqual expected', 1));
      } finally { await finishSeriesFixture(service, platform, start.ownerId); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIESPERSISTENCEFEATURE_1100
     * @tc.name testPerformanceSeriesPersistenceFeature0011
     * @tc.desc 系列元信息损坏只拒绝系列，不清掉合法正式账本或允许伪造完成次数
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceSeriesPersistenceFeature0011', 0, async (): Promise<void> => {
      const platform = new SeriesIoPlatform(); const source = AppService.fromPlatform(platform);
      const start = source.startExperimentSeries('W-TEXT', 'control', 1);
      await source.whenSeriesFinished(start.ownerId); const saved = platform.store.value; source.dispose();
      const duplicate = JSON.parse(saved) as Record<string, Object>;
      const duplicateSeries = duplicate['series'] as Record<string, Object>;
      duplicateSeries['recordIds'] = [start.ownerId, start.ownerId];
      const badCounter = JSON.parse(saved) as Record<string, Object>;
      (badCounter['series'] as Record<string, Object>)['startedCount'] = 0;
      const noEnd = JSON.parse(saved) as Record<string, Object>;
      (noEnd['series'] as Record<string, Object>)['endedAt'] = 0;
      const inputs: Object[] = [duplicate, badCounter, noEnd];
      inputs.forEach((input: Object): void => {
        const store = new MemoryStore(); store.value = JSON.stringify(input);
        const reopened = AppService.fromPlatform(new SeriesIoPlatform(store));
        try {
          expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0011 SeriesPersistenceFeature.test:300 assertUndefined actual', reopened.seriesState())).assertUndefined();
          expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0011 SeriesPersistenceFeature.test:301 assertEqual actual', reopened.ledgerRecords().length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0011 SeriesPersistenceFeature.test:301 assertEqual expected', 1));
          expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0011 SeriesPersistenceFeature.test:302 assertEqual actual', reopened.getState().storageMessage)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0011 SeriesPersistenceFeature.test:302 assertEqual expected', ''));
        } finally { reopened.dispose(); }
      });
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIESPERSISTENCEFEATURE_1200
     * @tc.name testPerformanceSeriesPersistenceFeature0012
     * @tc.desc 没有系列字段的存档保留英文状态设置、启动与实验，且可开始新系列
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceSeriesPersistenceFeature0012', 0, async (): Promise<void> => {
      const store = new MemoryStore(); const platform = new SeriesIoPlatform(store);
      const original = AppService.fromPlatform(platform);
      original.setSnapEnabled(true); original.markContentLoaded();
      await original.runExperiment('W-TEXT', 'control'); await original.whenSaved(); original.dispose();
      const nextPlatform = new SeriesIoPlatform(store); const reopened = AppService.fromPlatform(nextPlatform);
      try {
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0012 SeriesPersistenceFeature.test:322 assertUndefined actual', reopened.seriesState())).assertUndefined();
        expect(traceParameter(
          'com.samples.appperformance_PerformanceSeriesPersistenceFeature_0012 ' +
            'SeriesPersistenceFeature.test:323 assertEqual actual',
          reopened.getState().snapFlag))
          .assertEqual(traceParameter(
            'com.samples.appperformance_PerformanceSeriesPersistenceFeature_0012 ' +
              'SeriesPersistenceFeature.test:323 assertEqual expected',
            'enabled'));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0012 SeriesPersistenceFeature.test:324 assertEqual actual', reopened.getState().launches.length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0012 SeriesPersistenceFeature.test:324 assertEqual expected', 1));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0012 SeriesPersistenceFeature.test:325 assertEqual actual', reopened.ledgerRecords().length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0012 SeriesPersistenceFeature.test:325 assertEqual expected', 1));
        const start = reopened.startExperimentSeries('W-TEXT', 'control', 1);
        await reopened.whenSeriesFinished(start.ownerId);
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0012 SeriesPersistenceFeature.test:328 assertEqual actual', reopened.seriesRecords(start.ownerId).length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0012 SeriesPersistenceFeature.test:328 assertEqual expected', 1));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0012 SeriesPersistenceFeature.test:329 assertEqual actual', reopened.ledgerRecords().length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesPersistenceFeature_0012 SeriesPersistenceFeature.test:329 assertEqual expected', 2));
      } finally { reopened.dispose(); }
    });
  });
}
