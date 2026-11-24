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
import { PreviewHarness, createPreviewHarness } from '../support/PreviewHarness';
import { InputHandler } from '../../../../main/ets/InputMethodExtensionAbility/model/KeyboardController';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodExtremeCount]';

export default function extremeCountTest(): void {
  describe('ExtremeCountTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_COUNT_0001
     * @tc.name      testExtremeCount_001
     * @tc.desc      Verify that three hundred twenty-one alternating inserts fill the buffer.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testExtremeCount_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeCount_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      let index: number = 0;
      while (index < 321) {
        InputHandler.getInstance().insertText(index % 2 === 0 ? 'a' : 'b');
        index = index + 1;
      }
      expect(harness.client.buffer.length).assertEqual(321);
      expect(harness.client.buffer.charAt(0)).assertEqual('a');
      expect(harness.client.buffer.charAt(320)).assertEqual('a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeCount_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_COUNT_0002
     * @tc.name      testExtremeCount_002
     * @tc.desc      Verify that six hundred fifty-four move-copy pairs keep both channels equal.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testExtremeCount_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeCount_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      for (let i = 0; i < 654; i++) {
        InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
        InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.COPY);
      }
      expect(harness.client.movedDirections.length).assertEqual(654);
      expect(harness.client.extendActions.length).assertEqual(654);
      expect(harness.client.buffer.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeCount_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_COUNT_0003
     * @tc.name      testExtremeCount_003
     * @tc.desc      Verify that alternating zero backward and forward deletions split 451 and 450.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testExtremeCount_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeCount_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      let step: number = 0;
      while (step < 901) {
        if (step % 2 === 0) {
          InputHandler.getInstance().deleteBackward(0);
        } else {
          InputHandler.getInstance().deleteForward(0);
        }
        step = step + 1;
      }
      expect(harness.client.backwardLengths.length).assertEqual(451);
      expect(harness.client.forwardLengths.length).assertEqual(450);
      expect(harness.client.buffer).assertEqual('');
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeCount_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_COUNT_0004
     * @tc.name      testExtremeCount_004
     * @tc.desc      Verify that four hundred thirty-two cycled select movements split evenly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testExtremeCount_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeCount_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const directions: number[] = [inputMethodEngine.Direction.CURSOR_UP,
        inputMethodEngine.Direction.CURSOR_DOWN, inputMethodEngine.Direction.CURSOR_LEFT,
        inputMethodEngine.Direction.CURSOR_RIGHT];
      for (let i = 0; i < 432; i++) {
        InputHandler.getInstance().selectByMovement(directions[i % 4]);
      }
      const counts: Map<number, number> = new Map<number, number>();
      for (let i = 0; i < harness.client.movementDirections.length; i++) {
        const key: number = harness.client.movementDirections[i];
        counts.set(key, (counts.get(key) ?? 0) + 1);
      }
      expect(counts.size).assertEqual(4);
      expect(counts.get(1)).assertEqual(108);
      expect(harness.client.movementDirections.length).assertEqual(432);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeCount_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_COUNT_0005
     * @tc.name      testExtremeCount_005
     * @tc.desc      Verify that two hundred ten enters all finish with the same type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testExtremeCount_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeCount_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 3);
      for (let i = 0; i < 210; i++) {
        InputHandler.getInstance().sendKeyFunction();
      }
      let typeThree: number = 0;
      for (let i = 0; i < harness.client.keyFunctions.length; i++) {
        if (harness.client.keyFunctions[i] === 3) {
          typeThree = typeThree + 1;
        }
      }
      expect(typeThree).assertEqual(210);
      expect(harness.client.finishCount).assertEqual(210);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeCount_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_COUNT_0006
     * @tc.name      testExtremeCount_006
     * @tc.desc      Verify that three hundred forty-five plain chars open no preview.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testExtremeCount_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeCount_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      for (let i = 0; i < 345; i++) {
        InputHandler.getInstance().insertText('x');
      }
      expect(harness.client.buffer.length).assertEqual(345);
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeCount_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_COUNT_0007
     * @tc.name      testExtremeCount_007
     * @tc.desc      Verify that seventy-seven sessions each hide once total seventy-seven calls.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testExtremeCount_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeCount_007 begin');
      let hides: number = 0;
      for (let i = 0; i < 77; i++) {
        const session: PreviewHarness = await createPreviewHarness('');
        InputHandler.getInstance().hideKeyboardSelf();
        hides = hides + session.keyboard.hideCount;
      }
      expect(hides).assertEqual(77);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeCount_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_COUNT_0008
     * @tc.name      testExtremeCount_008
     * @tc.desc      Verify that seven hundred seventy-seven alternating chars fill the buffer once.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testExtremeCount_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeCount_008 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      let payload: string = '';
      for (let i = 0; i < 777; i++) {
        payload = payload + (i % 2 === 0 ? 'Z' : 'c');
      }
      InputHandler.getInstance().insertText(payload);
      expect(harness.client.buffer.length).assertEqual(777);
      expect(harness.client.buffer.charAt(776)).assertEqual('Z');
      expect(harness.client.insertedTexts.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeCount_008 end');
      await yieldToEventLoop();
    });

  });
}
