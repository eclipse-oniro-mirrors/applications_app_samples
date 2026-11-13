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
import { digestLedger } from '../../../main/ets/core/ExperimentLedger';
import { SeriesIoPlatform, SeriesStore, requiredSeries, waitSeries, drainSeries,
  finishSeriesFixture } from '../support/SeriesFixtures';

export default function seriesOwnershipFeatureTests(): void {
  describe('SeriesOwnershipFeature', (): void => {
    /**
     * @tc.number SUB_PERFORMANCE_SERIESOWNERSHIPFEATURE_0100
     * @tc.name testPerformanceSeriesOwnershipFeature0001
     * @tc.desc 默认三次逐次经过真实资源读取并产生独立账本记录
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceSeriesOwnershipFeature0001', 0, async (): Promise<void> => {
      const platform = new SeriesIoPlatform(); const service = AppService.fromPlatform(platform);
      const start = service.startExperimentSeries('W-TEXT', 'control');
      try {
        await service.whenSeriesFinished(start.ownerId);
        const state = requiredSeries(service);
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0001 SeriesOwnershipFeature.test:39 assertEqual actual', state.phase)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0001 SeriesOwnershipFeature.test:39 assertEqual expected', SeriesPhase.COMPLETED));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0001 SeriesOwnershipFeature.test:40 assertEqual actual', state.recordIds.length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0001 SeriesOwnershipFeature.test:40 assertEqual expected', 3));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0001 SeriesOwnershipFeature.test:41 assertEqual actual', new Set<string>(state.recordIds).size)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0001 SeriesOwnershipFeature.test:41 assertEqual expected', 3));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0001 SeriesOwnershipFeature.test:42 assertEqual actual', platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0001 SeriesOwnershipFeature.test:42 assertEqual expected', 6));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0001 SeriesOwnershipFeature.test:43 assertEqual actual', platform.fileCalls.length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0001 SeriesOwnershipFeature.test:43 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0001 SeriesOwnershipFeature.test:44 assertFalse actual', service.isExperimentBusy())).assertFalse();
      } finally { await finishSeriesFixture(service, platform, start.ownerId); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIESOWNERSHIPFEATURE_0200
     * @tc.name testPerformanceSeriesOwnershipFeature0002
     * @tc.desc 无效次数集中拒绝而不产生计划或系统副作用，下界一次仍可正常开始
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceSeriesOwnershipFeature0002', 0, async (): Promise<void> => {
      const platform = new SeriesIoPlatform(); const service = AppService.fromPlatform(platform);
      try {
        const counts: number[] = [0, -1, 11, 1.5, Number.NaN, Number.POSITIVE_INFINITY];
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0002 SeriesOwnershipFeature.test:60 assertTrue actual', counts.every((count: number): boolean =>
          !service.startExperimentSeries('W-TEXT', 'control', count).accepted))).assertTrue();
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0002 SeriesOwnershipFeature.test:62 assertUndefined actual', service.seriesState())).assertUndefined();
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0002 SeriesOwnershipFeature.test:63 assertEqual actual', platform.store.writeCalls.length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0002 SeriesOwnershipFeature.test:63 assertEqual expected', 0));
        const valid = service.startExperimentSeries('W-TEXT', 'control', 1);
        await service.whenSeriesFinished(valid.ownerId);
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0002 SeriesOwnershipFeature.test:66 assertEqual actual', service.seriesRecords(valid.ownerId).length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0002 SeriesOwnershipFeature.test:66 assertEqual expected', 1));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0002 SeriesOwnershipFeature.test:67 assertEqual actual', platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0002 SeriesOwnershipFeature.test:67 assertEqual expected', 2));
      } finally { service.dispose(); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIESOWNERSHIPFEATURE_0300
     * @tc.name testPerformanceSeriesOwnershipFeature0003
     * @tc.desc 十次上界保留十个真实身份，不复制首条样本或扩大全局账本容量
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceSeriesOwnershipFeature0003', 0, async (): Promise<void> => {
      const platform = new SeriesIoPlatform(); const service = AppService.fromPlatform(platform);
      const start = service.startExperimentSeries('W-TEXT', 'control', 10);
      try {
        await service.whenSeriesFinished(start.ownerId);
        const state = requiredSeries(service);
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0003 SeriesOwnershipFeature.test:85 assertEqual actual', state.startedCount)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0003 SeriesOwnershipFeature.test:85 assertEqual expected', 10));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0003 SeriesOwnershipFeature.test:86 assertEqual actual', new Set<string>(state.recordIds).size)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0003 SeriesOwnershipFeature.test:86 assertEqual expected', 10));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0003 SeriesOwnershipFeature.test:87 assertEqual actual', platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0003 SeriesOwnershipFeature.test:87 assertEqual expected', 20));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0003 SeriesOwnershipFeature.test:88 assertTrue actual', service.seriesRecords(start.ownerId).every((record): boolean => record.complete()))).assertTrue();
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0003 SeriesOwnershipFeature.test:89 assertEqual actual', state.saveState)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0003 SeriesOwnershipFeature.test:89 assertEqual expected', 'saved'));
      } finally { await finishSeriesFixture(service, platform, start.ownerId); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIESOWNERSHIPFEATURE_0400
     * @tc.name testPerformanceSeriesOwnershipFeature0004
     * @tc.desc 系列读取期间拒绝另一系列、单次实验和手工回收且不夺走所有者
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceSeriesOwnershipFeature0004', 0, async (): Promise<void> => {
      const platform = new SeriesIoPlatform(); platform.pauseReadAt = 1;
      const service = AppService.fromPlatform(platform); const start = service.startExperimentSeries('W-TEXT', 'files');
      try {
        await waitSeries((): boolean => platform.resourceCalls === 1, 'first warm read');
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0004 SeriesOwnershipFeature.test:106 assertFalse actual', service.startExperimentSeries('W-TEXT', 'control', 1).accepted)).assertFalse();
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0004 SeriesOwnershipFeature.test:107 assertUndefined actual', await service.runExperiment('W-TEXT', 'control'))).assertUndefined();
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0004 SeriesOwnershipFeature.test:108 assertFalse actual', (await service.evictFiles(['entry.hap'])).dispatched)).assertFalse();
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0004 SeriesOwnershipFeature.test:109 assertEqual actual', platform.fileCalls.length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0004 SeriesOwnershipFeature.test:109 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0004 SeriesOwnershipFeature.test:110 assertEqual actual', requiredSeries(service).ownerId)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0004 SeriesOwnershipFeature.test:110 assertEqual expected', start.ownerId));
      } finally { await finishSeriesFixture(service, platform, start.ownerId); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIESOWNERSHIPFEATURE_0500
     * @tc.name testPerformanceSeriesOwnershipFeature0005
     * @tc.desc 单次executor释放后的保存空档仍由全系列租约阻止抢占和清空
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceSeriesOwnershipFeature0005', 0, async (): Promise<void> => {
      const store = new SeriesStore(); store.pauseOnCommittedCount = 1;
      const platform = new SeriesIoPlatform(store); const service = AppService.fromPlatform(platform);
      const start = service.startExperimentSeries('W-TEXT', 'control', 3);
      try {
        await waitSeries((): boolean => store.paused, 'committed record waiting for save');
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0005 SeriesOwnershipFeature.test:128 assertEqual actual', requiredSeries(service).recordIds.length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0005 SeriesOwnershipFeature.test:128 assertEqual expected', 1));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0005 SeriesOwnershipFeature.test:129 assertFalse actual', service.isQuarantined())).assertFalse();
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0005 SeriesOwnershipFeature.test:130 assertTrue actual', service.isExperimentBusy())).assertTrue();
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0005 SeriesOwnershipFeature.test:131 assertUndefined actual', await service.runExperiment('W-TEXT', 'control'))).assertUndefined();
        await service.readResource(); service.clearLedger();
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0005 SeriesOwnershipFeature.test:133 assertEqual actual', platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0005 SeriesOwnershipFeature.test:133 assertEqual expected', 2));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0005 SeriesOwnershipFeature.test:134 assertEqual actual', service.ledgerRecords().length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0005 SeriesOwnershipFeature.test:134 assertEqual expected', 1));
        store.releaseWrite(); await service.whenSeriesFinished(start.ownerId);
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0005 SeriesOwnershipFeature.test:136 assertEqual actual', platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0005 SeriesOwnershipFeature.test:136 assertEqual expected', 6));
      } finally { await finishSeriesFixture(service, platform, start.ownerId, store); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIESOWNERSHIPFEATURE_0600
     * @tc.name testPerformanceSeriesOwnershipFeature0006
     * @tc.desc 系列占用时快启设置与重建在服务层拦截，不更改采样环境
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceSeriesOwnershipFeature0006', 0, async (): Promise<void> => {
      const platform = new SeriesIoPlatform(); platform.pauseReadAt = 1;
      const service = AppService.fromPlatform(platform); const start = service.startExperimentSeries('W-TEXT', 'files');
      try {
        await waitSeries((): boolean => platform.resourceCalls === 1, 'warm ownership');
        service.setSnapEnabled(true); service.rebuildSnap('series-interference');
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0006 SeriesOwnershipFeature.test:154 assertEqual actual', platform.snapCalls.length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0006 SeriesOwnershipFeature.test:154 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0006 SeriesOwnershipFeature.test:155 assertEqual actual', platform.rebuildCalls)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0006 SeriesOwnershipFeature.test:155 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0006 SeriesOwnershipFeature.test:156 assertEqual actual', service.getState().snapFlag)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0006 SeriesOwnershipFeature.test:156 assertEqual expected', '尚未设置'));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0006 SeriesOwnershipFeature.test:157 assertEqual actual', service.getState().logs.filter((record): boolean => record.kind === 'blocked').length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0006 SeriesOwnershipFeature.test:157 assertEqual expected', 2));
      } finally { await finishSeriesFixture(service, platform, start.ownerId); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIESOWNERSHIPFEATURE_0700
     * @tc.name testPerformanceSeriesOwnershipFeature0007
     * @tc.desc 首次读取中请求本次后停止仍完成当次回收校验，但不开始剩余次数
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceSeriesOwnershipFeature0007', 0, async (): Promise<void> => {
      const platform = new SeriesIoPlatform(); platform.pauseReadAt = 1;
      const service = AppService.fromPlatform(platform); const start = service.startExperimentSeries('W-TEXT', 'files');
      try {
        await waitSeries((): boolean => platform.resourceCalls === 1, 'warm read to stop after');
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0007 SeriesOwnershipFeature.test:174 assertTrue actual', service.stopExperimentSeries(start.ownerId))).assertTrue();
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0007 SeriesOwnershipFeature.test:175 assertFalse actual', service.isQuarantined())).assertFalse();
        platform.releaseRead(); await service.whenSeriesFinished(start.ownerId);
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0007 SeriesOwnershipFeature.test:177 assertEqual actual', requiredSeries(service).phase)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0007 SeriesOwnershipFeature.test:177 assertEqual expected', SeriesPhase.STOPPED));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0007 SeriesOwnershipFeature.test:178 assertTrue actual', service.seriesRecords(start.ownerId)[0].complete())).assertTrue();
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0007 SeriesOwnershipFeature.test:179 assertEqual actual', platform.fileCalls.length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0007 SeriesOwnershipFeature.test:179 assertEqual expected', 1));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0007 SeriesOwnershipFeature.test:180 assertEqual actual', requiredSeries(service).startedCount)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0007 SeriesOwnershipFeature.test:180 assertEqual expected', 1));
      } finally { await finishSeriesFixture(service, platform, start.ownerId); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIESOWNERSHIPFEATURE_0800
     * @tc.name testPerformanceSeriesOwnershipFeature0008
     * @tc.desc SDK回收等待中优雅停止不提前清时钟，结算成功后仅保留一次完整结果
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceSeriesOwnershipFeature0008', 0, async (): Promise<void> => {
      const platform = new SeriesIoPlatform(); platform.deferFile = true;
      const service = AppService.fromPlatform(platform); const start = service.startExperimentSeries('W-TEXT', 'files');
      try {
        await waitSeries((): boolean => platform.fileCalls.length === 1, 'pending native file call');
        service.stopExperimentSeries(start.ownerId);
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0008 SeriesOwnershipFeature.test:198 assertEqual actual', platform.pendingTimers())).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0008 SeriesOwnershipFeature.test:198 assertEqual expected', 1));
        platform.releaseFile(); await service.whenSeriesFinished(start.ownerId);
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0008 SeriesOwnershipFeature.test:200 assertEqual actual', service.seriesRecords(start.ownerId)[0].stage('evict')?.status)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0008 SeriesOwnershipFeature.test:200 assertEqual expected', '成功'));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0008 SeriesOwnershipFeature.test:201 assertEqual actual', requiredSeries(service).phase)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0008 SeriesOwnershipFeature.test:201 assertEqual expected', SeriesPhase.STOPPED));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0008 SeriesOwnershipFeature.test:202 assertEqual actual', platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0008 SeriesOwnershipFeature.test:202 assertEqual expected', 2));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0008 SeriesOwnershipFeature.test:203 assertEqual actual', requiredSeries(service).recordIds.length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0008 SeriesOwnershipFeature.test:203 assertEqual expected', 1));
      } finally { await finishSeriesFixture(service, platform, start.ownerId); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIESOWNERSHIPFEATURE_0900
     * @tc.name testPerformanceSeriesOwnershipFeature0009
     * @tc.desc 立即取消首次读取停止整个系列，迟到读取只解除隔离不自动继续
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceSeriesOwnershipFeature0009', 0, async (): Promise<void> => {
      const platform = new SeriesIoPlatform(); platform.pauseReadAt = 1;
      const service = AppService.fromPlatform(platform); const start = service.startExperimentSeries('W-TEXT', 'files');
      try {
        await waitSeries((): boolean => platform.resourceCalls === 1, 'warm read to cancel');
        service.cancelExperimentSeries(start.ownerId); await service.whenSeriesFinished(start.ownerId);
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0009 SeriesOwnershipFeature.test:221 assertEqual actual', requiredSeries(service).phase)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0009 SeriesOwnershipFeature.test:221 assertEqual expected', SeriesPhase.CANCELLED));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0009 SeriesOwnershipFeature.test:222 assertEqual actual', requiredSeries(service).recordIds.length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0009 SeriesOwnershipFeature.test:222 assertEqual expected', 1));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0009 SeriesOwnershipFeature.test:223 assertTrue actual', requiredSeries(service).waitingForSdk)).assertTrue();
        platform.releaseRead(); await drainSeries();
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0009 SeriesOwnershipFeature.test:225 assertFalse actual', service.isExperimentBusy())).assertFalse();
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0009 SeriesOwnershipFeature.test:226 assertEqual actual', platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0009 SeriesOwnershipFeature.test:226 assertEqual expected', 1));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0009 SeriesOwnershipFeature.test:227 assertEqual actual', platform.fileCalls.length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0009 SeriesOwnershipFeature.test:227 assertEqual expected', 0));
      } finally { await finishSeriesFixture(service, platform, start.ownerId); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIESOWNERSHIPFEATURE_1000
     * @tc.name testPerformanceSeriesOwnershipFeature0010
     * @tc.desc 取消回收后迟到SDK拒绝保留日志，不改写取消结果或启动第二次
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceSeriesOwnershipFeature0010', 0, async (): Promise<void> => {
      const platform = new SeriesIoPlatform(); platform.deferFile = true; platform.fileErrorCode = 182099;
      const service = AppService.fromPlatform(platform); const start = service.startExperimentSeries('W-TEXT', 'files');
      try {
        await waitSeries((): boolean => platform.fileCalls.length === 1, 'eviction to cancel');
        service.cancelExperimentSeries(start.ownerId); await service.whenSeriesFinished(start.ownerId);
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0010 SeriesOwnershipFeature.test:245 assertEqual actual', service.seriesRecords(start.ownerId)[0].stage('evict')?.status)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0010 SeriesOwnershipFeature.test:245 assertEqual expected', '已取消'));
        service.clearLedger(); expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0010 SeriesOwnershipFeature.test:246 assertEqual actual', service.ledgerRecords().length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0010 SeriesOwnershipFeature.test:246 assertEqual expected', 1));
        platform.releaseFile(); await drainSeries();
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0010 SeriesOwnershipFeature.test:248 assertTrue actual', service.getState().logs.some((record): boolean =>
          record.api === 'evictFilePages' && record.code === 182099))).assertTrue();
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0010 SeriesOwnershipFeature.test:250 assertEqual actual', requiredSeries(service).phase)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0010 SeriesOwnershipFeature.test:250 assertEqual expected', SeriesPhase.CANCELLED));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0010 SeriesOwnershipFeature.test:251 assertEqual actual', platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0010 SeriesOwnershipFeature.test:251 assertEqual expected', 1));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0010 SeriesOwnershipFeature.test:252 assertEqual actual', platform.fileCalls.length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0010 SeriesOwnershipFeature.test:252 assertEqual expected', 1));
      } finally { await finishSeriesFixture(service, platform, start.ownerId); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIESOWNERSHIPFEATURE_1100
     * @tc.name testPerformanceSeriesOwnershipFeature0011
     * @tc.desc 重读中取消保留已成功回收事实和首次字节，不把迟到资源补成完整结果
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceSeriesOwnershipFeature0011', 0, async (): Promise<void> => {
      const platform = new SeriesIoPlatform(); platform.pauseReadAt = 2;
      const service = AppService.fromPlatform(platform); const start = service.startExperimentSeries('W-TEXT', 'files');
      try {
        await waitSeries((): boolean => platform.resourceCalls === 2, 'reread to cancel');
        service.cancelExperimentSeries(start.ownerId); await service.whenSeriesFinished(start.ownerId);
        const record = service.seriesRecords(start.ownerId)[0];
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0011 SeriesOwnershipFeature.test:271 assertEqual actual', record.beforeBytes)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0011 SeriesOwnershipFeature.test:271 assertEqual expected', 3));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0011 SeriesOwnershipFeature.test:272 assertEqual actual', record.afterBytes)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0011 SeriesOwnershipFeature.test:272 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0011 SeriesOwnershipFeature.test:273 assertEqual actual', record.requestStatus)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0011 SeriesOwnershipFeature.test:273 assertEqual expected', '成功'));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0011 SeriesOwnershipFeature.test:274 assertEqual actual', record.stage('reread')?.status)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0011 SeriesOwnershipFeature.test:274 assertEqual expected', '已取消'));
        platform.releaseRead(); await drainSeries();
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0011 SeriesOwnershipFeature.test:276 assertEqual actual', service.seriesRecords(start.ownerId)[0].digestAfter)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0011 SeriesOwnershipFeature.test:276 assertEqual expected', ''));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0011 SeriesOwnershipFeature.test:277 assertEqual actual', platform.fileCalls.length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0011 SeriesOwnershipFeature.test:277 assertEqual expected', 1));
      } finally { await finishSeriesFixture(service, platform, start.ownerId); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIESOWNERSHIPFEATURE_1200
     * @tc.name testPerformanceSeriesOwnershipFeature0012
     * @tc.desc SDK超时使系列失败且保留租约，底层排空后不重发计划剩余次数
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceSeriesOwnershipFeature0012', 0, async (): Promise<void> => {
      const platform = new SeriesIoPlatform(); platform.deferFile = true;
      const service = AppService.fromPlatform(platform); const start = service.startExperimentSeries('W-TEXT', 'files');
      try {
        await waitSeries((): boolean => platform.fileCalls.length === 1, 'eviction timeout');
        platform.advance(10000); await service.whenSeriesFinished(start.ownerId);
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0012 SeriesOwnershipFeature.test:295 assertEqual actual', requiredSeries(service).phase)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0012 SeriesOwnershipFeature.test:295 assertEqual expected', SeriesPhase.FAILED));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0012 SeriesOwnershipFeature.test:296 assertTrue actual', requiredSeries(service).leaseHeld)).assertTrue();
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0012 SeriesOwnershipFeature.test:297 assertEqual actual', service.seriesRecords(start.ownerId)[0].stage('evict')?.status)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0012 SeriesOwnershipFeature.test:297 assertEqual expected', '超时'));
        platform.releaseFile(); await drainSeries();
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0012 SeriesOwnershipFeature.test:299 assertFalse actual', requiredSeries(service).leaseHeld)).assertFalse();
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0012 SeriesOwnershipFeature.test:300 assertEqual actual', platform.fileCalls.length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0012 SeriesOwnershipFeature.test:300 assertEqual expected', 1));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0012 SeriesOwnershipFeature.test:301 assertEqual actual', requiredSeries(service).startedCount)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0012 SeriesOwnershipFeature.test:301 assertEqual expected', 1));
      } finally { await finishSeriesFixture(service, platform, start.ownerId); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIESOWNERSHIPFEATURE_1300
     * @tc.name testPerformanceSeriesOwnershipFeature0013
     * @tc.desc 上一轮所有者的停止和取消不能影响新一轮读取
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceSeriesOwnershipFeature0013', 0, async (): Promise<void> => {
      const platform = new SeriesIoPlatform(); const service = AppService.fromPlatform(platform);
      const first = service.startExperimentSeries('W-TEXT', 'control', 1);
      await service.whenSeriesFinished(first.ownerId);
      platform.pauseReadAt = 3;
      const second = service.startExperimentSeries('W-TEXT', 'control', 1);
      try {
        await waitSeries((): boolean => platform.resourceCalls === 3, 'new owner warm');
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0013 SeriesOwnershipFeature.test:321 assertFalse actual', service.cancelExperimentSeries(first.ownerId))).assertFalse();
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0013 SeriesOwnershipFeature.test:322 assertFalse actual', service.stopExperimentSeries(first.ownerId))).assertFalse();
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0013 SeriesOwnershipFeature.test:323 assertEqual actual', requiredSeries(service).ownerId)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0013 SeriesOwnershipFeature.test:323 assertEqual expected', second.ownerId));
        platform.releaseRead(); await service.whenSeriesFinished(second.ownerId);
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0013 SeriesOwnershipFeature.test:325 assertEqual actual', requiredSeries(service).phase)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0013 SeriesOwnershipFeature.test:325 assertEqual expected', SeriesPhase.COMPLETED));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0013 SeriesOwnershipFeature.test:326 assertEqual actual', service.seriesRecords(first.ownerId).length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0013 SeriesOwnershipFeature.test:326 assertEqual expected', 0));
      } finally { await finishSeriesFixture(service, platform, second.ownerId); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIESOWNERSHIPFEATURE_1400
     * @tc.name testPerformanceSeriesOwnershipFeature0014
     * @tc.desc 两次之间取消无需executor在途，不制造取消样本或篡改上一条成功
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceSeriesOwnershipFeature0014', 0, async (): Promise<void> => {
      const store = new SeriesStore(); store.pauseOnCommittedCount = 1;
      const platform = new SeriesIoPlatform(store); const service = AppService.fromPlatform(platform);
      const start = service.startExperimentSeries('W-TEXT', 'control');
      try {
        await waitSeries((): boolean => store.paused, 'between iterations');
        service.cancelExperimentSeries(start.ownerId);
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0014 SeriesOwnershipFeature.test:345 assertFalse actual', service.isQuarantined())).assertFalse();
        store.releaseWrite(); await service.whenSeriesFinished(start.ownerId);
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0014 SeriesOwnershipFeature.test:347 assertEqual actual', requiredSeries(service).phase)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0014 SeriesOwnershipFeature.test:347 assertEqual expected', SeriesPhase.CANCELLED));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0014 SeriesOwnershipFeature.test:348 assertTrue actual', service.seriesRecords(start.ownerId)[0].complete())).assertTrue();
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0014 SeriesOwnershipFeature.test:349 assertEqual actual', requiredSeries(service).recordIds.length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0014 SeriesOwnershipFeature.test:349 assertEqual expected', 1));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0014 SeriesOwnershipFeature.test:350 assertEqual actual', platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0014 SeriesOwnershipFeature.test:350 assertEqual expected', 2));
      } finally { await finishSeriesFixture(service, platform, start.ownerId, store); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIESOWNERSHIPFEATURE_1500
     * @tc.name testPerformanceSeriesOwnershipFeature0015
     * @tc.desc 前后台值未变不取消，真实变化立即停后续并保留条件变化原因
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceSeriesOwnershipFeature0015', 0, async (): Promise<void> => {
      const platform = new SeriesIoPlatform(); platform.pauseReadAt = 1;
      const service = AppService.fromPlatform(platform);
      const start = service.startExperimentSeries('W-TEXT', 'control');
      try {
        await waitSeries((): boolean => platform.resourceCalls === 1, 'foreground sample');
        const before = service.getState().foreground; service.setForeground(before);
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0015 SeriesOwnershipFeature.test:369 assertEqual actual', requiredSeries(service).phase)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0015 SeriesOwnershipFeature.test:369 assertEqual expected', SeriesPhase.RUNNING));
        service.setForeground(!before); await service.whenSeriesFinished(start.ownerId);
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0015 SeriesOwnershipFeature.test:371 assertEqual actual', requiredSeries(service).phase)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0015 SeriesOwnershipFeature.test:371 assertEqual expected', SeriesPhase.CONDITION_CHANGED));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0015 SeriesOwnershipFeature.test:372 assertEqual actual', service.seriesRecords(start.ownerId)[0].stage('warm')?.status)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0015 SeriesOwnershipFeature.test:372 assertEqual expected', '已取消'));
        platform.releaseRead(); await drainSeries();
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0015 SeriesOwnershipFeature.test:374 assertEqual actual', platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0015 SeriesOwnershipFeature.test:374 assertEqual expected', 1));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0015 SeriesOwnershipFeature.test:375 assertFalse actual', service.isExperimentBusy())).assertFalse();
      } finally { await finishSeriesFixture(service, platform, start.ownerId); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIESOWNERSHIPFEATURE_1600
     * @tc.name testPerformanceSeriesOwnershipFeature0016
     * @tc.desc 释放服务停止系列本地调度，迟到读取不恢复执行或通知已移除视图
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceSeriesOwnershipFeature0016', 0, async (): Promise<void> => {
      const platform = new SeriesIoPlatform(); platform.pauseReadAt = 1;
      const service = AppService.fromPlatform(platform); let notices = 0;
      service.subscribe((): void => { notices++; });
      const start = service.startExperimentSeries('W-TEXT', 'control');
      try {
        await waitSeries((): boolean => platform.resourceCalls === 1, 'dispose active series');
        service.dispose(); const disposedNotices = notices;
        await service.whenSeriesFinished(start.ownerId);
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0016 SeriesOwnershipFeature.test:396 assertEqual actual', requiredSeries(service).phase)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0016 SeriesOwnershipFeature.test:396 assertEqual expected', SeriesPhase.CANCELLED));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0016 SeriesOwnershipFeature.test:397 assertFalse actual', service.startExperimentSeries('W-TEXT', 'control').accepted)).assertFalse();
        platform.releaseRead(); await drainSeries();
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0016 SeriesOwnershipFeature.test:399 assertEqual actual', notices)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0016 SeriesOwnershipFeature.test:399 assertEqual expected', disposedNotices));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0016 SeriesOwnershipFeature.test:400 assertEqual actual', platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0016 SeriesOwnershipFeature.test:400 assertEqual expected', 1));
      } finally { await finishSeriesFixture(service, platform, start.ownerId); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIESOWNERSHIPFEATURE_1700
     * @tc.name testPerformanceSeriesOwnershipFeature0017
     * @tc.desc 配置失败只留下已接受一次的真实失败记录，不制造其余计划样本
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceSeriesOwnershipFeature0017', 0, async (): Promise<void> => {
      const platform = new SeriesIoPlatform(); platform.config = '{}';
      const service = AppService.fromPlatform(platform); const start = service.startExperimentSeries('W-TEXT', 'files');
      try {
        await service.whenSeriesFinished(start.ownerId);
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0017 SeriesOwnershipFeature.test:417 assertEqual actual', requiredSeries(service).phase)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0017 SeriesOwnershipFeature.test:417 assertEqual expected', SeriesPhase.FAILED));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0017 SeriesOwnershipFeature.test:418 assertEqual actual', requiredSeries(service).startedCount)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0017 SeriesOwnershipFeature.test:418 assertEqual expected', 1));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0017 SeriesOwnershipFeature.test:419 assertEqual actual', service.seriesRecords(start.ownerId)[0].stage('config')?.status)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0017 SeriesOwnershipFeature.test:419 assertEqual expected', '失败'));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0017 SeriesOwnershipFeature.test:420 assertEqual actual', platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0017 SeriesOwnershipFeature.test:420 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0017 SeriesOwnershipFeature.test:421 assertEqual actual', requiredSeries(service).recordIds.length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0017 SeriesOwnershipFeature.test:421 assertEqual expected', 1));
      } finally { await finishSeriesFixture(service, platform, start.ownerId); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIESOWNERSHIPFEATURE_1800
     * @tc.name testPerformanceSeriesOwnershipFeature0018
     * @tc.desc 次间资源内容变化保留两个成功事实但拆条件组并停止第三次
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceSeriesOwnershipFeature0018', 0, async (): Promise<void> => {
      const platform = new SeriesIoPlatform(); platform.changeFromRead = 3;
      const service = AppService.fromPlatform(platform);
      const start = service.startExperimentSeries('W-TEXT', 'control');
      try {
        await service.whenSeriesFinished(start.ownerId);
        const records = service.seriesRecords(start.ownerId);
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0018 SeriesOwnershipFeature.test:440 assertEqual actual', requiredSeries(service).phase)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0018 SeriesOwnershipFeature.test:440 assertEqual expected', SeriesPhase.CONDITION_CHANGED));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0018 SeriesOwnershipFeature.test:441 assertTrue actual', records.every((record): boolean => record.complete()))).assertTrue();
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0018 SeriesOwnershipFeature.test:442 assertEqual actual', records.length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0018 SeriesOwnershipFeature.test:442 assertEqual expected', 2));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0018 SeriesOwnershipFeature.test:443 assertEqual actual', digestLedger(records).length)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0018 SeriesOwnershipFeature.test:443 assertEqual expected', 2));
        expect(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0018 SeriesOwnershipFeature.test:444 assertEqual actual', platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_PerformanceSeriesOwnershipFeature_0018 SeriesOwnershipFeature.test:444 assertEqual expected', 4));
      } finally { await finishSeriesFixture(service, platform, start.ownerId); }
    });
  });
}
