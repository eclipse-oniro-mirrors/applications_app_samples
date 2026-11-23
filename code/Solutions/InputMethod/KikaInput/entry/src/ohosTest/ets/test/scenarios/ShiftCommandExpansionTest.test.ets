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
import { InputHandler, KeyboardController } from '../../../../main/ets/model/KeyboardController';
import { ClientHarness, createClientHarness } from '../support/ClientHarness';
import { createKeyboardController, pressHardKey, releaseHardKey } from '../support/TestSupport';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputShiftCommandExpansion]';

function tap(controller: KeyboardController, keyCode: number): void {
  pressHardKey(controller, keyCode);
  releaseHardKey(controller, keyCode);
}

export default function shiftCommandExpansionTest(): void {
  describe('ShiftCommandExpansionTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_SHIFT_COMMAND_EXPANSION_0100
     * @tc.name      testShiftCommandExpansion_001
     * @tc.desc      Verify that an enter sent under a held shift keeps its type and position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testShiftCommandExpansion_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testShiftCommandExpansion_001 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(2);
      const controller: KeyboardController = createKeyboardController();

      pressHardKey(controller, 2047);
      InputHandler.getInstance().sendKeyFunction();
      tap(controller, 2017);
      releaseHardKey(controller, 2047);
      expect(harness.client.journal.join('|')).assertEqual('enter:2|insert:A');
      expect(harness.client.keyFunctions[0]).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testShiftCommandExpansion_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SHIFT_COMMAND_EXPANSION_0200
     * @tc.name      testShiftCommandExpansion_002
     * @tc.desc      Verify that an extend action under a held shift leaves the next letter uppercase.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testShiftCommandExpansion_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testShiftCommandExpansion_002 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      pressHardKey(controller, 2047);
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.COPY);
      tap(controller, 2018);
      releaseHardKey(controller, 2047);
      expect(harness.client.extendActions.length).assertEqual(1);
      expect(harness.client.insertedTexts.join('')).assertEqual('B');
      expect(harness.client.journal.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testShiftCommandExpansion_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SHIFT_COMMAND_EXPANSION_0300
     * @tc.name      testShiftCommandExpansion_003
     * @tc.desc      Verify that a hide under a held shift does not disturb the uppercase insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testShiftCommandExpansion_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testShiftCommandExpansion_003 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      pressHardKey(controller, 2047);
      InputHandler.getInstance().hideKeyboardSelf();
      tap(controller, 2019);
      releaseHardKey(controller, 2047);
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.insertedTexts[0]).assertEqual('C');
      expect(harness.client.journal.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testShiftCommandExpansion_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SHIFT_COMMAND_EXPANSION_0400
     * @tc.name      testShiftCommandExpansion_004
     * @tc.desc      Verify that a negative backward length under a held shift is forwarded before the letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testShiftCommandExpansion_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testShiftCommandExpansion_004 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      pressHardKey(controller, 2047);
      InputHandler.getInstance().deleteBackward(-1);
      tap(controller, 2020);
      releaseHardKey(controller, 2047);
      expect(harness.client.backwardLengths.join('')).assertEqual('-1');
      expect(harness.client.insertedTexts.join('')).assertEqual('D');
      expect(harness.client.journal.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testShiftCommandExpansion_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SHIFT_COMMAND_EXPANSION_0500
     * @tc.name      testShiftCommandExpansion_005
     * @tc.desc      Verify that an empty insertion between two shifted letters keeps both uppercase.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testShiftCommandExpansion_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testShiftCommandExpansion_005 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      pressHardKey(controller, 2047);
      tap(controller, 2017);
      InputHandler.getInstance().insertText('');
      tap(controller, 2018);
      releaseHardKey(controller, 2047);
      expect(harness.client.insertedTexts.length).assertEqual(3);
      expect(harness.client.insertedTexts[1].length).assertEqual(0);
      expect(harness.client.insertedTexts.join('')).assertEqual('AB');
      expect(harness.client.journal.length).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testShiftCommandExpansion_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SHIFT_COMMAND_EXPANSION_0600
     * @tc.name      testShiftCommandExpansion_006
     * @tc.desc      Verify that a zero deletion and a paste sit between shift down and the letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testShiftCommandExpansion_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testShiftCommandExpansion_006 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      pressHardKey(controller, 2047);
      InputHandler.getInstance().deleteBackward(0);
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.PASTE);
      tap(controller, 2021);
      releaseHardKey(controller, 2047);
      expect(harness.client.backwardLengths.join('')).assertEqual('0');
      expect(harness.client.extendActions.length).assertEqual(1);
      expect(harness.client.insertedTexts.join('')).assertEqual('E');
      expect(harness.client.journal.length).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testShiftCommandExpansion_006 end');
      await yieldToEventLoop();
    });

  });
}
