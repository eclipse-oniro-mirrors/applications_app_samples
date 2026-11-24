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
const TAG: string = '[Sample_KikaInputMethodSyncExpansionScenario]';

export default function syncExpansionScenarioTest(): void {
  describe('SyncExpansionScenarioTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SYNC_EXPANSION_0001
     * @tc.name      testSyncExpansionScenarioTest_001
     * @tc.desc      Verify that a forward deletion after a client switch is recorded by the new editor only.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSyncExpansionScenarioTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncExpansionScenarioTest_001 begin');
      const first: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().insertText('a');
      const second: PreviewHarness = await createPreviewHarness('');

      InputHandler.getInstance().deleteForward(3);
      expect(first.client.forwardLengths.length).assertEqual(0);
      expect(second.client.forwardLengths[0]).assertEqual(3);
      expect(second.client.buffer).assertEqual('');
      expect(first.client.buffer).assertEqual('a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncExpansionScenarioTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SYNC_EXPANSION_0002
     * @tc.name      testSyncExpansionScenarioTest_002
     * @tc.desc      Verify that an enter before a deletion keeps its type and finishes the preview once.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSyncExpansionScenarioTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncExpansionScenarioTest_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 2);

      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().deleteBackward(1);
      InputHandler.getInstance().insertText('b');
      expect(harness.client.keyFunctions[0]).assertEqual(2);
      expect(harness.client.backwardLengths[0]).assertEqual(1);
      expect(harness.client.insertedTexts.join('')).assertEqual('b');
      expect(harness.client.finishCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncExpansionScenarioTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SYNC_EXPANSION_0003
     * @tc.name      testSyncExpansionScenarioTest_003
     * @tc.desc      Verify that a hide followed by caret-end and an insertion keeps the buffer editable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSyncExpansionScenarioTest_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncExpansionScenarioTest_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      InputHandler.getInstance().hideKeyboardSelf();
      await InputHandler.getInstance().moveCursorToEnd();
      InputHandler.getInstance().insertText('z');
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.selectedRanges[0].start).assertEqual(1000);
      expect(harness.client.buffer).assertEqual('z');
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncExpansionScenarioTest_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SYNC_EXPANSION_0004
     * @tc.name      testSyncExpansionScenarioTest_004
     * @tc.desc      Verify that cut and paste around a forward deletion keep both action values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSyncExpansionScenarioTest_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncExpansionScenarioTest_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.CUT);
      InputHandler.getInstance().deleteForward(4);
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.PASTE);
      expect(harness.client.extendActions.length).assertEqual(2);
      expect(harness.client.extendActions[0]).assertEqual(inputMethodEngine.ExtendAction.CUT);
      expect(harness.client.extendActions[1]).assertEqual(inputMethodEngine.ExtendAction.PASTE);
      expect(harness.client.forwardLengths[0]).assertEqual(4);
      expect(harness.client.buffer).assertEqual('');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncExpansionScenarioTest_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SYNC_EXPANSION_0005
     * @tc.name      testSyncExpansionScenarioTest_005
     * @tc.desc      Verify that a cut and a deletion after a switch stay on the newest editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSyncExpansionScenarioTest_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncExpansionScenarioTest_005 begin');
      const first: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().insertText('x');
      const second: PreviewHarness = await createPreviewHarness('');

      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.CUT);
      InputHandler.getInstance().deleteBackward(2);
      expect(first.client.buffer).assertEqual('x');
      expect(first.client.backwardLengths.length).assertEqual(0);
      expect(second.client.extendActions[0]).assertEqual(inputMethodEngine.ExtendAction.CUT);
      expect(second.client.backwardLengths[0]).assertEqual(2);
      expect(second.client.buffer).assertEqual('');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncExpansionScenarioTest_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SYNC_EXPANSION_0006
     * @tc.name      testSyncExpansionScenarioTest_006
     * @tc.desc      Verify that a deferred attribute still allows a caret move and insertion first.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSyncExpansionScenarioTest_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncExpansionScenarioTest_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 0, 0, true, true);
      expect(harness.client.editorAttributeCount).assertEqual(1);

      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      InputHandler.getInstance().insertText('q');
      expect(harness.client.movedDirections[0]).assertEqual(3);
      expect(harness.client.buffer).assertEqual('q');

      harness.client.resolveAttribute();
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.keyFunctions[0]).assertEqual(0);
      expect(harness.client.finishCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncExpansionScenarioTest_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SYNC_EXPANSION_0007
     * @tc.name      testSyncExpansionScenarioTest_007
     * @tc.desc      Verify that a forward deletion after typed words does not alter the recorded buffer.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSyncExpansionScenarioTest_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncExpansionScenarioTest_007 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'a b');

      InputHandler.getInstance().deleteForward(2);
      InputHandler.getInstance().insertText('c');
      expect(harness.client.insertedTexts.join('')).assertEqual('a bc');
      expect(harness.client.forwardLengths[0]).assertEqual(2);
      expect(harness.client.buffer.length).assertEqual(4);
      expect(harness.client.insertedTexts.length).assertEqual(4);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncExpansionScenarioTest_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SYNC_EXPANSION_0008
     * @tc.name      testSyncExpansionScenarioTest_008
     * @tc.desc      Verify that caret-end after two punctuation keys leaves the buffer unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSyncExpansionScenarioTest_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncExpansionScenarioTest_008 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      InputHandler.getInstance().insertText(',');
      InputHandler.getInstance().insertText('.');
      await InputHandler.getInstance().moveCursorToEnd();
      InputHandler.getInstance().insertText('x');
      expect(harness.client.buffer).assertEqual(',.x');
      expect(harness.client.selectedRanges[0].start).assertEqual(1000);
      expect(harness.client.insertedTexts.length).assertEqual(3);
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncExpansionScenarioTest_008 end');
      await yieldToEventLoop();
    });

  });
}
