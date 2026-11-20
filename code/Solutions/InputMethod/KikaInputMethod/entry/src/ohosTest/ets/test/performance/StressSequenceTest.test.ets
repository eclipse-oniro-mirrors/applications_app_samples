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
import { pressHardKey, releaseHardKey } from '../support/TestSupport';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodStressSequence]';

export default function stressSequenceTest(): void {
  describe('StressSequenceTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_STRESS_SEQUENCE_0001
     * @tc.name      testStressSequence_001
     * @tc.desc      Verify that one thousand one-letter insertions grow the buffer without a preview.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testStressSequence_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStressSequence_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      let index: number = 0;
      while (index < 1000) {
        InputHandler.getInstance().insertText(index % 2 === 0 ? 'a' : 'b');
        index = index + 1;
      }
      expect(harness.client.insertedTexts.length).assertEqual(1000);
      expect(harness.client.buffer.length).assertEqual(1000);
      expect(harness.client.buffer.charAt(1)).assertEqual('b');
      expect(harness.client.buffer.charAt(999)).assertEqual('b');
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStressSequence_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_STRESS_SEQUENCE_0002
     * @tc.name      testStressSequence_002
     * @tc.desc      Verify that five hundred move-copy pairs keep both channels at five hundred.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testStressSequence_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStressSequence_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      for (let i = 0; i < 500; i++) {
        InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
        InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.COPY);
      }
      expect(harness.client.movedDirections.length).assertEqual(500);
      expect(harness.client.extendActions.length).assertEqual(500);
      expect(harness.client.buffer.length).assertEqual(0);
      expect(harness.client.insertedTexts.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStressSequence_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_STRESS_SEQUENCE_0003
     * @tc.name      testStressSequence_003
     * @tc.desc      Verify that two hundred shift-digit chords stay blocked and typing resumes afterwards.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testStressSequence_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStressSequence_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      for (let i = 0; i < 200; i++) {
        pressHardKey(2047);
        pressHardKey(2001);
        releaseHardKey(2001);
        releaseHardKey(2047);
      }
      expect(harness.client.buffer.length).assertEqual(0);
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(harness.client.finishCount).assertEqual(0);
      for (let i = 0; i < 10; i++) {
        pressHardKey(2017);
        releaseHardKey(2017);
      }
      expect(harness.client.buffer.length).assertEqual(10);
      expect(harness.client.buffer.charAt(0)).assertEqual('a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStressSequence_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_STRESS_SEQUENCE_0004
     * @tc.name      testStressSequence_004
     * @tc.desc      Verify that three hundred selection movements and one hundred inserts stay separate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testStressSequence_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStressSequence_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      const directions: number[] = [inputMethodEngine.Direction.CURSOR_UP,
        inputMethodEngine.Direction.CURSOR_DOWN, inputMethodEngine.Direction.CURSOR_LEFT,
        inputMethodEngine.Direction.CURSOR_RIGHT];
      for (let i = 0; i < 300; i++) {
        InputHandler.getInstance().selectByMovement(directions[i % 4]);
      }
      for (let i = 0; i < 100; i++) {
        InputHandler.getInstance().insertText('m');
      }
      expect(harness.client.movementDirections.length).assertEqual(300);
      expect(harness.client.insertedTexts.length).assertEqual(100);
      expect(harness.client.buffer.length).assertEqual(100);
      expect(harness.client.movedDirections.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStressSequence_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_STRESS_SEQUENCE_0005
     * @tc.name      testStressSequence_005
     * @tc.desc      Verify that forty consecutive attaches each receive a two-character insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testStressSequence_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStressSequence_005 begin');
      let totalUnits: number = 0;
      const seen: Set<string> = new Set<string>();
      for (let i = 0; i < 40; i++) {
        const session: PreviewHarness = await createPreviewHarness('');
        const first: string = String.fromCharCode(65 + (i % 26));
        const second: string = String.fromCharCode(97 + (i % 26));
        InputHandler.getInstance().insertText(first);
        InputHandler.getInstance().insertText(second);
        totalUnits = totalUnits + session.client.buffer.length;
        seen.add(session.client.buffer);
      }
      expect(totalUnits).assertEqual(80);
      expect(seen.size).assertEqual(26);
      expect(seen.has('Aa')).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStressSequence_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_STRESS_SEQUENCE_0006
     * @tc.name      testStressSequence_006
     * @tc.desc      Verify that fifty preview-commit cycles each finish once and keep one call.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testStressSequence_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStressSequence_006 begin');
      let finishes: number = 0;
      let calls: number = 0;
      for (let i = 0; i < 50; i++) {
        const session: PreviewHarness = await createPreviewHarness('');
        typeSequence(session, 'hel');
        InputHandler.getInstance().sendKeyFunction();
        finishes = finishes + session.client.finishCount;
        calls = calls + session.client.previewCalls.length;
      }
      expect(finishes).assertEqual(50);
      expect(calls).assertEqual(50);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStressSequence_006 end');
      await yieldToEventLoop();
    });

  });
}
