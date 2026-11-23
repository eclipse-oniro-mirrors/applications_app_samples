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
import { yieldToEventLoop } from '../support/AsyncSupport';
import { InputHandler, KeyboardController } from '../../../../main/ets/model/KeyboardController';
import { ClientHarness, createClientHarness } from '../support/ClientHarness';
import {
  createKeyboardController,
  inputHardKeyValue,
  isAlphabetKeyCode,
  isNumberKeyCode,
  pressHardKey,
  releaseHardKey
} from '../support/TestSupport';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputClassificationRoutingCross]';

function tap(controller: KeyboardController, keyCode: number): void {
  pressHardKey(controller, keyCode);
  releaseHardKey(controller, keyCode);
}

export default function classificationRoutingCrossTest(): void {
  describe('ClassificationRoutingCrossTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_CLASSIFICATION_ROUTING_CROSS_0100
     * @tc.name      testClassificationRoutingCross_001
     * @tc.desc      Verify that the two alphabet edge codes insert a and z through the composed stage.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testClassificationRoutingCross_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClassificationRoutingCross_001 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      expect(isAlphabetKeyCode(controller, 2017)).assertTrue();
      expect(isAlphabetKeyCode(controller, 2042)).assertTrue();
      expect(inputHardKeyValue(controller, 'a', 2017)).assertTrue();
      expect(inputHardKeyValue(controller, 'z', 2042)).assertTrue();
      expect(harness.client.insertedTexts.join('')).assertEqual('az');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testClassificationRoutingCross_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CLASSIFICATION_ROUTING_CROSS_0200
     * @tc.name      testClassificationRoutingCross_002
     * @tc.desc      Verify that the decimal edge codes classify as numbers and insert their digits.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testClassificationRoutingCross_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClassificationRoutingCross_002 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      expect(isNumberKeyCode(controller, 2000)).assertTrue();
      expect(isNumberKeyCode(controller, 2009)).assertTrue();
      tap(controller, 2000);
      tap(controller, 2009);
      expect(harness.client.journal.join('|')).assertEqual('insert:0|insert:9');
      expect(harness.client.insertedTexts.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testClassificationRoutingCross_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CLASSIFICATION_ROUTING_CROSS_0300
     * @tc.name      testClassificationRoutingCross_003
     * @tc.desc      Verify that the pre-range code is rejected by both classifiers and inserts an empty token.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testClassificationRoutingCross_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClassificationRoutingCross_003 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      expect(isAlphabetKeyCode(controller, 1999)).assertFalse();
      expect(isNumberKeyCode(controller, 1999)).assertFalse();
      expect(inputHardKeyValue(controller, '', 1999)).assertTrue();
      expect(harness.client.journal.join('')).assertEqual('insert:');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testClassificationRoutingCross_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CLASSIFICATION_ROUTING_CROSS_0400
     * @tc.name      testClassificationRoutingCross_004
     * @tc.desc      Verify that the center token is not a letter or number but still becomes an insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testClassificationRoutingCross_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClassificationRoutingCross_004 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      expect(isAlphabetKeyCode(controller, 2016)).assertFalse();
      expect(isNumberKeyCode(controller, 2016)).assertFalse();
      expect(inputHardKeyValue(controller, 'KEYCODE_DPAD_CENTER', 2016)).assertTrue();
      expect(harness.client.insertedTexts[0]).assertEqual('KEYCODE_DPAD_CENTER');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testClassificationRoutingCross_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CLASSIFICATION_ROUTING_CROSS_0500
     * @tc.name      testClassificationRoutingCross_005
     * @tc.desc      Verify that a numpad code classifies as a number but has no glyph translation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testClassificationRoutingCross_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClassificationRoutingCross_005 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      expect(isNumberKeyCode(controller, 2103)).assertTrue();
      expect(isAlphabetKeyCode(controller, 2103)).assertFalse();
      expect(inputHardKeyValue(controller, '', 2103)).assertTrue();
      expect(harness.client.insertedTexts[0].length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testClassificationRoutingCross_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CLASSIFICATION_ROUTING_CROSS_0600
     * @tc.name      testClassificationRoutingCross_006
     * @tc.desc      Verify that the two alphabet neighbours are rejected by the alphabet classifier.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testClassificationRoutingCross_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClassificationRoutingCross_006 begin');
      const controller: KeyboardController = createKeyboardController();
      const neighbours: number[] = [2016, 2043];
      let rejected: number = 0;
      for (let i = 0; i < neighbours.length; i++) {
        if (!isAlphabetKeyCode(controller, neighbours[i])) {
          rejected = rejected + 1;
        }
      }
      expect(rejected).assertEqual(2);
      expect(isAlphabetKeyCode(controller, 2043)).assertFalse();
      expect(isAlphabetKeyCode(controller, 2016)).assertFalse();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testClassificationRoutingCross_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CLASSIFICATION_ROUTING_CROSS_0700
     * @tc.name      testClassificationRoutingCross_007
     * @tc.desc      Verify that two controllers classify the same boundary code independently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testClassificationRoutingCross_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClassificationRoutingCross_007 begin');
      const first: KeyboardController = createKeyboardController();
      const second: KeyboardController = createKeyboardController();
      const results: boolean[] = [isAlphabetKeyCode(first, 2017), isAlphabetKeyCode(second, 2043),
        isNumberKeyCode(first, 2009), isNumberKeyCode(second, 2010)];
      expect(results.join('|')).assertEqual('true|false|true|false');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testClassificationRoutingCross_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CLASSIFICATION_ROUTING_CROSS_0800
     * @tc.name      testClassificationRoutingCross_008
     * @tc.desc      Verify that a shifted letter code still classifies as a letter before insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testClassificationRoutingCross_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClassificationRoutingCross_008 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      pressHardKey(controller, 2047);
      expect(isAlphabetKeyCode(controller, 2017)).assertTrue();
      pressHardKey(controller, 2017);
      releaseHardKey(controller, 2017);
      releaseHardKey(controller, 2047);
      expect(harness.client.insertedTexts[0]).assertEqual('A');
      expect(harness.client.journal.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testClassificationRoutingCross_008 end');
      await yieldToEventLoop();
    });

  });
}
