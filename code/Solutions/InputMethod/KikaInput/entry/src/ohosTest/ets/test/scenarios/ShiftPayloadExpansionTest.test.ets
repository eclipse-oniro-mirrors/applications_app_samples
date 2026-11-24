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
import { createKeyboardController, pressHardKey, releaseHardKey, isShiftHeld } from '../support/TestSupport';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputShiftPayloadExpansion]';

function tap(controller: KeyboardController, keyCode: number): void {
  pressHardKey(controller, keyCode);
  releaseHardKey(controller, keyCode);
}

export default function shiftPayloadExpansionTest(): void {
  describe('ShiftPayloadExpansionTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_SHIFT_PAYLOAD_EXPANSION_0100
     * @tc.name      testShiftPayloadExpansion_001
     * @tc.desc      Verify that a zero-width space under a held shift keeps its code unit before the letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testShiftPayloadExpansion_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testShiftPayloadExpansion_001 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      const invisible: string = String.fromCharCode(8203);

      pressHardKey(controller, 2047);
      InputHandler.getInstance().insertText(invisible);
      tap(controller, 2017);
      releaseHardKey(controller, 2047);
      expect(harness.client.insertedTexts[0].length).assertEqual(1);
      expect(harness.client.insertedTexts[0].charCodeAt(0)).assertEqual(8203);
      expect(harness.client.insertedTexts[1]).assertEqual('A');
      expect(harness.client.journal.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testShiftPayloadExpansion_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SHIFT_PAYLOAD_EXPANSION_0200
     * @tc.name      testShiftPayloadExpansion_002
     * @tc.desc      Verify that a zero-length forward deletion under a held shift precedes the letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testShiftPayloadExpansion_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testShiftPayloadExpansion_002 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      pressHardKey(controller, 2047);
      InputHandler.getInstance().deleteForward(0);
      tap(controller, 2018);
      releaseHardKey(controller, 2047);
      expect(harness.client.forwardLengths.join('')).assertEqual('0');
      expect(harness.client.insertedTexts.join('')).assertEqual('B');
      expect(harness.client.journal.join('|')).assertEqual('forward:0|insert:B');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testShiftPayloadExpansion_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SHIFT_PAYLOAD_EXPANSION_0300
     * @tc.name      testShiftPayloadExpansion_003
     * @tc.desc      Verify that two enters under a held shift do not change the latch for the later letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testShiftPayloadExpansion_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testShiftPayloadExpansion_003 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(3);
      const controller: KeyboardController = createKeyboardController();

      pressHardKey(controller, 2047);
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.keyFunctions.length).assertEqual(2);
      releaseHardKey(controller, 2047);
      tap(controller, 2019);
      expect(harness.client.insertedTexts.join('')).assertEqual('c');
      expect(isShiftHeld(controller)).assertFalse();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testShiftPayloadExpansion_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SHIFT_PAYLOAD_EXPANSION_0400
     * @tc.name      testShiftPayloadExpansion_004
     * @tc.desc      Verify that select-all and a five-unit deletion under shift keep two journal entries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testShiftPayloadExpansion_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testShiftPayloadExpansion_004 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      pressHardKey(controller, 2047);
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.SELECT_ALL);
      InputHandler.getInstance().deleteForward(5);
      releaseHardKey(controller, 2047);
      expect(harness.client.extendActions[0]).assertEqual(inputMethodEngine.ExtendAction.SELECT_ALL);
      expect(harness.client.forwardLengths[0]).assertEqual(5);
      expect(harness.client.journal.length).assertEqual(2);
      expect(harness.client.insertedTexts.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testShiftPayloadExpansion_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SHIFT_PAYLOAD_EXPANSION_0500
     * @tc.name      testShiftPayloadExpansion_005
     * @tc.desc      Verify that two hide requests under a held shift still leave the next letter uppercase.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testShiftPayloadExpansion_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testShiftPayloadExpansion_005 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      pressHardKey(controller, 2047);
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().hideKeyboardSelf();
      tap(controller, 2020);
      releaseHardKey(controller, 2047);
      expect(harness.keyboard.hideCount).assertEqual(2);
      expect(harness.client.insertedTexts[0]).assertEqual('D');
      expect(harness.client.journal.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testShiftPayloadExpansion_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SHIFT_PAYLOAD_EXPANSION_0600
     * @tc.name      testShiftPayloadExpansion_006
     * @tc.desc      Verify that a negative forward length under a held shift is forwarded before the letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testShiftPayloadExpansion_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testShiftPayloadExpansion_006 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      pressHardKey(controller, 2047);
      InputHandler.getInstance().deleteForward(-2);
      tap(controller, 2021);
      releaseHardKey(controller, 2047);
      expect(harness.client.forwardLengths.join('')).assertEqual('-2');
      expect(harness.client.insertedTexts.join('')).assertEqual('E');
      expect(harness.client.journal.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testShiftPayloadExpansion_006 end');
      await yieldToEventLoop();
    });

  });
}
