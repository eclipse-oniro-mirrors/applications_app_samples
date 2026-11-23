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
const TAG: string = '[Sample_KikaInputExtremeArgument]';

export default function extremeArgumentTest(): void {
  describe('ExtremeArgumentTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_EXTREME_ARGUMENT_0100
     * @tc.name      testExtremeArgument_001
     * @tc.desc      Verify that the maximum backward length is forwarded without clamping.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testExtremeArgument_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeArgument_001 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().deleteBackward(2147483647);
      expect(harness.client.backwardLengths[0]).assertEqual(2147483647);
      expect(harness.client.journal.join('')).assertEqual('back:2147483647');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeArgument_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EXTREME_ARGUMENT_0200
     * @tc.name      testExtremeArgument_002
     * @tc.desc      Verify that the minimum forward length is forwarded as a negative number.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testExtremeArgument_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeArgument_002 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().deleteForward(-2147483648);
      expect(harness.client.forwardLengths[0] < 0).assertTrue();
      expect(harness.client.forwardLengths[0]).assertEqual(-2147483648);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeArgument_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EXTREME_ARGUMENT_0300
     * @tc.name      testExtremeArgument_003
     * @tc.desc      Verify that an undocumented caret direction value is still forwarded once.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testExtremeArgument_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeArgument_003 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().moveCursor(99 as inputMethodEngine.Direction);
      expect(harness.client.movedDirections.length).assertEqual(1);
      expect(harness.client.movedDirections[0]).assertEqual(99);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeArgument_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EXTREME_ARGUMENT_0400
     * @tc.name      testExtremeArgument_004
     * @tc.desc      Verify that an undocumented extend action value is still forwarded once.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testExtremeArgument_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeArgument_004 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().sendExtendAction(99 as inputMethodEngine.ExtendAction);
      expect(harness.client.extendActions.length).assertEqual(1);
      expect(harness.client.journal.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeArgument_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EXTREME_ARGUMENT_0500
     * @tc.name      testExtremeArgument_005
     * @tc.desc      Verify that a lone high surrogate is stored as one code unit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testExtremeArgument_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeArgument_005 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const lone: string = String.fromCharCode(55357);
      InputHandler.getInstance().insertText(lone);
      expect(harness.client.insertedTexts[0].length).assertEqual(1);
      expect(harness.client.insertedTexts[0].charCodeAt(0)).assertEqual(55357);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeArgument_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EXTREME_ARGUMENT_0600
     * @tc.name      testExtremeArgument_006
     * @tc.desc      Verify that a ten-thousand-character payload remains one insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testExtremeArgument_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeArgument_006 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      let payload: string = '';
      for (let i = 0; i < 10000; i++) {
        payload = payload + 'L';
      }
      InputHandler.getInstance().insertText(payload);
      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(harness.client.insertedTexts[0].length).assertEqual(10000);
      expect(harness.client.journal.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeArgument_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EXTREME_ARGUMENT_0700
     * @tc.name      testExtremeArgument_007
     * @tc.desc      Verify that the maximum enter type is forwarded without coercion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testExtremeArgument_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeArgument_007 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(2147483647);
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.keyFunctions[0]).assertEqual(2147483647);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(2147483647);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeArgument_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EXTREME_ARGUMENT_0800
     * @tc.name      testExtremeArgument_008
     * @tc.desc      Verify that repeated hides after a stop reach no controller.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testExtremeArgument_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeArgument_008 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().onInputStop();
      for (let i = 0; i < 5; i++) {
        InputHandler.getInstance().hideKeyboardSelf();
      }
      expect(harness.keyboard.hideCount).assertEqual(0);
      expect(harness.client.journal.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeArgument_008 end');
      await yieldToEventLoop();
    });

  });
}
