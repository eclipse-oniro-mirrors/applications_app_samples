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
const TAG: string = '[Sample_KikaInputMethodEnterSequence]';

export default function enterSequenceTest(): void {
  describe('EnterSequenceTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ENTER_SEQUENCE_0001
     * @tc.name      testEnterSequence_001
     * @tc.desc      Verify that an insertion and a commit before edits keep the preview text as the base.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnterSequence_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnterSequence_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().insertText('e');
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().deleteBackward(1);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      expect(harness.client.buffer).assertEqual('hello worlde');
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.backwardLengths[0]).assertEqual(1);
      expect(harness.client.movedDirections[0]).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnterSequence_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ENTER_SEQUENCE_0002
     * @tc.name      testEnterSequence_002
     * @tc.desc      Verify that a plain insertion followed by a commit and a forward delete stay separate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnterSequence_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnterSequence_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().insertText('a');
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().deleteForward(2);
      expect(harness.client.buffer).assertEqual('a');
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.forwardLengths[0]).assertEqual(2);
      expect(harness.client.previewCalls.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnterSequence_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ENTER_SEQUENCE_0003
     * @tc.name      testEnterSequence_003
     * @tc.desc      Verify that a commit, a cut and a second commit count two finishes and one action.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnterSequence_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnterSequence_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      const committed: string = harness.client.buffer;
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.CUT);
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.finishCount).assertEqual(2);
      expect(harness.client.extendActions.length).assertEqual(1);
      expect(harness.client.buffer).assertEqual(committed);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnterSequence_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ENTER_SEQUENCE_0004
     * @tc.name      testEnterSequence_004
     * @tc.desc      Verify that a move and commit during a preview precede a hide request.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnterSequence_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnterSequence_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_DOWN);
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().hideKeyboardSelf();
      expect(harness.client.movedDirections[0]).assertEqual(2);
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.keyboard.hideCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnterSequence_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ENTER_SEQUENCE_0005
     * @tc.name      testEnterSequence_005
     * @tc.desc      Verify that a zero deletion and an empty insertion do not disturb a commit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnterSequence_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnterSequence_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().deleteBackward(0);
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().insertText('');
      expect(harness.client.backwardLengths[0]).assertEqual(0);
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.insertedTexts[harness.client.insertedTexts.length - 1].length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnterSequence_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ENTER_SEQUENCE_0006
     * @tc.name      testEnterSequence_006
     * @tc.desc      Verify that the maximum enter type commits a preview and an insertion follows.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnterSequence_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnterSequence_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 2147483647);
      typeSequence(harness, 'hel');
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().insertText('m');
      expect(harness.client.keyFunctions[0]).assertEqual(2147483647);
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.buffer.charAt(harness.client.buffer.length - 1)).assertEqual('m');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnterSequence_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ENTER_SEQUENCE_0007
     * @tc.name      testEnterSequence_007
     * @tc.desc      Verify that two commits around a right move during a preview count twice.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnterSequence_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnterSequence_007 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_RIGHT);
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.finishCount).assertEqual(2);
      expect(harness.client.movedDirections[0]).assertEqual(4);
      expect(harness.client.keyFunctions.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnterSequence_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ENTER_SEQUENCE_0008
     * @tc.name      testEnterSequence_008
     * @tc.desc      Verify that a commit in the first session is not replayed by the next attach.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnterSequence_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnterSequence_008 begin');
      const first: PreviewHarness = await createPreviewHarness('', 5);
      typeSequence(first, 'hel');
      InputHandler.getInstance().sendKeyFunction();
      const second: PreviewHarness = await createPreviewHarness('', 6);
      InputHandler.getInstance().insertText('n');
      expect(first.client.finishCount).assertEqual(1);
      expect(first.client.keyFunctions.join('')).assertEqual('5');
      expect(second.client.keyFunctions.length).assertEqual(0);
      expect(second.client.buffer).assertEqual('n');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnterSequence_008 end');
      await yieldToEventLoop();
    });

  });
}
