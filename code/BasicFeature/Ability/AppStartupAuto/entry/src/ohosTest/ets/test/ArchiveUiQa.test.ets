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

import { describe, expect } from '@ohos/hypium';
import { runtimeCaseName, traceParameter } from '../support/TestLog';
import { ON, uiCase, UiTestSession } from '../support/UiTestRuntime';
import { QueryOutcome, RefreshSource } from '../../../main/ets/autostart/AutoStartupTypes';
import { archiveQaClick, archiveQaExpected, archiveQaInput, archiveQaNode, archiveQaText,
  currentArchiveUiQa, launchArchiveUiQa } from '../support/ArchiveUiQaSupport';

export default function archiveUiQaTests(): void {
  describe('ArchiveUiQa', (): void => {
    /**
     * @tc.number SUB_STARTUP_ARCHIVEUIQA_0100
     * @tc.name testArchiveUiQa0001
     * @tc.desc An empty real archive does not enable save or copy and reports an actual zero-scope summary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    uiCase(runtimeCaseName('testArchiveUiQa0001'), 0, async (session: UiTestSession): Promise<void> => {
      const driver = await launchArchiveUiQa(session, 'empty');
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0001|ArchiveUiQa.test.ets|assert0001|assertEqual|actual', await archiveQaText(driver, 'archive-empty'))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0001|ArchiveUiQa.test.ets|assert0001|assertEqual|expected', archiveQaExpected('startup_text_0824')));
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0001|ArchiveUiQa.test.ets|assert0002|assertFalse|actual|expected=false', await (await archiveQaNode(driver, 'archive-save')).isEnabled())).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0001|ArchiveUiQa.test.ets|assert0003|assertFalse|actual|expected=false', await (await archiveQaNode(driver, 'archive-copy')).isEnabled())).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0001|ArchiveUiQa.test.ets|assert0004|assertEqual|actual', await archiveQaText(driver, 'archive-summary'))).assertEqual(
        traceParameter('com.samples.appstartupauto_ArchiveUiQa_0001|ArchiveUiQa.test.ets|assert0004|assertEqual|expected', archiveQaExpected('startup_format_78064061fa94', ['0', '0', '0']) +
          archiveQaExpected('startup_format_f6b100802a6e', ['0', '0', '0'])));
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0001|ArchiveUiQa.test.ets|assert0005|assertEqual|actual', currentArchiveUiQa(session).storage.writes)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0001|ArchiveUiQa.test.ets|assert0005|assertEqual|expected', 0));
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVEUIQA_0200
     * @tc.name testArchiveUiQa0002
     * @tc.desc Actual save remains pending behind I/O and exposes committed-only rows until the write is acknowledged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    uiCase(runtimeCaseName('testArchiveUiQa0002'), 0, async (session: UiTestSession): Promise<void> => {
      const driver = await launchArchiveUiQa(session, 'pending');
      await archiveQaClick(driver, 'archive-save');
      const fixture = currentArchiveUiQa(session);
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0002|ArchiveUiQa.test.ets|assert0006|assertEqual|actual', await archiveQaText(driver, 'archive-notice'))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0002|ArchiveUiQa.test.ets|assert0006|assertEqual|expected', archiveQaExpected('startup_text_0784')));
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0002|ArchiveUiQa.test.ets|assert0007|assertFalse|actual|expected=false', await (await archiveQaNode(driver, 'archive-auto')).isEnabled())).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0002|ArchiveUiQa.test.ets|assert0008|assertEqual|actual', fixture.repository.snapshot().rows.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0002|ArchiveUiQa.test.ets|assert0008|assertEqual|expected', 0));
      fixture.release();
      await session.guard(fixture.repository.whenIdle());
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0002|ArchiveUiQa.test.ets|assert0009|assertEqual|actual', await archiveQaText(driver, 'archive-summary'))).assertEqual(
        traceParameter('com.samples.appstartupauto_ArchiveUiQa_0002|ArchiveUiQa.test.ets|assert0009|assertEqual|expected', archiveQaExpected('startup_format_78064061fa94', ['2', '1', '1']) +
          archiveQaExpected('startup_format_f6b100802a6e', ['0', '0', '0'])));
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0002|ArchiveUiQa.test.ets|assert0010|assertEqual|actual', fixture.storage.document.rows[1].record.errorMessage)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0002|ArchiveUiQa.test.ets|assert0010|assertEqual|expected', ''));
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0002|ArchiveUiQa.test.ets|assert0011|assertEqual|actual', fixture.liveRecords[1].errorMessage)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0002|ArchiveUiQa.test.ets|assert0011|assertEqual|expected', 'qa-private-error-detail'));
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
    uiCase(runtimeCaseName('testArchiveUiQa0003'), 0, async (session: UiTestSession): Promise<void> => {
      const driver = await launchArchiveUiQa(session, 'writeFailure');
      await archiveQaClick(driver, 'archive-save');
      const fixture = currentArchiveUiQa(session);
      await session.guard(fixture.repository.whenIdle());
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0003|ArchiveUiQa.test.ets|assert0012|assertEqual|actual', await archiveQaText(driver, 'archive-notice'))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0003|ArchiveUiQa.test.ets|assert0012|assertEqual|expected', archiveQaExpected('startup_text_0166')));
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0003|ArchiveUiQa.test.ets|assert0013|assertEqual|actual', fixture.storage.document.rows.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0003|ArchiveUiQa.test.ets|assert0013|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0003|ArchiveUiQa.test.ets|assert0014|assertTrue|actual|expected=true', await (await archiveQaNode(driver, 'archive-save')).isEnabled())).assertTrue();
      await archiveQaClick(driver, 'archive-save');
      await session.guard(fixture.repository.whenIdle());
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0003|ArchiveUiQa.test.ets|assert0015|assertEqual|actual', fixture.repository.snapshot().rows.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0003|ArchiveUiQa.test.ets|assert0015|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0003|ArchiveUiQa.test.ets|assert0016|assertEqual|actual', fixture.storage.writes)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0003|ArchiveUiQa.test.ets|assert0016|assertEqual|expected', 2));
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
    uiCase(runtimeCaseName('testArchiveUiQa0004'), 0, async (session: UiTestSession): Promise<void> => {
      const driver = await launchArchiveUiQa(session, 'seeded');
      const fixture = currentArchiveUiQa(session);
      const failure = fixture.repository.snapshot().rows.find(
        (row): boolean => row.record.outcome === QueryOutcome.FAILURE);
      if (failure === undefined) {
        throw new Error('Production archive did not contain the seeded failure');
      }
      await archiveQaClick(driver, `archive-row-${failure.archiveId}`);
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0004|ArchiveUiQa.test.ets|assert0017|assertTrue|actual|expected=true', (await archiveQaText(driver, 'archive-details')).indexOf('16000050') >= 0)).assertTrue();
      await archiveQaClick(driver, 'archive-source-manual');
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0004|ArchiveUiQa.test.ets|assert0018|assertEqual|actual', await archiveQaText(driver, 'archive-summary'))).assertEqual(
        traceParameter('com.samples.appstartupauto_ArchiveUiQa_0004|ArchiveUiQa.test.ets|assert0018|assertEqual|expected', archiveQaExpected('startup_format_78064061fa94', ['1', '1', '0']) +
          archiveQaExpected('startup_format_f6b100802a6e', ['0', '0', '0'])));
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0004|ArchiveUiQa.test.ets|assert0019|assertEqual|actual', await archiveQaText(driver, 'archive-details'))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0004|ArchiveUiQa.test.ets|assert0019|assertEqual|expected', archiveQaExpected('startup_text_0780')));
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0004|ArchiveUiQa.test.ets|assert0020|assertEqual|actual', fixture.storage.document.rows.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0004|ArchiveUiQa.test.ets|assert0020|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0004|ArchiveUiQa.test.ets|assert0021|assertEqual|actual', fixture.storage.writes)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0004|ArchiveUiQa.test.ets|assert0021|assertEqual|expected', 1));
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
    uiCase(runtimeCaseName('testArchiveUiQa0005'), 0, async (session: UiTestSession): Promise<void> => {
      const driver = await launchArchiveUiQa(session, 'seeded');
      await archiveQaInput(driver, 'archive-search', '16000050');
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0005|ArchiveUiQa.test.ets|assert0022|assertEqual|actual', await archiveQaText(driver, 'archive-summary'))).assertEqual(
        traceParameter('com.samples.appstartupauto_ArchiveUiQa_0005|ArchiveUiQa.test.ets|assert0022|assertEqual|expected', archiveQaExpected('startup_format_78064061fa94', ['1', '0', '1']) +
          archiveQaExpected('startup_format_f6b100802a6e', ['0', '0', '0'])));
      await archiveQaInput(driver, 'archive-search', 'no-match');
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0005|ArchiveUiQa.test.ets|assert0023|assertEqual|actual', await archiveQaText(driver, 'archive-empty'))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0005|ArchiveUiQa.test.ets|assert0023|assertEqual|expected', archiveQaExpected('startup_text_0824')));
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0005|ArchiveUiQa.test.ets|assert0024|assertFalse|actual|expected=false', await (await archiveQaNode(driver, 'archive-copy')).isEnabled())).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0005|ArchiveUiQa.test.ets|assert0025|assertEqual|actual', currentArchiveUiQa(session).storage.document.rows.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0005|ArchiveUiQa.test.ets|assert0025|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0005|ArchiveUiQa.test.ets|assert0026|assertEqual|actual', currentArchiveUiQa(session).clipboard.texts.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0005|ArchiveUiQa.test.ets|assert0026|assertEqual|expected', 0));
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
    uiCase(runtimeCaseName('testArchiveUiQa0006'), 0, async (session: UiTestSession): Promise<void> => {
      const driver = await launchArchiveUiQa(session, 'manual');
      const fixture = currentArchiveUiQa(session);
      await archiveQaClick(driver, 'archive-auto');
      await archiveQaClick(driver, 'archive-cancel');
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0006|ArchiveUiQa.test.ets|assert0027|assertEqual|actual', fixture.storage.writes)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0006|ArchiveUiQa.test.ets|assert0027|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0006|ArchiveUiQa.test.ets|assert0028|assertFalse|actual|expected=false', fixture.repository.snapshot().automatic)).assertFalse();
      await archiveQaClick(driver, 'archive-auto');
      await archiveQaClick(driver, 'archive-auto-confirm');
      await session.guard(fixture.repository.whenIdle());
      fixture.repository.capture(fixture.record(301, QueryOutcome.UNSUPPORTED, RefreshSource.SETTINGS));
      await session.guard(fixture.repository.whenIdle());
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0006|ArchiveUiQa.test.ets|assert0029|assertEqual|actual', await archiveQaText(driver, 'archive-auto'))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0006|ArchiveUiQa.test.ets|assert0029|assertEqual|expected', archiveQaExpected('startup_text_0814')));
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0006|ArchiveUiQa.test.ets|assert0030|assertTrue|actual|expected=true', fixture.storage.document.automatic)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0006|ArchiveUiQa.test.ets|assert0031|assertEqual|actual', await archiveQaText(driver, 'archive-summary'))).assertEqual(
        traceParameter('com.samples.appstartupauto_ArchiveUiQa_0006|ArchiveUiQa.test.ets|assert0031|assertEqual|expected', archiveQaExpected('startup_format_78064061fa94', ['3', '1', '1']) +
          archiveQaExpected('startup_format_f6b100802a6e', ['1', '0', '0'])));
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVEUIQA_0700
     * @tc.name testArchiveUiQa0007
     * @tc.desc Cancelling cleanup leaves its real expired evidence and storage revision intact.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    uiCase(runtimeCaseName('testArchiveUiQa0007'), 0, async (session: UiTestSession): Promise<void> => {
      const driver = await launchArchiveUiQa(session, 'cleanup');
      const fixture = currentArchiveUiQa(session);
      const revision = fixture.repository.snapshot().revision;
      await archiveQaClick(driver, 'archive-clean-preview');
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0007|ArchiveUiQa.test.ets|assert0032|assertTrue|actual|expected=true', await (await archiveQaNode(driver, 'archive-clean-confirm')).isEnabled())).assertTrue();
      await archiveQaClick(driver, 'archive-cancel');
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0007|ArchiveUiQa.test.ets|assert0033|assertEqual|actual', await archiveQaText(driver, 'archive-notice'))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0007|ArchiveUiQa.test.ets|assert0033|assertEqual|expected', archiveQaExpected('startup_text_0817')));
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0007|ArchiveUiQa.test.ets|assert0034|assertEqual|actual', fixture.storage.document.rows.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0007|ArchiveUiQa.test.ets|assert0034|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0007|ArchiveUiQa.test.ets|assert0035|assertEqual|actual', fixture.repository.snapshot().revision)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0007|ArchiveUiQa.test.ets|assert0035|assertEqual|expected', revision));
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0007|ArchiveUiQa.test.ets|assert0036|assertEqual|actual', fixture.storage.writes)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0007|ArchiveUiQa.test.ets|assert0036|assertEqual|expected', 1));
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
    uiCase(runtimeCaseName('testArchiveUiQa0008'), 0, async (session: UiTestSession): Promise<void> => {
      const driver = await launchArchiveUiQa(session, 'cleanup');
      const fixture = currentArchiveUiQa(session);
      await archiveQaClick(driver, 'archive-clean-preview');
      await archiveQaClick(driver, 'archive-clean-confirm');
      await session.guard(fixture.repository.whenIdle());
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0008|ArchiveUiQa.test.ets|assert0037|assertEqual|actual', await archiveQaText(driver, 'archive-notice'))).assertEqual(
        traceParameter('com.samples.appstartupauto_ArchiveUiQa_0008|ArchiveUiQa.test.ets|assert0037|assertEqual|expected', archiveQaExpected('startup_format_f7ccf2ca0b28', ['1'])));
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0008|ArchiveUiQa.test.ets|assert0038|assertEqual|actual', fixture.storage.document.rows[0].record.id)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0008|ArchiveUiQa.test.ets|assert0038|assertEqual|expected', 101));
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0008|ArchiveUiQa.test.ets|assert0039|assertEqual|actual', fixture.liveRecords.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0008|ArchiveUiQa.test.ets|assert0039|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0008|ArchiveUiQa.test.ets|assert0040|assertEqual|actual', fixture.storage.writes)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0008|ArchiveUiQa.test.ets|assert0040|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0008|ArchiveUiQa.test.ets|assert0041|assertEqual|actual', await archiveQaText(driver, 'archive-summary'))).assertEqual(
        traceParameter('com.samples.appstartupauto_ArchiveUiQa_0008|ArchiveUiQa.test.ets|assert0041|assertEqual|expected', archiveQaExpected('startup_format_78064061fa94', ['1', '1', '0']) +
          archiveQaExpected('startup_format_f6b100802a6e', ['0', '0', '0'])));
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
    uiCase(runtimeCaseName('testArchiveUiQa0009'), 0, async (session: UiTestSession): Promise<void> => {
      const driver = await launchArchiveUiQa(session, 'staleCleanup');
      const fixture = currentArchiveUiQa(session);
      await archiveQaClick(driver, 'archive-clean-preview');
      await session.guard(fixture.repository.save([fixture.record(401, QueryOutcome.TIMEOUT, RefreshSource.FOREGROUND)]));
      const revision = fixture.repository.snapshot().revision;
      await archiveQaClick(driver, 'archive-clean-confirm');
      await session.guard(fixture.repository.whenIdle());
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0009|ArchiveUiQa.test.ets|assert0042|assertEqual|actual', await archiveQaText(driver, 'archive-notice'))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0009|ArchiveUiQa.test.ets|assert0042|assertEqual|expected', archiveQaExpected('startup_text_0162')));
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0009|ArchiveUiQa.test.ets|assert0043|assertEqual|actual', fixture.storage.document.rows.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0009|ArchiveUiQa.test.ets|assert0043|assertEqual|expected', 3));
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0009|ArchiveUiQa.test.ets|assert0044|assertEqual|actual', fixture.repository.snapshot().revision)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0009|ArchiveUiQa.test.ets|assert0044|assertEqual|expected', revision));
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0009|ArchiveUiQa.test.ets|assert0045|assertEqual|actual', fixture.storage.writes)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0009|ArchiveUiQa.test.ets|assert0045|assertEqual|expected', 2));
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
    uiCase(runtimeCaseName('testArchiveUiQa0010'), 0, async (session: UiTestSession): Promise<void> => {
      const driver = await launchArchiveUiQa(session, 'seeded');
      const fixture = currentArchiveUiQa(session);
      await archiveQaClick(driver, 'archive-clear');
      await archiveQaClick(driver, 'archive-clear-confirm');
      await session.guard(fixture.repository.whenIdle());
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0010|ArchiveUiQa.test.ets|assert0046|assertEqual|actual', await archiveQaText(driver, 'archive-notice'))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0010|ArchiveUiQa.test.ets|assert0046|assertEqual|expected', archiveQaExpected('startup_text_0142')));
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0010|ArchiveUiQa.test.ets|assert0047|assertEqual|actual', fixture.storage.document.rows.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0010|ArchiveUiQa.test.ets|assert0047|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0010|ArchiveUiQa.test.ets|assert0048|assertEqual|actual', fixture.liveRecords.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0010|ArchiveUiQa.test.ets|assert0048|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0010|ArchiveUiQa.test.ets|assert0049|assertFalse|actual|expected=false', await (await archiveQaNode(driver, 'archive-copy')).isEnabled())).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0010|ArchiveUiQa.test.ets|assert0050|assertTrue|actual|expected=true', await (await archiveQaNode(driver, 'archive-save')).isEnabled())).assertTrue();
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
    uiCase(runtimeCaseName('testArchiveUiQa0011'), 0, async (session: UiTestSession): Promise<void> => {
      const driver = await launchArchiveUiQa(session, 'copyPending');
      const fixture = currentArchiveUiQa(session);
      await archiveQaClick(driver, 'archive-outcome-failure');
      await archiveQaClick(driver, 'archive-copy');
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0011|ArchiveUiQa.test.ets|assert0051|assertEqual|actual', await archiveQaText(driver, 'archive-notice'))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0011|ArchiveUiQa.test.ets|assert0051|assertEqual|expected', archiveQaExpected('startup_text_0784')));
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0011|ArchiveUiQa.test.ets|assert0052|assertFalse|actual|expected=false', await (await archiveQaNode(driver, 'archive-copy')).isEnabled())).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0011|ArchiveUiQa.test.ets|assert0053|assertEqual|actual', fixture.clipboard.texts[0].indexOf('qa-private-error-detail'))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0011|ArchiveUiQa.test.ets|assert0053|assertEqual|expected', -1));
      fixture.release();
      const notice = await driver.waitForComponent(ON.text(archiveQaExpected('startup_text_0153')), 3000);
      if (notice === undefined || notice === null) {
        throw new Error('Copy acknowledgment was not rendered');
      }
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0011|ArchiveUiQa.test.ets|assert0054|assertEqual|actual', await archiveQaText(driver, 'archive-notice'))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0011|ArchiveUiQa.test.ets|assert0054|assertEqual|expected', archiveQaExpected('startup_text_0153')));
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0011|ArchiveUiQa.test.ets|assert0055|assertEqual|actual', fixture.storage.writes)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0011|ArchiveUiQa.test.ets|assert0055|assertEqual|expected', 1));
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
    uiCase(runtimeCaseName('testArchiveUiQa0012'), 0, async (session: UiTestSession): Promise<void> => {
      const driver = await launchArchiveUiQa(session, 'copyFailure');
      await archiveQaClick(driver, 'archive-copy');
      const notice = await driver.waitForComponent(ON.text(archiveQaExpected('startup_text_0154')), 3000);
      if (notice === undefined || notice === null) {
        throw new Error('Rejected clipboard status was not rendered');
      }
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0012|ArchiveUiQa.test.ets|assert0056|assertEqual|actual', await archiveQaText(driver, 'archive-notice'))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0012|ArchiveUiQa.test.ets|assert0056|assertEqual|expected', archiveQaExpected('startup_text_0154')));
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0012|ArchiveUiQa.test.ets|assert0057|assertTrue|actual|expected=true', await (await archiveQaNode(driver, 'archive-copy')).isEnabled())).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0012|ArchiveUiQa.test.ets|assert0058|assertEqual|actual', currentArchiveUiQa(session).storage.writes)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0012|ArchiveUiQa.test.ets|assert0058|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0012|ArchiveUiQa.test.ets|assert0059|assertEqual|actual', currentArchiveUiQa(session).storage.document.rows.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0012|ArchiveUiQa.test.ets|assert0059|assertEqual|expected', 2));
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
    uiCase(runtimeCaseName('testArchiveUiQa0013'), 0, async (session: UiTestSession): Promise<void> => {
      const driver = await launchArchiveUiQa(session, 'readFailure');
      const fixture = currentArchiveUiQa(session);
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0013|ArchiveUiQa.test.ets|assert0060|assertFalse|actual|expected=false', await (await archiveQaNode(driver, 'archive-auto')).isEnabled())).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0013|ArchiveUiQa.test.ets|assert0061|assertFalse|actual|expected=false', await (await archiveQaNode(driver, 'archive-clean-preview')).isEnabled())).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0013|ArchiveUiQa.test.ets|assert0062|assertEqual|actual', await archiveQaText(driver, 'archive-notice'))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0013|ArchiveUiQa.test.ets|assert0062|assertEqual|expected', archiveQaExpected('startup_text_0128')));
      fixture.storage.failLoad = false;
      await archiveQaClick(driver, 'archive-retry');
      await session.guard(fixture.repository.whenIdle());
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0013|ArchiveUiQa.test.ets|assert0063|assertTrue|actual|expected=true', await (await archiveQaNode(driver, 'archive-auto')).isEnabled())).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0013|ArchiveUiQa.test.ets|assert0064|assertEqual|actual', fixture.storage.writes)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveUiQa_0013|ArchiveUiQa.test.ets|assert0064|assertEqual|expected', 0));
    });
  });
}
