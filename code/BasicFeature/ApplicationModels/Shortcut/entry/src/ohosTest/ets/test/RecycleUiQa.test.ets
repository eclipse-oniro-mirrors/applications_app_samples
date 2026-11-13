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

import { uiText } from '../../../main/ets/i18n/Strings';
import { describe } from '@ohos/hypium';
import { caseName, expect } from '../support/TestCase';
import { ON, uiCase as it, UiTestSession } from '../support/UiTestRuntime';
import { RecycleBatchAction } from '../../../main/ets/business/RecycleBatch';
import { MAX_ACTIVE_NOTES, MAX_RECYCLED_NOTES } from '../../../main/ets/business/NoteRecyclePolicy';
import { currentRecycleUiQa as fixtureForSession, RecycleUiQaFixture, launchRecycleUiQa, recycleQaClick, recycleQaDialog,
  recycleQaNode, recycleQaPreview, recycleQaText, recycleQaUntil } from '../support/RecycleUiQaSupport';

export default function recycleUiQaTests(): void {
  describe('RecycleUiQa', (): void => {


    /**
     * @tc.number SUB_SHORTCUT_RECYCLEUIQA_0100
     * @tc.name testRecycleUiQa0001
     * @tc.desc The actual empty recycle panel reports its scope and keeps expired cleanup disabled without a write.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('RecycleUiQa', '0001'), 0, async (session: UiTestSession): Promise<void> => {
      const currentRecycleUiQa = (): RecycleUiQaFixture => fixtureForSession(session);
      const driver = await launchRecycleUiQa('empty', session);
      expect(await recycleQaText(driver, 'note-trash-empty'), caseName('RecycleUiQa', '0001'), 'RecycleUiQa.test.ets:A0001').assertEqual(uiText('shortcut_text_0304'));
      expect(await recycleQaText(driver, 'note-trash-summary'), caseName('RecycleUiQa', '0001'), 'RecycleUiQa.test.ets:A0002').assertEqual(uiText('shortcut_text_0299', ['0', String(MAX_RECYCLED_NOTES), '0']));
      expect(await (await recycleQaNode(driver, 'note-trash-cleanup')).isEnabled(), caseName('RecycleUiQa', '0001'), 'RecycleUiQa.test.ets:A0003').assertFalse();
      expect(currentRecycleUiQa().storage.writes, caseName('RecycleUiQa', '0001'), 'RecycleUiQa.test.ets:A0004').assertEqual(0);
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLEUIQA_0200
     * @tc.name testRecycleUiQa0002
     * @tc.desc The real restore button returns both the original note and its retained production revision history.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('RecycleUiQa', '0002'), 0, async (session: UiTestSession): Promise<void> => {
      const currentRecycleUiQa = (): RecycleUiQaFixture => fixtureForSession(session);
      const driver = await launchRecycleUiQa('seeded', session);
      const fixture = currentRecycleUiQa();
      await recycleQaClick(driver, `trash-restore-${fixture.trashId}`);
      await session.guard(recycleQaUntil(fixture.store, (): boolean => !fixture.store.snapshot().busy));
      expect(await recycleQaText(driver, 'note-trash-status'), caseName('RecycleUiQa', '0002'), 'RecycleUiQa.test.ets:A0005').assertEqual(uiText('shortcut_text_0091'));
      expect(fixture.store.snapshot().notes[0].body, caseName('RecycleUiQa', '0002'), 'RecycleUiQa.test.ets:A0006').assertEqual('qa-recycle-private-body');
      expect(fixture.store.snapshot().notes[0].id, caseName('RecycleUiQa', '0002'), 'RecycleUiQa.test.ets:A0007').assertEqual(fixture.noteId);
      expect(fixture.store.historyFor(fixture.noteId)[0].action, caseName('RecycleUiQa', '0002'), 'RecycleUiQa.test.ets:A0008').assertEqual('create');
      expect(await recycleQaText(driver, 'note-trash-empty'), caseName('RecycleUiQa', '0002'), 'RecycleUiQa.test.ets:A0009').assertEqual(uiText('shortcut_text_0304'));
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLEUIQA_0300
     * @tc.name testRecycleUiQa0003
     * @tc.desc Cancelling the real permanent-delete alert leaves its target and history recoverable
     * without a storage write.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('RecycleUiQa', '0003'), 0, async (session: UiTestSession): Promise<void> => {
      const currentRecycleUiQa = (): RecycleUiQaFixture => fixtureForSession(session);
      const driver = await launchRecycleUiQa('seeded', session);
      const fixture = currentRecycleUiQa();
      await recycleQaClick(driver, `trash-purge-${fixture.trashId}`);
      await recycleQaDialog(driver, uiText('shortcut_text_0452'));
      expect(fixture.storage.value, caseName('RecycleUiQa', '0003'), 'RecycleUiQa.test.ets:A0010').assertEqual(fixture.baseline);
      expect(await (await recycleQaNode(driver, `trash-restore-${fixture.trashId}`)).isEnabled(), caseName('RecycleUiQa', '0003'), 'RecycleUiQa.test.ets:A0011').assertTrue();
      expect(fixture.store.snapshot().recycledNotes[0].history[0].action, caseName('RecycleUiQa', '0003'), 'RecycleUiQa.test.ets:A0012').assertEqual('create');
      expect(fixture.storage.writes, caseName('RecycleUiQa', '0003'), 'RecycleUiQa.test.ets:A0013').assertEqual(fixture.baselineWrites);
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLEUIQA_0400
     * @tc.name testRecycleUiQa0004
     * @tc.desc Confirmed permanent deletion removes the actual recycled payload and history
     * rather than restoring an active note.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('RecycleUiQa', '0004'), 0, async (session: UiTestSession): Promise<void> => {
      const currentRecycleUiQa = (): RecycleUiQaFixture => fixtureForSession(session);
      const driver = await launchRecycleUiQa('seeded', session);
      const fixture = currentRecycleUiQa();
      await recycleQaClick(driver, `trash-purge-${fixture.trashId}`);
      await recycleQaDialog(driver, uiText('shortcut_text_0696'));
      await session.guard(recycleQaUntil(fixture.store, (): boolean => !fixture.store.snapshot().busy));
      expect(await recycleQaText(driver, 'note-trash-status'), caseName('RecycleUiQa', '0004'), 'RecycleUiQa.test.ets:A0014').assertEqual(uiText('shortcut_text_0687'));
      expect(fixture.store.snapshot().notes.length, caseName('RecycleUiQa', '0004'), 'RecycleUiQa.test.ets:A0015').assertEqual(0);
      expect(fixture.store.historyFor(fixture.noteId).length, caseName('RecycleUiQa', '0004'), 'RecycleUiQa.test.ets:A0016').assertEqual(0);
      expect(fixture.storage.value.indexOf('qa-recycle-private-body'), caseName('RecycleUiQa', '0004'), 'RecycleUiQa.test.ets:A0017').assertEqual(-1);
      expect(await recycleQaText(driver, 'note-trash-empty'), caseName('RecycleUiQa', '0004'), 'RecycleUiQa.test.ets:A0018').assertEqual(uiText('shortcut_text_0304'));
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLEUIQA_0500
     * @tc.name testRecycleUiQa0005
     * @tc.desc Mixed-expiry scope disables only the expired restore and actual cleanup retains the unexpired item.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('RecycleUiQa', '0005'), 0, async (session: UiTestSession): Promise<void> => {
      const currentRecycleUiQa = (): RecycleUiQaFixture => fixtureForSession(session);
      const driver = await launchRecycleUiQa('mixedExpiry', session);
      const fixture = currentRecycleUiQa();
      expect(await (await recycleQaNode(driver, `trash-restore-${fixture.trashId}`)).isEnabled(), caseName('RecycleUiQa', '0005'), 'RecycleUiQa.test.ets:A0019').assertFalse();
      expect(await (await recycleQaNode(driver, `trash-restore-${fixture.recentTrashId}`)).isEnabled(), caseName('RecycleUiQa', '0005'), 'RecycleUiQa.test.ets:A0020').assertTrue();
      expect(await recycleQaText(driver, 'note-trash-summary'), caseName('RecycleUiQa', '0005'), 'RecycleUiQa.test.ets:A0021').assertEqual(uiText('shortcut_text_0299', ['2', String(MAX_RECYCLED_NOTES), '1']));
      await recycleQaClick(driver, 'note-trash-cleanup');
      await recycleQaDialog(driver, uiText('shortcut_text_0441'), uiText('shortcut_text_0440'));
      await session.guard(recycleQaUntil(fixture.store, (): boolean => !fixture.store.snapshot().busy));
      expect(await recycleQaText(driver, 'note-trash-status'), caseName('RecycleUiQa', '0005'), 'RecycleUiQa.test.ets:A0022').assertEqual(uiText('shortcut_text_0668', ['1']));
      expect(fixture.store.snapshot().recycledNotes[0].trashId, caseName('RecycleUiQa', '0005'), 'RecycleUiQa.test.ets:A0023').assertEqual(fixture.recentTrashId);
      expect(await (await recycleQaNode(driver, 'note-trash-cleanup')).isEnabled(), caseName('RecycleUiQa', '0005'), 'RecycleUiQa.test.ets:A0024').assertFalse();
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLEUIQA_0600
     * @tc.name testRecycleUiQa0006
     * @tc.desc A suspended restore displays pending feedback and gates conflicting writes
     * until its durable acknowledgment arrives.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('RecycleUiQa', '0006'), 0, async (session: UiTestSession): Promise<void> => {
      const currentRecycleUiQa = (): RecycleUiQaFixture => fixtureForSession(session);
      const driver = await launchRecycleUiQa('pending', session);
      const fixture = currentRecycleUiQa();
      await recycleQaClick(driver, `trash-restore-${fixture.trashId}`);
      expect(await recycleQaText(driver, 'note-trash-busy'), caseName('RecycleUiQa', '0006'), 'RecycleUiQa.test.ets:A0025').assertEqual(uiText('shortcut_text_0167'));
      expect(await (await recycleQaNode(driver, `trash-purge-${fixture.trashId}`)).isEnabled(), caseName('RecycleUiQa', '0006'), 'RecycleUiQa.test.ets:A0026').assertFalse();
      expect(await (await recycleQaNode(driver, 'note-trash-refresh')).isEnabled(), caseName('RecycleUiQa', '0006'), 'RecycleUiQa.test.ets:A0027').assertFalse();
      expect(fixture.store.snapshot().notes.length, caseName('RecycleUiQa', '0006'), 'RecycleUiQa.test.ets:A0028').assertEqual(0);
      fixture.release();
      await session.guard(recycleQaUntil(fixture.store, (): boolean => !fixture.store.snapshot().busy));
      expect(await recycleQaText(driver, 'note-trash-status'), caseName('RecycleUiQa', '0006'), 'RecycleUiQa.test.ets:A0029').assertEqual(uiText('shortcut_text_0091'));
      expect(fixture.storage.writes, caseName('RecycleUiQa', '0006'), 'RecycleUiQa.test.ets:A0030').assertEqual(fixture.baselineWrites + 1);
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLEUIQA_0700
     * @tc.name testRecycleUiQa0007
     * @tc.desc A known-before-effect write failure retains the real recycle card
     * and an explicit second click can safely restore it.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('RecycleUiQa', '0007'), 0, async (session: UiTestSession): Promise<void> => {
      const currentRecycleUiQa = (): RecycleUiQaFixture => fixtureForSession(session);
      const driver = await launchRecycleUiQa('writeFailure', session);
      const fixture = currentRecycleUiQa();
      await recycleQaClick(driver, `trash-restore-${fixture.trashId}`);
      await session.guard(recycleQaUntil(fixture.store, (): boolean => !fixture.store.snapshot().busy));
      expect(await recycleQaText(driver, 'note-trash-status'), caseName('RecycleUiQa', '0007'), 'RecycleUiQa.test.ets:A0031').assertEqual(uiText('shortcut_text_0049'));
      expect(fixture.storage.value, caseName('RecycleUiQa', '0007'), 'RecycleUiQa.test.ets:A0032').assertEqual(fixture.baseline);
      expect(await (await recycleQaNode(driver, `trash-restore-${fixture.trashId}`)).isEnabled(), caseName('RecycleUiQa', '0007'), 'RecycleUiQa.test.ets:A0033').assertTrue();
      await recycleQaClick(driver, `trash-restore-${fixture.trashId}`);
      await session.guard(recycleQaUntil(fixture.store, (): boolean => !fixture.store.snapshot().busy));
      expect(fixture.store.snapshot().notes[0].id, caseName('RecycleUiQa', '0007'), 'RecycleUiQa.test.ets:A0034').assertEqual(fixture.noteId);
      expect(fixture.storage.writes, caseName('RecycleUiQa', '0007'), 'RecycleUiQa.test.ets:A0035').assertEqual(fixture.baselineWrites + 2);
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLEUIQA_0800
     * @tc.name testRecycleUiQa0008
     * @tc.desc An uncertain applied restore requires the actual reread entry and never blindly repeats the write.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('RecycleUiQa', '0008'), 0, async (session: UiTestSession): Promise<void> => {
      const currentRecycleUiQa = (): RecycleUiQaFixture => fixtureForSession(session);
      const driver = await launchRecycleUiQa('uncertainApplied', session);
      const fixture = currentRecycleUiQa();
      await recycleQaClick(driver, `trash-restore-${fixture.trashId}`);
      await session.guard(recycleQaUntil(fixture.store, (): boolean => !fixture.store.snapshot().busy));
      expect(await recycleQaText(driver, 'note-trash-status'), caseName('RecycleUiQa', '0008'), 'RecycleUiQa.test.ets:A0036').assertEqual(uiText('shortcut_text_0617'));
      expect(await (await recycleQaNode(driver, `trash-restore-${fixture.trashId}`)).isEnabled(), caseName('RecycleUiQa', '0008'), 'RecycleUiQa.test.ets:A0037').assertFalse();
      expect(await (await recycleQaNode(driver, `trash-purge-${fixture.trashId}`)).isEnabled(), caseName('RecycleUiQa', '0008'), 'RecycleUiQa.test.ets:A0038').assertFalse();
      await recycleQaClick(driver, 'note-trash-reload');
      await session.guard(recycleQaUntil(fixture.store, (): boolean => !fixture.store.snapshot().busy));
      expect(await recycleQaText(driver, 'note-trash-status'), caseName('RecycleUiQa', '0008'), 'RecycleUiQa.test.ets:A0039').assertEqual(uiText('shortcut_text_0024', [uiText('shortcut_text_0091')]));
      expect(fixture.storage.reloads, caseName('RecycleUiQa', '0008'), 'RecycleUiQa.test.ets:A0040').assertEqual(1);
      expect(fixture.storage.writes, caseName('RecycleUiQa', '0008'), 'RecycleUiQa.test.ets:A0041').assertEqual(fixture.baselineWrites + 1);
      expect(fixture.store.snapshot().notes[0].id, caseName('RecycleUiQa', '0008'), 'RecycleUiQa.test.ets:A0042').assertEqual(fixture.noteId);
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLEUIQA_0900
     * @tc.name testRecycleUiQa0009
     * @tc.desc A permanent-delete dialog whose item was independently restored is stale
     * and cannot delete the now-active note.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('RecycleUiQa', '0009'), 0, async (session: UiTestSession): Promise<void> => {
      const currentRecycleUiQa = (): RecycleUiQaFixture => fixtureForSession(session);
      const driver = await launchRecycleUiQa('seeded', session);
      const fixture = currentRecycleUiQa();
      await recycleQaClick(driver, `trash-purge-${fixture.trashId}`);
      session.requireLive();
      await session.guard(fixture.store.restoreTrashedNote(fixture.trashId));
      await recycleQaDialog(driver, uiText('shortcut_text_0696'));
      expect(await recycleQaText(driver, 'note-trash-status'), caseName('RecycleUiQa', '0009'), 'RecycleUiQa.test.ets:A0043').assertEqual(uiText('shortcut_text_0297'));
      expect(fixture.store.snapshot().notes[0].id, caseName('RecycleUiQa', '0009'), 'RecycleUiQa.test.ets:A0044').assertEqual(fixture.noteId);
      expect(fixture.store.historyFor(fixture.noteId)[0].body, caseName('RecycleUiQa', '0009'), 'RecycleUiQa.test.ets:A0045').assertEqual('qa-recycle-private-body');
      expect(fixture.storage.writes, caseName('RecycleUiQa', '0009'), 'RecycleUiQa.test.ets:A0046').assertEqual(fixture.baselineWrites + 1);
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLEUIQA_1000
     * @tc.name testRecycleUiQa0010
     * @tc.desc A failed initial read renders its retry view and recovers through that real entry
     * without writing user data.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('RecycleUiQa', '0010'), 0, async (session: UiTestSession): Promise<void> => {
      const currentRecycleUiQa = (): RecycleUiQaFixture => fixtureForSession(session);
      const driver = await launchRecycleUiQa('readFailure', session);
      const fixture = currentRecycleUiQa();
      expect(await recycleQaText(driver, 'note-trash-status'), caseName('RecycleUiQa', '0010'), 'RecycleUiQa.test.ets:A0047').assertEqual(uiText('shortcut_text_0224'));
      expect(await (await recycleQaNode(driver, 'note-trash-cleanup')).isEnabled(), caseName('RecycleUiQa', '0010'), 'RecycleUiQa.test.ets:A0048').assertFalse();
      expect(await (await recycleQaNode(driver, 'note-trash-reload')).isEnabled(), caseName('RecycleUiQa', '0010'), 'RecycleUiQa.test.ets:A0049').assertTrue();
      fixture.storage.failRead = false;
      await recycleQaClick(driver, 'note-trash-reload');
      await session.guard(recycleQaUntil(fixture.store, (): boolean => !fixture.store.snapshot().loading));
      expect(fixture.store.snapshot().ready, caseName('RecycleUiQa', '0010'), 'RecycleUiQa.test.ets:A0050').assertTrue();
      expect(fixture.storage.writes, caseName('RecycleUiQa', '0010'), 'RecycleUiQa.test.ets:A0051').assertEqual(0);
      expect(await recycleQaText(driver, 'note-trash-empty'), caseName('RecycleUiQa', '0010'), 'RecycleUiQa.test.ets:A0052').assertEqual(uiText('shortcut_text_0304'));
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLEUIQA_1100
     * @tc.name testRecycleUiQa0011
     * @tc.desc The production close action invokes its supplied callback and unmounts the panel
     * without purging or restoring anything.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('RecycleUiQa', '0011'), 0, async (session: UiTestSession): Promise<void> => {
      const currentRecycleUiQa = (): RecycleUiQaFixture => fixtureForSession(session);
      const driver = await launchRecycleUiQa('seeded', session);
      const fixture = currentRecycleUiQa();
      await recycleQaClick(driver, 'note-trash-close');
      expect(await recycleQaText(driver, 'recycle-qa-closed'), caseName('RecycleUiQa', '0011'), 'RecycleUiQa.test.ets:A0053').assertEqual('回收站已关闭');
      const panel = await driver.findComponent(ON.id('note-trash-panel'));
      expect(panel === null || panel === undefined, caseName('RecycleUiQa', '0011'), 'RecycleUiQa.test.ets:A0054').assertTrue();
      expect(fixture.storage.value, caseName('RecycleUiQa', '0011'), 'RecycleUiQa.test.ets:A0055').assertEqual(fixture.baseline);
      expect(fixture.store.snapshot().recycledNotes[0].trashId, caseName('RecycleUiQa', '0011'), 'RecycleUiQa.test.ets:A0056').assertEqual(fixture.trashId);
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLEUIQA_1200
     * @tc.name testRecycleUiQa0012
     * @tc.desc Actual active-note capacity gates restore, while releasing one genuine note slot
     * makes the same retained item recoverable.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('RecycleUiQa', '0012'), 0, async (session: UiTestSession): Promise<void> => {
      const currentRecycleUiQa = (): RecycleUiQaFixture => fixtureForSession(session);
      const driver = await launchRecycleUiQa('capacity', session);
      const fixture = currentRecycleUiQa();
      expect(await recycleQaText(driver, 'note-trash-capacity'), caseName('RecycleUiQa', '0012'), 'RecycleUiQa.test.ets:A0057').assertEqual(uiText('shortcut_text_0310'));
      expect(await (await recycleQaNode(driver, `trash-restore-${fixture.trashId}`)).isEnabled(), caseName('RecycleUiQa', '0012'), 'RecycleUiQa.test.ets:A0058').assertFalse();
      expect(await (await recycleQaNode(driver, `trash-purge-${fixture.trashId}`)).isEnabled(), caseName('RecycleUiQa', '0012'), 'RecycleUiQa.test.ets:A0059').assertTrue();
      const activeId = fixture.store.snapshot().notes[0].id;
      session.requireLive();
      await session.guard(fixture.store.moveNoteToTrash(activeId));
      expect(await (await recycleQaNode(driver, `trash-restore-${fixture.trashId}`)).isEnabled(), caseName('RecycleUiQa', '0012'), 'RecycleUiQa.test.ets:A0060').assertTrue();
      await recycleQaClick(driver, `trash-restore-${fixture.trashId}`);
      await session.guard(recycleQaUntil(fixture.store, (): boolean => !fixture.store.snapshot().busy));
      expect(fixture.store.snapshot().notes.length, caseName('RecycleUiQa', '0012'), 'RecycleUiQa.test.ets:A0061').assertEqual(MAX_ACTIVE_NOTES);
      expect(fixture.store.snapshot().notes.some((note): boolean => note.id === fixture.noteId), caseName('RecycleUiQa', '0012'), 'RecycleUiQa.test.ets:A0062').assertTrue();
      expect(fixture.store.snapshot().recycledNotes[0].note.id, caseName('RecycleUiQa', '0012'), 'RecycleUiQa.test.ets:A0063').assertEqual(activeId);
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLEUIQA_1300
     * @tc.name testRecycleUiQa0013
     * @tc.desc Refresh observes a newly elapsed retention window and changes real restore/cleanup gates
     * without rewriting retained data.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('RecycleUiQa', '0013'), 0, async (session: UiTestSession): Promise<void> => {
      const currentRecycleUiQa = (): RecycleUiQaFixture => fixtureForSession(session);
      const driver = await launchRecycleUiQa('seeded', session);
      const fixture = currentRecycleUiQa();
      fixture.expireRetainedItems();
      await recycleQaClick(driver, 'note-trash-refresh');
      expect(await (await recycleQaNode(driver, `trash-restore-${fixture.trashId}`)).isEnabled(), caseName('RecycleUiQa', '0013'), 'RecycleUiQa.test.ets:A0064').assertFalse();
      expect(await (await recycleQaNode(driver, 'note-trash-cleanup')).isEnabled(), caseName('RecycleUiQa', '0013'), 'RecycleUiQa.test.ets:A0065').assertTrue();
      expect(await recycleQaText(driver, 'note-trash-summary'), caseName('RecycleUiQa', '0013'), 'RecycleUiQa.test.ets:A0066').assertEqual(uiText('shortcut_text_0299', ['1', String(MAX_RECYCLED_NOTES), '1']));
      expect(fixture.storage.value, caseName('RecycleUiQa', '0013'), 'RecycleUiQa.test.ets:A0067').assertEqual(fixture.baseline);
      expect(fixture.storage.writes, caseName('RecycleUiQa', '0013'), 'RecycleUiQa.test.ets:A0068').assertEqual(fixture.baselineWrites);
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLEUIQA_1400
     * @tc.name testRecycleUiQa0014
     * @tc.desc Actual multiselect creates a zero-I/O three-target restore preview
     * and cancelling destroys its authority without changing notes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('RecycleUiQa', '0014'), 0, async (session: UiTestSession): Promise<void> => {
      const currentRecycleUiQa = (): RecycleUiQaFixture => fixtureForSession(session);
      const driver = await launchRecycleUiQa('batch', session);
      const fixture = currentRecycleUiQa();
      await recycleQaClick(driver, 'note-trash-multiselect');
      expect(await (await recycleQaNode(driver, 'note-trash-batch-restore')).isEnabled(), caseName('RecycleUiQa', '0014'), 'RecycleUiQa.test.ets:A0069').assertFalse();
      await recycleQaClick(driver, 'note-trash-select-all-restorable');
      await recycleQaClick(driver, 'note-trash-batch-restore');
      const preview = recycleQaPreview(fixture);
      expect(preview.selectedCount, caseName('RecycleUiQa', '0014'), 'RecycleUiQa.test.ets:A0070').assertEqual(3);
      expect(preview.action, caseName('RecycleUiQa', '0014'), 'RecycleUiQa.test.ets:A0071').assertEqual(RecycleBatchAction.RESTORE);
      expect(await (await recycleQaNode(driver, 'note-trash-batch-confirm')).isEnabled(), caseName('RecycleUiQa', '0014'), 'RecycleUiQa.test.ets:A0072').assertTrue();
      await recycleQaClick(driver, 'note-trash-batch-cancel');
      expect(fixture.store.snapshot().recycleBatchPreview === undefined, caseName('RecycleUiQa', '0014'), 'RecycleUiQa.test.ets:A0073').assertTrue();
      expect(fixture.store.snapshot().notes.length, caseName('RecycleUiQa', '0014'), 'RecycleUiQa.test.ets:A0074').assertEqual(0);
      expect(fixture.storage.writes, caseName('RecycleUiQa', '0014'), 'RecycleUiQa.test.ets:A0075').assertEqual(fixture.baselineWrites);
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLEUIQA_1500
     * @tc.name testRecycleUiQa0015
     * @tc.desc Cancelling the real confirmation returns the original selection for review,
     * then a narrower selection commits only its two targets.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('RecycleUiQa', '0015'), 0, async (session: UiTestSession): Promise<void> => {
      const currentRecycleUiQa = (): RecycleUiQaFixture => fixtureForSession(session);
      const driver = await launchRecycleUiQa('batch', session);
      const fixture = currentRecycleUiQa();
      await recycleQaClick(driver, 'note-trash-multiselect');
      await recycleQaClick(driver, 'note-trash-select-all');
      await recycleQaClick(driver, 'note-trash-batch-restore');
      await recycleQaClick(driver, 'note-trash-batch-confirm');
      await recycleQaDialog(driver, uiText('shortcut_text_0452'), uiText('shortcut_text_0478'));
      expect(await (await recycleQaNode(driver, `trash-select-${fixture.trashId}`)).isChecked(), caseName('RecycleUiQa', '0015'), 'RecycleUiQa.test.ets:A0076').assertTrue();
      expect(fixture.storage.value, caseName('RecycleUiQa', '0015'), 'RecycleUiQa.test.ets:A0077').assertEqual(fixture.baseline);
      await recycleQaClick(driver, `trash-select-${fixture.trashId}`);
      await recycleQaClick(driver, 'note-trash-batch-restore');
      expect(recycleQaPreview(fixture).selectedCount, caseName('RecycleUiQa', '0015'), 'RecycleUiQa.test.ets:A0078').assertEqual(2);
      await recycleQaClick(driver, 'note-trash-batch-confirm');
      await recycleQaDialog(driver, uiText('shortcut_text_0425'), uiText('shortcut_text_0478'));
      await session.guard(recycleQaUntil(fixture.store, (): boolean => !fixture.store.snapshot().busy));
      expect(fixture.store.snapshot().notes.length, caseName('RecycleUiQa', '0015'), 'RecycleUiQa.test.ets:A0079').assertEqual(2);
      expect(fixture.store.snapshot().recycledNotes[0].trashId, caseName('RecycleUiQa', '0015'), 'RecycleUiQa.test.ets:A0080').assertEqual(fixture.trashId);
      expect(fixture.storage.writes, caseName('RecycleUiQa', '0015'), 'RecycleUiQa.test.ets:A0081').assertEqual(fixture.baselineWrites + 1);
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLEUIQA_1600
     * @tc.name testRecycleUiQa0016
     * @tc.desc Selecting expired and live rows rejects the whole restore;
     * the explicit restorable selector excludes only expired targets.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('RecycleUiQa', '0016'), 0, async (session: UiTestSession): Promise<void> => {
      const currentRecycleUiQa = (): RecycleUiQaFixture => fixtureForSession(session);
      const driver = await launchRecycleUiQa('batchExpired', session);
      const fixture = currentRecycleUiQa();
      await recycleQaClick(driver, 'note-trash-multiselect');
      await recycleQaClick(driver, 'note-trash-select-all');
      await recycleQaClick(driver, 'note-trash-batch-restore');
      const rejected = recycleQaPreview(fixture);
      const old = rejected.rows.find((row): boolean => row.trashId === fixture.trashId);
      if (old === undefined) { throw new Error('Expired target was silently omitted from the preview'); }
      expect(old.reason, caseName('RecycleUiQa', '0016'), 'RecycleUiQa.test.ets:A0082').assertEqual(uiText('shortcut_text_0157'));
      expect(await (await recycleQaNode(driver, 'note-trash-batch-confirm')).isEnabled(), caseName('RecycleUiQa', '0016'), 'RecycleUiQa.test.ets:A0083').assertFalse();
      expect(fixture.storage.writes, caseName('RecycleUiQa', '0016'), 'RecycleUiQa.test.ets:A0084').assertEqual(fixture.baselineWrites);
      await recycleQaClick(driver, 'note-trash-batch-cancel');
      await recycleQaClick(driver, 'note-trash-select-all-restorable');
      expect(await (await recycleQaNode(driver, `trash-select-${fixture.trashId}`)).isChecked(), caseName('RecycleUiQa', '0016'), 'RecycleUiQa.test.ets:A0085').assertFalse();
      await recycleQaClick(driver, 'note-trash-batch-restore');
      expect(recycleQaPreview(fixture).selectedCount, caseName('RecycleUiQa', '0016'), 'RecycleUiQa.test.ets:A0086').assertEqual(2);
      expect(recycleQaPreview(fixture).eligible, caseName('RecycleUiQa', '0016'), 'RecycleUiQa.test.ets:A0087').assertTrue();
      expect(fixture.store.snapshot().notes.length, caseName('RecycleUiQa', '0016'), 'RecycleUiQa.test.ets:A0088').assertEqual(0);
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLEUIQA_1700
     * @tc.name testRecycleUiQa0017
     * @tc.desc The production batch preview reports aggregate slot shortage
     * and never silently truncates the user's three selected targets.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('RecycleUiQa', '0017'), 0, async (session: UiTestSession): Promise<void> => {
      const currentRecycleUiQa = (): RecycleUiQaFixture => fixtureForSession(session);
      const driver = await launchRecycleUiQa('batchCapacity', session);
      const fixture = currentRecycleUiQa();
      await recycleQaClick(driver, 'note-trash-multiselect');
      await recycleQaClick(driver, 'note-trash-select-all-restorable');
      await recycleQaClick(driver, 'note-trash-batch-restore');
      const preview = recycleQaPreview(fixture);
      expect(preview.selectedCount, caseName('RecycleUiQa', '0017'), 'RecycleUiQa.test.ets:A0089').assertEqual(3);
      expect(preview.availableSlots, caseName('RecycleUiQa', '0017'), 'RecycleUiQa.test.ets:A0090').assertEqual(2);
      expect(preview.errors.indexOf(uiText('shortcut_text_0309', ['3', '2'])) >= 0, caseName('RecycleUiQa', '0017'), 'RecycleUiQa.test.ets:A0091').assertTrue();
      expect(await (await recycleQaNode(driver, 'note-trash-batch-confirm')).isEnabled(), caseName('RecycleUiQa', '0017'), 'RecycleUiQa.test.ets:A0092').assertFalse();
      expect(fixture.storage.writes, caseName('RecycleUiQa', '0017'), 'RecycleUiQa.test.ets:A0093').assertEqual(fixture.baselineWrites);
      expect(fixture.store.snapshot().notes.length, caseName('RecycleUiQa', '0017'), 'RecycleUiQa.test.ets:A0094').assertEqual(MAX_ACTIVE_NOTES - 2);
    });
  });
}
