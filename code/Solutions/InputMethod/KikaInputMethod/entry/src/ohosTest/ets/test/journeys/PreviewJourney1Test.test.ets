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
import { createPreviewHarness, PreviewHarness, typeSequence } from '../support/PreviewHarness';
import { InputHandler } from '../../../../main/ets/InputMethodExtensionAbility/model/KeyboardController';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodPreviewJourney]';

export default function previewJourney1Test(): void {
  describe('PreviewJourney1Test', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_JOURNEY_0001
     * @tc.name      testPreviewJourney1Test_001
     * @tc.desc      Verify one complete preview journey: trigger, confirm, edit, move and hide.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewJourney1Test_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewJourney1Test_001 begin');
      // One journey is enough here; the focused suites cover each step in isolation.
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().insertText('x');
      InputHandler.getInstance().deleteBackward(1);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      InputHandler.getInstance().hideKeyboardSelf();

      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.insertedTexts.join('')).assertEqual('helx');
      expect(harness.client.backwardLengths.join(',')).assertEqual('1');
      expect(harness.client.movedDirections.join(',')).assertEqual('3');
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hello worldx');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewJourney1Test_001 end');
      await yieldToEventLoop();
    });

  });

}
