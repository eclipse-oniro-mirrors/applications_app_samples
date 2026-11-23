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
import { InputHandler } from '../../../../main/ets/model/KeyboardController';
import { ClientHarness, FakeKeyboardController, createClientHarness } from '../support/ClientHarness';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputReattachKeyboardSwap]';

export default function reattachKeyboardSwapTest(): void {
  describe('ReattachKeyboardSwapTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_REATTACH_KEYBOARD_SWAP_0100
     * @tc.name      testReattachKeyboardSwap_001
     * @tc.desc      Verify that two reattachments of one harness read the attribute twice more.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testReattachKeyboardSwap_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testReattachKeyboardSwap_001 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(4);
      for (let i = 0; i < 2; i++) {
        InputHandler.getInstance().onInputStart(
          harness.keyboard as object as inputMethodEngine.KeyboardController,
          harness.client as object as inputMethodEngine.InputClient);
        await Promise.resolve();
        await Promise.resolve();
      }
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.editorAttributeCount).assertEqual(3);
      expect(harness.client.keyFunctions.join('')).assertEqual('4');
      expect(harness.client.journal.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testReattachKeyboardSwap_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_REATTACH_KEYBOARD_SWAP_0200
     * @tc.name      testReattachKeyboardSwap_002
     * @tc.desc      Verify that reattaching appends to the earlier journal instead of replacing it.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testReattachKeyboardSwap_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testReattachKeyboardSwap_002 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().insertText('a');
      InputHandler.getInstance().onInputStart(
        harness.keyboard as object as inputMethodEngine.KeyboardController,
        harness.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().insertText('b');
      expect(harness.client.insertedTexts.join('')).assertEqual('ab');
      expect(harness.client.journal.join('|')).assertEqual('insert:a|insert:b');
      expect(harness.client.editorAttributeCount).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testReattachKeyboardSwap_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_REATTACH_KEYBOARD_SWAP_0300
     * @tc.name      testReattachKeyboardSwap_003
     * @tc.desc      Verify that swapping only the keyboard object redirects later hide requests.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testReattachKeyboardSwap_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testReattachKeyboardSwap_003 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const replacement: FakeKeyboardController = new FakeKeyboardController();
      InputHandler.getInstance().onInputStart(
        replacement as object as inputMethodEngine.KeyboardController,
        harness.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().hideKeyboardSelf();
      expect(replacement.hideCount).assertEqual(1);
      expect(harness.keyboard.hideCount).assertEqual(0);
      expect(harness.client.editorAttributeCount).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testReattachKeyboardSwap_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_REATTACH_KEYBOARD_SWAP_0400
     * @tc.name      testReattachKeyboardSwap_004
     * @tc.desc      Verify that two stops after a reattach detach the client without extra commands.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testReattachKeyboardSwap_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testReattachKeyboardSwap_004 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().onInputStart(
        harness.keyboard as object as inputMethodEngine.KeyboardController,
        harness.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().insertText('late');
      expect(harness.client.journal.length).assertEqual(0);
      expect(harness.client.editorAttributeCount).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testReattachKeyboardSwap_004 end');
      await yieldToEventLoop();
    });

  });
}
