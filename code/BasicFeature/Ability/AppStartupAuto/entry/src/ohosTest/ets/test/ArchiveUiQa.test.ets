// 待集中验证：当前仅静态对齐正式组件/SDK，未执行本套件或任何中间门禁。
import { afterEach, describe, expect, it } from '@ohos/hypium';
import { ON } from '@kit.TestKit';
import { QueryOutcome, RefreshSource } from '../../../main/ets/autostart/AutoStartupTypes';
import { archiveQaClick, archiveQaInput, archiveQaNode, archiveQaText, currentArchiveUiQa,
  finishArchiveUiQa, launchArchiveUiQa } from '../support/ArchiveUiQaSupport';

export default function archiveUiQaTests(): void {
  describe('ArchiveUiQa', (): void => {
    afterEach(async (): Promise<void> => {
      await finishArchiveUiQa();
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVEUIQA_0100
     * @tc.name testArchiveUiQa0001
     * @tc.desc An empty real archive does not enable save or copy and reports an actual zero-scope summary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArchiveUiQa0001', 0, async (): Promise<void> => {
      const driver = await launchArchiveUiQa('empty');
      expect(await archiveQaText(driver, 'archive-empty')).assertEqual('当前范围没有已保存归档');
      expect(await (await archiveQaNode(driver, 'archive-save')).isEnabled()).assertFalse();
      expect(await (await archiveQaNode(driver, 'archive-copy')).isEnabled()).assertFalse();
      expect(await archiveQaText(driver, 'archive-summary')).assertEqual('范围 0 条｜成功 0｜失败 0｜不支持 0｜超时 0｜未知 0');
      expect(currentArchiveUiQa().storage.writes).assertEqual(0);
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVEUIQA_0200
     * @tc.name testArchiveUiQa0002
     * @tc.desc Actual save remains pending behind I/O and exposes committed-only rows until the write is acknowledged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArchiveUiQa0002', 0, async (): Promise<void> => {
      const driver = await launchArchiveUiQa('pending');
      await archiveQaClick(driver, 'archive-save');
      const fixture = currentArchiveUiQa();
      expect(await archiveQaText(driver, 'archive-notice')).assertEqual('正在处理，尚未确认保存');
      expect(await (await archiveQaNode(driver, 'archive-auto')).isEnabled()).assertFalse();
      expect(fixture.repository.snapshot().rows.length).assertEqual(0);
      fixture.release();
      await fixture.repository.whenIdle();
      expect(await archiveQaText(driver, 'archive-summary')).assertEqual('范围 2 条｜成功 1｜失败 1｜不支持 0｜超时 0｜未知 0');
      expect(fixture.storage.document.rows[1].record.errorMessage).assertEqual('');
      expect(fixture.liveRecords[1].errorMessage).assertEqual('qa-private-error-detail');
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVEUIQA_0300
     * @tc.name testArchiveUiQa0003
     * @tc.desc A known failed save displays failure, keeps the committed archive empty,
     * and allows an explicit retrying save.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArchiveUiQa0003', 0, async (): Promise<void> => {
      const driver = await launchArchiveUiQa('writeFailure');
      await archiveQaClick(driver, 'archive-save');
      const fixture = currentArchiveUiQa();
      await fixture.repository.whenIdle();
      expect(await archiveQaText(driver, 'archive-notice')).assertEqual('保存失败，原归档未改变，待保存证据保留');
      expect(fixture.storage.document.rows.length).assertEqual(0);
      expect(await (await archiveQaNode(driver, 'archive-save')).isEnabled()).assertTrue();
      await archiveQaClick(driver, 'archive-save');
      await fixture.repository.whenIdle();
      expect(fixture.repository.snapshot().rows.length).assertEqual(2);
      expect(fixture.storage.writes).assertEqual(2);
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVEUIQA_0400
     * @tc.name testArchiveUiQa0004
     * @tc.desc Source filtering updates scope statistics and clears details
     * when a previously selected row leaves the visible range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArchiveUiQa0004', 0, async (): Promise<void> => {
      const driver = await launchArchiveUiQa('seeded');
      const fixture = currentArchiveUiQa();
      const failure = fixture.repository.snapshot().rows.find(
        (row): boolean => row.record.outcome === QueryOutcome.FAILURE);
      if (failure === undefined) {
        throw new Error('Production archive did not contain the seeded failure');
      }
      await archiveQaClick(driver, `archive-row-${failure.archiveId}`);
      expect((await archiveQaText(driver, 'archive-details')).indexOf('16000050') >= 0).assertTrue();
      await archiveQaClick(driver, 'archive-source-manual');
      expect(await archiveQaText(driver, 'archive-summary')).assertEqual('范围 1 条｜成功 1｜失败 0｜不支持 0｜超时 0｜未知 0');
      expect(await archiveQaText(driver, 'archive-details')).assertEqual('请选择已保存归档查看详情');
      expect(fixture.storage.document.rows.length).assertEqual(2);
      expect(fixture.storage.writes).assertEqual(1);
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVEUIQA_0500
     * @tc.name testArchiveUiQa0005
     * @tc.desc Real search input finds an exact error code and an unmatched scope disables copying
     * without changing stored evidence.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArchiveUiQa0005', 0, async (): Promise<void> => {
      const driver = await launchArchiveUiQa('seeded');
      await archiveQaInput(driver, 'archive-search', '16000050');
      expect(await archiveQaText(driver, 'archive-summary')).assertEqual('范围 1 条｜成功 0｜失败 1｜不支持 0｜超时 0｜未知 0');
      await archiveQaInput(driver, 'archive-search', 'no-match');
      expect(await archiveQaText(driver, 'archive-empty')).assertEqual('当前范围没有已保存归档');
      expect(await (await archiveQaNode(driver, 'archive-copy')).isEnabled()).assertFalse();
      expect(currentArchiveUiQa().storage.document.rows.length).assertEqual(2);
      expect(currentArchiveUiQa().clipboard.texts.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVEUIQA_0600
     * @tc.name testArchiveUiQa0006
     * @tc.desc Automatic capture is opt-in: cancelling its real confirmation writes nothing,
     * while confirming enables later production capture.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArchiveUiQa0006', 0, async (): Promise<void> => {
      const driver = await launchArchiveUiQa('manual');
      const fixture = currentArchiveUiQa();
      await archiveQaClick(driver, 'archive-auto');
      await archiveQaClick(driver, 'archive-cancel');
      expect(fixture.storage.writes).assertEqual(0);
      expect(fixture.repository.snapshot().automatic).assertFalse();
      await archiveQaClick(driver, 'archive-auto');
      await archiveQaClick(driver, 'archive-auto-confirm');
      await fixture.repository.whenIdle();
      fixture.repository.capture(fixture.record(301, QueryOutcome.UNSUPPORTED, RefreshSource.SETTINGS));
      await fixture.repository.whenIdle();
      expect(await archiveQaText(driver, 'archive-auto')).assertEqual('停用自动归档');
      expect(fixture.storage.document.automatic).assertTrue();
      expect(await archiveQaText(driver, 'archive-summary')).assertEqual('范围 3 条｜成功 1｜失败 1｜不支持 1｜超时 0｜未知 0');
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVEUIQA_0700
     * @tc.name testArchiveUiQa0007
     * @tc.desc Cancelling cleanup leaves its real expired evidence and storage revision intact.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArchiveUiQa0007', 0, async (): Promise<void> => {
      console.info('[SA_UI7] before launch cleanup');
      const driver = await launchArchiveUiQa('cleanup');
      console.info('[SA_UI7] after launch cleanup');
      const fixture = currentArchiveUiQa();
      const revision = fixture.repository.snapshot().revision;
      console.info('[SA_UI7] before click archive-clean-preview');
      await archiveQaClick(driver, 'archive-clean-preview');
      console.info('[SA_UI7] after click archive-clean-preview');
      console.info('[SA_UI7] before enabled archive-clean-confirm');
      expect(await (await archiveQaNode(driver, 'archive-clean-confirm')).isEnabled()).assertTrue();
      console.info('[SA_UI7] after enabled archive-clean-confirm');
      console.info('[SA_UI7] before click archive-cancel');
      await archiveQaClick(driver, 'archive-cancel');
      console.info('[SA_UI7] after click archive-cancel');
      console.info('[SA_UI7] before text archive-notice');
      expect(await archiveQaText(driver, 'archive-notice')).assertEqual('已取消，归档未改变');
      console.info('[SA_UI7] after text archive-notice');
      expect(fixture.storage.document.rows.length).assertEqual(2);
      expect(fixture.repository.snapshot().revision).assertEqual(revision);
      expect(fixture.storage.writes).assertEqual(1);
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVEUIQA_0800
     * @tc.name testArchiveUiQa0008
     * @tc.desc Confirmed production cleanup removes the aged record
     * but retains the recent protected evidence and live records.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArchiveUiQa0008', 0, async (): Promise<void> => {
      const driver = await launchArchiveUiQa('cleanup');
      const fixture = currentArchiveUiQa();
      await archiveQaClick(driver, 'archive-clean-preview');
      await archiveQaClick(driver, 'archive-clean-confirm');
      await fixture.repository.whenIdle();
      expect(await archiveQaText(driver, 'archive-notice')).assertEqual('已提交清理，删除 1 条');
      expect(fixture.storage.document.rows[0].record.id).assertEqual(101);
      expect(fixture.liveRecords.length).assertEqual(2);
      expect(fixture.storage.writes).assertEqual(2);
      expect(await archiveQaText(driver, 'archive-summary')).assertEqual('范围 1 条｜成功 1｜失败 0｜不支持 0｜超时 0｜未知 0');
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVEUIQA_0900
     * @tc.name testArchiveUiQa0009
     * @tc.desc New evidence arriving after cleanup preview makes its confirmation stale
     * rather than deleting from a changed revision.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArchiveUiQa0009', 0, async (): Promise<void> => {
      const driver = await launchArchiveUiQa('staleCleanup');
      const fixture = currentArchiveUiQa();
      await archiveQaClick(driver, 'archive-clean-preview');
      await fixture.repository.save([fixture.record(401, QueryOutcome.TIMEOUT, RefreshSource.FOREGROUND)]);
      const revision = fixture.repository.snapshot().revision;
      await archiveQaClick(driver, 'archive-clean-confirm');
      await fixture.repository.whenIdle();
      expect(await archiveQaText(driver, 'archive-notice')).assertEqual('记录已更新，请重新预览或确认');
      expect(fixture.storage.document.rows.length).assertEqual(3);
      expect(fixture.repository.snapshot().revision).assertEqual(revision);
      expect(fixture.storage.writes).assertEqual(2);
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVEUIQA_1000
     * @tc.name testArchiveUiQa0010
     * @tc.desc Actual clear confirmation empties durable evidence
     * without clearing live history or enabling empty-range copy.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArchiveUiQa0010', 0, async (): Promise<void> => {
      const driver = await launchArchiveUiQa('seeded');
      const fixture = currentArchiveUiQa();
      await archiveQaClick(driver, 'archive-clear');
      await archiveQaClick(driver, 'archive-clear-confirm');
      await fixture.repository.whenIdle();
      expect(await archiveQaText(driver, 'archive-notice')).assertEqual('已清空已保存归档；live历史未改变');
      expect(fixture.storage.document.rows.length).assertEqual(0);
      expect(fixture.liveRecords.length).assertEqual(2);
      expect(await (await archiveQaNode(driver, 'archive-copy')).isEnabled()).assertFalse();
      expect(await (await archiveQaNode(driver, 'archive-save')).isEnabled()).assertTrue();
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVEUIQA_1100
     * @tc.name testArchiveUiQa0011
     * @tc.desc Copy waits for its isolated clipboard acknowledgment
     * and exports redacted current-scope evidence, not raw errors.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArchiveUiQa0011', 0, async (): Promise<void> => {
      const driver = await launchArchiveUiQa('copyPending');
      const fixture = currentArchiveUiQa();
      await archiveQaClick(driver, 'archive-outcome-failure');
      await archiveQaClick(driver, 'archive-copy');
      expect(await archiveQaText(driver, 'archive-notice')).assertEqual('正在处理，尚未确认保存');
      expect(await (await archiveQaNode(driver, 'archive-copy')).isEnabled()).assertFalse();
      expect(fixture.clipboard.texts[0].indexOf('qa-private-error-detail')).assertEqual(-1);
      fixture.release();
      const notice = await driver.waitForComponent(ON.text('脱敏归档已复制'), 3000);
      if (notice === undefined || notice === null) {
        throw new Error('Copy acknowledgment was not rendered');
      }
      expect(await archiveQaText(driver, 'archive-notice')).assertEqual('脱敏归档已复制');
      expect(fixture.storage.writes).assertEqual(1);
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVEUIQA_1200
     * @tc.name testArchiveUiQa0012
     * @tc.desc A rejected clipboard promise restores real action availability
     * and displays failure without a storage write.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArchiveUiQa0012', 0, async (): Promise<void> => {
      const driver = await launchArchiveUiQa('copyFailure');
      await archiveQaClick(driver, 'archive-copy');
      const notice = await driver.waitForComponent(ON.text('复制失败，请重试'), 3000);
      if (notice === undefined || notice === null) {
        throw new Error('Rejected clipboard status was not rendered');
      }
      expect(await archiveQaText(driver, 'archive-notice')).assertEqual('复制失败，请重试');
      expect(await (await archiveQaNode(driver, 'archive-copy')).isEnabled()).assertTrue();
      expect(currentArchiveUiQa().storage.writes).assertEqual(1);
      expect(currentArchiveUiQa().storage.document.rows.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVEUIQA_1300
     * @tc.name testArchiveUiQa0013
     * @tc.desc A failed archive read gates destructive actions and the actual retry entry recovers
     * without replacing the original database.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArchiveUiQa0013', 0, async (): Promise<void> => {
      const driver = await launchArchiveUiQa('readFailure');
      const fixture = currentArchiveUiQa();
      expect(await (await archiveQaNode(driver, 'archive-auto')).isEnabled()).assertFalse();
      expect(await (await archiveQaNode(driver, 'archive-clean-preview')).isEnabled()).assertFalse();
      expect(await archiveQaText(driver, 'archive-notice')).assertEqual('归档读取失败或版本无效；暂停写入，请重试读取，原库不覆盖');
      fixture.storage.failLoad = false;
      await archiveQaClick(driver, 'archive-retry');
      await fixture.repository.whenIdle();
      expect(await (await archiveQaNode(driver, 'archive-auto')).isEnabled()).assertTrue();
      expect(fixture.storage.writes).assertEqual(0);
    });
  });
}
