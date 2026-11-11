// 待集中验证：当前仅静态对齐正式组件/SDK，未执行本套件或任何中间门禁。
import { afterEach, describe, expect, it } from '@ohos/hypium';
import { SERIES_MIN_REPETITIONS, SERIES_MAX_REPETITIONS } from '../../../main/ets/core/ExperimentSeries';
import { uiTestCase } from '../support/UiTestSupport';
import { currentSeriesUiQa, finishSeriesUiQa, launchSeriesUiQa, seriesQaClick,
  seriesQaNode, seriesQaText, seriesQaUntil } from '../support/SeriesUiQaSupport';

export default function seriesUiQaTests(): void {
  describe('SeriesUiQa', (): void => {
    afterEach(async (): Promise<void> => { await finishSeriesUiQa(); });

    /**
     * @tc.number SUB_PERFORMANCE_SERIESUIQA_0100
     * @tc.name testSeriesUiQa0001
     * @tc.desc Untouched production panel exposes its actual empty state and gates actions without samples.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSeriesUiQa0001', 0, uiTestCase(async (): Promise<void> => {
      const driver = await launchSeriesUiQa('empty');
      expect(await seriesQaText(driver, 'apSeriesProgress')).assertEqual('尚未开始系列');
      expect(await (await seriesQaNode(driver, 'apSeriesStart')).isEnabled()).assertTrue();
      expect(await (await seriesQaNode(driver, 'apSeriesStopAfter')).isEnabled()).assertFalse();
      expect(await (await seriesQaNode(driver, 'apSeriesCopyReport')).isEnabled()).assertFalse();
      expect(currentSeriesUiQa().platform.resourceCalls).assertEqual(0);
    }, finishSeriesUiQa));

    /**
     * @tc.number SUB_PERFORMANCE_SERIESUIQA_0200
     * @tc.name testSeriesUiQa0002
     * @tc.desc Count controls reach both production bounds without disabling an otherwise valid start.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSeriesUiQa0002', 0, uiTestCase(async (): Promise<void> => {
      const driver = await launchSeriesUiQa('empty');
      await seriesQaClick(driver, 'apSeriesCountMinus');
      await seriesQaClick(driver, 'apSeriesCountMinus');
      expect(await seriesQaText(driver, 'apSeriesCountValue')).assertEqual(`重复次数 ${SERIES_MIN_REPETITIONS}`);
      expect(await (await seriesQaNode(driver, 'apSeriesCountMinus')).isEnabled()).assertFalse();
      expect(await (await seriesQaNode(driver, 'apSeriesStart')).isEnabled()).assertTrue();
      for (let index: number = 0; index < SERIES_MAX_REPETITIONS - SERIES_MIN_REPETITIONS; index++) {
        await seriesQaClick(driver, 'apSeriesCountPlus');
      }
      expect(await seriesQaText(driver, 'apSeriesCountValue')).assertEqual(`重复次数 ${SERIES_MAX_REPETITIONS}`);
      expect(await (await seriesQaNode(driver, 'apSeriesCountPlus')).isEnabled()).assertFalse();
      expect(currentSeriesUiQa().platform.resourceCalls).assertEqual(0);
    }, finishSeriesUiQa));

    /**
     * @tc.number SUB_PERFORMANCE_SERIESUIQA_0300
     * @tc.name testSeriesUiQa0003
     * @tc.desc A real resource-read suspension freezes configuration while leaving stop and cancellation available.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSeriesUiQa0003', 0, uiTestCase(async (): Promise<void> => {
      const driver = await launchSeriesUiQa('pending');
      await seriesQaClick(driver, 'apSeriesStart');
      const fixture = currentSeriesUiQa();
      expect(await (await seriesQaNode(driver, 'apSeriesStart')).isEnabled()).assertFalse();
      expect(await (await seriesQaNode(driver, 'apSeriesCountPlus')).isEnabled()).assertFalse();
      expect(await (await seriesQaNode(driver, 'apSeriesStopAfter')).isEnabled()).assertTrue();
      expect(await (await seriesQaNode(driver, 'apSeriesCancelNow')).isEnabled()).assertTrue();
      expect(fixture.platform.resourceCalls).assertEqual(1);
      expect(fixture.service.seriesRecords(fixture.ownerId).length).assertEqual(0);
    }, finishSeriesUiQa));

    /**
     * @tc.number SUB_PERFORMANCE_SERIESUIQA_0400
     * @tc.name testSeriesUiQa0004
     * @tc.desc Stop-after-current acknowledges the pending iteration and never schedules the other two iterations.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSeriesUiQa0004', 0, uiTestCase(async (): Promise<void> => {
      const driver = await launchSeriesUiQa('pending');
      await seriesQaClick(driver, 'apSeriesStart');
      await seriesQaClick(driver, 'apSeriesStopAfter');
      expect(await seriesQaText(driver, 'apSeriesPhase')).assertEqual('等待本次完成后停止');
      expect(await (await seriesQaNode(driver, 'apSeriesStopAfter')).isEnabled()).assertFalse();
      const fixture = currentSeriesUiQa();
      fixture.releaseRead();
      await fixture.service.whenSeriesFinished(fixture.ownerId);
      expect(await seriesQaText(driver, 'apSeriesPhase')).assertEqual('已停止');
      expect(fixture.service.seriesRecords(fixture.ownerId).length).assertEqual(1);
      expect(await (await seriesQaNode(driver, 'apSeriesStart')).isEnabled()).assertTrue();
      expect((await seriesQaText(driver, 'apSeriesProgress')).indexOf('未执行 2') >= 0).assertTrue();
    }, finishSeriesUiQa));

    /**
     * @tc.number SUB_PERFORMANCE_SERIESUIQA_0500
     * @tc.name testSeriesUiQa0005
     * @tc.desc Three actual production runs complete and the panel exposes only their saved record references.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSeriesUiQa0005', 0, uiTestCase(async (): Promise<void> => {
      const driver = await launchSeriesUiQa('complete');
      await seriesQaClick(driver, 'apSeriesStart');
      const fixture = currentSeriesUiQa();
      await fixture.service.whenSeriesFinished(fixture.ownerId);
      await fixture.service.whenSaved();
      expect(await seriesQaText(driver, 'apSeriesPhase')).assertEqual('已完成');
      expect(await seriesQaText(driver, 'apSeriesSaveState')).assertEqual('已保存');
      expect(await seriesQaText(driver, 'apSeriesReferences')).assertEqual('可用 3 / 3 条，缺失 0 条');
      expect(fixture.service.seriesRecords(fixture.ownerId).every((record): boolean => record.complete())).assertTrue();
      expect(await (await seriesQaNode(driver, 'apSeriesCopyReport')).isEnabled()).assertTrue();
    }, finishSeriesUiQa));

    /**
     * @tc.number SUB_PERFORMANCE_SERIESUIQA_0600
     * @tc.name testSeriesUiQa0006
     * @tc.desc A resource failure is rendered as a terminal failed series without retrying or claiming valid samples.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSeriesUiQa0006', 0, uiTestCase(async (): Promise<void> => {
      const driver = await launchSeriesUiQa('resourceFailure');
      await seriesQaClick(driver, 'apSeriesStart');
      const fixture = currentSeriesUiQa();
      await fixture.service.whenSeriesFinished(fixture.ownerId);
      expect(await seriesQaText(driver, 'apSeriesPhase')).assertEqual('实验失败，已停止');
      expect(fixture.platform.resourceCalls).assertEqual(1);
      expect(fixture.service.seriesRecords(fixture.ownerId).filter((record): boolean => record.complete()).length)
        .assertEqual(0);
      expect(await (await seriesQaNode(driver, 'apSeriesCancelNow')).isEnabled()).assertFalse();
      expect(await (await seriesQaNode(driver, 'apSeriesStart')).isEnabled()).assertTrue();
    }, finishSeriesUiQa));

    /**
     * @tc.number SUB_PERFORMANCE_SERIESUIQA_0700
     * @tc.name testSeriesUiQa0007
     * @tc.desc Cancelling local waiting renders SDK quarantine and cannot re-enable start
     * until the original resource promise settles.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSeriesUiQa0007', 0, uiTestCase(async (): Promise<void> => {
      const driver = await launchSeriesUiQa('pending');
      await seriesQaClick(driver, 'apSeriesStart');
      await seriesQaClick(driver, 'apSeriesCancelNow');
      const fixture = currentSeriesUiQa();
      await fixture.service.whenSeriesFinished(fixture.ownerId);
      expect(await seriesQaText(driver, 'apSeriesPhase')).assertEqual('已取消');
      expect(await seriesQaText(driver, 'apSeriesSdkIsolation')).assertEqual('SDK尚未settle，继续隔离；不会自动重发');
      expect(await (await seriesQaNode(driver, 'apSeriesStart')).isEnabled()).assertFalse();
      expect(fixture.platform.resourceCalls).assertEqual(1);
      fixture.releaseRead();
      await seriesQaUntil(fixture, (): boolean => !fixture.service.isExperimentBusy());
      expect(await (await seriesQaNode(driver, 'apSeriesStart')).isEnabled()).assertTrue();
      expect(fixture.service.seriesRecords(fixture.ownerId).filter((record): boolean => record.complete()).length)
        .assertEqual(0);
    }, finishSeriesUiQa));

    /**
     * @tc.number SUB_PERFORMANCE_SERIESUIQA_0800
     * @tc.name testSeriesUiQa0008
     * @tc.desc A failed initial plan save renders a terminal storage failure
     * before any actual workload read or fabricated result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSeriesUiQa0008', 0, uiTestCase(async (): Promise<void> => {
      const driver = await launchSeriesUiQa('saveFailure');
      await seriesQaClick(driver, 'apSeriesStart');
      const fixture = currentSeriesUiQa();
      await fixture.service.whenSeriesFinished(fixture.ownerId);
      expect(await seriesQaText(driver, 'apSeriesPhase')).assertEqual('保存失败，已停止');
      expect(await seriesQaText(driver, 'apSeriesSaveState')).assertEqual('保存失败，当前结果仅在内存保留');
      expect(fixture.platform.resourceCalls).assertEqual(0);
      expect(await (await seriesQaNode(driver, 'apSeriesCopyReport')).isEnabled()).assertFalse();
      expect(await (await seriesQaNode(driver, 'apSeriesCancelNow')).isEnabled()).assertFalse();
    }, finishSeriesUiQa));

    /**
     * @tc.number SUB_PERFORMANCE_SERIESUIQA_0900
     * @tc.name testSeriesUiQa0009
     * @tc.desc A real second-iteration resource identity change stops the series
     * and the panel does not claim the third iteration ran.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSeriesUiQa0009', 0, uiTestCase(async (): Promise<void> => {
      const driver = await launchSeriesUiQa('conditionChange');
      await seriesQaClick(driver, 'apSeriesStart');
      const fixture = currentSeriesUiQa();
      await seriesQaUntil(fixture, (): boolean => fixture.platform.resourceCalls === 3);
      fixture.platform.resource = new Uint8Array([68, 69, 70]);
      fixture.releaseRead();
      await fixture.service.whenSeriesFinished(fixture.ownerId);
      expect(await seriesQaText(driver, 'apSeriesPhase')).assertEqual('条件变化，已停止');
      expect(fixture.service.seriesRecords(fixture.ownerId).length).assertEqual(2);
      expect((await seriesQaText(driver, 'apSeriesProgress')).indexOf('未执行 1') >= 0).assertTrue();
      expect(fixture.platform.resourceCalls).assertEqual(4);
      expect(await (await seriesQaNode(driver, 'apSeriesStopAfter')).isEnabled()).assertFalse();
    }, finishSeriesUiQa));

    /**
     * @tc.number SUB_PERFORMANCE_SERIESUIQA_1000
     * @tc.name testSeriesUiQa0010
     * @tc.desc The actual copy button invokes the production series exporter
     * into an isolated clipboard port, preserving the ledger.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSeriesUiQa0010', 0, uiTestCase(async (): Promise<void> => {
      const driver = await launchSeriesUiQa('complete');
      await seriesQaClick(driver, 'apSeriesStart');
      const fixture = currentSeriesUiQa();
      await fixture.service.whenSeriesFinished(fixture.ownerId);
      const ids = fixture.service.seriesRecords(fixture.ownerId).map((record): string => record.id).join(',');
      await seriesQaClick(driver, 'apSeriesCopyReport');
      await seriesQaUntil(fixture, (): boolean => fixture.service.getState().notice === '已复制本系列分析报告（Markdown）');
      expect(fixture.platform.copiedTexts.length).assertEqual(1);
      expect(fixture.platform.copiedTexts[0].indexOf('真实重复实验系列报告') >= 0).assertTrue();
      expect(fixture.service.seriesRecords(fixture.ownerId).map((record): string => record.id).join(','))
        .assertEqual(ids);
      expect(await seriesQaText(driver, 'apSeriesReferences')).assertEqual('可用 3 / 3 条，缺失 0 条');
      expect(await (await seriesQaNode(driver, 'apSeriesStart')).isEnabled()).assertTrue();
    }, finishSeriesUiQa));
  });
}
