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
import { PreviewHarness, createPreviewHarness, typeSequence } from '../support/PreviewHarness';
import { InputHandler } from '../../../../main/ets/InputMethodExtensionAbility/model/KeyboardController';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodPreviewEditorInterlock]';

export default function previewEditorInterlockTest(): void {
  describe('PreviewEditorInterlockTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_EDITOR_INTERLOCK_0001
     * @tc.name      testPreviewEditorInterlock_001
     * @tc.desc      Verify that caret-begin and an insertion during a preview precede its commit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewEditorInterlock_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      const beforeAppend: number = harness.client.buffer.length;
      await InputHandler.getInstance().moveCursorToBegin();
      InputHandler.getInstance().insertText('x');
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.buffer.length - beforeAppend).assertEqual(1);
      expect(harness.client.buffer.charAt(harness.client.buffer.length - 1).charCodeAt(0)).assertEqual(120);
      expect(harness.client.selectedRanges[0].start + harness.client.selectedRanges[0].end).assertEqual(0);
      expect(harness.client.finishCount * 1).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewEditorInterlock_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_EDITOR_INTERLOCK_0002
     * @tc.name      testPreviewEditorInterlock_002
     * @tc.desc      Verify that select-end and a forward deletion during a preview keep both requests.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewEditorInterlock_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewEditorInterlock_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      await InputHandler.getInstance().selectToEnd();
      InputHandler.getInstance().deleteForward(5);
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.selectedRanges[0].end).assertEqual(1000);
      expect(harness.client.forwardLengths[0]).assertEqual(5);
      expect(harness.client.finishCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewEditorInterlock_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_EDITOR_INTERLOCK_0003
     * @tc.name      testPreviewEditorInterlock_003
     * @tc.desc      Verify that a hide and a left move before commit keep three independent effects.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewEditorInterlock_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewEditorInterlock_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.movedDirections[0]).assertEqual(3);
      expect(harness.client.finishCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewEditorInterlock_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_EDITOR_INTERLOCK_0004
     * @tc.name      testPreviewEditorInterlock_004
     * @tc.desc      Verify that cut, caret-end and paste around a preview keep two actions and one range.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewEditorInterlock_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewEditorInterlock_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.CUT);
      await InputHandler.getInstance().moveCursorToEnd();
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.PASTE);
      expect(harness.client.extendActions.length).assertEqual(2);
      expect(harness.client.selectedRanges[0].start).assertEqual(1000);
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewEditorInterlock_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_EDITOR_INTERLOCK_0005
     * @tc.name      testPreviewEditorInterlock_005
     * @tc.desc      Verify that both selection directions during a preview precede a single commit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewEditorInterlock_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewEditorInterlock_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      await InputHandler.getInstance().selectToBegin();
      await InputHandler.getInstance().selectToEnd();
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.selectedRanges.length).assertEqual(2);
      expect(harness.client.selectedRanges[1].end).assertEqual(1000);
      expect(harness.client.finishCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewEditorInterlock_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_EDITOR_INTERLOCK_0006
     * @tc.name      testPreviewEditorInterlock_006
     * @tc.desc      Verify that a selection movement and a two-unit deletion during a preview precede a commit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewEditorInterlock_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewEditorInterlock_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().selectByMovement(inputMethodEngine.Direction.CURSOR_UP);
      InputHandler.getInstance().deleteBackward(2);
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.movementDirections[0]).assertEqual(1);
      expect(harness.client.backwardLengths[0]).assertEqual(2);
      expect(harness.client.finishCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewEditorInterlock_006 end');
      await yieldToEventLoop();
    });

  });
}
