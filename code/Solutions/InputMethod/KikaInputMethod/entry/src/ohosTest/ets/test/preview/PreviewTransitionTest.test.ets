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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import inputMethodEngine from '@ohos.inputMethodEngine';
import { yieldToEventLoop } from '../support/AsyncSupport';
import { createPreviewHarness, PreviewHarness, typeSequence } from '../support/PreviewHarness';
import { InputHandler } from '../../../../main/ets/InputMethodExtensionAbility/model/KeyboardController';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodPreviewTransition]';

export default function previewTransitionTest(): void {
  describe('PreviewTransitionTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_TRANSITION_0001
     * @tc.name      testPreviewTransitionTest_001
     * @tc.desc      Verify that forward deletion during a preview is forwarded and leaves the preview text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewTransitionTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewTransitionTest_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');

      InputHandler.getInstance().deleteForward(1);

      expect(harness.client.forwardLengths.length).assertEqual(1);
      expect(harness.client.forwardLengths[0]).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hello world');
      expect(harness.client.finishCount).assertEqual(0);
      expect(harness.client.previewCalls.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewTransitionTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_TRANSITION_0002
     * @tc.name      testPreviewTransitionTest_002
     * @tc.desc      Verify that backward deletion during a preview does not commit or shorten the preview.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewTransitionTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewTransitionTest_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');

      InputHandler.getInstance().deleteBackward(3);

      expect(harness.client.backwardLengths.length).assertEqual(1);
      expect(harness.client.backwardLengths[0]).assertEqual(3);
      expect(harness.client.buffer).assertEqual('hello world');
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewTransitionTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_TRANSITION_0003
     * @tc.name      testPreviewTransitionTest_003
     * @tc.desc      Verify that hiding the keyboard during a preview keeps the preview until enter commits it.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewTransitionTest_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewTransitionTest_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');

      InputHandler.getInstance().hideKeyboardSelf();
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(0);
      expect(harness.client.buffer).assertEqual('hello world');

      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.keyFunctions.length).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hello world');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewTransitionTest_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_TRANSITION_0004
     * @tc.name      testPreviewTransitionTest_004
     * @tc.desc      Verify that enter without a preview still sends the enter type and one finish request.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewTransitionTest_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewTransitionTest_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 5);

      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.keyFunctions.length).assertEqual(1);
      expect(harness.client.keyFunctions[0]).assertEqual(5);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewTransitionTest_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_TRANSITION_0005
     * @tc.name      testPreviewTransitionTest_005
     * @tc.desc      Verify that switching editors mid-preview keeps the old preview and starts the new editor clean.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewTransitionTest_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewTransitionTest_005 begin');
      const first: PreviewHarness = await createPreviewHarness('');
      typeSequence(first, 'hel');
      const second: PreviewHarness = await createPreviewHarness('xyz');

      expect(first.client.buffer).assertEqual('hello world');
      expect(first.client.previewCalls.length).assertEqual(1);
      expect(second.client.buffer).assertEqual('xyz');
      expect(second.client.previewCalls.length).assertEqual(0);

      typeSequence(second, 'q');
      expect(second.client.insertedTexts.join('')).assertEqual('q');
      expect(second.client.buffer).assertEqual('xyzq');
      expect(first.client.insertedTexts.length).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewTransitionTest_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_TRANSITION_0006
     * @tc.name      testPreviewTransitionTest_006
     * @tc.desc      Verify that typing past a completed preview does not open another preview.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewTransitionTest_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewTransitionTest_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      typeSequence(harness, 'o');

      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.insertedTexts.join('')).assertEqual('helo');
      expect(harness.client.buffer).assertEqual('hello worldo');
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewTransitionTest_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_TRANSITION_EXTRA_0001
     * @tc.name      testTransitionExtra_001
     * @tc.desc      Verify that hiding during a preview leaves the preview open for the next insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTransitionExtra_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTransitionExtra_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().insertText('x');
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(0);
      expect(harness.client.buffer.length > 10).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTransitionExtra_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_TRANSITION_EXTRA_0002
     * @tc.name      testTransitionExtra_002
     * @tc.desc      Verify that an enter followed by an insertion keeps the finished count at one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTransitionExtra_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTransitionExtra_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().insertText('z');
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.buffer.endsWith('z')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTransitionExtra_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_TRANSITION_EXTRA_0003
     * @tc.name      testTransitionExtra_003
     * @tc.desc      Verify that a begin selection before enter keeps one zero-based anchor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTransitionExtra_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTransitionExtra_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      await InputHandler.getInstance().selectToBegin();
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.selectedRanges[0].start).assertEqual(0);
      expect(harness.client.finishCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTransitionExtra_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_TRANSITION_EXTRA_0004
     * @tc.name      testTransitionExtra_004
     * @tc.desc      Verify that a caret move and a forward deletion during a preview keep both channels.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTransitionExtra_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTransitionExtra_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().moveCursor(4 as inputMethodEngine.Direction);
      InputHandler.getInstance().deleteForward(3);
      expect(harness.client.movedDirections[0]).assertEqual(4);
      expect(harness.client.forwardLengths[0]).assertEqual(3);
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTransitionExtra_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_TRANSITION_EXTRA_0005
     * @tc.name      testTransitionExtra_005
     * @tc.desc      Verify that a cut action during a preview is forwarded before the single commit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTransitionExtra_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTransitionExtra_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.CUT);
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.extendActions.length).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTransitionExtra_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_TRANSITION_EXTRA_0006
     * @tc.name      testTransitionExtra_006
     * @tc.desc      Verify that a rejected preview leaves the buffer and allows a later normal insert.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTransitionExtra_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTransitionExtra_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      harness.client.failPreview = true;
      typeSequence(harness, 'hel');
      harness.client.failPreview = false;
      InputHandler.getInstance().insertText('!');
      expect(harness.client.finishCount).assertEqual(0);
      expect(harness.client.buffer.indexOf('hel')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTransitionExtra_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_TRANSITION_EXTRA_0007
     * @tc.name      testTransitionExtra_007
     * @tc.desc      Verify that an unsupported editor still opens the trigger preview once.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTransitionExtra_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTransitionExtra_007 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 0, 0, false);
      typeSequence(harness, 'hel');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTransitionExtra_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_TRANSITION_EXTRA_0008
     * @tc.name      testTransitionExtra_008
     * @tc.desc      Verify that typing before a deferred attribute settles survives the transition.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTransitionExtra_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTransitionExtra_008 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 0, 0, true, true);
      typeSequence(harness, 'hel');
      harness.client.resolveAttribute();
      await yieldToEventLoop();
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.keyFunctions.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTransitionExtra_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_TRANSITION_EXTRA_0009
     * @tc.name      testTransitionExtra_009
     * @tc.desc      Verify that two hides around a preview keep only the hide count and no commit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTransitionExtra_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTransitionExtra_009 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().hideKeyboardSelf();
      expect(harness.keyboard.hideCount).assertEqual(2);
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTransitionExtra_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_TRANSITION_EXTRA_0010
     * @tc.name      testTransitionExtra_010
     * @tc.desc      Verify that a failing finish still forwards every repeated enter type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTransitionExtra_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const harness: PreviewHarness = await createPreviewHarness('', 6);
      harness.client.failFinish = true;
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().sendKeyFunction();
      const forwarded: number[] = harness.client.keyFunctions;
      expect(forwarded.length).assertEqual(2);
      expect(forwarded[0]).assertEqual(forwarded[1]);
      expect(forwarded[0] * 2).assertEqual(12);
      expect(harness.client.finishCount - forwarded.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTransitionExtra_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_TRANSITION_EXTRA_0011
     * @tc.name      testTransitionExtra_011
     * @tc.desc      Verify that a private command count is unchanged by a preview transition.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTransitionExtra_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTransitionExtra_011 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const commands: number = harness.client.privateCommandCount;
      typeSequence(harness, 'hel');
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.privateCommandCount).assertEqual(commands);
      expect(commands).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTransitionExtra_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_TRANSITION_EXTRA_0012
     * @tc.name      testTransitionExtra_012
     * @tc.desc      Verify that select-to-end during a preview keeps the fixed end boundary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTransitionExtra_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTransitionExtra_012 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      await InputHandler.getInstance().selectToEnd();
      expect(harness.client.selectedRanges[0].end).assertEqual(1000);
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTransitionExtra_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_TRANSITION_EXTRA_0013
     * @tc.name      testTransitionExtra_013
     * @tc.desc      Verify that a begin move during a preview opens no extra preview window.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTransitionExtra_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTransitionExtra_013 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      const calls: number = harness.client.previewCalls.length;
      await InputHandler.getInstance().moveCursorToBegin();
      expect(harness.client.previewCalls.length).assertEqual(calls);
      expect(harness.client.selectedRanges[0].start).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTransitionExtra_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_TRANSITION_EXTRA_0014
     * @tc.name      testTransitionExtra_014
     * @tc.desc      Verify that an empty insertion during a preview keeps the same visible text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTransitionExtra_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTransitionExtra_014 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      const before: string = harness.client.buffer;
      InputHandler.getInstance().insertText('');
      expect(harness.client.buffer.indexOf('hello world') >= 0).assertTrue();
      expect(before.indexOf('hello world') >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTransitionExtra_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_TRANSITION_EXTRA_0015
     * @tc.name      testTransitionExtra_015
     * @tc.desc      Verify that a forward deletion after a preview keeps the finish count at zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTransitionExtra_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTransitionExtra_015 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().deleteForward(4);
      expect(harness.client.forwardLengths[0]).assertEqual(4);
      expect(harness.client.finishCount).assertEqual(0);
      expect(harness.client.previewCalls.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTransitionExtra_015 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_TRANSITION_EXTRA_0016
     * @tc.name      testTransitionExtra_016
     * @tc.desc      Verify that a selection movement during a preview does not finish it.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTransitionExtra_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTransitionExtra_016 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().selectByMovement(inputMethodEngine.Direction.CURSOR_DOWN);
      expect(harness.client.movementDirections.length).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTransitionExtra_016 end');
      await yieldToEventLoop();
    });

  });

}
