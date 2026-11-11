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
// 待集中验证：当前仅静态对齐正式组件/SDK，未执行本套件或任何中间门禁。
import { afterEach, describe, expect, it } from '@ohos/hypium';
import { ON } from '@kit.TestKit';
import { RecycleBatchAction } from '../../../main/ets/business/RecycleBatch';
import { MAX_ACTIVE_NOTES, MAX_RECYCLED_NOTES } from '../../../main/ets/business/NoteRecyclePolicy';
import { currentRecycleUiQa, finishRecycleUiQa, launchRecycleUiQa, recycleQaClick, recycleQaDialog,
  recycleQaNode, recycleQaPreview, recycleQaText, recycleQaUntil } from '../support/RecycleUiQaSupport';

export default function recycleUiQaTests(): void {
  describe('RecycleUiQa', (): void => {
    afterEach(async (): Promise<void> => { await finishRecycleUiQa(); });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLEUIQA_0100
     * @tc.name testRecycleUiQa0001
     * @tc.desc The actual empty recycle panel reports its scope and keeps expired cleanup disabled without a write.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecycleUiQa0001', 0, async (): Promise<void> => {
      const driver = await launchRecycleUiQa('empty');
      expect(await recycleQaText(driver, 'note-trash-empty')).assertEqual(uiText("shortcut_text_0304"));
      expect(await recycleQaText(driver, 'note-trash-summary')).assertEqual(uiText('shortcut_text_0299', ['0', String(MAX_RECYCLED_NOTES), '0']));
      expect(await (await recycleQaNode(driver, 'note-trash-cleanup')).isEnabled()).assertFalse();
      expect(currentRecycleUiQa().storage.writes).assertEqual(0);
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLEUIQA_0200
     * @tc.name testRecycleUiQa0002
     * @tc.desc The real restore button returns both the original note and its retained production revision history.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecycleUiQa0002', 0, async (): Promise<void> => {
      const driver = await launchRecycleUiQa('seeded');
      const fixture = currentRecycleUiQa();
      await recycleQaClick(driver, `trash-restore-${fixture.trashId}`);
      await recycleQaUntil(fixture.store, (): boolean => !fixture.store.snapshot().busy);
      expect(await recycleQaText(driver, 'note-trash-status')).assertEqual(uiText("shortcut_text_0091"));
      expect(fixture.store.snapshot().notes[0].body).assertEqual('qa-recycle-private-body');
      expect(fixture.store.snapshot().notes[0].id).assertEqual(fixture.noteId);
      expect(fixture.store.historyFor(fixture.noteId)[0].action).assertEqual('create');
      expect(await recycleQaText(driver, 'note-trash-empty')).assertEqual(uiText("shortcut_text_0304"));
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
    it('testRecycleUiQa0003', 0, async (): Promise<void> => {
      const driver = await launchRecycleUiQa('seeded');
      const fixture = currentRecycleUiQa();
      await recycleQaClick(driver, `trash-purge-${fixture.trashId}`);
      await recycleQaDialog(driver, uiText("shortcut_text_0452"));
      expect(fixture.storage.value).assertEqual(fixture.baseline);
      expect(await (await recycleQaNode(driver, `trash-restore-${fixture.trashId}`)).isEnabled()).assertTrue();
      expect(fixture.store.snapshot().recycledNotes[0].history[0].action).assertEqual('create');
      expect(fixture.storage.writes).assertEqual(fixture.baselineWrites);
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
    it('testRecycleUiQa0004', 0, async (): Promise<void> => {
      const driver = await launchRecycleUiQa('seeded');
      const fixture = currentRecycleUiQa();
      await recycleQaClick(driver, `trash-purge-${fixture.trashId}`);
      await recycleQaDialog(driver, uiText("shortcut_text_0696"));
      await recycleQaUntil(fixture.store, (): boolean => !fixture.store.snapshot().busy);
      expect(await recycleQaText(driver, 'note-trash-status')).assertEqual(uiText("shortcut_text_0687"));
      expect(fixture.store.snapshot().notes.length).assertEqual(0);
      expect(fixture.store.historyFor(fixture.noteId).length).assertEqual(0);
      expect(fixture.storage.value.indexOf('qa-recycle-private-body')).assertEqual(-1);
      expect(await recycleQaText(driver, 'note-trash-empty')).assertEqual(uiText("shortcut_text_0304"));
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLEUIQA_0500
     * @tc.name testRecycleUiQa0005
     * @tc.desc Mixed-expiry scope disables only the expired restore and actual cleanup retains the unexpired item.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecycleUiQa0005', 0, async (): Promise<void> => {
      const driver = await launchRecycleUiQa('mixedExpiry');
      const fixture = currentRecycleUiQa();
      expect(await (await recycleQaNode(driver, `trash-restore-${fixture.trashId}`)).isEnabled()).assertFalse();
      expect(await (await recycleQaNode(driver, `trash-restore-${fixture.recentTrashId}`)).isEnabled()).assertTrue();
      expect(await recycleQaText(driver, 'note-trash-summary')).assertEqual(uiText('shortcut_text_0299', ['2', String(MAX_RECYCLED_NOTES), '1']));
      await recycleQaClick(driver, 'note-trash-cleanup');
      await recycleQaDialog(driver, uiText("shortcut_text_0441"), uiText("shortcut_text_0440"));
      await recycleQaUntil(fixture.store, (): boolean => !fixture.store.snapshot().busy);
      expect(await recycleQaText(driver, 'note-trash-status')).assertEqual(uiText('shortcut_text_0668', ['1']));
      expect(fixture.store.snapshot().recycledNotes[0].trashId).assertEqual(fixture.recentTrashId);
      expect(await (await recycleQaNode(driver, 'note-trash-cleanup')).isEnabled()).assertFalse();
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
    it('testRecycleUiQa0006', 0, async (): Promise<void> => {
      const driver = await launchRecycleUiQa('pending');
      const fixture = currentRecycleUiQa();
      await recycleQaClick(driver, `trash-restore-${fixture.trashId}`);
      expect(await recycleQaText(driver, 'note-trash-busy')).assertEqual(uiText("shortcut_text_0167"));
      expect(await (await recycleQaNode(driver, `trash-purge-${fixture.trashId}`)).isEnabled()).assertFalse();
      expect(await (await recycleQaNode(driver, 'note-trash-refresh')).isEnabled()).assertFalse();
      expect(fixture.store.snapshot().notes.length).assertEqual(0);
      fixture.release();
      await recycleQaUntil(fixture.store, (): boolean => !fixture.store.snapshot().busy);
      expect(await recycleQaText(driver, 'note-trash-status')).assertEqual(uiText("shortcut_text_0091"));
      expect(fixture.storage.writes).assertEqual(fixture.baselineWrites + 1);
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
    it('testRecycleUiQa0007', 0, async (): Promise<void> => {
      const driver = await launchRecycleUiQa('writeFailure');
      const fixture = currentRecycleUiQa();
      await recycleQaClick(driver, `trash-restore-${fixture.trashId}`);
      await recycleQaUntil(fixture.store, (): boolean => !fixture.store.snapshot().busy);
      expect(await recycleQaText(driver, 'note-trash-status')).assertEqual(uiText("shortcut_text_0049"));
      expect(fixture.storage.value).assertEqual(fixture.baseline);
      expect(await (await recycleQaNode(driver, `trash-restore-${fixture.trashId}`)).isEnabled()).assertTrue();
      await recycleQaClick(driver, `trash-restore-${fixture.trashId}`);
      await recycleQaUntil(fixture.store, (): boolean => !fixture.store.snapshot().busy);
      expect(fixture.store.snapshot().notes[0].id).assertEqual(fixture.noteId);
      expect(fixture.storage.writes).assertEqual(fixture.baselineWrites + 2);
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLEUIQA_0800
     * @tc.name testRecycleUiQa0008
     * @tc.desc An uncertain applied restore requires the actual reread entry and never blindly repeats the write.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecycleUiQa0008', 0, async (): Promise<void> => {
      const driver = await launchRecycleUiQa('uncertainApplied');
      const fixture = currentRecycleUiQa();
      await recycleQaClick(driver, `trash-restore-${fixture.trashId}`);
      await recycleQaUntil(fixture.store, (): boolean => !fixture.store.snapshot().busy);
      expect(await recycleQaText(driver, 'note-trash-status')).assertEqual(uiText("shortcut_text_0617"));
      expect(await (await recycleQaNode(driver, `trash-restore-${fixture.trashId}`)).isEnabled()).assertFalse();
      expect(await (await recycleQaNode(driver, `trash-purge-${fixture.trashId}`)).isEnabled()).assertFalse();
      await recycleQaClick(driver, 'note-trash-reload');
      await recycleQaUntil(fixture.store, (): boolean => !fixture.store.snapshot().busy);
      expect(await recycleQaText(driver, 'note-trash-status')).assertEqual(uiText('shortcut_text_0024', [uiText('shortcut_text_0091')]));
      expect(fixture.storage.reloads).assertEqual(1);
      expect(fixture.storage.writes).assertEqual(fixture.baselineWrites + 1);
      expect(fixture.store.snapshot().notes[0].id).assertEqual(fixture.noteId);
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
    it('testRecycleUiQa0009', 0, async (): Promise<void> => {
      const driver = await launchRecycleUiQa('seeded');
      const fixture = currentRecycleUiQa();
      await recycleQaClick(driver, `trash-purge-${fixture.trashId}`);
      await fixture.store.restoreTrashedNote(fixture.trashId);
      await recycleQaDialog(driver, uiText("shortcut_text_0696"));
      expect(await recycleQaText(driver, 'note-trash-status')).assertEqual(uiText("shortcut_text_0297"));
      expect(fixture.store.snapshot().notes[0].id).assertEqual(fixture.noteId);
      expect(fixture.store.historyFor(fixture.noteId)[0].body).assertEqual('qa-recycle-private-body');
      expect(fixture.storage.writes).assertEqual(fixture.baselineWrites + 1);
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
    it('testRecycleUiQa0010', 0, async (): Promise<void> => {
      const driver = await launchRecycleUiQa('readFailure');
      const fixture = currentRecycleUiQa();
      expect(await recycleQaText(driver, 'note-trash-status')).assertEqual(uiText("shortcut_text_0224"));
      expect(await (await recycleQaNode(driver, 'note-trash-cleanup')).isEnabled()).assertFalse();
      expect(await (await recycleQaNode(driver, 'note-trash-reload')).isEnabled()).assertTrue();
      fixture.storage.failRead = false;
      await recycleQaClick(driver, 'note-trash-reload');
      await recycleQaUntil(fixture.store, (): boolean => !fixture.store.snapshot().loading);
      expect(fixture.store.snapshot().ready).assertTrue();
      expect(fixture.storage.writes).assertEqual(0);
      expect(await recycleQaText(driver, 'note-trash-empty')).assertEqual(uiText("shortcut_text_0304"));
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
    it('testRecycleUiQa0011', 0, async (): Promise<void> => {
      const driver = await launchRecycleUiQa('seeded');
      const fixture = currentRecycleUiQa();
      await recycleQaClick(driver, 'note-trash-close');
      expect(await recycleQaText(driver, 'recycle-qa-closed')).assertEqual('回收站已关闭');
      const panel = await driver.findComponent(ON.id('note-trash-panel'));
      expect(panel === null || panel === undefined).assertTrue();
      expect(fixture.storage.value).assertEqual(fixture.baseline);
      expect(fixture.store.snapshot().recycledNotes[0].trashId).assertEqual(fixture.trashId);
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
    it('testRecycleUiQa0012', 0, async (): Promise<void> => {
      const driver = await launchRecycleUiQa('capacity');
      const fixture = currentRecycleUiQa();
      expect(await recycleQaText(driver, 'note-trash-capacity')).assertEqual(uiText("shortcut_text_0310"));
      expect(await (await recycleQaNode(driver, `trash-restore-${fixture.trashId}`)).isEnabled()).assertFalse();
      expect(await (await recycleQaNode(driver, `trash-purge-${fixture.trashId}`)).isEnabled()).assertTrue();
      const activeId = fixture.store.snapshot().notes[0].id;
      await fixture.store.moveNoteToTrash(activeId);
      expect(await (await recycleQaNode(driver, `trash-restore-${fixture.trashId}`)).isEnabled()).assertTrue();
      await recycleQaClick(driver, `trash-restore-${fixture.trashId}`);
      await recycleQaUntil(fixture.store, (): boolean => !fixture.store.snapshot().busy);
      expect(fixture.store.snapshot().notes.length).assertEqual(MAX_ACTIVE_NOTES);
      expect(fixture.store.snapshot().notes.some((note): boolean => note.id === fixture.noteId)).assertTrue();
      expect(fixture.store.snapshot().recycledNotes[0].note.id).assertEqual(activeId);
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
    it('testRecycleUiQa0013', 0, async (): Promise<void> => {
      const driver = await launchRecycleUiQa('seeded');
      const fixture = currentRecycleUiQa();
      fixture.expireRetainedItems();
      await recycleQaClick(driver, 'note-trash-refresh');
      expect(await (await recycleQaNode(driver, `trash-restore-${fixture.trashId}`)).isEnabled()).assertFalse();
      expect(await (await recycleQaNode(driver, 'note-trash-cleanup')).isEnabled()).assertTrue();
      expect(await recycleQaText(driver, 'note-trash-summary')).assertEqual(uiText('shortcut_text_0299', ['1', String(MAX_RECYCLED_NOTES), '1']));
      expect(fixture.storage.value).assertEqual(fixture.baseline);
      expect(fixture.storage.writes).assertEqual(fixture.baselineWrites);
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
    it('testRecycleUiQa0014', 0, async (): Promise<void> => {
      const driver = await launchRecycleUiQa('batch');
      const fixture = currentRecycleUiQa();
      await recycleQaClick(driver, 'note-trash-multiselect');
      expect(await (await recycleQaNode(driver, 'note-trash-batch-restore')).isEnabled()).assertFalse();
      await recycleQaClick(driver, 'note-trash-select-all-restorable');
      await recycleQaClick(driver, 'note-trash-batch-restore');
      const preview = recycleQaPreview(fixture);
      expect(preview.selectedCount).assertEqual(3);
      expect(preview.action).assertEqual(RecycleBatchAction.RESTORE);
      expect(await (await recycleQaNode(driver, 'note-trash-batch-confirm')).isEnabled()).assertTrue();
      await recycleQaClick(driver, 'note-trash-batch-cancel');
      expect(fixture.store.snapshot().recycleBatchPreview === undefined).assertTrue();
      expect(fixture.store.snapshot().notes.length).assertEqual(0);
      expect(fixture.storage.writes).assertEqual(fixture.baselineWrites);
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
    it('testRecycleUiQa0015', 0, async (): Promise<void> => {
      const driver = await launchRecycleUiQa('batch');
      const fixture = currentRecycleUiQa();
      await recycleQaClick(driver, 'note-trash-multiselect');
      await recycleQaClick(driver, 'note-trash-select-all');
      await recycleQaClick(driver, 'note-trash-batch-restore');
      await recycleQaClick(driver, 'note-trash-batch-confirm');
      await recycleQaDialog(driver, uiText("shortcut_text_0452"), uiText("shortcut_text_0478"));
      expect(await (await recycleQaNode(driver, `trash-select-${fixture.trashId}`)).isChecked()).assertTrue();
      expect(fixture.storage.value).assertEqual(fixture.baseline);
      await recycleQaClick(driver, `trash-select-${fixture.trashId}`);
      await recycleQaClick(driver, 'note-trash-batch-restore');
      expect(recycleQaPreview(fixture).selectedCount).assertEqual(2);
      await recycleQaClick(driver, 'note-trash-batch-confirm');
      await recycleQaDialog(driver, uiText("shortcut_text_0425"), uiText("shortcut_text_0478"));
      await recycleQaUntil(fixture.store, (): boolean => !fixture.store.snapshot().busy);
      expect(fixture.store.snapshot().notes.length).assertEqual(2);
      expect(fixture.store.snapshot().recycledNotes[0].trashId).assertEqual(fixture.trashId);
      expect(fixture.storage.writes).assertEqual(fixture.baselineWrites + 1);
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
    it('testRecycleUiQa0016', 0, async (): Promise<void> => {
      const driver = await launchRecycleUiQa('batchExpired');
      const fixture = currentRecycleUiQa();
      await recycleQaClick(driver, 'note-trash-multiselect');
      await recycleQaClick(driver, 'note-trash-select-all');
      await recycleQaClick(driver, 'note-trash-batch-restore');
      const rejected = recycleQaPreview(fixture);
      const old = rejected.rows.find((row): boolean => row.trashId === fixture.trashId);
      if (old === undefined) { throw new Error('Expired target was silently omitted from the preview'); }
      expect(old.reason).assertEqual(uiText("shortcut_text_0157"));
      expect(await (await recycleQaNode(driver, 'note-trash-batch-confirm')).isEnabled()).assertFalse();
      expect(fixture.storage.writes).assertEqual(fixture.baselineWrites);
      await recycleQaClick(driver, 'note-trash-batch-cancel');
      await recycleQaClick(driver, 'note-trash-select-all-restorable');
      expect(await (await recycleQaNode(driver, `trash-select-${fixture.trashId}`)).isChecked()).assertFalse();
      await recycleQaClick(driver, 'note-trash-batch-restore');
      expect(recycleQaPreview(fixture).selectedCount).assertEqual(2);
      expect(recycleQaPreview(fixture).eligible).assertTrue();
      expect(fixture.store.snapshot().notes.length).assertEqual(0);
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
    it('testRecycleUiQa0017', 0, async (): Promise<void> => {
      const driver = await launchRecycleUiQa('batchCapacity');
      const fixture = currentRecycleUiQa();
      await recycleQaClick(driver, 'note-trash-multiselect');
      await recycleQaClick(driver, 'note-trash-select-all-restorable');
      await recycleQaClick(driver, 'note-trash-batch-restore');
      const preview = recycleQaPreview(fixture);
      expect(preview.selectedCount).assertEqual(3);
      expect(preview.availableSlots).assertEqual(2);
      expect(preview.errors.indexOf(uiText('shortcut_text_0309', ['3', '2'])) >= 0).assertTrue();
      expect(await (await recycleQaNode(driver, 'note-trash-batch-confirm')).isEnabled()).assertFalse();
      expect(fixture.storage.writes).assertEqual(fixture.baselineWrites);
      expect(fixture.store.snapshot().notes.length).assertEqual(MAX_ACTIVE_NOTES - 2);
    });
  });
}
