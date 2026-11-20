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

import { Level, Size, TestType, describe, expect, it } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import inputMethodEngine from '@ohos.inputMethodEngine';
import { yieldToEventLoop } from '../support/AsyncSupport';
import { PreviewHarness, createPreviewHarness, typeSequence } from '../support/PreviewHarness';
import { InputHandler } from '../../../../main/ets/InputMethodExtensionAbility/model/KeyboardController';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodAttributeRace]';

export default function FaultRaceSuiteTest(): void {
  describe('FaultRaceSuite', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ATTRIBUTE_RACE_0001
     * @tc.name      testAttributeRaceTest_001
     * @tc.desc      Verify that a late first attach overwrites the newer attribute and is forwarded.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testAttributeRaceTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAttributeRaceTest_001 begin');
      const first: PreviewHarness = await createPreviewHarness('', 1, 0, true, true);
      const second: PreviewHarness = await createPreviewHarness('', 7, 0, true, false);
      first.client.resolveAttribute();
      await Promise.resolve();
      await Promise.resolve();

      InputHandler.getInstance().sendKeyFunction();

      // The late first resolution overwrites the newer attribute in the singleton.
      expect(second.client.keyFunctions.length).assertEqual(1);
      expect(second.client.keyFunctions[0]).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAttributeRaceTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_DEFERRED_RACE_0001
     * @tc.name      testDeferredRace_001
     * @tc.desc      Verify that enter before a deferred settle uses the previous type and afterwards the new type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDeferredRace_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeferredRace_001 begin');
      const settled: PreviewHarness = await createPreviewHarness('', 4);
      const pending: PreviewHarness = await createPreviewHarness('', 9, 0, true, true);
      InputHandler.getInstance().sendKeyFunction();
      pending.client.resolveAttribute();
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().sendKeyFunction();
      expect(settled.client.keyFunctions.length).assertEqual(0);
      expect(pending.client.keyFunctions.join('|')).assertEqual('4|9');
      expect(pending.client.finishCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeferredRace_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_DEFERRED_RACE_0002
     * @tc.name      testDeferredRace_002
     * @tc.desc      Verify that a preview opens while the attribute is pending and settling does not reopen it.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDeferredRace_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeferredRace_002 begin');
      const pending: PreviewHarness = await createPreviewHarness('', 12, 0, true, true);
      typeSequence(pending, 'hel');
      expect(pending.client.previewCalls.length).assertEqual(1);
      expect(pending.client.previewCalls[0].end).assertEqual(3);
      expect(pending.client.editorAttributeCount).assertEqual(1);
      pending.client.resolveAttribute();
      await Promise.resolve();
      await Promise.resolve();
      expect(pending.client.previewCalls.length).assertEqual(1);
      expect(pending.client.insertedTexts.join('')).assertEqual('hel');
      expect(pending.client.buffer).assertEqual('hello world');
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeferredRace_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_DEFERRED_RACE_0003
     * @tc.name      testDeferredRace_003
     * @tc.desc      Verify that a pending attach with existing text keeps the two-character offset in the window.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDeferredRace_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeferredRace_003 begin');
      const pending: PreviewHarness = await createPreviewHarness('ab', 0, 0, true, true);
      typeSequence(pending, 'hel');
      expect(pending.client.previewCalls.length).assertEqual(1);
      expect(pending.client.previewCalls[0].start).assertEqual(2);
      expect(pending.client.previewCalls[0].end).assertEqual(5);
      expect(pending.client.buffer).assertEqual('abhello world');
      expect(pending.client.buffer.length).assertEqual(13);
      expect(pending.client.editorAttributeCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeferredRace_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_DEFERRED_RACE_0004
     * @tc.name      testDeferredRace_004
     * @tc.desc      Verify that settling two deferred attaches in attach order leaves the newest type in force.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDeferredRace_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeferredRace_004 begin');
      const older: PreviewHarness = await createPreviewHarness('', 2, 0, true, true);
      const newer: PreviewHarness = await createPreviewHarness('', 6, 0, true, true);
      older.client.resolveAttribute();
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().sendKeyFunction();
      newer.client.resolveAttribute();
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().sendKeyFunction();
      expect(older.client.editorAttributeCount).assertEqual(1);
      expect(newer.client.editorAttributeCount).assertEqual(1);
      expect(newer.client.keyFunctions.join('|')).assertEqual('2|6');
      expect(newer.client.finishCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeferredRace_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_DEFERRED_RACE_0005
     * @tc.name      testDeferredRace_005
     * @tc.desc      Verify that a rejected attach command still publishes both deferred attribute values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDeferredRace_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeferredRace_005 begin');
      const pending: PreviewHarness = await createPreviewHarness('', 3, 8, true, true, true);
      typeSequence(pending, 'hel');
      expect(pending.client.privateCommandCount).assertEqual(1);
      expect(pending.client.previewCalls.length).assertEqual(1);
      pending.client.resolveAttribute();
      await Promise.resolve();
      await Promise.resolve();
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(3);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(8);
      expect(pending.client.buffer).assertEqual('hello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeferredRace_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_DEFERRED_RACE_0006
     * @tc.name      testDeferredRace_006
     * @tc.desc      Verify that an unsupported pending editor receives the trigger window before it settles.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDeferredRace_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeferredRace_006 begin');
      const pending: PreviewHarness = await createPreviewHarness('', 0, 0, false, true);
      typeSequence(pending, 'hel');
      expect(pending.client.previewCalls.length).assertEqual(1);
      expect(pending.client.previewCalls[0].text).assertEqual('hello world');
      expect(pending.client.previewCalls[0].start).assertEqual(0);
      expect(pending.client.previewCalls[0].end).assertEqual(3);
      pending.client.resolveAttribute();
      await Promise.resolve();
      await Promise.resolve();
      expect(pending.client.previewCalls.length).assertEqual(1);
      expect(pending.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeferredRace_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_DEFERRED_RACE_0007
     * @tc.name      testDeferredRace_007
     * @tc.desc      Verify that deletions, caret moves and edit actions route to a pending client.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDeferredRace_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeferredRace_007 begin');
      const pending: PreviewHarness = await createPreviewHarness('base', 0, 0, true, true);
      InputHandler.getInstance().deleteBackward(3);
      InputHandler.getInstance().deleteForward(2);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.COPY);
      expect(pending.client.backwardLengths.join('|')).assertEqual('3');
      expect(pending.client.forwardLengths.join('|')).assertEqual('2');
      expect(pending.client.movedDirections[0]).assertEqual(inputMethodEngine.Direction.CURSOR_LEFT);
      expect(pending.client.extendActions[0]).assertEqual(inputMethodEngine.ExtendAction.COPY);
      expect(pending.client.finishCount).assertEqual(0);
      expect(pending.client.buffer).assertEqual('base');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeferredRace_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_DEFERRED_RACE_0008
     * @tc.name      testDeferredRace_008
     * @tc.desc      Verify that resolving an already settled attach a second time changes no count or type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDeferredRace_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeferredRace_008 begin');
      const pending: PreviewHarness = await createPreviewHarness('', 15, 0, true, true);
      pending.client.resolveAttribute();
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().sendKeyFunction();
      pending.client.resolveAttribute();
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().sendKeyFunction();
      expect(pending.client.editorAttributeCount).assertEqual(1);
      expect(pending.client.keyFunctions.join('|')).assertEqual('15|15');
      expect(pending.client.finishCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeferredRace_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_DEFERRED_RACE_0009
     * @tc.name      testDeferredRace_009
     * @tc.desc      Verify that three attaches of one client each request the attribute and the command.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testDeferredRace_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeferredRace_009 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      for (let i: number = 0; i < 2; i++) {
        InputHandler.getInstance().onInputStart(
          harness.keyboard as object as inputMethodEngine.KeyboardController,
          harness.client as object as inputMethodEngine.InputClient);
      }
      await Promise.resolve();
      await Promise.resolve();
      expect(harness.client.editorAttributeCount).assertEqual(3);
      expect(harness.client.privateCommandCount).assertEqual(3);
      expect(harness.client.privateCommands.length).assertEqual(3);
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.finishCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeferredRace_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_DEFERRED_RACE_0010
     * @tc.name      testDeferredRace_010
     * @tc.desc      Verify that a rejected window on a pending editor stays rejected after the attribute settles.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testDeferredRace_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeferredRace_010 begin');
      const pending: PreviewHarness = await createPreviewHarness('', 13, 0, true, true);
      pending.client.failPreview = true;
      typeSequence(pending, 'hel');
      expect(pending.client.previewCalls.length).assertEqual(0);
      expect(pending.client.buffer).assertEqual('hel');
      pending.client.resolveAttribute();
      await Promise.resolve();
      await Promise.resolve();
      expect(pending.client.previewCalls.length).assertEqual(0);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(13);
      InputHandler.getInstance().sendKeyFunction();
      expect(pending.client.finishCount).assertEqual(1);
      expect(pending.client.buffer).assertEqual('hel');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeferredRace_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_DEFERRED_RACE_0011
     * @tc.name      testDeferredRace_011
     * @tc.desc      Verify that resolving the newer attach first and the older second sends nine then two.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testDeferredRace_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeferredRace_011 begin');
      const older: PreviewHarness = await createPreviewHarness('', 2, 0, true, true);
      const newer: PreviewHarness = await createPreviewHarness('', 9, 0, true, true);
      newer.client.resolveAttribute();
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().sendKeyFunction();
      older.client.resolveAttribute();
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().sendKeyFunction();
      expect(newer.client.keyFunctions.join('|')).assertEqual('9|2');
      expect(newer.client.finishCount).assertEqual(2);
      expect(older.client.keyFunctions.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeferredRace_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_DEFERRED_RACE_0012
     * @tc.name      testDeferredRace_012
     * @tc.desc      Verify that typing x into a pending editor holding the full preview word opens no window.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testDeferredRace_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeferredRace_012 begin');
      const pending: PreviewHarness = await createPreviewHarness('hello world', 6, 0, true, true);
      InputHandler.getInstance().insertText('x');
      expect(pending.client.previewCalls.length).assertEqual(0);
      expect(pending.client.buffer).assertEqual('hello worldx');
      pending.client.resolveAttribute();
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().sendKeyFunction();
      expect(pending.client.keyFunctions.join('|')).assertEqual('6');
      expect(pending.client.finishCount).assertEqual(1);
      expect(pending.client.previewCalls.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeferredRace_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_HIDE_FAULT_0001
     * @tc.name      testHideFaultTest_001
     * @tc.desc      Verify that a rejected hide request does not block later typing.
     */
    it('testHideFaultTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHideFaultTest_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      harness.keyboard.failHide = true;
      InputHandler.getInstance().hideKeyboardSelf();
      await Promise.resolve();
      InputHandler.getInstance().insertText('a');
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.insertedTexts.join('')).assertEqual('a');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHideFaultTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_HIDE_FAULT_0002
     * @tc.name      testHideFaultTest_002
     * @tc.desc      Verify that two rejected hides are both counted and do not block enter.
     */
    it('testHideFaultTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHideFaultTest_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 4);
      harness.keyboard.failHide = true;
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().hideKeyboardSelf();
      await Promise.resolve();
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.keyboard.hideCount).assertEqual(2);
      expect(harness.client.keyFunctions[0]).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHideFaultTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_HIDE_FAULT_REATTACH_0001
     * @tc.name      testHideFaultReattach_001
     * @tc.desc      Verify that a hide after a switch reaches the new panel and leaves the old one untouched.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHideFaultReattach_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHideFaultReattach_001 begin');
      const first: PreviewHarness = await createPreviewHarness('');
      const second: PreviewHarness = await createPreviewHarness('');
      first.keyboard.failHide = true;
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().insertText('k');
      expect(first.keyboard.hideCount).assertEqual(0);
      expect(second.keyboard.hideCount).assertEqual(1);
      expect(first.client.insertedTexts.length).assertEqual(0);
      expect(second.client.insertedTexts.join('')).assertEqual('k');
      expect(second.client.buffer).assertEqual('k');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHideFaultReattach_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_HIDE_FAULT_REATTACH_0002
     * @tc.name      testHideFaultReattach_002
     * @tc.desc      Verify that a rejected hide during a preview still allows selecting to the end at the preview cursor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHideFaultReattach_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHideFaultReattach_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      harness.keyboard.failHide = true;
      typeSequence(harness, 'hel');
      InputHandler.getInstance().hideKeyboardSelf();
      await InputHandler.getInstance().selectToEnd();
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.selectedRanges.length).assertEqual(1);
      expect(harness.client.selectedRanges[0].start).assertEqual(10);
      expect(harness.client.selectedRanges[0].end).assertEqual(1000);
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHideFaultReattach_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_HIDE_FAULT_REATTACH_0003
     * @tc.name      testHideFaultReattach_003
     * @tc.desc      Verify that two failing hides on the replacement panel do not block the enter of that session.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHideFaultReattach_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHideFaultReattach_003 begin');
      const retired: PreviewHarness = await createPreviewHarness('');
      const active: PreviewHarness = await createPreviewHarness('', 7);
      retired.keyboard.failHide = true;
      active.keyboard.failHide = true;
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().sendKeyFunction();
      expect(retired.keyboard.hideCount).assertEqual(0);
      expect(active.keyboard.hideCount).assertEqual(2);
      expect(retired.client.finishCount).assertEqual(0);
      expect(active.client.keyFunctions[0]).assertEqual(7);
      expect(active.client.finishCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHideFaultReattach_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_HIDE_FAULT_REATTACH_0004
     * @tc.name      testHideFaultReattach_004
     * @tc.desc      Verify that a failing hide and a failing finish keep separate counts while text still inserts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHideFaultReattach_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHideFaultReattach_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 3, 0, true, false);
      harness.keyboard.failHide = true;
      harness.client.failFinish = true;
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().insertText('a');
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.keyFunctions.join('|')).assertEqual('3');
      expect(harness.client.insertedTexts.join('')).assertEqual('a');
      expect(harness.client.buffer).assertEqual('a');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHideFaultReattach_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_HIDE_FAULT_REATTACH_0005
     * @tc.name      testHideFaultReattach_005
     * @tc.desc      Verify that a failing hide works before a deferred attach settles and enter waits for the type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHideFaultReattach_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHideFaultReattach_005 begin');
      const pending: PreviewHarness = await createPreviewHarness('', 6, 0, true, true);
      pending.keyboard.failHide = true;
      InputHandler.getInstance().hideKeyboardSelf();
      expect(pending.keyboard.hideCount).assertEqual(1);
      expect(pending.client.keyFunctions.length).assertEqual(0);
      pending.client.resolveAttribute();
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().sendKeyFunction();
      expect(pending.client.keyFunctions[0]).assertEqual(6);
      expect(pending.client.finishCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHideFaultReattach_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_HIDE_FAULT_REATTACH_0006
     * @tc.name      testHideFaultReattach_006
     * @tc.desc      Verify that a rejected hide is followed by a zero-based begin selection without text loss.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHideFaultReattach_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHideFaultReattach_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      harness.keyboard.failHide = true;
      InputHandler.getInstance().insertText('x');
      InputHandler.getInstance().hideKeyboardSelf();
      await InputHandler.getInstance().moveCursorToBegin();
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.selectedRanges.length).assertEqual(1);
      expect(harness.client.selectedRanges[0].start).assertEqual(0);
      expect(harness.client.selectedRanges[0].end).assertEqual(0);
      expect(harness.client.buffer).assertEqual('x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHideFaultReattach_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_HIDE_FAULT_REATTACH_0007
     * @tc.name      testHideFaultReattach_007
     * @tc.desc      Verify that hides interleaved with two insertions count twice and keep both letters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHideFaultReattach_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHideFaultReattach_007 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      harness.keyboard.failHide = true;
      InputHandler.getInstance().insertText('a');
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().insertText('b');
      InputHandler.getInstance().hideKeyboardSelf();
      expect(harness.keyboard.hideCount).assertEqual(2);
      expect(harness.client.insertedTexts.join('')).assertEqual('ab');
      expect(harness.client.buffer).assertEqual('ab');
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHideFaultReattach_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_HIDE_FAULT_REATTACH_0008
     * @tc.name      testHideFaultReattach_008
     * @tc.desc      Verify that a finish fault on a retired client is not carried into the replacement session.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHideFaultReattach_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHideFaultReattach_008 begin');
      const retired: PreviewHarness = await createPreviewHarness('', 0);
      retired.client.failFinish = true;
      const active: PreviewHarness = await createPreviewHarness('', 5);
      InputHandler.getInstance().sendKeyFunction();
      expect(active.client.keyFunctions.join('|')).assertEqual('5');
      expect(active.client.finishCount).assertEqual(1);
      expect(retired.client.keyFunctions.length).assertEqual(0);
      expect(retired.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHideFaultReattach_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_FAULT_AFTER_ATTACH_0001
     * @tc.name      testFaultAfterAttachTest_001
     * @tc.desc      Verify that a rejected preview still allows the enter key to finish once.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testFaultAfterAttachTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultAfterAttachTest_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      harness.client.failPreview = true;
      typeSequence(harness, 'hel');
      await Promise.resolve();
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hel');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultAfterAttachTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_FAULT_AFTER_ATTACH_0002
     * @tc.name      testFaultAfterAttachTest_002
     * @tc.desc      Verify that a rejected private command does not stop the preview path.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testFaultAfterAttachTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultAfterAttachTest_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 0, 0, true, false, true);
      await Promise.resolve();
      typeSequence(harness, 'hel');
      InputHandler.getInstance().insertText('x');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hello worldx');
      expect(harness.client.privateCommandCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultAfterAttachTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_FAULT_PRIORITY_0001
     * @tc.name      testFaultPriority_001
     * @tc.desc      Verify that a preview fault and a finish fault together leave the raw typed prefix intact.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testFaultPriority_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultPriority_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 5);
      harness.client.failPreview = true;
      harness.client.failFinish = true;
      typeSequence(harness, 'hel');
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('hel');
      expect(harness.client.keyFunctions.join('|')).assertEqual('5');
      expect(harness.client.finishCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultPriority_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_FAULT_PRIORITY_0002
     * @tc.name      testFaultPriority_002
     * @tc.desc      Verify that enter before any preview still counts a rejected finish and the preview then opens.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testFaultPriority_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultPriority_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 2);
      harness.client.failFinish = true;
      InputHandler.getInstance().sendKeyFunction();
      typeSequence(harness, 'hel');
      expect(harness.client.keyFunctions.join('|')).assertEqual('2');
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].start).assertEqual(0);
      expect(harness.client.buffer).assertEqual('hello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultPriority_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_FAULT_PRIORITY_0003
     * @tc.name      testFaultPriority_003
     * @tc.desc      Verify that a fault raised after a healthy preview rejects the next overwrite and keeps the extra letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testFaultPriority_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultPriority_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('he');
      typeSequence(harness, 'l');
      expect(harness.client.previewCalls.length).assertEqual(1);
      harness.client.failPreview = true;
      InputHandler.getInstance().insertText('l');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hello worldl');
      expect(harness.client.getTextIndexAtCursorSync()).assertEqual(11);
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultPriority_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_FAULT_PRIORITY_0004
     * @tc.name      testFaultPriority_004
     * @tc.desc      Verify that one rejected attach command and one rejected finish keep their own counters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testFaultPriority_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultPriority_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 2, 0, true, false, true);
      harness.client.failFinish = true;
      InputHandler.getInstance().insertText('a');
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.privateCommandCount).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.keyFunctions[0]).assertEqual(2);
      expect(harness.client.insertedTexts.join('')).assertEqual('a');
      expect(harness.client.buffer).assertEqual('a');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultPriority_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_FAULT_PRIORITY_0005
     * @tc.name      testFaultPriority_005
     * @tc.desc      Verify that two enter requests under both faults record two finishes and two type sends.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testFaultPriority_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultPriority_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 1, 0, true, false, true);
      harness.client.failPreview = true;
      harness.client.failFinish = true;
      typeSequence(harness, 'hel');
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.privateCommandCount).assertEqual(1);
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.keyFunctions.join('|')).assertEqual('1|1');
      expect(harness.client.finishCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultPriority_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ASYNC_ATTACH_0001
     * @tc.name      testAsyncAttachTest_001
     * @tc.desc      Verify that text insertion works while the editor attribute is still pending.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAsyncAttachTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAsyncAttachTest_001 begin');
      // Rejected calls are caught in production; later commands must still work.
      const harness: PreviewHarness = await createPreviewHarness('', 3, 0, true, true);

      InputHandler.getInstance().insertText('a');

      // Command arrays catch reordering that a final text check would miss.
      expect(harness.client.insertedTexts.join('')).assertEqual('a');
      expect(harness.client.buffer).assertEqual('a');
      expect(harness.client.editorAttributeCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testAsyncAttachTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ASYNC_ATTACH_0004
     * @tc.name      testAsyncAttachTest_004
     * @tc.desc      Verify that two insertions before resolution both reach the buffer.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAsyncAttachTest_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAsyncAttachTest_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 0, 0, true, true);

      InputHandler.getInstance().insertText('b');
      InputHandler.getInstance().insertText('c');

      expect(harness.client.insertedTexts.join('')).assertEqual('bc');
      expect(harness.client.buffer).assertEqual('bc');
      expect(harness.client.privateCommandCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testAsyncAttachTest_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PENDING_EDIT_0001
     * @tc.name      testPendingAttachEdit_001
     * @tc.desc      Verify that two insertions before a deferred settle both append to the buffer.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPendingAttachEdit_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPendingAttachEdit_001 begin');
      const pending: PreviewHarness = await createPreviewHarness('', 0, 0, true, true);
      InputHandler.getInstance().insertText('a');
      InputHandler.getInstance().insertText('b');
      expect(pending.client.insertedTexts.join('')).assertEqual('ab');
      expect(pending.client.buffer).assertEqual('ab');
      expect(pending.client.previewCalls.length).assertEqual(0);
      expect(pending.client.editorAttributeCount).assertEqual(1);
      expect(pending.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPendingAttachEdit_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PENDING_EDIT_0002
     * @tc.name      testPendingAttachEdit_002
     * @tc.desc      Verify that deletions before a deferred settle keep their own channel order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPendingAttachEdit_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPendingAttachEdit_002 begin');
      const pending: PreviewHarness = await createPreviewHarness('', 0, 0, true, true);
      InputHandler.getInstance().deleteBackward(4);
      InputHandler.getInstance().deleteForward(2);
      InputHandler.getInstance().deleteBackward(1);
      expect(pending.client.backwardLengths.join('|')).assertEqual('4|1');
      expect(pending.client.forwardLengths.join('|')).assertEqual('2');
      expect(pending.client.buffer).assertEqual('');
      expect(pending.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPendingAttachEdit_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PENDING_EDIT_0003
     * @tc.name      testPendingAttachEdit_003
     * @tc.desc      Verify that caret movement and movement selection before a settle stay on separate channels.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPendingAttachEdit_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPendingAttachEdit_003 begin');
      const pending: PreviewHarness = await createPreviewHarness('', 0, 0, true, true);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_RIGHT);
      InputHandler.getInstance().selectByMovement(inputMethodEngine.Direction.CURSOR_LEFT);
      expect(pending.client.movedDirections.length).assertEqual(1);
      expect(pending.client.movedDirections[0]).assertEqual(inputMethodEngine.Direction.CURSOR_RIGHT);
      expect(pending.client.movementDirections.length).assertEqual(1);
      expect(pending.client.movementDirections[0]).assertEqual(inputMethodEngine.Direction.CURSOR_LEFT);
      expect(pending.client.selectedRanges.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPendingAttachEdit_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PENDING_EDIT_0004
     * @tc.name      testPendingAttachEdit_004
     * @tc.desc      Verify that begin and end selections before a settle use the pending cursor index of two.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPendingAttachEdit_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPendingAttachEdit_004 begin');
      const pending: PreviewHarness = await createPreviewHarness('abc', 0, 0, true, true);
      await InputHandler.getInstance().selectToBegin();
      await InputHandler.getInstance().selectToEnd();
      expect(pending.client.selectedRanges.length).assertEqual(2);
      expect(pending.client.selectedRanges[0].start).assertEqual(0);
      expect(pending.client.selectedRanges[0].end).assertEqual(2);
      expect(pending.client.selectedRanges[1].start).assertEqual(2);
      expect(pending.client.selectedRanges[1].end).assertEqual(1000);
      expect(pending.client.buffer).assertEqual('abc');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPendingAttachEdit_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PENDING_EDIT_0005
     * @tc.name      testPendingAttachEdit_005
     * @tc.desc      Verify that an edit action reaches a pending client once before its attribute settles.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPendingAttachEdit_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPendingAttachEdit_005 begin');
      const pending: PreviewHarness = await createPreviewHarness('', 0, 0, true, true);
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.PASTE);
      expect(pending.client.extendActions.length).assertEqual(1);
      expect(pending.client.extendActions[0]).assertEqual(inputMethodEngine.ExtendAction.PASTE);
      expect(pending.client.privateCommandCount).assertEqual(1);
      expect(pending.client.editorAttributeCount).assertEqual(1);
      expect(pending.client.buffer).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPendingAttachEdit_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PENDING_EDIT_0006
     * @tc.name      testPendingAttachEdit_006
     * @tc.desc      Verify that the debug snapshot reads both ends of a pending buffer and records the five-unit queries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPendingAttachEdit_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPendingAttachEdit_006 begin');
      const pending: PreviewHarness = await createPreviewHarness('preview', 0, 0, true, true);
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const snapshot: string = AppStorage.get<string>('showLog') as string;
      expect(snapshot.includes('previ')).assertTrue();
      expect(snapshot.includes('eview')).assertTrue();
      expect(pending.client.forwardQueries.join('|')).assertEqual('5');
      expect(pending.client.backwardQueries.join('|')).assertEqual('5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPendingAttachEdit_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PENDING_EDIT_0007
     * @tc.name      testPendingAttachEdit_007
     * @tc.desc      Verify that a preview opened before the settle is finished with the deferred enter type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPendingAttachEdit_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPendingAttachEdit_007 begin');
      const pending: PreviewHarness = await createPreviewHarness('', 11, 0, true, true);
      typeSequence(pending, 'hel');
      pending.client.resolveAttribute();
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().sendKeyFunction();
      expect(pending.client.keyFunctions[0]).assertEqual(11);
      expect(pending.client.finishCount).assertEqual(1);
      expect(pending.client.previewCalls.length).assertEqual(1);
      expect(pending.client.buffer).assertEqual('hello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPendingAttachEdit_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PRIVATE_FAULT_0001
     * @tc.name      testPrivateCommandFaultTest_001
     * @tc.desc      Verify that a rejected private command does not block later typing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPrivateCommandFaultTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateCommandFaultTest_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 0, 0, true, false, true);
      await Promise.resolve();

      InputHandler.getInstance().insertText('a');

      expect(harness.client.privateCommandCount).assertEqual(1);
      expect(harness.client.insertedTexts.join('')).assertEqual('a');
      expect(harness.client.buffer).assertEqual('a');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateCommandFaultTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PRIVATE_FAULT_0002
     * @tc.name      testPrivateCommandFaultTest_002
     * @tc.desc      Verify that two attaches with rejected commands each keep their own client.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPrivateCommandFaultTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateCommandFaultTest_002 begin');
      const first: PreviewHarness = await createPreviewHarness('', 0, 0, true, false, true);
      const second: PreviewHarness = await createPreviewHarness('', 0, 0, true, false, true);
      InputHandler.getInstance().insertText('z');

      expect(first.client.privateCommandCount).assertEqual(1);
      expect(second.client.privateCommandCount).assertEqual(1);
      expect(first.client.insertedTexts.length).assertEqual(0);
      expect(second.client.insertedTexts.join('')).assertEqual('z');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateCommandFaultTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PRIVATE_FAULT_VARIANT_0001
     * @tc.name      testPrivateFaultVariant_001
     * @tc.desc      Verify that a rejected command on a deferred editor still publishes its values after the settle.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPrivateFaultVariant_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateFaultVariant_001 begin');
      const pending: PreviewHarness = await createPreviewHarness('', 5, 9, true, true, true);
      typeSequence(pending, 'hel');
      expect(pending.client.previewCalls.length).assertEqual(1);
      expect(pending.client.privateCommandCount).assertEqual(1);
      pending.client.resolveAttribute();
      await Promise.resolve();
      await Promise.resolve();
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(5);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(9);
      expect(pending.client.buffer).assertEqual('hello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateFaultVariant_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PRIVATE_FAULT_VARIANT_0002
     * @tc.name      testPrivateFaultVariant_002
     * @tc.desc      Verify that after a rejected command the action, caret and hide channels stay independent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPrivateFaultVariant_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateFaultVariant_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 0, 0, true, false, true);
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.COPY);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      InputHandler.getInstance().hideKeyboardSelf();
      expect(harness.client.extendActions.length).assertEqual(1);
      expect(harness.client.movedDirections.length).assertEqual(1);
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.privateCommandCount).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateFaultVariant_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PRIVATE_FAULT_VARIANT_0003
     * @tc.name      testPrivateFaultVariant_003
     * @tc.desc      Verify that two enters after a rejected command still send the type twice and leave one command.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPrivateFaultVariant_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateFaultVariant_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 6, 0, true, false, true);
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.keyFunctions.join('|')).assertEqual('6|6');
      expect(harness.client.finishCount).assertEqual(2);
      expect(harness.client.privateCommandCount).assertEqual(1);
      expect(harness.client.editorAttributeCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateFaultVariant_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PRIVATE_FAULT_VARIANT_0004
     * @tc.name      testPrivateFaultVariant_004
     * @tc.desc      Verify that a preview survives a rejected command together with a caret move and an edit action.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPrivateFaultVariant_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateFaultVariant_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 0, 0, true, false, true);
      typeSequence(harness, 'hel');
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_DOWN);
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.PASTE);
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.movedDirections[0]).assertEqual(inputMethodEngine.Direction.CURSOR_DOWN);
      expect(harness.client.extendActions[0]).assertEqual(inputMethodEngine.ExtendAction.PASTE);
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateFaultVariant_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PRIVATE_FAULT_VARIANT_0005
     * @tc.name      testPrivateFaultVariant_005
     * @tc.desc      Verify that a pending editor with two rejected attach channels keeps a raw prefix until settle.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPrivateFaultVariant_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateFaultVariant_005 begin');
      const pending: PreviewHarness = await createPreviewHarness('', 17, 4, true, true, true);
      pending.client.failPreview = true;
      typeSequence(pending, 'hel');
      expect(pending.client.previewCalls.length).assertEqual(0);
      expect(pending.client.privateCommandCount).assertEqual(1);
      expect(pending.client.buffer).assertEqual('hel');
      pending.client.resolveAttribute();
      await Promise.resolve();
      await Promise.resolve();
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(17);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(4);
      expect(pending.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateFaultVariant_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_FAULT_0001
     * @tc.name      testFaultInjectionTest_001
     * @tc.desc      Verify that a rejected preview request does not stop later typed characters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testFaultInjectionTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultInjectionTest_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      harness.client.failPreview = true;

      typeSequence(harness, 'hel');
      await Promise.resolve();
      typeSequence(harness, 'x');

      expect(harness.client.insertedTexts.join('')).assertEqual('helx');
      expect(harness.client.buffer).assertEqual('helx');
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultInjectionTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_FAULT_0002
     * @tc.name      testFaultInjectionTest_002
     * @tc.desc      Verify that a rejected finish request still sends the enter type and keeps the buffer.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testFaultInjectionTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultInjectionTest_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 6);
      typeSequence(harness, 'hel');
      harness.client.failFinish = true;

      InputHandler.getInstance().sendKeyFunction();
      await Promise.resolve();
      typeSequence(harness, 'x');

      expect(harness.client.keyFunctions.length).assertEqual(1);
      expect(harness.client.keyFunctions[0]).assertEqual(6);
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hello worldx');
      expect(harness.client.insertedTexts.join('')).assertEqual('helx');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultInjectionTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_FAULT_ORDER_0001
     * @tc.name      testFaultOrder_001
     * @tc.desc      Verify that clearing a preview fault allows a tail trigger to rebuild the window at offset two.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testFaultOrder_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultOrder_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      harness.client.failPreview = true;
      typeSequence(harness, 'hel');
      InputHandler.getInstance().insertText('e');
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('hele');
      harness.client.failPreview = false;
      InputHandler.getInstance().insertText('l');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].start).assertEqual(2);
      expect(harness.client.previewCalls[0].end).assertEqual(5);
      expect(harness.client.buffer).assertEqual('hehello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultOrder_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_FAULT_ORDER_0002
     * @tc.name      testFaultOrder_002
     * @tc.desc      Verify that a finish fault cleared between two enters leaves both finish and type records.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testFaultOrder_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultOrder_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      harness.client.failFinish = true;
      InputHandler.getInstance().sendKeyFunction();
      harness.client.failFinish = false;
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.finishCount).assertEqual(2);
      expect(harness.client.keyFunctions.length).assertEqual(2);
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultOrder_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_FAULT_ORDER_0003
     * @tc.name      testFaultOrder_003
     * @tc.desc      Verify that a failing hide and a failing preview together still allow the enter type send.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testFaultOrder_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultOrder_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      harness.client.failPreview = true;
      harness.keyboard.failHide = true;
      typeSequence(harness, 'hel');
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.keyFunctions.length).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hel');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultOrder_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_FAULT_ORDER_0004
     * @tc.name      testFaultOrder_004
     * @tc.desc      Verify that enter on an empty editor before any trigger still records the configured type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testFaultOrder_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultOrder_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 4);
      harness.client.failFinish = true;
      InputHandler.getInstance().sendKeyFunction();
      typeSequence(harness, 'hel');
      const enterTypes: number[] = harness.client.keyFunctions;
      expect(enterTypes.length).assertEqual(1);
      expect(enterTypes[0]).assertEqual(4);
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].start).assertEqual(0);
      expect(harness.client.buffer).assertEqual('hello world');
      expect(harness.client.buffer.length).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultOrder_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_FAULT_ORDER_0005
     * @tc.name      testFaultOrder_005
     * @tc.desc      Verify that a rejected preview leaves the deletion channels and a later insertion usable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testFaultOrder_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultOrder_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      harness.client.failPreview = true;
      typeSequence(harness, 'hel');
      InputHandler.getInstance().deleteBackward(2);
      InputHandler.getInstance().deleteForward(1);
      InputHandler.getInstance().insertText('z');
      expect(harness.client.backwardLengths.join('|')).assertEqual('2');
      expect(harness.client.forwardLengths.join('|')).assertEqual('1');
      expect(harness.client.insertedTexts.join('')).assertEqual('helz');
      expect(harness.client.buffer).assertEqual('helz');
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultOrder_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_REFRESH_PREVIEW_0001
     * @tc.name      testRefreshPreviewTest_001
     * @tc.desc      Verify that the debug snapshot reads the preview buffer after a trigger.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testRefreshPreviewTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRefreshPreviewTest_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('hexyz');
      typeSequence(harness, 'l');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().setSelectInfo('preview-sel');
      InputHandler.getInstance().refreshInfo();
      const snapshot: string = AppStorage.get<string>('showLog') as string;
      expect(snapshot.includes('hexhe')).assertTrue();
      expect(snapshot.includes('world')).assertTrue();
      expect(snapshot.includes('preview-sel')).assertTrue();
      expect(harness.client.forwardQueries[0]).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRefreshPreviewTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_REFRESH_PREVIEW_0002
     * @tc.name      testRefreshPreviewTest_002
     * @tc.desc      Verify that a hide request does not alter the snapshot after a preview.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testRefreshPreviewTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRefreshPreviewTest_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().hideKeyboardSelf();
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const snapshot: string = AppStorage.get<string>('showLog') as string;
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(snapshot.includes('hello')).assertTrue();
      expect(snapshot.includes('world')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRefreshPreviewTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SNAPSHOT_FAULT_0001
     * @tc.name      testSnapshotFault_001
     * @tc.desc      Verify that the snapshot shows the uncommitted prefix inside both five-unit slots after a rejected preview.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSnapshotFault_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSnapshotFault_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      harness.client.failPreview = true;
      typeSequence(harness, 'hel');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const snapshot: string = AppStorage.get<string>('showLog') as string;
      expect(snapshot.includes('before：[hel]')).assertTrue();
      expect(snapshot.includes('after：[hel]')).assertTrue();
      expect(harness.client.forwardQueries.join('|')).assertEqual('5');
      expect(harness.client.buffer).assertEqual('hel');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSnapshotFault_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SNAPSHOT_FAULT_0002
     * @tc.name      testSnapshotFault_002
     * @tc.desc      Verify that an empty client produces empty before-and-after slots in the snapshot.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSnapshotFault_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSnapshotFault_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const snapshot: string = AppStorage.get<string>('showLog') as string;
      expect(snapshot.includes('before：[];after：[]')).assertTrue();
      expect(harness.client.forwardQueries.length).assertEqual(1);
      expect(harness.client.backwardQueries.length).assertEqual(1);
      expect(harness.client.buffer).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSnapshotFault_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SNAPSHOT_FAULT_0003
     * @tc.name      testSnapshotFault_003
     * @tc.desc      Verify that after a switch the snapshot reads the new buffer and each client keeps one query pair.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSnapshotFault_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSnapshotFault_003 begin');
      const first: PreviewHarness = await createPreviewHarness('aaa');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const beforeSwitch: string = AppStorage.get<string>('showLog') as string;
      const second: PreviewHarness = await createPreviewHarness('zzz');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const afterSwitch: string = AppStorage.get<string>('showLog') as string;
      expect(beforeSwitch.includes('before：[aaa]')).assertTrue();
      expect(afterSwitch.includes('before：[zzz]')).assertTrue();
      expect(first.client.forwardQueries.length).assertEqual(1);
      expect(second.client.forwardQueries.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSnapshotFault_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SNAPSHOT_FAULT_0004
     * @tc.name      testSnapshotFault_004
     * @tc.desc      Verify that a negative deletion and a zero forward deletion leave both snapshot slots at the two-letter text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSnapshotFault_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSnapshotFault_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('xy');
      InputHandler.getInstance().deleteBackward(-1);
      InputHandler.getInstance().deleteForward(0);
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const snapshot: string = AppStorage.get<string>('showLog') as string;
      expect(snapshot.includes('before：[xy]')).assertTrue();
      expect(snapshot.includes('after：[xy]')).assertTrue();
      expect(harness.client.backwardLengths[0]).assertEqual(-1);
      expect(harness.client.forwardLengths[0]).assertEqual(0);
      expect(harness.client.buffer).assertEqual('xy');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSnapshotFault_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SNAPSHOT_FAULT_0005
     * @tc.name      testSnapshotFault_005
     * @tc.desc      Verify that two refreshes each issue one five-unit forward and backward query.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSnapshotFault_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSnapshotFault_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('hello');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      InputHandler.getInstance().refreshInfo();
      const snapshot: string = AppStorage.get<string>('showLog') as string;
      expect(harness.client.forwardQueries.join('|')).assertEqual('5|5');
      expect(harness.client.backwardQueries.join('|')).assertEqual('5|5');
      expect(snapshot.includes('before：[hello]')).assertTrue();
      expect(harness.client.buffer).assertEqual('hello');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSnapshotFault_005 end');
      await yieldToEventLoop();
    });

  });
}
