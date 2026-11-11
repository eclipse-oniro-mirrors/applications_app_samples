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
        expect(state.phase).assertEqual(SeriesPhase.COMPLETED);
        expect(state.recordIds.length).assertEqual(3);
        expect(new Set<string>(state.recordIds).size).assertEqual(3);
        expect(platform.resourceCalls).assertEqual(6);
        expect(platform.fileCalls.length).assertEqual(0);
        expect(service.isExperimentBusy()).assertFalse();
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
        expect(counts.every((count: number): boolean =>
          !service.startExperimentSeries('W-TEXT', 'control', count).accepted)).assertTrue();
        expect(service.seriesState()).assertUndefined();
        expect(platform.store.writeCalls.length).assertEqual(0);
        const valid = service.startExperimentSeries('W-TEXT', 'control', 1);
        await service.whenSeriesFinished(valid.ownerId);
        expect(service.seriesRecords(valid.ownerId).length).assertEqual(1);
        expect(platform.resourceCalls).assertEqual(2);
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
        expect(state.startedCount).assertEqual(10);
        expect(new Set<string>(state.recordIds).size).assertEqual(10);
        expect(platform.resourceCalls).assertEqual(20);
        expect(service.seriesRecords(start.ownerId).every((record): boolean => record.complete())).assertTrue();
        expect(state.saveState).assertEqual('saved');
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
        expect(service.startExperimentSeries('W-TEXT', 'control', 1).accepted).assertFalse();
        expect(await service.runExperiment('W-TEXT', 'control')).assertUndefined();
        expect((await service.evictFiles(['entry.hap'])).dispatched).assertFalse();
        expect(platform.fileCalls.length).assertEqual(0);
        expect(requiredSeries(service).ownerId).assertEqual(start.ownerId);
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
        expect(requiredSeries(service).recordIds.length).assertEqual(1);
        expect(service.isQuarantined()).assertFalse();
        expect(service.isExperimentBusy()).assertTrue();
        expect(await service.runExperiment('W-TEXT', 'control')).assertUndefined();
        await service.readResource(); service.clearLedger();
        expect(platform.resourceCalls).assertEqual(2);
        expect(service.ledgerRecords().length).assertEqual(1);
        store.releaseWrite(); await service.whenSeriesFinished(start.ownerId);
        expect(platform.resourceCalls).assertEqual(6);
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
        expect(platform.snapCalls.length).assertEqual(0);
        expect(platform.rebuildCalls).assertEqual(0);
        expect(service.getState().snapFlag).assertEqual('尚未设置');
        expect(service.getState().logs.filter((record): boolean => record.kind === 'blocked').length).assertEqual(2);
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
        expect(service.stopExperimentSeries(start.ownerId)).assertTrue();
        expect(service.isQuarantined()).assertFalse();
        platform.releaseRead(); await service.whenSeriesFinished(start.ownerId);
        expect(requiredSeries(service).phase).assertEqual(SeriesPhase.STOPPED);
        expect(service.seriesRecords(start.ownerId)[0].complete()).assertTrue();
        expect(platform.fileCalls.length).assertEqual(1);
        expect(requiredSeries(service).startedCount).assertEqual(1);
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
        expect(platform.pendingTimers()).assertEqual(1);
        platform.releaseFile(); await service.whenSeriesFinished(start.ownerId);
        expect(service.seriesRecords(start.ownerId)[0].stage('evict')?.status).assertEqual('成功');
        expect(requiredSeries(service).phase).assertEqual(SeriesPhase.STOPPED);
        expect(platform.resourceCalls).assertEqual(2);
        expect(requiredSeries(service).recordIds.length).assertEqual(1);
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
        expect(requiredSeries(service).phase).assertEqual(SeriesPhase.CANCELLED);
        expect(requiredSeries(service).recordIds.length).assertEqual(1);
        expect(requiredSeries(service).waitingForSdk).assertTrue();
        platform.releaseRead(); await drainSeries();
        expect(service.isExperimentBusy()).assertFalse();
        expect(platform.resourceCalls).assertEqual(1);
        expect(platform.fileCalls.length).assertEqual(0);
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
        expect(service.seriesRecords(start.ownerId)[0].stage('evict')?.status).assertEqual('已取消');
        service.clearLedger(); expect(service.ledgerRecords().length).assertEqual(1);
        platform.releaseFile(); await drainSeries();
        expect(service.getState().logs.some((record): boolean =>
          record.api === 'evictFilePages' && record.code === 182099)).assertTrue();
        expect(requiredSeries(service).phase).assertEqual(SeriesPhase.CANCELLED);
        expect(platform.resourceCalls).assertEqual(1);
        expect(platform.fileCalls.length).assertEqual(1);
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
        expect(record.beforeBytes).assertEqual(3);
        expect(record.afterBytes).assertEqual(0);
        expect(record.requestStatus).assertEqual('成功');
        expect(record.stage('reread')?.status).assertEqual('已取消');
        platform.releaseRead(); await drainSeries();
        expect(service.seriesRecords(start.ownerId)[0].digestAfter).assertEqual('');
        expect(platform.fileCalls.length).assertEqual(1);
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
        expect(requiredSeries(service).phase).assertEqual(SeriesPhase.FAILED);
        expect(requiredSeries(service).leaseHeld).assertTrue();
        expect(service.seriesRecords(start.ownerId)[0].stage('evict')?.status).assertEqual('超时');
        platform.releaseFile(); await drainSeries();
        expect(requiredSeries(service).leaseHeld).assertFalse();
        expect(platform.fileCalls.length).assertEqual(1);
        expect(requiredSeries(service).startedCount).assertEqual(1);
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
        expect(service.cancelExperimentSeries(first.ownerId)).assertFalse();
        expect(service.stopExperimentSeries(first.ownerId)).assertFalse();
        expect(requiredSeries(service).ownerId).assertEqual(second.ownerId);
        platform.releaseRead(); await service.whenSeriesFinished(second.ownerId);
        expect(requiredSeries(service).phase).assertEqual(SeriesPhase.COMPLETED);
        expect(service.seriesRecords(first.ownerId).length).assertEqual(0);
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
        expect(service.isQuarantined()).assertFalse();
        store.releaseWrite(); await service.whenSeriesFinished(start.ownerId);
        expect(requiredSeries(service).phase).assertEqual(SeriesPhase.CANCELLED);
        expect(service.seriesRecords(start.ownerId)[0].complete()).assertTrue();
        expect(requiredSeries(service).recordIds.length).assertEqual(1);
        expect(platform.resourceCalls).assertEqual(2);
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
        expect(requiredSeries(service).phase).assertEqual(SeriesPhase.RUNNING);
        service.setForeground(!before); await service.whenSeriesFinished(start.ownerId);
        expect(requiredSeries(service).phase).assertEqual(SeriesPhase.CONDITION_CHANGED);
        expect(service.seriesRecords(start.ownerId)[0].stage('warm')?.status).assertEqual('已取消');
        platform.releaseRead(); await drainSeries();
        expect(platform.resourceCalls).assertEqual(1);
        expect(service.isExperimentBusy()).assertFalse();
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
        expect(requiredSeries(service).phase).assertEqual(SeriesPhase.CANCELLED);
        expect(service.startExperimentSeries('W-TEXT', 'control').accepted).assertFalse();
        platform.releaseRead(); await drainSeries();
        expect(notices).assertEqual(disposedNotices);
        expect(platform.resourceCalls).assertEqual(1);
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
        expect(requiredSeries(service).phase).assertEqual(SeriesPhase.FAILED);
        expect(requiredSeries(service).startedCount).assertEqual(1);
        expect(service.seriesRecords(start.ownerId)[0].stage('config')?.status).assertEqual('失败');
        expect(platform.resourceCalls).assertEqual(0);
        expect(requiredSeries(service).recordIds.length).assertEqual(1);
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
        expect(requiredSeries(service).phase).assertEqual(SeriesPhase.CONDITION_CHANGED);
        expect(records.every((record): boolean => record.complete())).assertTrue();
        expect(records.length).assertEqual(2);
        expect(digestLedger(records).length).assertEqual(2);
        expect(platform.resourceCalls).assertEqual(4);
      } finally { await finishSeriesFixture(service, platform, start.ownerId); }
    });
  });
}
