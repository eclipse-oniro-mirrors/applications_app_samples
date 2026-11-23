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
const TAG: string = '[Sample_KikaInputMethodClientRouting]';

export default function clientRoutingTest(): void {
  describe('ClientRoutingTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CLIENT_ROUTING_0001
     * @tc.name      testClientRoutingTest_001
     * @tc.desc      Verify that a late insertion reaches only the newest client.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testClientRoutingTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClientRoutingTest_001 begin');
      const first: PreviewHarness = await createPreviewHarness('a');
      const second: PreviewHarness = await createPreviewHarness('b');
      InputHandler.getInstance().insertText('x');
      expect(first.client.insertedTexts.length).assertEqual(0);
      expect(second.client.insertedTexts.join('')).assertEqual('x');
      expect(second.client.buffer).assertEqual('bx');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClientRoutingTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CLIENT_ROUTING_0002
     * @tc.name      testClientRoutingTest_002
     * @tc.desc      Verify that each client keeps its own enter type across a switch.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testClientRoutingTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClientRoutingTest_002 begin');
      const first: PreviewHarness = await createPreviewHarness('', 1);
      InputHandler.getInstance().sendKeyFunction();
      const second: PreviewHarness = await createPreviewHarness('', 6);
      InputHandler.getInstance().sendKeyFunction();
      expect(first.client.keyFunctions[0]).assertEqual(1);
      expect(second.client.keyFunctions[0]).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClientRoutingTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CLIENT_ROUTING_0003
     * @tc.name      testClientRoutingTest_003
     * @tc.desc      Verify that a hide request reaches only the newest panel controller.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testClientRoutingTest_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClientRoutingTest_003 begin');
      const first: PreviewHarness = await createPreviewHarness('a');
      const second: PreviewHarness = await createPreviewHarness('b');
      InputHandler.getInstance().hideKeyboardSelf();
      expect(first.keyboard.hideCount).assertEqual(0);
      expect(second.keyboard.hideCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClientRoutingTest_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CLIENT_ROUTING_0004
     * @tc.name      testClientRoutingTest_004
     * @tc.desc      Verify that an edit action is routed to the newest client only.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testClientRoutingTest_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClientRoutingTest_004 begin');
      const first: PreviewHarness = await createPreviewHarness('a');
      const second: PreviewHarness = await createPreviewHarness('b');
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.COPY);
      expect(first.client.extendActions.length).assertEqual(0);
      expect(second.client.extendActions[0]).assertEqual(inputMethodEngine.ExtendAction.COPY);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClientRoutingTest_004 end');
      await yieldToEventLoop();
    });

  });

}
