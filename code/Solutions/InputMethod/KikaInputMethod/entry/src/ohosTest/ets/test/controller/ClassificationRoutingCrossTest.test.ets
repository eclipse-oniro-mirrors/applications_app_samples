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
import { PreviewHarness, createPreviewHarness } from '../support/PreviewHarness';
import { keyboardController } from '../../../../main/ets/InputMethodExtensionAbility/model/KeyboardController';
import { pressHardKey, releaseHardKey } from '../support/TestSupport';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodClassificationRoutingCross]';

export default function classificationRoutingCrossTest(): void {
  describe('ClassificationRoutingCrossTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CLASSIFICATION_ROUTING_CROSS_0001
     * @tc.name      testClassificationRoutingCross_001
     * @tc.desc      Verify that the alphabet edge codes classify and insert their glyphs.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testClassificationRoutingCross_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClassificationRoutingCross_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      expect(keyboardController.isKeyCodeAZ(2017)).assertTrue();
      expect(keyboardController.isKeyCodeAZ(2042)).assertTrue();
      expect(keyboardController.inputHardKeyCode('a', 2017)).assertTrue();
      expect(keyboardController.inputHardKeyCode('z', 2042)).assertTrue();
      expect(harness.client.buffer).assertEqual('az');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testClassificationRoutingCross_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CLASSIFICATION_ROUTING_CROSS_0002
     * @tc.name      testClassificationRoutingCross_002
     * @tc.desc      Verify that decimal edge codes classify as numbers and insert digits.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testClassificationRoutingCross_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClassificationRoutingCross_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      expect(keyboardController.isKeyCodeNumber(2000)).assertTrue();
      expect(keyboardController.isKeyCodeNumber(2009)).assertTrue();
      pressHardKey(2000);
      releaseHardKey(2000);
      pressHardKey(2009);
      releaseHardKey(2009);
      expect(harness.client.buffer).assertEqual('09');
      expect(harness.client.insertedTexts.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testClassificationRoutingCross_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CLASSIFICATION_ROUTING_CROSS_0003
     * @tc.name      testClassificationRoutingCross_003
     * @tc.desc      Verify that a pre-range code is rejected by both classifiers and inserts an empty token.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testClassificationRoutingCross_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClassificationRoutingCross_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      expect(keyboardController.isKeyCodeAZ(1999)).assertFalse();
      expect(keyboardController.isKeyCodeNumber(1999)).assertFalse();
      expect(keyboardController.inputHardKeyCode('', 1999)).assertTrue();
      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(harness.client.buffer.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testClassificationRoutingCross_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CLASSIFICATION_ROUTING_CROSS_0004
     * @tc.name      testClassificationRoutingCross_004
     * @tc.desc      Verify that the center token classifies as neither letter nor number but is inserted.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testClassificationRoutingCross_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClassificationRoutingCross_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      expect(keyboardController.isKeyCodeAZ(2016)).assertFalse();
      expect(keyboardController.isKeyCodeNumber(2016)).assertFalse();
      expect(keyboardController.inputHardKeyCode('KEYCODE_DPAD_CENTER', 2016)).assertTrue();
      expect(harness.client.buffer).assertEqual('KEYCODE_DPAD_CENTER');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testClassificationRoutingCross_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CLASSIFICATION_ROUTING_CROSS_0005
     * @tc.name      testClassificationRoutingCross_005
     * @tc.desc      Verify that a numpad code classifies as a number without a glyph translation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testClassificationRoutingCross_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClassificationRoutingCross_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      expect(keyboardController.isKeyCodeNumber(2103)).assertTrue();
      expect(keyboardController.isKeyCodeAZ(2103)).assertFalse();
      expect(keyboardController.inputHardKeyCode('', 2103)).assertTrue();
      expect(harness.client.insertedTexts[0].length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testClassificationRoutingCross_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CLASSIFICATION_ROUTING_CROSS_0006
     * @tc.name      testClassificationRoutingCross_006
     * @tc.desc      Verify that both alphabet neighbours are rejected by the alphabet classifier.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testClassificationRoutingCross_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClassificationRoutingCross_006 begin');
      const rejected: boolean[] = [!keyboardController.isKeyCodeAZ(2016), !keyboardController.isKeyCodeAZ(2043)];
      expect(rejected.join('|')).assertEqual('true|true');
      expect(keyboardController.isKeyCodeAZ(2017)).assertTrue();
      expect(keyboardController.isKeyCodeAZ(2042)).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testClassificationRoutingCross_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CLASSIFICATION_ROUTING_CROSS_0007
     * @tc.name      testClassificationRoutingCross_007
     * @tc.desc      Verify that the same classifier answer stays stable across repeated calls.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testClassificationRoutingCross_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClassificationRoutingCross_007 begin');
      const answers: boolean[] = [];
      for (let i = 0; i < 5; i++) {
        answers.push(keyboardController.isKeyCodeNumber(2009));
      }
      expect(answers.join('|')).assertEqual('true|true|true|true|true');
      expect(keyboardController.isKeyCodeNumber(2010)).assertFalse();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testClassificationRoutingCross_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CLASSIFICATION_ROUTING_CROSS_0008
     * @tc.name      testClassificationRoutingCross_008
     * @tc.desc      Verify that a shifted letter code still classifies as a letter before insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testClassificationRoutingCross_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClassificationRoutingCross_008 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      pressHardKey(2047);
      expect(keyboardController.isKeyCodeAZ(2017)).assertTrue();
      pressHardKey(2017);
      releaseHardKey(2017);
      releaseHardKey(2047);
      expect(harness.client.buffer).assertEqual('A');
      expect(harness.client.insertedTexts.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testClassificationRoutingCross_008 end');
      await yieldToEventLoop();
    });

  });
}
