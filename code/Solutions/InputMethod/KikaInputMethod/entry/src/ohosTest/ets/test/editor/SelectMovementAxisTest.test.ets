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
import { InputHandler } from '../../../../main/ets/InputMethodExtensionAbility/model/KeyboardController';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodSelectMovementAxis]';

export default function selectMovementAxisTest(): void {
  describe('SelectMovementAxisTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SELECT_AXIS_0001
     * @tc.name      testSelectMovementAxisTest_001
     * @tc.desc      Verify that all four selection movements are forwarded in order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSelectMovementAxisTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectMovementAxisTest_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');
      const directions: inputMethodEngine.Direction[] = [
        inputMethodEngine.Direction.CURSOR_UP,
        inputMethodEngine.Direction.CURSOR_DOWN,
        inputMethodEngine.Direction.CURSOR_LEFT,
        inputMethodEngine.Direction.CURSOR_RIGHT
      ];
      for (let i = 0; i < directions.length; i++) {
        InputHandler.getInstance().selectByMovement(directions[i]);
      }
      expect(harness.client.movementDirections.join(',')).assertEqual('1,2,3,4');
      expect(harness.client.buffer).assertEqual('abc');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectMovementAxisTest_001 end');
      await yieldToEventLoop();
    });

  });

}
