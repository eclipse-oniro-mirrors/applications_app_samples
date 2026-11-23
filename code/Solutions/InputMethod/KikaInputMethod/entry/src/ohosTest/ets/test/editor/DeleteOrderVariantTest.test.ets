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
const TAG: string = '[Sample_KikaInputMethodDeleteOrderVariant]';

export default function deleteOrderVariantTest(): void {
  describe('DeleteOrderVariantTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_DELETE_ORDER_VARIANT_0001
     * @tc.name      testDeleteOrderVariant_001
     * @tc.desc      Verify that three descending backward lengths keep their array order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDeleteOrderVariant_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteOrderVariant_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().deleteBackward(3);
      InputHandler.getInstance().deleteBackward(2);
      InputHandler.getInstance().deleteBackward(1);
      expect(harness.client.backwardLengths.join('|')).assertEqual('3|2|1');
      expect(harness.client.buffer).assertEqual('');
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteOrderVariant_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_DELETE_ORDER_VARIANT_0002
     * @tc.name      testDeleteOrderVariant_002
     * @tc.desc      Verify that forward-backward-forward deletions keep their direction channels.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDeleteOrderVariant_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteOrderVariant_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().deleteForward(2);
      InputHandler.getInstance().deleteBackward(4);
      InputHandler.getInstance().deleteForward(6);
      expect(harness.client.forwardLengths.join('|')).assertEqual('2|6');
      expect(harness.client.backwardLengths.join('')).assertEqual('4');
      expect(harness.client.forwardLengths.length + harness.client.backwardLengths.length).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteOrderVariant_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_DELETE_ORDER_VARIANT_0003
     * @tc.name      testDeleteOrderVariant_003
     * @tc.desc      Verify that a negative and a positive backward length cancel in sum.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDeleteOrderVariant_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteOrderVariant_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().deleteBackward(-3);
      InputHandler.getInstance().deleteBackward(3);
      expect(harness.client.backwardLengths[0]).assertEqual(-3);
      expect(harness.client.backwardLengths[0] + harness.client.backwardLengths[1]).assertEqual(0);
      expect(harness.client.buffer).assertEqual('');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteOrderVariant_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_DELETE_ORDER_VARIANT_0004
     * @tc.name      testDeleteOrderVariant_004
     * @tc.desc      Verify that a maximum forward length and a zero backward length stay on separate channels.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDeleteOrderVariant_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteOrderVariant_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().insertText('q');
      InputHandler.getInstance().deleteForward(2147483647);
      InputHandler.getInstance().deleteBackward(0);
      expect(harness.client.buffer).assertEqual('q');
      expect(harness.client.forwardLengths[0]).assertEqual(2147483647);
      expect(harness.client.backwardLengths[0]).assertEqual(0);
      expect(harness.client.forwardLengths.length + harness.client.backwardLengths.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteOrderVariant_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_DELETE_ORDER_VARIANT_0005
     * @tc.name      testDeleteOrderVariant_005
     * @tc.desc      Verify that five zero backward deletions stay five separate calls.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDeleteOrderVariant_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteOrderVariant_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      for (let i = 0; i < 5; i++) {
        InputHandler.getInstance().deleteBackward(0);
      }
      expect(harness.client.backwardLengths.length).assertEqual(5);
      let zeroSum: number = 0;
      for (let i = 0; i < harness.client.backwardLengths.length; i++) {
        zeroSum = zeroSum + harness.client.backwardLengths[i];
      }
      expect(zeroSum).assertEqual(0);
      expect(harness.client.insertedTexts.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteOrderVariant_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_DELETE_ORDER_VARIANT_0006
     * @tc.name      testDeleteOrderVariant_006
     * @tc.desc      Verify that a deletion after a left move keeps both calls in order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDeleteOrderVariant_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteOrderVariant_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      InputHandler.getInstance().deleteForward(5);
      expect(harness.client.movedDirections.join('')).assertEqual('3');
      expect(harness.client.forwardLengths.join('')).assertEqual('5');
      expect(harness.client.backwardLengths.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteOrderVariant_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_DELETE_ORDER_VARIANT_0007
     * @tc.name      testDeleteOrderVariant_007
     * @tc.desc      Verify that a deletion after an enter keeps the key function and deletion counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDeleteOrderVariant_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteOrderVariant_007 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 7);
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().deleteBackward(7);
      expect(harness.client.keyFunctions.join('')).assertEqual('7');
      expect(harness.client.backwardLengths.join('')).assertEqual('7');
      expect(harness.client.finishCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteOrderVariant_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_DELETE_ORDER_VARIANT_0008
     * @tc.name      testDeleteOrderVariant_008
     * @tc.desc      Verify that a client switch inside a deletion sequence routes the second call onward.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDeleteOrderVariant_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteOrderVariant_008 begin');
      const first: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().deleteBackward(1);
      const second: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().deleteBackward(2);
      expect(first.client.backwardLengths.join('')).assertEqual('1');
      expect(second.client.backwardLengths.join('')).assertEqual('2');
      expect(first.client.buffer).assertEqual('');
      expect(second.client.buffer).assertEqual('');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteOrderVariant_008 end');
      await yieldToEventLoop();
    });

  });
}
