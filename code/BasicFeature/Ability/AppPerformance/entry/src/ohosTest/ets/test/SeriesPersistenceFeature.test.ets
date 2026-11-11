import { describe, expect, it } from '@ohos/hypium';
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
        expect(requiredSeries(service).phase).assertEqual(SeriesPhase.SAVE_FAILED);
        expect(requiredSeries(service).saveState).assertEqual('failed');
        expect(platform.resourceCalls).assertEqual(0);
        expect(requiredSeries(service).startedCount).assertEqual(0);
        expect(store.value).assertEqual('');
        expect(service.isExperimentBusy()).assertFalse();
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
        expect(requiredSeries(service).phase).assertEqual(SeriesPhase.SAVE_FAILED);
        expect(requiredSeries(service).recordIds.length).assertEqual(0);
        expect(platform.calls.indexOf('bundleInfo')).assertEqual(-1);
        expect(requiredSeries(service).startedCount).assertEqual(0);
        expect(store.writeCalls.length).assertEqual(2);
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
        expect(requiredSeries(service).phase).assertEqual(SeriesPhase.SAVE_FAILED);
        expect(service.seriesRecords(start.ownerId)[0].complete()).assertTrue();
        expect(requiredSeries(service).saveState).assertEqual('failed');
        expect(snapshotRecordCount(store.value)).assertEqual(0);
        expect(platform.resourceCalls).assertEqual(2);
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
        expect(service.getState().storageMessage).assertEqual('存储写入失败');
        platform.releaseRead(); await service.whenSeriesFinished(start.ownerId);
        expect(requiredSeries(service).phase).assertEqual(SeriesPhase.SAVE_FAILED);
        expect(requiredSeries(service).saveState).assertEqual('saved');
        expect(service.seriesRecords(start.ownerId)[0].complete()).assertTrue();
        expect(platform.resourceCalls).assertEqual(2);
        expect(snapshotRecordCount(store.value)).assertEqual(1);
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
        expect(coherent).assertTrue();
        expect(store.writeCalls.some((value: string): boolean => snapshotRecordCount(value) === 1)).assertTrue();
        expect(snapshotRecordCount(store.value)).assertEqual(3);
        expect((JSON.parse(store.value) as Record<string, Object>)['schema']).assertEqual(2);
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
          expect(requiredSeries(reopened).phase).assertEqual(SeriesPhase.INTERRUPTED);
          expect(requiredSeries(reopened).startedCount).assertEqual(0);
          expect(nextPlatform.resourceCalls).assertEqual(0);
          expect(reopened.isExperimentBusy()).assertFalse();
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
          expect(requiredSeries(reopened).phase).assertEqual(SeriesPhase.INTERRUPTED);
          expect(requiredSeries(reopened).message.indexOf('第 1 次结果未知') >= 0).assertTrue();
          expect(requiredSeries(reopened).recordIds.length).assertEqual(0);
          expect(nextPlatform.fileCalls.length).assertEqual(0);
          expect(requiredSeries(reopened).leaseHeld).assertFalse();
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
        expect(requiredSeries(reopened).phase).assertEqual(SeriesPhase.COMPLETED);
        expect(reopened.seriesRecords(start.ownerId).map((record): string => record.id).join('|')).assertEqual(before);
        expect(nextPlatform.resourceCalls).assertEqual(0);
        expect(requiredSeries(reopened).saveState).assertEqual('saved');
        expect(reopened.isExperimentBusy()).assertFalse();
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
          expect(requiredSeries(reopened).phase).assertEqual(SeriesPhase.CANCELLED);
          expect(reopened.seriesRecords(start.ownerId)[0].complete()).assertFalse();
          expect(reopened.isQuarantined()).assertFalse();
          expect(nextPlatform.resourceCalls).assertEqual(0);
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
        expect(service.seriesRecords(start.ownerId).length).assertEqual(2);
        expect(requiredSeries(service).missingRecordIds.length).assertEqual(1);
        expect(await service.copySeriesAnalysisReport(start.ownerId)).assertTrue();
        expect(platform.copiedTexts[0].indexOf('记录：2 条') >= 0).assertTrue();
        for (let index = 0; index < 3; index++) { await service.runExperiment('W-TEXT', 'control'); }
        expect(service.ledgerRecords().length).assertEqual(30);
        expect(service.seriesRecords(start.ownerId).length).assertEqual(0);
        expect(await service.copySeriesAnalysisReport(start.ownerId)).assertFalse();
        expect(platform.copiedTexts.length).assertEqual(1);
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
          expect(reopened.seriesState()).assertUndefined();
          expect(reopened.ledgerRecords().length).assertEqual(1);
          expect(reopened.getState().storageMessage).assertEqual('');
        } finally { reopened.dispose(); }
      });
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIESPERSISTENCEFEATURE_1200
     * @tc.name testPerformanceSeriesPersistenceFeature0012
     * @tc.desc 没有系列字段的旧schema二存档仍保留设置、启动与实验，且可开始新系列
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
        expect(reopened.seriesState()).assertUndefined();
        expect(reopened.getState().snapFlag).assertEqual('启用');
        expect(reopened.getState().launches.length).assertEqual(1);
        expect(reopened.ledgerRecords().length).assertEqual(1);
        const start = reopened.startExperimentSeries('W-TEXT', 'control', 1);
        await reopened.whenSeriesFinished(start.ownerId);
        expect(reopened.seriesRecords(start.ownerId).length).assertEqual(1);
        expect(reopened.ledgerRecords().length).assertEqual(2);
      } finally { reopened.dispose(); }
    });
  });
}
