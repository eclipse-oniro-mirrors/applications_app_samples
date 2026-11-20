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
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { contextMessage } from '../../../main/ets/core/TextMessages';
import { describe, expect } from '@ohos/hypium';
import { UiTestSession, uiCase } from '../support/UiTestRuntime';
import { SERIES_MIN_REPETITIONS, SERIES_MAX_REPETITIONS } from '../../../main/ets/core/ExperimentSeries';
import { currentSeriesUiQa, launchSeriesUiQa, seriesQaClick,
  seriesQaNode, seriesQaText, seriesQaUntil } from '../support/SeriesUiQaSupport';

export default function seriesUiQaTests(): void {
  describe('SeriesUiQa', (): void => {

    /**
     * @tc.number SUB_PERFORMANCE_SERIESUIQA_0100
     * @tc.name testSeriesUiQa0001
     * @tc.desc Untouched production panel exposes its actual empty state and gates actions without samples.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    uiCase('testSeriesUiQa0001', 0, async (session: UiTestSession): Promise<void> => {
      const driver = await launchSeriesUiQa(session, 'empty');
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0001 SeriesUiQa.test:39 assertEqual actual', await seriesQaText(driver, 'apSeriesProgress'))).assertEqual(traceParameter('com.samples.appperformance_SeriesUiQa_0001 SeriesUiQa.test:39 assertEqual expected', '尚未开始系列'));
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0001 SeriesUiQa.test:40 assertTrue actual', await (await seriesQaNode(driver, 'apSeriesStart')).isEnabled())).assertTrue();
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0001 SeriesUiQa.test:41 assertFalse actual', await (await seriesQaNode(driver, 'apSeriesStopAfter')).isEnabled())).assertFalse();
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0001 SeriesUiQa.test:42 assertFalse actual', await (await seriesQaNode(driver, 'apSeriesCopyReport')).isEnabled())).assertFalse();
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0001 SeriesUiQa.test:43 assertEqual actual', currentSeriesUiQa(session).platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_SeriesUiQa_0001 SeriesUiQa.test:43 assertEqual expected', 0));
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIESUIQA_0200
     * @tc.name testSeriesUiQa0002
     * @tc.desc Count controls reach both production bounds without disabling an otherwise valid start.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    uiCase('testSeriesUiQa0002', 0, async (session: UiTestSession): Promise<void> => {
      const driver = await launchSeriesUiQa(session, 'empty');
      await seriesQaClick(driver, 'apSeriesCountMinus');
      await seriesQaClick(driver, 'apSeriesCountMinus');
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0002 SeriesUiQa.test:58 assertEqual actual', await seriesQaText(driver, 'apSeriesCountValue'))).assertEqual(traceParameter('com.samples.appperformance_SeriesUiQa_0002 SeriesUiQa.test:58 assertEqual expected', contextMessage(abilityDelegatorRegistry.getAbilityDelegator().getAppContext(),
        'ap_series_repetition_count', [SERIES_MIN_REPETITIONS])));
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0002 SeriesUiQa.test:60 assertFalse actual', await (await seriesQaNode(driver, 'apSeriesCountMinus')).isEnabled())).assertFalse();
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0002 SeriesUiQa.test:61 assertTrue actual', await (await seriesQaNode(driver, 'apSeriesStart')).isEnabled())).assertTrue();
      for (let index: number = 0; index < SERIES_MAX_REPETITIONS - SERIES_MIN_REPETITIONS; index++) {
        await seriesQaClick(driver, 'apSeriesCountPlus');
      }
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0002 SeriesUiQa.test:65 assertEqual actual', await seriesQaText(driver, 'apSeriesCountValue'))).assertEqual(traceParameter('com.samples.appperformance_SeriesUiQa_0002 SeriesUiQa.test:65 assertEqual expected', contextMessage(abilityDelegatorRegistry.getAbilityDelegator().getAppContext(),
        'ap_series_repetition_count', [SERIES_MAX_REPETITIONS])));
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0002 SeriesUiQa.test:67 assertFalse actual', await (await seriesQaNode(driver, 'apSeriesCountPlus')).isEnabled())).assertFalse();
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0002 SeriesUiQa.test:68 assertEqual actual', currentSeriesUiQa(session).platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_SeriesUiQa_0002 SeriesUiQa.test:68 assertEqual expected', 0));
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIESUIQA_0300
     * @tc.name testSeriesUiQa0003
     * @tc.desc A real resource-read suspension freezes configuration while leaving stop and cancellation available.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    uiCase('testSeriesUiQa0003', 0, async (session: UiTestSession): Promise<void> => {
      const driver = await launchSeriesUiQa(session, 'pending');
      await seriesQaClick(driver, 'apSeriesStart');
      const fixture = currentSeriesUiQa(session);
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0003 SeriesUiQa.test:83 assertFalse actual', await (await seriesQaNode(driver, 'apSeriesStart')).isEnabled())).assertFalse();
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0003 SeriesUiQa.test:84 assertFalse actual', await (await seriesQaNode(driver, 'apSeriesCountPlus')).isEnabled())).assertFalse();
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0003 SeriesUiQa.test:85 assertTrue actual', await (await seriesQaNode(driver, 'apSeriesStopAfter')).isEnabled())).assertTrue();
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0003 SeriesUiQa.test:86 assertTrue actual', await (await seriesQaNode(driver, 'apSeriesCancelNow')).isEnabled())).assertTrue();
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0003 SeriesUiQa.test:87 assertEqual actual', fixture.platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_SeriesUiQa_0003 SeriesUiQa.test:87 assertEqual expected', 1));
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0003 SeriesUiQa.test:88 assertEqual actual', fixture.service.seriesRecords(fixture.ownerId).length)).assertEqual(traceParameter('com.samples.appperformance_SeriesUiQa_0003 SeriesUiQa.test:88 assertEqual expected', 0));
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIESUIQA_0400
     * @tc.name testSeriesUiQa0004
     * @tc.desc Stop-after-current acknowledges the pending iteration and never schedules the other two iterations.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    uiCase('testSeriesUiQa0004', 0, async (session: UiTestSession): Promise<void> => {
      const driver = await launchSeriesUiQa(session, 'pending');
      await seriesQaClick(driver, 'apSeriesStart');
      await seriesQaClick(driver, 'apSeriesStopAfter');
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0004 SeriesUiQa.test:103 assertEqual actual', await seriesQaText(driver, 'apSeriesPhase'))).assertEqual(traceParameter('com.samples.appperformance_SeriesUiQa_0004 SeriesUiQa.test:103 assertEqual expected', '等待本次完成后停止'));
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0004 SeriesUiQa.test:104 assertFalse actual', await (await seriesQaNode(driver, 'apSeriesStopAfter')).isEnabled())).assertFalse();
      const fixture = currentSeriesUiQa(session);
      fixture.releaseRead();
      await session.guard(fixture.service.whenSeriesFinished(fixture.ownerId));
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0004 SeriesUiQa.test:108 assertEqual actual', await seriesQaText(driver, 'apSeriesPhase'))).assertEqual(traceParameter('com.samples.appperformance_SeriesUiQa_0004 SeriesUiQa.test:108 assertEqual expected', '已停止'));
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0004 SeriesUiQa.test:109 assertEqual actual', fixture.service.seriesRecords(fixture.ownerId).length)).assertEqual(traceParameter('com.samples.appperformance_SeriesUiQa_0004 SeriesUiQa.test:109 assertEqual expected', 1));
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0004 SeriesUiQa.test:110 assertTrue actual', await (await seriesQaNode(driver, 'apSeriesStart')).isEnabled())).assertTrue();
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0004 SeriesUiQa.test:111 assertTrue actual', (await seriesQaText(driver, 'apSeriesProgress')).indexOf('未执行 2') >= 0)).assertTrue();
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIESUIQA_0500
     * @tc.name testSeriesUiQa0005
     * @tc.desc Three actual production runs complete and the panel exposes only their saved record references.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    uiCase('testSeriesUiQa0005', 0, async (session: UiTestSession): Promise<void> => {
      const driver = await launchSeriesUiQa(session, 'complete');
      await seriesQaClick(driver, 'apSeriesStart');
      const fixture = currentSeriesUiQa(session);
      await session.guard(fixture.service.whenSeriesFinished(fixture.ownerId));
      await session.guard(fixture.service.whenSaved());
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0005 SeriesUiQa.test:128 assertEqual actual', await seriesQaText(driver, 'apSeriesPhase'))).assertEqual(traceParameter('com.samples.appperformance_SeriesUiQa_0005 SeriesUiQa.test:128 assertEqual expected', '已完成'));
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0005 SeriesUiQa.test:129 assertEqual actual', await seriesQaText(driver, 'apSeriesSaveState'))).assertEqual(traceParameter('com.samples.appperformance_SeriesUiQa_0005 SeriesUiQa.test:129 assertEqual expected', '已保存'));
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0005 SeriesUiQa.test:130 assertEqual actual', await seriesQaText(driver, 'apSeriesReferences'))).assertEqual(traceParameter('com.samples.appperformance_SeriesUiQa_0005 SeriesUiQa.test:130 assertEqual expected', '可用 3 / 3 条，缺失 0 条'));
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0005 SeriesUiQa.test:131 assertTrue actual', fixture.service.seriesRecords(fixture.ownerId).every((record): boolean => record.complete()))).assertTrue();
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0005 SeriesUiQa.test:132 assertTrue actual', await (await seriesQaNode(driver, 'apSeriesCopyReport')).isEnabled())).assertTrue();
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIESUIQA_0600
     * @tc.name testSeriesUiQa0006
     * @tc.desc A resource failure is rendered as a terminal failed series without retrying or claiming valid samples.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    uiCase('testSeriesUiQa0006', 0, async (session: UiTestSession): Promise<void> => {
      const driver = await launchSeriesUiQa(session, 'resourceFailure');
      await seriesQaClick(driver, 'apSeriesStart');
      const fixture = currentSeriesUiQa(session);
      await session.guard(fixture.service.whenSeriesFinished(fixture.ownerId));
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0006 SeriesUiQa.test:148 assertEqual actual', await seriesQaText(driver, 'apSeriesPhase'))).assertEqual(traceParameter('com.samples.appperformance_SeriesUiQa_0006 SeriesUiQa.test:148 assertEqual expected', '实验失败，已停止'));
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0006 SeriesUiQa.test:149 assertEqual actual', fixture.platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_SeriesUiQa_0006 SeriesUiQa.test:149 assertEqual expected', 1));
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0006 SeriesUiQa.test:150 assertEqual actual', fixture.service.seriesRecords(fixture.ownerId).filter((record): boolean => record.complete()).length))
        .assertEqual(traceParameter('com.samples.appperformance_SeriesUiQa_0006 SeriesUiQa.test:150 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0006 SeriesUiQa.test:152 assertFalse actual', await (await seriesQaNode(driver, 'apSeriesCancelNow')).isEnabled())).assertFalse();
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0006 SeriesUiQa.test:153 assertTrue actual', await (await seriesQaNode(driver, 'apSeriesStart')).isEnabled())).assertTrue();
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIESUIQA_0700
     * @tc.name testSeriesUiQa0007
     * @tc.desc Cancelling local waiting renders SDK quarantine and cannot re-enable start
     * until the original resource promise settles.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    uiCase('testSeriesUiQa0007', 0, async (session: UiTestSession): Promise<void> => {
      const driver = await launchSeriesUiQa(session, 'pending');
      await seriesQaClick(driver, 'apSeriesStart');
      await seriesQaClick(driver, 'apSeriesCancelNow');
      const fixture = currentSeriesUiQa(session);
      await session.guard(fixture.service.whenSeriesFinished(fixture.ownerId));
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0007 SeriesUiQa.test:171 assertEqual actual', await seriesQaText(driver, 'apSeriesPhase'))).assertEqual(traceParameter('com.samples.appperformance_SeriesUiQa_0007 SeriesUiQa.test:171 assertEqual expected', '已取消'));
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0007 SeriesUiQa.test:172 assertEqual actual', await seriesQaText(driver, 'apSeriesSdkIsolation'))).assertEqual(traceParameter('com.samples.appperformance_SeriesUiQa_0007 SeriesUiQa.test:172 assertEqual expected', 'SDK尚未settle，继续隔离；不会自动重发'));
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0007 SeriesUiQa.test:173 assertFalse actual', await (await seriesQaNode(driver, 'apSeriesStart')).isEnabled())).assertFalse();
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0007 SeriesUiQa.test:174 assertEqual actual', fixture.platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_SeriesUiQa_0007 SeriesUiQa.test:174 assertEqual expected', 1));
      fixture.releaseRead();
      await seriesQaUntil(fixture, (): boolean => !fixture.service.isExperimentBusy());
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0007 SeriesUiQa.test:177 assertTrue actual', await (await seriesQaNode(driver, 'apSeriesStart')).isEnabled())).assertTrue();
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0007 SeriesUiQa.test:178 assertEqual actual', fixture.service.seriesRecords(fixture.ownerId).filter((record): boolean => record.complete()).length))
        .assertEqual(traceParameter('com.samples.appperformance_SeriesUiQa_0007 SeriesUiQa.test:178 assertEqual expected', 0));
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIESUIQA_0800
     * @tc.name testSeriesUiQa0008
     * @tc.desc A failed initial plan save renders a terminal storage failure
     * before any actual workload read or fabricated result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    uiCase('testSeriesUiQa0008', 0, async (session: UiTestSession): Promise<void> => {
      const driver = await launchSeriesUiQa(session, 'saveFailure');
      await seriesQaClick(driver, 'apSeriesStart');
      const fixture = currentSeriesUiQa(session);
      await session.guard(fixture.service.whenSeriesFinished(fixture.ownerId));
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0008 SeriesUiQa.test:196 assertEqual actual', await seriesQaText(driver, 'apSeriesPhase'))).assertEqual(traceParameter('com.samples.appperformance_SeriesUiQa_0008 SeriesUiQa.test:196 assertEqual expected', '保存失败，已停止'));
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0008 SeriesUiQa.test:197 assertEqual actual', await seriesQaText(driver, 'apSeriesSaveState'))).assertEqual(traceParameter('com.samples.appperformance_SeriesUiQa_0008 SeriesUiQa.test:197 assertEqual expected', '保存失败，当前结果仅在内存保留'));
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0008 SeriesUiQa.test:198 assertEqual actual', fixture.platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_SeriesUiQa_0008 SeriesUiQa.test:198 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0008 SeriesUiQa.test:199 assertFalse actual', await (await seriesQaNode(driver, 'apSeriesCopyReport')).isEnabled())).assertFalse();
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0008 SeriesUiQa.test:200 assertFalse actual', await (await seriesQaNode(driver, 'apSeriesCancelNow')).isEnabled())).assertFalse();
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIESUIQA_0900
     * @tc.name testSeriesUiQa0009
     * @tc.desc A real second-iteration resource identity change stops the series
     * and the panel does not claim the third iteration ran.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    uiCase('testSeriesUiQa0009', 0, async (session: UiTestSession): Promise<void> => {
      const driver = await launchSeriesUiQa(session, 'conditionChange');
      await seriesQaClick(driver, 'apSeriesStart');
      const fixture = currentSeriesUiQa(session);
      await seriesQaUntil(fixture, (): boolean => fixture.platform.resourceCalls === 3);
      fixture.platform.resource = new Uint8Array([68, 69, 70]);
      fixture.releaseRead();
      await session.guard(fixture.service.whenSeriesFinished(fixture.ownerId));
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0009 SeriesUiQa.test:220 assertEqual actual', await seriesQaText(driver, 'apSeriesPhase'))).assertEqual(traceParameter('com.samples.appperformance_SeriesUiQa_0009 SeriesUiQa.test:220 assertEqual expected', '条件变化，已停止'));
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0009 SeriesUiQa.test:221 assertEqual actual', fixture.service.seriesRecords(fixture.ownerId).length)).assertEqual(traceParameter('com.samples.appperformance_SeriesUiQa_0009 SeriesUiQa.test:221 assertEqual expected', 2));
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0009 SeriesUiQa.test:222 assertTrue actual', (await seriesQaText(driver, 'apSeriesProgress')).indexOf('未执行 1') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0009 SeriesUiQa.test:223 assertEqual actual', fixture.platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_SeriesUiQa_0009 SeriesUiQa.test:223 assertEqual expected', 4));
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0009 SeriesUiQa.test:224 assertFalse actual', await (await seriesQaNode(driver, 'apSeriesStopAfter')).isEnabled())).assertFalse();
    });

    /**
     * @tc.number SUB_PERFORMANCE_SERIESUIQA_1000
     * @tc.name testSeriesUiQa0010
     * @tc.desc The actual copy button invokes the production series exporter
     * into an isolated clipboard port, preserving the ledger.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    uiCase('testSeriesUiQa0010', 0, async (session: UiTestSession): Promise<void> => {
      const driver = await launchSeriesUiQa(session, 'complete');
      await seriesQaClick(driver, 'apSeriesStart');
      const fixture = currentSeriesUiQa(session);
      await session.guard(fixture.service.whenSeriesFinished(fixture.ownerId));
      const ids = fixture.service.seriesRecords(fixture.ownerId).map((record): string => record.id).join(',');
      await seriesQaClick(driver, 'apSeriesCopyReport');
      await seriesQaUntil(fixture, (): boolean => fixture.service.getState().notice === '已复制本系列分析报告（Markdown）');
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0010 SeriesUiQa.test:244 assertEqual actual', fixture.platform.copiedTexts.length)).assertEqual(traceParameter('com.samples.appperformance_SeriesUiQa_0010 SeriesUiQa.test:244 assertEqual expected', 1));
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0010 SeriesUiQa.test:245 assertTrue actual', fixture.platform.copiedTexts[0].indexOf('真实重复实验系列报告') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0010 SeriesUiQa.test:246 assertEqual actual', fixture.service.seriesRecords(fixture.ownerId).map((record): string => record.id).join(',')))
        .assertEqual(traceParameter('com.samples.appperformance_SeriesUiQa_0010 SeriesUiQa.test:246 assertEqual expected', ids));
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0010 SeriesUiQa.test:248 assertEqual actual', await seriesQaText(driver, 'apSeriesReferences'))).assertEqual(traceParameter('com.samples.appperformance_SeriesUiQa_0010 SeriesUiQa.test:248 assertEqual expected', '可用 3 / 3 条，缺失 0 条'));
      expect(traceParameter('com.samples.appperformance_SeriesUiQa_0010 SeriesUiQa.test:249 assertTrue actual', await (await seriesQaNode(driver, 'apSeriesStart')).isEnabled())).assertTrue();
    });
  });
}
