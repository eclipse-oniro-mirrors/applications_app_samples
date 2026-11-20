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
import { createPreviewHarness, PreviewHarness } from '../support/PreviewHarness';
import { pressHardKey, releaseHardKey, isShiftHeld } from '../support/TestSupport';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodAltCombination]';

export default function altCombinationTest(): void {
  describe('AltCombinationTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ALT_COMBINATION_0001
     * @tc.name      testAltCombinationTest_001
     * @tc.desc      Verify that alt followed by shift leaves shift unheld and inserts nothing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAltCombinationTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAltCombinationTest_001 begin');
      // Return values show interception separately from the inserted glyph.
      const harness: PreviewHarness = await createPreviewHarness('');

      // Release sequences must leave the singleton with no held key.
      expect(pressHardKey(2045)).assertEqual(false);
      expect(pressHardKey(2047)).assertEqual(false);
      expect(isShiftHeld()).assertEqual(false);
      expect(releaseHardKey(2047)).assertEqual(true);
      expect(releaseHardKey(2045)).assertEqual(true);
      expect(harness.client.insertedTexts.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testAltCombinationTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ALT_COMBINATION_0002
     * @tc.name      testAltCombinationTest_002
     * @tc.desc      Verify that shift plus alt enters the blocked special state and both releases keep it closed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAltCombinationTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAltCombinationTest_002 begin');
      // Release paths must end clean because the controller is process-wide.
      const harness: PreviewHarness = await createPreviewHarness('');

      // Held-key order is part of the contract, not an implementation detail.
      expect(pressHardKey(2047)).assertEqual(false);
      expect(pressHardKey(2045)).assertEqual(false);
      expect(releaseHardKey(2045)).assertEqual(false);
      expect(releaseHardKey(2047)).assertEqual(false);
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(isShiftHeld()).assertEqual(false);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testAltCombinationTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ALT_COMBINATION_0003
     * @tc.name      testAltCombinationTest_003
     * @tc.desc      Verify that pressing alt twice and releasing twice never inserts text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAltCombinationTest_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAltCombinationTest_003 begin');
      // Held-key order is the contract: shift follows the first key down.
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(2045)).assertEqual(false);
      expect(pressHardKey(2045)).assertEqual(false);
      expect(releaseHardKey(2045)).assertEqual(true);
      expect(releaseHardKey(2045)).assertEqual(true);
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testAltCombinationTest_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ALT_COMBINATION_0004
     * @tc.name      testAltCombinationTest_004
     * @tc.desc      Verify that alt does not block a following digit from reaching the editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAltCombinationTest_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAltCombinationTest_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(2045)).assertEqual(false);
      expect(pressHardKey(2001)).assertEqual(true);
      expect(releaseHardKey(2001)).assertEqual(true);
      expect(releaseHardKey(2045)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('1');
      expect(harness.client.buffer).assertEqual('1');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testAltCombinationTest_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ALT_COMBINATION_0005
     * @tc.name      testAltCombinationTest_005
     * @tc.desc      Verify that alt does not block the DEL function key from deleting forward.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAltCombinationTest_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAltCombinationTest_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');

      expect(pressHardKey(2045)).assertEqual(false);
      expect(pressHardKey(2055)).assertEqual(true);
      expect(harness.client.forwardLengths.length).assertEqual(1);
      expect(harness.client.forwardLengths[0]).assertEqual(1);
      expect(releaseHardKey(2055)).assertEqual(true);
      expect(releaseHardKey(2045)).assertEqual(true);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testAltCombinationTest_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ALT_COMBINATION_0006
     * @tc.name      testAltCombinationTest_006
     * @tc.desc      Verify that releasing alt before the letter does not remove the letter from the editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAltCombinationTest_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAltCombinationTest_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      const pressExpected: boolean[] = [false, true];
      expect(pressHardKey(2045)).assertEqual(pressExpected[0]);
      expect(pressHardKey(2017)).assertEqual(pressExpected[1]);
      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(releaseHardKey(2045)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(harness.client.insertedTexts[0]).assertEqual('a');
      expect(harness.client.buffer.length).assertEqual(1);
      expect(harness.client.buffer.charCodeAt(0)).assertEqual(97);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testAltCombinationTest_006 end');
      await yieldToEventLoop();
    });

  });

}
