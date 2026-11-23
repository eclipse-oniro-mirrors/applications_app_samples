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
import { createPreviewHarness, PreviewHarness } from '../support/PreviewHarness';
import { pressHardKey, releaseHardKey, isShiftHeld } from '../support/TestSupport';
import { keyboardController } from '../../../../main/ets/InputMethodExtensionAbility/model/KeyboardController';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodPublicMethod]';

interface TokenRow {
  token: string;
  expected: boolean;
}

export default function publicMethodTest(): void {
  describe('PublicMethodTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PUBLIC_METHOD_0001
     * @tc.name      testPublicMethodTest_001
     * @tc.desc      Verify that a letter token is inserted once and reported as handled.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPublicMethodTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPublicMethodTest_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      const handled: boolean = keyboardController.inputHardKeyCode('a', 2017);

      expect(handled).assertEqual(true);
      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(harness.client.insertedTexts[0]).assertEqual('a');
      expect(harness.client.buffer).assertEqual('a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPublicMethodTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PUBLIC_METHOD_0002
     * @tc.name      testPublicMethodTest_002
     * @tc.desc      Verify that the DEL token routes to forward deletion and is reported as handled.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPublicMethodTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPublicMethodTest_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');

      const handled: boolean = keyboardController.inputHardKeyCode('KEYCODE_DEL', 2055);

      expect(handled).assertEqual(true);
      expect(harness.client.forwardLengths.length).assertEqual(1);
      expect(harness.client.forwardLengths[0]).assertEqual(1);
      expect(harness.client.insertedTexts.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPublicMethodTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PUBLIC_METHOD_0003
     * @tc.name      testPublicMethodTest_003
     * @tc.desc      Verify that a shift token is consumed without inserting text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPublicMethodTest_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPublicMethodTest_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      const handled: boolean = keyboardController.inputHardKeyCode('KEYCODE_SHIFT_RIGHT', 2048);

      expect(handled).assertEqual(false);
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPublicMethodTest_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PUBLIC_METHOD_0004
     * @tc.name      testPublicMethodTest_004
     * @tc.desc      Verify that shiftKeys recognizes exactly the two shift tokens.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPublicMethodTest_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPublicMethodTest_004 begin');
      const rows: TokenRow[] = [
        { token: 'KEYCODE_SHIFT_LEFT', expected: true },
        { token: 'KEYCODE_SHIFT_RIGHT', expected: true },
        { token: 'KEYCODE_DEL', expected: false },
        { token: 'KEYCODE_DPAD_UP', expected: false },
        { token: 'a', expected: false },
        { token: '', expected: false }
      ];

      for (let i = 0; i < rows.length; i++) {
        expect(keyboardController.shiftKeys(rows[i].token)).assertEqual(rows[i].expected);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPublicMethodTest_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PUBLIC_METHOD_0005
     * @tc.name      testPublicMethodTest_005
     * @tc.desc      Verify that the six function tokens dispatch their own editor commands and report handled.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPublicMethodTest_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPublicMethodTest_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');
      const tokens: string[] = [
        'KEYCODE_DEL', 'KEYCODE_FORWARD_DEL', 'KEYCODE_DPAD_UP',
        'KEYCODE_DPAD_DOWN', 'KEYCODE_DPAD_LEFT', 'KEYCODE_DPAD_RIGHT'
      ];

      for (let i = 0; i < tokens.length; i++) {
        expect(keyboardController.processFunctionKeys(tokens[i])).assertEqual(true);
      }
      expect(harness.client.forwardLengths.length).assertEqual(1);
      expect(harness.client.backwardLengths.length).assertEqual(1);
      expect(harness.client.movedDirections.length).assertEqual(4);
      expect(harness.client.movedDirections[0]).assertEqual(inputMethodEngine.Direction.CURSOR_UP);
      expect(harness.client.movedDirections[1]).assertEqual(inputMethodEngine.Direction.CURSOR_DOWN);
      expect(harness.client.movedDirections[2]).assertEqual(inputMethodEngine.Direction.CURSOR_LEFT);
      expect(harness.client.movedDirections[3]).assertEqual(inputMethodEngine.Direction.CURSOR_RIGHT);
      expect(harness.client.insertedTexts.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPublicMethodTest_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PUBLIC_METHOD_0006
     * @tc.name      testPublicMethodTest_006
     * @tc.desc      Verify that the center token and an unknown token are not treated as function keys.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPublicMethodTest_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPublicMethodTest_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');

      expect(keyboardController.processFunctionKeys('KEYCODE_DPAD_CENTER')).assertEqual(false);
      expect(keyboardController.processFunctionKeys('not-a-token')).assertEqual(false);
      expect(harness.client.forwardLengths.length).assertEqual(0);
      expect(harness.client.backwardLengths.length).assertEqual(0);
      expect(harness.client.movedDirections.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPublicMethodTest_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PUBLIC_METHOD_0007
     * @tc.name      testPublicMethodTest_007
     * @tc.desc      Verify that shift becomes the leading hold only after the earlier letter is released.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPublicMethodTest_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPublicMethodTest_007 begin');
      await createPreviewHarness('');

      expect(pressHardKey(2017)).assertEqual(true);
      expect(pressHardKey(2047)).assertEqual(false);
      expect(isShiftHeld()).assertEqual(false);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(isShiftHeld()).assertEqual(true);
      expect(releaseHardKey(2047)).assertEqual(true);
      expect(isShiftHeld()).assertEqual(false);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPublicMethodTest_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PUBLIC_METHOD_0008
     * @tc.name      testPublicMethodTest_008
     * @tc.desc      Verify that a punctuation token reaches the editor with its exact glyph.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPublicMethodTest_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPublicMethodTest_008 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(keyboardController.inputHardKeyCode('@', 2065)).assertEqual(true);
      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(harness.client.insertedTexts[0]).assertEqual('@');
      expect(harness.client.buffer).assertEqual('@');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPublicMethodTest_008 end');
      await yieldToEventLoop();
    });

  });

}
