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

import { preferences } from '@kit.ArkData';
import { describe, expect, it } from '@ohos/hypium';
import { StoredState } from '../../../main/ets/core/AppService';
import { NativeStateStore } from '../../../main/ets/core/AppPlatform';
import { LEDGER_LIMIT, ExperimentRecord } from '../../../main/ets/core/ExperimentLedger';
import {
  SERIES_MAX_REPETITIONS, ExperimentSeriesState, SeriesPhase, SeriesStartResult
} from '../../../main/ets/core/ExperimentSeries';
import { SeriesNativeQaFixture, SeriesNativeSession, requiredNativeSeries,
  seriesNativeDocument, withSeriesNativeQa } from '../support/SeriesNativeQaSupport';

// NativeOnly: native context/resource/persistence are acquired only from it callbacks.
export default function seriesNativeQaTests(): void {
  describe('SeriesNativeQa', (): void => {
    /**
     * @tc.number SUB_PERFORMANCE_SERIES_NATIVE_QA_0100
     * @tc.name testSeriesNativeQa0001
     * @tc.desc 实际读取随包资源的完成系列清除Preferences缓存后恢复真实记录且不重新执行
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSeriesNativeQa0001', 0, async (): Promise<void> => {
      await withSeriesNativeQa(async (f: SeriesNativeQaFixture): Promise<void> => {
        const source: SeriesNativeSession = f.open();
        const start: SeriesStartResult = source.service.startExperimentSeries('W-TEXT', 'control', 2);
        expect(start.accepted).assertTrue();
        await source.service.whenSeriesFinished(start.ownerId);
        await source.service.whenSaved();
        const ids: string = requiredNativeSeries(source.service).recordIds.join(',');
        const raw: string = f.raw();
        const reopened: SeriesNativeSession = await f.reopen();
        expect(requiredNativeSeries(reopened.service).phase).assertEqual(SeriesPhase.COMPLETED);
        expect(reopened.service.seriesRecords(start.ownerId)
          .map((record: ExperimentRecord): string => record.id).join(',')).assertEqual(ids);
        expect(reopened.service.seriesRecords(start.ownerId)
          .every((record: ExperimentRecord): boolean => record.complete())).assertTrue();
        expect(reopened.service.seriesRecords(start.ownerId)[0].beforeBytes > 0).assertTrue();
        expect(reopened.platform.resourceCalls).assertEqual(0);
        expect(reopened.store.writes).assertEqual(0);
        expect(f.raw()).assertEqual(raw);
        expect(reopened.service.isExperimentBusy()).assertFalse();
      });
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIES_NATIVE_QA_0200
     * @tc.name testSeriesNativeQa0002
     * @tc.desc 每次真实flush后的系列引用与完整账本记录同快照提交中间检查点可冷恢复
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSeriesNativeQa0002', 0, async (): Promise<void> => {
      await withSeriesNativeQa(async (f: SeriesNativeQaFixture): Promise<void> => {
        const source: SeriesNativeSession = f.open();
        const start: SeriesStartResult = source.service.startExperimentSeries('W-TEXT', 'control', 3);
        await source.service.whenSeriesFinished(start.ownerId);
        await source.service.whenSaved();
        const firstRecordId: string = source.service.seriesRecords(start.ownerId)[0].id;
        const images: string[] = source.store.images.slice();
        const coherent: boolean = images.every((raw: string): boolean => {
          const document: StoredState = seriesNativeDocument(raw);
          const series: ExperimentSeriesState | undefined = document.series;
          const records: ExperimentRecord[] | undefined = document.experiments;
          if (series === undefined || records === undefined) { return false; }
          return series.recordIds.every((id: string): boolean => records.some((record: ExperimentRecord): boolean =>
            record.id === id && record.workloadId === series.workloadId &&
            record.mode === series.mode && record.stages.length === 6));
        });
        expect(coherent).assertTrue();
        const checkpoint: string | undefined = images.find((raw: string): boolean => {
          const series = seriesNativeDocument(raw).series;
          return series !== undefined && series.recordIds.length === 1 && series.phase === SeriesPhase.RUNNING;
        });
        if (checkpoint === undefined) { throw new Error('No real flushed one-record checkpoint'); }
        await f.seed(checkpoint);
        const restored: SeriesNativeSession = f.open();
        expect(requiredNativeSeries(restored.service).phase).assertEqual(SeriesPhase.INTERRUPTED);
        expect(restored.service.ledgerRecords().map((record: ExperimentRecord): string => record.id).join(','))
          .assertEqual(firstRecordId);
        expect(restored.service.seriesRecords(start.ownerId)[0].complete()).assertTrue();
        expect(restored.platform.resourceCalls).assertEqual(0);
        expect(f.raw()).assertEqual(checkpoint);
      });
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIES_NATIVE_QA_0300
     * @tc.name testSeriesNativeQa0003
     * @tc.desc 将真实已flush的计划和在途快照注入专用库模拟进程中断重开不重放未结束次数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testSeriesNativeQa0003', 0, async (): Promise<void> => {
      await withSeriesNativeQa(async (f: SeriesNativeQaFixture): Promise<void> => {
        const source: SeriesNativeSession = f.open();
        const start: SeriesStartResult = source.service.startExperimentSeries('W-TEXT', 'control', 2);
        await source.service.whenSeriesFinished(start.ownerId);
        await source.service.whenSaved();
        const plan: string | undefined = source.store.images.find((raw: string): boolean => {
          const state = seriesNativeDocument(raw).series;
          return state !== undefined && state.phase === SeriesPhase.PREPARING &&
            state.startedCount === 0 && state.activeIteration === 0;
        });
        const inFlight: string | undefined = source.store.images.find((raw: string): boolean => {
          const state = seriesNativeDocument(raw).series;
          return state !== undefined && state.phase === SeriesPhase.RUNNING &&
            state.startedCount === 1 && state.recordIds.length === 0;
        });
        if (plan === undefined || inFlight === undefined) {
          throw new Error('Missing real native plan/in-flight images');
        }
        for (const checkpoint of [plan, inFlight]) {
          await f.seed(checkpoint);
          const restored: SeriesNativeSession = f.open();
          expect(requiredNativeSeries(restored.service).phase).assertEqual(SeriesPhase.INTERRUPTED);
          expect(restored.service.ledgerRecords().length).assertEqual(0);
          expect(restored.platform.resourceCalls).assertEqual(0);
          expect(restored.platform.fileCalls.length).assertEqual(0);
          expect(requiredNativeSeries(restored.service).leaseHeld).assertFalse();
          await restored.service.whenSaved();
          expect(f.raw()).assertEqual(checkpoint);
        }
      });
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIES_NATIVE_QA_0400
     * @tc.name testSeriesNativeQa0004
     * @tc.desc 真实记录已flush后丢失确认仅停止本进程冷重开保留事实但不盲重放剩余实验
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testSeriesNativeQa0004', 0, async (): Promise<void> => {
      await withSeriesNativeQa(async (f: SeriesNativeQaFixture): Promise<void> => {
        const source: SeriesNativeSession = f.open();
        source.store.failAfterRecordCount = 1;
        const start: SeriesStartResult = source.service.startExperimentSeries('W-TEXT', 'control', 3);
        await source.service.whenSeriesFinished(start.ownerId);
        await source.service.whenSaved();
        expect(requiredNativeSeries(source.service).phase).assertEqual(SeriesPhase.SAVE_FAILED);
        expect(source.platform.resourceCalls).assertEqual(2);
        const firstId: string = source.service.seriesRecords(start.ownerId)[0].id;
        const disk: StoredState = seriesNativeDocument(f.raw());
        if (disk.series === undefined) { throw new Error('Missing actual committed series'); }
        expect(disk.series.recordIds.join(',')).assertEqual(firstId);
        const reopened: SeriesNativeSession = await f.reopen();
        expect(requiredNativeSeries(reopened.service).phase).assertEqual(SeriesPhase.INTERRUPTED);
        expect(reopened.service.seriesRecords(start.ownerId)[0].complete()).assertTrue();
        expect(reopened.platform.resourceCalls).assertEqual(0);
        const explicit: SeriesStartResult = reopened.service.startExperimentSeries('W-TEXT', 'control', 1);
        await reopened.service.whenSeriesFinished(explicit.ownerId);
        const nextId: string = requiredNativeSeries(reopened.service).recordIds[0];
        expect(reopened.service.ledgerRecords().map((record: ExperimentRecord): string => record.id).join(','))
          .assertEqual(`${nextId},${firstId}`);
        expect(reopened.platform.resourceCalls).assertEqual(2);
        expect(reopened.service.seriesRecords(explicit.ownerId)[0].complete()).assertTrue();
      });
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIES_NATIVE_QA_0500
     * @tc.name testSeriesNativeQa0005
     * @tc.desc 损坏终态元信息不会丢弃已落盘账本新系列显式保存时仍携带原始真实记录
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSeriesNativeQa0005', 0, async (): Promise<void> => {
      await withSeriesNativeQa(async (f: SeriesNativeQaFixture): Promise<void> => {
        const source: SeriesNativeSession = f.open();
        const start: SeriesStartResult = source.service.startExperimentSeries('W-TEXT', 'control', 2);
        await source.service.whenSeriesFinished(start.ownerId);
        const priorIds: string = source.service.ledgerRecords()
          .map((record: ExperimentRecord): string => record.id).join(',');
        const document: StoredState = seriesNativeDocument(f.raw());
        if (document.series === undefined) { throw new Error('Missing series metadata to corrupt'); }
        document.series.endedAt = 0;
        const broken: string = JSON.stringify(document);
        await f.seed(broken);
        const restored: SeriesNativeSession = f.open();
        expect(restored.service.seriesState() === undefined).assertTrue();
        expect(restored.service.ledgerRecords().map((record: ExperimentRecord): string => record.id).join(','))
          .assertEqual(priorIds);
        expect(restored.service.ledgerRecords().every((record: ExperimentRecord): boolean => record.complete()))
          .assertTrue();
        expect(f.raw()).assertEqual(broken);
        const next: SeriesStartResult = restored.service.startExperimentSeries('W-TEXT', 'control', 1);
        await restored.service.whenSeriesFinished(next.ownerId);
        const nextId: string = requiredNativeSeries(restored.service).recordIds[0];
        const cold: SeriesNativeSession = await f.reopen();
        expect(cold.service.ledgerRecords().map((record: ExperimentRecord): string => record.id).join(','))
          .assertEqual(`${nextId},${priorIds}`);
        expect(requiredNativeSeries(cold.service).recordIds.join(',')).assertEqual(nextId);
        expect(cold.platform.resourceCalls).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIES_NATIVE_QA_0600
     * @tc.name testSeriesNativeQa0006
     * @tc.desc 正式清空账本仅删除记录保留系列缺失引用启动样本和同Preferences旁路键
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSeriesNativeQa0006', 0, async (): Promise<void> => {
      await withSeriesNativeQa(async (f: SeriesNativeQaFixture): Promise<void> => {
        const source: SeriesNativeSession = f.open();
        source.service.markContentLoaded();
        const start: SeriesStartResult = source.service.startExperimentSeries('W-TEXT', 'control', 2);
        await source.service.whenSeriesFinished(start.ownerId);
        const nativeStore: preferences.Preferences = preferences.getPreferencesSync(f.context, { name: f.namespace });
        nativeStore.putSync('qa-side-key', '不属于实验账本');
        nativeStore.flushSync();
        const priorIds: string = requiredNativeSeries(source.service).recordIds.join(',');
        source.service.clearLedger();
        await source.service.whenSaved();
        const reopened: SeriesNativeSession = await f.reopen();
        expect(reopened.service.ledgerRecords().length).assertEqual(0);
        expect(requiredNativeSeries(reopened.service).missingRecordIds.join(',')).assertEqual(priorIds);
        expect(reopened.service.seriesRecords(start.ownerId).length).assertEqual(0);
        expect(reopened.service.getState().launches.length).assertEqual(1);
        expect(reopened.platform.resourceCalls).assertEqual(0);
        const cold: preferences.Preferences = preferences.getPreferencesSync(f.context, { name: f.namespace });
        expect(cold.getSync('qa-side-key', '')).assertEqual('不属于实验账本');
      });
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIES_NATIVE_QA_0700
     * @tc.name testSeriesNativeQa0007
     * @tc.desc 两个原生命名空间相互隔离一方清空及删除不影响另一方的真实记录
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSeriesNativeQa0007', 0, async (): Promise<void> => {
      await withSeriesNativeQa(async (left: SeriesNativeQaFixture): Promise<void> => {
        const a: SeriesNativeSession = left.open();
        const start: SeriesStartResult = a.service.startExperimentSeries('W-TEXT', 'control', 1);
        await a.service.whenSeriesFinished(start.ownerId);
        const firstId: string = a.service.seriesRecords(start.ownerId)[0].id;
        const raw: string = left.raw();
        await withSeriesNativeQa(async (right: SeriesNativeQaFixture): Promise<void> => {
          const b: SeriesNativeSession = right.open();
          expect(b.service.ledgerRecords().length).assertEqual(0);
          const other: SeriesStartResult = b.service.startExperimentSeries('W-TEXT', 'control', 1);
          await b.service.whenSeriesFinished(other.ownerId);
          expect(b.service.seriesRecords(other.ownerId)[0].complete()).assertTrue();
          expect(other.ownerId === start.ownerId).assertFalse();
          b.service.clearLedger();
          await b.service.whenSaved();
          expect(left.raw()).assertEqual(raw);
        });
        const reopened: SeriesNativeSession = await left.reopen();
        expect(reopened.service.seriesRecords(start.ownerId)[0].id).assertEqual(firstId);
        expect(reopened.service.seriesRecords(start.ownerId)[0].complete()).assertTrue();
        expect(left.raw()).assertEqual(raw);
      });
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIES_NATIVE_QA_0800
     * @tc.name testSeriesNativeQa0008
     * @tc.desc 正式adapter写入有效快照不清空旁路键冷重开读取更新原文而非旧缓存
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSeriesNativeQa0008', 0, async (): Promise<void> => {
      await withSeriesNativeQa(async (f: SeriesNativeQaFixture): Promise<void> => {
        const source: SeriesNativeSession = f.open();
        const start: SeriesStartResult = source.service.startExperimentSeries('W-TEXT', 'control', 1);
        await source.service.whenSeriesFinished(start.ownerId);
        const firstId: string = source.service.seriesRecords(start.ownerId)[0].id;
        const document: StoredState = seriesNativeDocument(f.raw());
        await f.release();
        await preferences.removePreferencesFromCache(f.context, f.namespace);
        const nativeStore: preferences.Preferences = preferences.getPreferencesSync(f.context, { name: f.namespace });
        nativeStore.putSync('qa-private-sentinel', '不随state替换');
        nativeStore.flushSync();
        document.snapFlag = '启用';
        document.snapAt = Date.now();
        await new NativeStateStore(f.context, f.namespace).write(JSON.stringify(document));
        await preferences.removePreferencesFromCache(f.context, f.namespace);
        const reopened: SeriesNativeSession = f.open();
        expect(reopened.service.getState().snapFlag).assertEqual('启用');
        expect(reopened.service.seriesRecords(start.ownerId)[0].id).assertEqual(firstId);
        expect(reopened.platform.snapCalls.length).assertEqual(0);
        expect(reopened.platform.resourceCalls).assertEqual(0);
        const cold: preferences.Preferences = preferences.getPreferencesSync(f.context, { name: f.namespace });
        expect(cold.getSync('qa-private-sentinel', '')).assertEqual('不随state替换');
      });
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIES_NATIVE_QA_0900
     * @tc.name testSeriesNativeQa0009
     * @tc.desc 无法解析的原生原文初始化只报读取失败不写空state显式修复后能恢复真实账本
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSeriesNativeQa0009', 0, async (): Promise<void> => {
      await withSeriesNativeQa(async (f: SeriesNativeQaFixture): Promise<void> => {
        const source: SeriesNativeSession = f.open();
        const start: SeriesStartResult = source.service.startExperimentSeries('W-TEXT', 'control', 1);
        await source.service.whenSeriesFinished(start.ownerId);
        const good: string = f.raw();
        const malformed: string = good.substring(0, good.length - 2);
        await f.seed(malformed);
        const rejected: SeriesNativeSession = f.open();
        expect(rejected.service.getState().storageMessage).assertEqual('存储读取失败');
        expect(rejected.store.writes).assertEqual(0);
        expect(f.raw()).assertEqual(malformed);
        expect(rejected.platform.resourceCalls).assertEqual(0);
        await f.seed(good);
        const repaired: SeriesNativeSession = f.open();
        expect(repaired.service.seriesRecords(start.ownerId)[0].complete()).assertTrue();
        expect(requiredNativeSeries(repaired.service).phase).assertEqual(SeriesPhase.COMPLETED);
      });
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIES_NATIVE_QA_1000
     * @tc.name testSeriesNativeQa0010
     * @tc.desc 首个真实样本flush确认边界请求停止终态落盘且重开不继续余下次数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSeriesNativeQa0010', 0, async (): Promise<void> => {
      await withSeriesNativeQa(async (f: SeriesNativeQaFixture): Promise<void> => {
        const source: SeriesNativeSession = f.open();
        const accepted: boolean[] = [];
        source.store.onCommitted = (document: StoredState): void => {
          const series: ExperimentSeriesState | undefined = document.series;
          if (series !== undefined && series.recordIds.length === 1 && accepted.length === 0) {
            accepted.push(source.service.stopExperimentSeries(series.ownerId));
          }
        };
        const start: SeriesStartResult = source.service.startExperimentSeries('W-TEXT', 'control', 3);
        await source.service.whenSeriesFinished(start.ownerId);
        await source.service.whenSaved();
        expect(accepted[0]).assertTrue();
        expect(source.platform.resourceCalls).assertEqual(2);
        const firstId: string = source.service.seriesRecords(start.ownerId)[0].id;
        const reopened: SeriesNativeSession = await f.reopen();
        expect(requiredNativeSeries(reopened.service).phase).assertEqual(SeriesPhase.STOPPED);
        expect(reopened.service.seriesRecords(start.ownerId)
          .map((record: ExperimentRecord): string => record.id).join(',')).assertEqual(firstId);
        expect(reopened.platform.resourceCalls).assertEqual(0);
        expect(requiredNativeSeries(reopened.service).stopRequested).assertTrue();
      });
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIES_NATIVE_QA_1100
     * @tc.name testSeriesNativeQa0011
     * @tc.desc 计划真实flush后立即取消产生零样本持久终态重开不补跑也不制造账本记录
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSeriesNativeQa0011', 0, async (): Promise<void> => {
      await withSeriesNativeQa(async (f: SeriesNativeQaFixture): Promise<void> => {
        const source: SeriesNativeSession = f.open();
        const cancelled: boolean[] = [];
        source.store.onCommitted = (document: StoredState): void => {
          const series: ExperimentSeriesState | undefined = document.series;
          if (series !== undefined && series.startedCount === 0 && cancelled.length === 0) {
            cancelled.push(source.service.cancelExperimentSeries(series.ownerId));
          }
        };
        const start: SeriesStartResult = source.service.startExperimentSeries('W-TEXT', 'control', 3);
        await source.service.whenSeriesFinished(start.ownerId);
        await source.service.whenSaved();
        expect(cancelled[0]).assertTrue();
        expect(source.platform.resourceCalls).assertEqual(0);
        const reopened: SeriesNativeSession = await f.reopen();
        expect(requiredNativeSeries(reopened.service).phase).assertEqual(SeriesPhase.CANCELLED);
        expect(reopened.service.ledgerRecords().length).assertEqual(0);
        expect(reopened.service.isExperimentBusy()).assertFalse();
        expect(requiredNativeSeries(reopened.service).startedCount).assertEqual(0);
        expect(reopened.store.writes).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIES_NATIVE_QA_1200
     * @tc.name testSeriesNativeQa0012
     * @tc.desc 冷重开后显式新系列建立新owner和独立记录身份不把前系列结果混入引用
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSeriesNativeQa0012', 0, async (): Promise<void> => {
      await withSeriesNativeQa(async (f: SeriesNativeQaFixture): Promise<void> => {
        const first: SeriesNativeSession = f.open();
        const prior: SeriesStartResult = first.service.startExperimentSeries('W-TEXT', 'control', 2);
        await first.service.whenSeriesFinished(prior.ownerId);
        const priorIds: string = first.service.ledgerRecords()
          .map((record: ExperimentRecord): string => record.id).join(',');
        const next: SeriesNativeSession = await f.reopen();
        const current: SeriesStartResult = next.service.startExperimentSeries('W-TEXT', 'control', 1);
        await next.service.whenSeriesFinished(current.ownerId);
        expect(current.ownerId === prior.ownerId).assertFalse();
        const currentId: string = requiredNativeSeries(next.service).recordIds[0];
        const reopened: SeriesNativeSession = await f.reopen();
        expect(requiredNativeSeries(reopened.service).recordIds.join(',')).assertEqual(currentId);
        expect(requiredNativeSeries(reopened.service).baselineRecordId).assertEqual(currentId);
        expect(reopened.service.ledgerRecords().map((record: ExperimentRecord): string => record.id).join(','))
          .assertEqual(`${currentId},${priorIds}`);
        expect(reopened.service.seriesRecords(prior.ownerId).length).assertEqual(0);
        expect(reopened.service.seriesRecords(current.ownerId)[0].complete()).assertTrue();
        expect(reopened.platform.resourceCalls).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIES_NATIVE_QA_1300
     * @tc.name testSeriesNativeQa0013
     * @tc.desc 超过账本容量的真实资源实验经原生存储淘汰后冷重开保留最新有界记录且不倒序
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testSeriesNativeQa0013', 0, async (): Promise<void> => {
      await withSeriesNativeQa(async (f: SeriesNativeQaFixture): Promise<void> => {
        const source: SeriesNativeSession = f.open();
        const actualIds: string[] = [];
        let lastSeriesIds: string = '';
        let remaining: number = LEDGER_LIMIT + 1;
        while (remaining > 0) {
          const repetitions: number = Math.min(remaining, SERIES_MAX_REPETITIONS);
          const start: SeriesStartResult = source.service.startExperimentSeries('W-TEXT', 'control', repetitions);
          if (!start.accepted) { throw new Error('Real native capacity series was rejected'); }
          await source.service.whenSeriesFinished(start.ownerId);
          if (requiredNativeSeries(source.service).phase !== SeriesPhase.COMPLETED) {
            throw new Error('Capacity input must consist only of actual completed experiments');
          }
          lastSeriesIds = requiredNativeSeries(source.service).recordIds.join(',');
          source.service.seriesRecords(start.ownerId).forEach((record: ExperimentRecord): void => {
            actualIds.push(record.id);
          });
          remaining -= repetitions;
        }
        await source.service.whenSaved();
        expect(source.platform.resourceCalls).assertEqual((LEDGER_LIMIT + 1) * 2);
        const reopened: SeriesNativeSession = await f.reopen();
        const records: ExperimentRecord[] = reopened.service.ledgerRecords();
        expect(records.length).assertEqual(LEDGER_LIMIT);
        expect(records[0].id).assertEqual(actualIds[actualIds.length - 1]);
        expect(records[records.length - 1].id).assertEqual(actualIds[1]);
        expect(records.some((record: ExperimentRecord): boolean => record.id === actualIds[0])).assertFalse();
        expect(requiredNativeSeries(reopened.service).recordIds.join(',')).assertEqual(lastSeriesIds);
        expect(records.every((record: ExperimentRecord): boolean => record.complete())).assertTrue();
        expect(reopened.platform.resourceCalls).assertEqual(0);
      });
    });
  });
}
