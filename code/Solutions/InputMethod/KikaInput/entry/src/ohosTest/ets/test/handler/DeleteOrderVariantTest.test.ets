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
import { ClientHarness, createClientHarness } from '../support/ClientHarness';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputDeleteOrderVariant]';

export default function deleteOrderVariantTest(): void {
  describe('DeleteOrderVariantTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_DELETE_ORDER_VARIANT_0100
     * @tc.name      testDeleteOrderVariant_001
     * @tc.desc      Verify that three descending backward lengths keep their call order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDeleteOrderVariant_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteOrderVariant_001 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().deleteBackward(3);
      InputHandler.getInstance().deleteBackward(2);
      InputHandler.getInstance().deleteBackward(1);
      expect(harness.client.backwardLengths.join('|')).assertEqual('3|2|1');
      expect(harness.client.journal.length).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteOrderVariant_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_DELETE_ORDER_VARIANT_0200
     * @tc.name      testDeleteOrderVariant_002
     * @tc.desc      Verify that forward-backward-forward deletions keep their direction slots.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDeleteOrderVariant_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteOrderVariant_002 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().deleteForward(2);
      InputHandler.getInstance().deleteBackward(4);
      InputHandler.getInstance().deleteForward(6);
      expect(harness.client.journal.join('|')).assertEqual('forward:2|back:4|forward:6');
      expect(harness.client.backwardLengths.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteOrderVariant_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_DELETE_ORDER_VARIANT_0300
     * @tc.name      testDeleteOrderVariant_003
     * @tc.desc      Verify that a negative length followed by a positive length is preserved.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDeleteOrderVariant_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteOrderVariant_003 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().deleteBackward(-3);
      InputHandler.getInstance().deleteBackward(3);
      expect(harness.client.backwardLengths.join('|')).assertEqual('-3|3');
      expect(harness.client.backwardLengths[0] + harness.client.backwardLengths[1]).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteOrderVariant_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_DELETE_ORDER_VARIANT_0400
     * @tc.name      testDeleteOrderVariant_004
     * @tc.desc      Verify that a maximum length and a zero length remain distinct calls.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDeleteOrderVariant_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteOrderVariant_004 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().deleteForward(2147483647);
      InputHandler.getInstance().deleteForward(0);
      expect(harness.client.forwardLengths.length).assertEqual(2);
      expect(harness.client.forwardLengths[0]).assertEqual(2147483647);
      expect(harness.client.forwardLengths[1]).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteOrderVariant_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_DELETE_ORDER_VARIANT_0500
     * @tc.name      testDeleteOrderVariant_005
     * @tc.desc      Verify that five zero deletions stay five separate journal entries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDeleteOrderVariant_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteOrderVariant_005 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      for (let i = 0; i < 5; i++) {
        InputHandler.getInstance().deleteBackward(0);
      }
      expect(harness.client.journal.length).assertEqual(5);
      expect(harness.client.journal.join('')).assertEqual('back:0back:0back:0back:0back:0');
      expect(harness.client.insertedTexts.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteOrderVariant_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_DELETE_ORDER_VARIANT_0600
     * @tc.name      testDeleteOrderVariant_006
     * @tc.desc      Verify that a deletion after a left move keeps the move first.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDeleteOrderVariant_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteOrderVariant_006 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      InputHandler.getInstance().deleteForward(5);
      expect(harness.client.journal.join('|')).assertEqual('move:3|forward:5');
      expect(harness.client.movedDirections.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteOrderVariant_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_DELETE_ORDER_VARIANT_0700
     * @tc.name      testDeleteOrderVariant_007
     * @tc.desc      Verify that a deletion after an enter keeps both typed commands.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDeleteOrderVariant_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteOrderVariant_007 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(7);
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().deleteBackward(7);
      expect(harness.client.journal.join('|')).assertEqual('enter:7|back:7');
      expect(harness.client.keyFunctions[0]).assertEqual(7);
      expect(harness.client.backwardLengths[0]).assertEqual(7);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteOrderVariant_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_DELETE_ORDER_VARIANT_0800
     * @tc.name      testDeleteOrderVariant_008
     * @tc.desc      Verify that a switch inside a deletion sequence routes the second call onward.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDeleteOrderVariant_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteOrderVariant_008 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().deleteBackward(1);
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().deleteBackward(2);
      expect(first.client.backwardLengths.join('')).assertEqual('1');
      expect(second.client.backwardLengths.join('')).assertEqual('2');
      expect(first.client.journal.length + second.client.journal.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteOrderVariant_008 end');
      await yieldToEventLoop();
    });

  });
}
