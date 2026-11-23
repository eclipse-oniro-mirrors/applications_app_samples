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
const TAG: string = '[Sample_KikaInputMethodCommandQueue]';

export default function commandQueueTest(): void {
  describe('CommandQueueTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMAND_QUEUE_0001
     * @tc.name      testCommandQueue_001
     * @tc.desc      Verify that ninety mixed commands keep three checkpoints of thirty.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testCommandQueue_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandQueue_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const checkpoints: number[] = [];
      let step: number = 0;
      while (step < 100) {
        const kind: number = step % 4;
        if (kind === 0) {
          InputHandler.getInstance().insertText('q');
        } else if (kind === 1) {
          InputHandler.getInstance().deleteBackward(1);
        } else if (kind === 2) {
          InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
        } else {
          InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.COPY);
        }
        step = step + 1;
        if (step % 25 === 0) {
          checkpoints.push(step);
        }
      }
      expect(checkpoints.join('|')).assertEqual('25|50|75|100');
      expect(harness.client.insertedTexts.length).assertEqual(25);
      expect(harness.client.extendActions.length).assertEqual(25);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandQueue_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMAND_QUEUE_0002
     * @tc.name      testCommandQueue_002
     * @tc.desc      Verify that forty-five insert-hide pairs keep both counters equal.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testCommandQueue_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandQueue_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      for (let i = 0; i < 30; i++) {
        InputHandler.getInstance().insertText('r');
        InputHandler.getInstance().hideKeyboardSelf();
        InputHandler.getInstance().sendKeyFunction();
      }
      expect(harness.client.insertedTexts.length).assertEqual(30);
      expect(harness.keyboard.hideCount).assertEqual(30);
      expect(harness.client.finishCount).assertEqual(30);
      expect(harness.client.buffer.length).assertEqual(30);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandQueue_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMAND_QUEUE_0003
     * @tc.name      testCommandQueue_003
     * @tc.desc      Verify that three sessions of fifteen trigger words open forty-five previews.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testCommandQueue_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandQueue_003 begin');
      let calls: number = 0;
      for (let session = 0; session < 3; session++) {
        for (let i = 0; i < 15; i++) {
          const harness: PreviewHarness = await createPreviewHarness('');
          typeSequence(harness, 'hel');
          calls = calls + harness.client.previewCalls.length;
        }
      }
      expect(calls).assertEqual(45);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandQueue_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMAND_QUEUE_0004
     * @tc.name      testCommandQueue_004
     * @tc.desc      Verify that forty inserts then forty forward deletes split at the array boundary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testCommandQueue_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandQueue_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      for (let i = 0; i < 30; i++) {
        InputHandler.getInstance().insertText('t');
      }
      for (let i = 0; i < 30; i++) {
        InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_DOWN);
      }
      for (let i = 0; i < 30; i++) {
        InputHandler.getInstance().deleteForward(2);
      }
      expect(harness.client.insertedTexts.length).assertEqual(30);
      expect(harness.client.movedDirections.length).assertEqual(30);
      expect(harness.client.forwardLengths.length).assertEqual(30);
      expect(harness.client.buffer.length).assertEqual(30);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandQueue_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMAND_QUEUE_0005
     * @tc.name      testCommandQueue_005
     * @tc.desc      Verify that sixty alternating selection moves and copies split thirty each.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testCommandQueue_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandQueue_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      for (let i = 0; i < 60; i++) {
        const kind: number = i % 3;
        if (kind === 0) {
          InputHandler.getInstance().selectByMovement(inputMethodEngine.Direction.CURSOR_UP);
        } else if (kind === 1) {
          InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_RIGHT);
        } else {
          InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.COPY);
        }
      }
      expect(harness.client.movementDirections.length).assertEqual(20);
      expect(harness.client.movedDirections.length).assertEqual(20);
      expect(harness.client.extendActions.length).assertEqual(20);
      expect(harness.client.buffer).assertEqual('');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandQueue_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMAND_QUEUE_0006
     * @tc.name      testCommandQueue_006
     * @tc.desc      Verify that every tenth of sixty commands is a zero forward delete.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testCommandQueue_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandQueue_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const kinds: string[] = [];
      for (let i = 0; i < 60; i++) {
        if (i % 10 === 0) {
          InputHandler.getInstance().deleteForward(0);
          kinds.push('f');
        } else {
          InputHandler.getInstance().insertText('u');
          kinds.push('i');
        }
      }
      expect(harness.client.forwardLengths.length).assertEqual(6);
      expect(harness.client.insertedTexts.length).assertEqual(54);
      expect(kinds[0]).assertEqual('f');
      expect(kinds[9]).assertEqual('i');
      expect(kinds.join('').split('f').length - 1).assertEqual(6);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandQueue_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMAND_QUEUE_0007
     * @tc.name      testCommandQueue_007
     * @tc.desc      Verify that four sessions of fifteen enters keep the last four types.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testCommandQueue_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandQueue_007 begin');
      const types: number[] = [2, 6, 8];
      const seen: Map<number, number> = new Map<number, number>();
      for (let i = 0; i < types.length; i++) {
        const harness: PreviewHarness = await createPreviewHarness('', types[i]);
        for (let k = 0; k < 20; k++) {
          InputHandler.getInstance().sendKeyFunction();
        }
        for (let k = 0; k < harness.client.keyFunctions.length; k++) {
          const type: number = harness.client.keyFunctions[k];
          seen.set(type, (seen.get(type) ?? 0) + 1);
        }
      }
      expect(seen.size).assertEqual(3);
      expect(seen.get(2)).assertEqual(20);
      expect(seen.get(8)).assertEqual(20);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(8);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandQueue_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMAND_QUEUE_0008
     * @tc.name      testCommandQueue_008
     * @tc.desc      Verify that seventy-two modular commands split twelve across six kinds.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testCommandQueue_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandQueue_008 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      for (let i = 0; i < 72; i++) {
        const kind: number = i % 6;
        if (kind === 0) {
          InputHandler.getInstance().insertText('w');
        } else if (kind === 1) {
          InputHandler.getInstance().deleteBackward(1);
        } else if (kind === 2) {
          InputHandler.getInstance().deleteForward(1);
        } else if (kind === 3) {
          InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_RIGHT);
        } else if (kind === 4) {
          InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.PASTE);
        } else {
          InputHandler.getInstance().selectByMovement(inputMethodEngine.Direction.CURSOR_DOWN);
        }
      }
      expect(harness.client.insertedTexts.length).assertEqual(12);
      expect(harness.client.backwardLengths.length).assertEqual(12);
      expect(harness.client.forwardLengths.length).assertEqual(12);
      expect(harness.client.movedDirections.length).assertEqual(12);
      expect(harness.client.extendActions.length).assertEqual(12);
      expect(harness.client.movementDirections.length).assertEqual(12);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandQueue_008 end');
      await yieldToEventLoop();
    });

  });
}
