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
import { preferences } from '@kit.ArkData';
import { describe, expect } from '@ohos/hypium';
import { loggedIt as it } from '../support/TestLog';
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
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0001 SeriesNativeQa.test:42 assertTrue actual', start.accepted)).assertTrue();
        await source.service.whenSeriesFinished(start.ownerId);
        await source.service.whenSaved();
        const ids: string = requiredNativeSeries(source.service).recordIds.join(',');
        const raw: string = f.raw();
        const reopened: SeriesNativeSession = await f.reopen();
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0001 SeriesNativeQa.test:48 assertEqual actual', requiredNativeSeries(reopened.service).phase)).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0001 SeriesNativeQa.test:48 assertEqual expected', SeriesPhase.COMPLETED));
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0001 SeriesNativeQa.test:49 assertEqual actual', reopened.service.seriesRecords(start.ownerId)
          .map((record: ExperimentRecord): string => record.id).join(','))).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0001 SeriesNativeQa.test:49 assertEqual expected', ids));
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0001 SeriesNativeQa.test:51 assertTrue actual', reopened.service.seriesRecords(start.ownerId)
          .every((record: ExperimentRecord): boolean => record.complete()))).assertTrue();
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0001 SeriesNativeQa.test:53 assertTrue actual', reopened.service.seriesRecords(start.ownerId)[0].beforeBytes > 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0001 SeriesNativeQa.test:54 assertEqual actual', reopened.platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0001 SeriesNativeQa.test:54 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0001 SeriesNativeQa.test:55 assertEqual actual', reopened.store.writes)).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0001 SeriesNativeQa.test:55 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0001 SeriesNativeQa.test:56 assertEqual actual', f.raw())).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0001 SeriesNativeQa.test:56 assertEqual expected', raw));
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0001 SeriesNativeQa.test:57 assertFalse actual', reopened.service.isExperimentBusy())).assertFalse();
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
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0002 SeriesNativeQa.test:86 assertTrue actual', coherent)).assertTrue();
        const checkpoint: string | undefined = images.find((raw: string): boolean => {
          const series = seriesNativeDocument(raw).series;
          return series !== undefined && series.recordIds.length === 1 && series.phase === SeriesPhase.RUNNING;
        });
        if (checkpoint === undefined) { throw new Error('No real flushed one-record checkpoint'); }
        await f.seed(checkpoint);
        const restored: SeriesNativeSession = f.open();
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0002 SeriesNativeQa.test:94 assertEqual actual', requiredNativeSeries(restored.service).phase)).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0002 SeriesNativeQa.test:94 assertEqual expected', SeriesPhase.INTERRUPTED));
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0002 SeriesNativeQa.test:95 assertEqual actual', restored.service.ledgerRecords().map((record: ExperimentRecord): string => record.id).join(',')))
          .assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0002 SeriesNativeQa.test:95 assertEqual expected', firstRecordId));
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0002 SeriesNativeQa.test:97 assertTrue actual', restored.service.seriesRecords(start.ownerId)[0].complete())).assertTrue();
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0002 SeriesNativeQa.test:98 assertEqual actual', restored.platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0002 SeriesNativeQa.test:98 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0002 SeriesNativeQa.test:99 assertEqual actual', f.raw())).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0002 SeriesNativeQa.test:99 assertEqual expected', checkpoint));
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
          expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0003 SeriesNativeQa.test:133 assertEqual actual', requiredNativeSeries(restored.service).phase)).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0003 SeriesNativeQa.test:133 assertEqual expected', SeriesPhase.INTERRUPTED));
          expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0003 SeriesNativeQa.test:134 assertEqual actual', restored.service.ledgerRecords().length)).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0003 SeriesNativeQa.test:134 assertEqual expected', 0));
          expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0003 SeriesNativeQa.test:135 assertEqual actual', restored.platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0003 SeriesNativeQa.test:135 assertEqual expected', 0));
          expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0003 SeriesNativeQa.test:136 assertEqual actual', restored.platform.fileCalls.length)).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0003 SeriesNativeQa.test:136 assertEqual expected', 0));
          expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0003 SeriesNativeQa.test:137 assertFalse actual', requiredNativeSeries(restored.service).leaseHeld)).assertFalse();
          await restored.service.whenSaved();
          expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0003 SeriesNativeQa.test:139 assertEqual actual', f.raw())).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0003 SeriesNativeQa.test:139 assertEqual expected', checkpoint));
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
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0004 SeriesNativeQa.test:159 assertEqual actual', requiredNativeSeries(source.service).phase)).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0004 SeriesNativeQa.test:159 assertEqual expected', SeriesPhase.SAVE_FAILED));
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0004 SeriesNativeQa.test:160 assertEqual actual', source.platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0004 SeriesNativeQa.test:160 assertEqual expected', 2));
        const firstId: string = source.service.seriesRecords(start.ownerId)[0].id;
        const disk: StoredState = seriesNativeDocument(f.raw());
        if (disk.series === undefined) { throw new Error('Missing actual committed series'); }
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0004 SeriesNativeQa.test:164 assertEqual actual', disk.series.recordIds.join(','))).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0004 SeriesNativeQa.test:164 assertEqual expected', firstId));
        const reopened: SeriesNativeSession = await f.reopen();
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0004 SeriesNativeQa.test:166 assertEqual actual', requiredNativeSeries(reopened.service).phase)).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0004 SeriesNativeQa.test:166 assertEqual expected', SeriesPhase.INTERRUPTED));
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0004 SeriesNativeQa.test:167 assertTrue actual', reopened.service.seriesRecords(start.ownerId)[0].complete())).assertTrue();
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0004 SeriesNativeQa.test:168 assertEqual actual', reopened.platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0004 SeriesNativeQa.test:168 assertEqual expected', 0));
        const explicit: SeriesStartResult = reopened.service.startExperimentSeries('W-TEXT', 'control', 1);
        await reopened.service.whenSeriesFinished(explicit.ownerId);
        const nextId: string = requiredNativeSeries(reopened.service).recordIds[0];
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0004 SeriesNativeQa.test:172 assertEqual actual', reopened.service.ledgerRecords().map((record: ExperimentRecord): string => record.id).join(',')))
          .assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0004 SeriesNativeQa.test:172 assertEqual expected', `${nextId},${firstId}`));
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0004 SeriesNativeQa.test:174 assertEqual actual', reopened.platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0004 SeriesNativeQa.test:174 assertEqual expected', 2));
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0004 SeriesNativeQa.test:175 assertTrue actual', reopened.service.seriesRecords(explicit.ownerId)[0].complete())).assertTrue();
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
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0005 SeriesNativeQa.test:200 assertTrue actual', restored.service.seriesState() === undefined)).assertTrue();
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0005 SeriesNativeQa.test:201 assertEqual actual', restored.service.ledgerRecords().map((record: ExperimentRecord): string => record.id).join(',')))
          .assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0005 SeriesNativeQa.test:201 assertEqual expected', priorIds));
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0005 SeriesNativeQa.test:203 assertTrue actual', restored.service.ledgerRecords().every((record: ExperimentRecord): boolean => record.complete())))
          .assertTrue();
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0005 SeriesNativeQa.test:205 assertEqual actual', f.raw())).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0005 SeriesNativeQa.test:205 assertEqual expected', broken));
        const next: SeriesStartResult = restored.service.startExperimentSeries('W-TEXT', 'control', 1);
        await restored.service.whenSeriesFinished(next.ownerId);
        const nextId: string = requiredNativeSeries(restored.service).recordIds[0];
        const cold: SeriesNativeSession = await f.reopen();
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0005 SeriesNativeQa.test:210 assertEqual actual', cold.service.ledgerRecords().map((record: ExperimentRecord): string => record.id).join(',')))
          .assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0005 SeriesNativeQa.test:210 assertEqual expected', `${nextId},${priorIds}`));
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0005 SeriesNativeQa.test:212 assertEqual actual', requiredNativeSeries(cold.service).recordIds.join(','))).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0005 SeriesNativeQa.test:212 assertEqual expected', nextId));
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0005 SeriesNativeQa.test:213 assertEqual actual', cold.platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0005 SeriesNativeQa.test:213 assertEqual expected', 0));
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
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0006 SeriesNativeQa.test:238 assertEqual actual', reopened.service.ledgerRecords().length)).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0006 SeriesNativeQa.test:238 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0006 SeriesNativeQa.test:239 assertEqual actual', requiredNativeSeries(reopened.service).missingRecordIds.join(','))).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0006 SeriesNativeQa.test:239 assertEqual expected', priorIds));
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0006 SeriesNativeQa.test:240 assertEqual actual', reopened.service.seriesRecords(start.ownerId).length)).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0006 SeriesNativeQa.test:240 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0006 SeriesNativeQa.test:241 assertEqual actual', reopened.service.getState().launches.length)).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0006 SeriesNativeQa.test:241 assertEqual expected', 1));
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0006 SeriesNativeQa.test:242 assertEqual actual', reopened.platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0006 SeriesNativeQa.test:242 assertEqual expected', 0));
        const cold: preferences.Preferences = preferences.getPreferencesSync(f.context, { name: f.namespace });
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0006 SeriesNativeQa.test:244 assertEqual actual', cold.getSync('qa-side-key', ''))).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0006 SeriesNativeQa.test:244 assertEqual expected', '不属于实验账本'));
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
          expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0007 SeriesNativeQa.test:265 assertEqual actual', b.service.ledgerRecords().length)).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0007 SeriesNativeQa.test:265 assertEqual expected', 0));
          const other: SeriesStartResult = b.service.startExperimentSeries('W-TEXT', 'control', 1);
          await b.service.whenSeriesFinished(other.ownerId);
          expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0007 SeriesNativeQa.test:268 assertTrue actual', b.service.seriesRecords(other.ownerId)[0].complete())).assertTrue();
          expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0007 SeriesNativeQa.test:269 assertFalse actual', other.ownerId === start.ownerId)).assertFalse();
          b.service.clearLedger();
          await b.service.whenSaved();
          expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0007 SeriesNativeQa.test:272 assertEqual actual', left.raw())).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0007 SeriesNativeQa.test:272 assertEqual expected', raw));
        });
        const reopened: SeriesNativeSession = await left.reopen();
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0007 SeriesNativeQa.test:275 assertEqual actual', reopened.service.seriesRecords(start.ownerId)[0].id)).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0007 SeriesNativeQa.test:275 assertEqual expected', firstId));
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0007 SeriesNativeQa.test:276 assertTrue actual', reopened.service.seriesRecords(start.ownerId)[0].complete())).assertTrue();
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0007 SeriesNativeQa.test:277 assertEqual actual', left.raw())).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0007 SeriesNativeQa.test:277 assertEqual expected', raw));
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
        document.snapFlag = 'enabled';
        document.snapAt = Date.now();
        await new NativeStateStore(f.context, f.namespace).write(JSON.stringify(document));
        await preferences.removePreferencesFromCache(f.context, f.namespace);
        const reopened: SeriesNativeSession = f.open();
        expect(traceParameter(
          'com.samples.appperformance_SeriesNativeQa_0008 ' +
            'SeriesNativeQa.test:306 assertEqual actual',
          reopened.service.getState().snapFlag))
          .assertEqual(traceParameter(
            'com.samples.appperformance_SeriesNativeQa_0008 ' +
              'SeriesNativeQa.test:306 assertEqual expected',
            'enabled'));
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0008 SeriesNativeQa.test:307 assertEqual actual', reopened.service.seriesRecords(start.ownerId)[0].id)).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0008 SeriesNativeQa.test:307 assertEqual expected', firstId));
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0008 SeriesNativeQa.test:308 assertEqual actual', reopened.platform.snapCalls.length)).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0008 SeriesNativeQa.test:308 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0008 SeriesNativeQa.test:309 assertEqual actual', reopened.platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0008 SeriesNativeQa.test:309 assertEqual expected', 0));
        const cold: preferences.Preferences = preferences.getPreferencesSync(f.context, { name: f.namespace });
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0008 SeriesNativeQa.test:311 assertEqual actual', cold.getSync('qa-private-sentinel', ''))).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0008 SeriesNativeQa.test:311 assertEqual expected', '不随state替换'));
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
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0009 SeriesNativeQa.test:332 assertEqual actual', rejected.service.getState().storageMessage)).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0009 SeriesNativeQa.test:332 assertEqual expected', '存储读取失败'));
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0009 SeriesNativeQa.test:333 assertEqual actual', rejected.store.writes)).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0009 SeriesNativeQa.test:333 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0009 SeriesNativeQa.test:334 assertEqual actual', f.raw())).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0009 SeriesNativeQa.test:334 assertEqual expected', malformed));
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0009 SeriesNativeQa.test:335 assertEqual actual', rejected.platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0009 SeriesNativeQa.test:335 assertEqual expected', 0));
        await f.seed(good);
        const repaired: SeriesNativeSession = f.open();
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0009 SeriesNativeQa.test:338 assertTrue actual', repaired.service.seriesRecords(start.ownerId)[0].complete())).assertTrue();
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0009 SeriesNativeQa.test:339 assertEqual actual', requiredNativeSeries(repaired.service).phase)).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0009 SeriesNativeQa.test:339 assertEqual expected', SeriesPhase.COMPLETED));
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
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0010 SeriesNativeQa.test:364 assertTrue actual', accepted[0])).assertTrue();
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0010 SeriesNativeQa.test:365 assertEqual actual', source.platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0010 SeriesNativeQa.test:365 assertEqual expected', 2));
        const firstId: string = source.service.seriesRecords(start.ownerId)[0].id;
        const reopened: SeriesNativeSession = await f.reopen();
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0010 SeriesNativeQa.test:368 assertEqual actual', requiredNativeSeries(reopened.service).phase)).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0010 SeriesNativeQa.test:368 assertEqual expected', SeriesPhase.STOPPED));
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0010 SeriesNativeQa.test:369 assertEqual actual', reopened.service.seriesRecords(start.ownerId)
          .map((record: ExperimentRecord): string => record.id).join(','))).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0010 SeriesNativeQa.test:369 assertEqual expected', firstId));
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0010 SeriesNativeQa.test:371 assertEqual actual', reopened.platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0010 SeriesNativeQa.test:371 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0010 SeriesNativeQa.test:372 assertTrue actual', requiredNativeSeries(reopened.service).stopRequested)).assertTrue();
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
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0011 SeriesNativeQa.test:397 assertTrue actual', cancelled[0])).assertTrue();
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0011 SeriesNativeQa.test:398 assertEqual actual', source.platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0011 SeriesNativeQa.test:398 assertEqual expected', 0));
        const reopened: SeriesNativeSession = await f.reopen();
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0011 SeriesNativeQa.test:400 assertEqual actual', requiredNativeSeries(reopened.service).phase)).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0011 SeriesNativeQa.test:400 assertEqual expected', SeriesPhase.CANCELLED));
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0011 SeriesNativeQa.test:401 assertEqual actual', reopened.service.ledgerRecords().length)).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0011 SeriesNativeQa.test:401 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0011 SeriesNativeQa.test:402 assertFalse actual', reopened.service.isExperimentBusy())).assertFalse();
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0011 SeriesNativeQa.test:403 assertEqual actual', requiredNativeSeries(reopened.service).startedCount)).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0011 SeriesNativeQa.test:403 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0011 SeriesNativeQa.test:404 assertEqual actual', reopened.store.writes)).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0011 SeriesNativeQa.test:404 assertEqual expected', 0));
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
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0012 SeriesNativeQa.test:426 assertFalse actual', current.ownerId === prior.ownerId)).assertFalse();
        const currentId: string = requiredNativeSeries(next.service).recordIds[0];
        const reopened: SeriesNativeSession = await f.reopen();
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0012 SeriesNativeQa.test:429 assertEqual actual', requiredNativeSeries(reopened.service).recordIds.join(','))).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0012 SeriesNativeQa.test:429 assertEqual expected', currentId));
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0012 SeriesNativeQa.test:430 assertEqual actual', requiredNativeSeries(reopened.service).baselineRecordId)).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0012 SeriesNativeQa.test:430 assertEqual expected', currentId));
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0012 SeriesNativeQa.test:431 assertEqual actual', reopened.service.ledgerRecords().map((record: ExperimentRecord): string => record.id).join(',')))
          .assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0012 SeriesNativeQa.test:431 assertEqual expected', `${currentId},${priorIds}`));
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0012 SeriesNativeQa.test:433 assertEqual actual', reopened.service.seriesRecords(prior.ownerId).length)).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0012 SeriesNativeQa.test:433 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0012 SeriesNativeQa.test:434 assertTrue actual', reopened.service.seriesRecords(current.ownerId)[0].complete())).assertTrue();
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0012 SeriesNativeQa.test:435 assertEqual actual', reopened.platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0012 SeriesNativeQa.test:435 assertEqual expected', 0));
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
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0013 SeriesNativeQa.test:468 assertEqual actual', source.platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0013 SeriesNativeQa.test:468 assertEqual expected', (LEDGER_LIMIT + 1) * 2));
        const reopened: SeriesNativeSession = await f.reopen();
        const records: ExperimentRecord[] = reopened.service.ledgerRecords();
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0013 SeriesNativeQa.test:471 assertEqual actual', records.length)).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0013 SeriesNativeQa.test:471 assertEqual expected', LEDGER_LIMIT));
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0013 SeriesNativeQa.test:472 assertEqual actual', records[0].id)).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0013 SeriesNativeQa.test:472 assertEqual expected', actualIds[actualIds.length - 1]));
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0013 SeriesNativeQa.test:473 assertEqual actual', records[records.length - 1].id)).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0013 SeriesNativeQa.test:473 assertEqual expected', actualIds[1]));
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0013 SeriesNativeQa.test:474 assertFalse actual', records.some((record: ExperimentRecord): boolean => record.id === actualIds[0]))).assertFalse();
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0013 SeriesNativeQa.test:475 assertEqual actual', requiredNativeSeries(reopened.service).recordIds.join(','))).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0013 SeriesNativeQa.test:475 assertEqual expected', lastSeriesIds));
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0013 SeriesNativeQa.test:476 assertTrue actual', records.every((record: ExperimentRecord): boolean => record.complete()))).assertTrue();
        expect(traceParameter('com.samples.appperformance_SeriesNativeQa_0013 SeriesNativeQa.test:477 assertEqual actual', reopened.platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_SeriesNativeQa_0013 SeriesNativeQa.test:477 assertEqual expected', 0));
      });
    });
  });
}
