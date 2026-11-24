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

import { Level, Size, TestType, describe, expect, it } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import { yieldToEventLoop } from '../support/AsyncSupport';
import { PreviewHarness, createPreviewHarness } from '../support/PreviewHarness';
import { pressHardKey, releaseHardKey } from '../support/TestSupport';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodShiftPair]';

export default function ShiftReleaseSuiteTest(): void {
  describe('ShiftReleaseSuite', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SHIFT_PAIR_0001
     * @tc.name      testShiftPairTest_001
     * @tc.desc      Verify that the right shift alone capitalizes one letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testShiftPairTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testShiftPairTest_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      expect(pressHardKey(2048)).assertEqual(false);
      expect(pressHardKey(2017)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('A');
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2048)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testShiftPairTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_RELEASE_ORDER_0001
     * @tc.name      testReleaseOrderTest_001
     * @tc.desc      Verify that releasing three held letters first-last keeps all insertions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testReleaseOrderTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testReleaseOrderTest_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      expect(pressHardKey(2017)).assertEqual(true);
      expect(pressHardKey(2018)).assertEqual(true);
      expect(pressHardKey(2019)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2018)).assertEqual(true);
      expect(releaseHardKey(2019)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('abc');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testReleaseOrderTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SPECIAL_LATCH_0001
     * @tc.name      testSpecialLatchOrderTest_001
     * @tc.desc      Verify that shift released during an unknown-code latch does not end the latch early.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSpecialLatchOrderTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSpecialLatchOrderTest_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      expect(pressHardKey(3000)).assertEqual(false);
      expect(pressHardKey(2047)).assertEqual(false);
      expect(releaseHardKey(2047)).assertEqual(false);
      expect(pressHardKey(2020)).assertEqual(false);
      expect(releaseHardKey(2020)).assertEqual(false);
      expect(releaseHardKey(3000)).assertEqual(false);
      expect(pressHardKey(2020)).assertEqual(true);
      expect(releaseHardKey(2020)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('d');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSpecialLatchOrderTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_DUPLICATE_RELEASE_0001
     * @tc.name      testDuplicateReleaseTest_001
     * @tc.desc      Verify that releasing one letter twice returns true and inserts only once.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDuplicateReleaseTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDuplicateReleaseTest_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      expect(pressHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('a');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDuplicateReleaseTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_DUPLICATE_RELEASE_0002
     * @tc.name      testDuplicateReleaseTest_002
     * @tc.desc      Verify that shift released twice leaves the hold clear.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDuplicateReleaseTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDuplicateReleaseTest_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      expect(pressHardKey(2047)).assertEqual(false);
      expect(releaseHardKey(2047)).assertEqual(true);
      expect(releaseHardKey(2047)).assertEqual(true);
      expect(harness.client.insertedTexts.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDuplicateReleaseTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_FUNCTION_SHIFT_0001
     * @tc.name      testFunctionShiftTest_001
     * @tc.desc      Verify that a direction key under a held shift is blocked and moves nothing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testFunctionShiftTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFunctionShiftTest_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');
      expect(pressHardKey(2047)).assertEqual(false);
      expect(pressHardKey(2012)).assertEqual(false);
      expect(releaseHardKey(2012)).assertEqual(true);
      expect(releaseHardKey(2047)).assertEqual(false);
      expect(harness.client.movedDirections.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFunctionShiftTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_FUNCTION_SHIFT_0002
     * @tc.name      testFunctionShiftTest_002
     * @tc.desc      Verify that space under a held shift is blocked and inserts no whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testFunctionShiftTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFunctionShiftTest_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      expect(pressHardKey(2047)).assertEqual(false);
      expect(pressHardKey(2050)).assertEqual(false);
      expect(releaseHardKey(2050)).assertEqual(false);
      expect(releaseHardKey(2047)).assertEqual(false);
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFunctionShiftTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SHIFT_BEHIND_0001
     * @tc.name      testShiftBehindHoldTest_001
     * @tc.desc      Verify that shift pressed behind two held letters does not capitalize the next key.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testShiftBehindHoldTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testShiftBehindHoldTest_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      expect(pressHardKey(2017)).assertEqual(true);
      expect(pressHardKey(2018)).assertEqual(true);
      expect(pressHardKey(2047)).assertEqual(false);
      expect(pressHardKey(2019)).assertEqual(true);
      expect(releaseHardKey(2019)).assertEqual(true);
      expect(releaseHardKey(2018)).assertEqual(true);
      expect(releaseHardKey(2047)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('abc');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testShiftBehindHoldTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SHIFT_BEHIND_0002
     * @tc.name      testShiftBehindHoldTest_002
     * @tc.desc      Verify that releasing the middle letter before adding shift keeps later letters lowercase.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testShiftBehindHoldTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testShiftBehindHoldTest_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      expect(pressHardKey(2017)).assertEqual(true);
      expect(pressHardKey(2018)).assertEqual(true);
      expect(pressHardKey(2019)).assertEqual(true);
      expect(releaseHardKey(2018)).assertEqual(true);
      expect(pressHardKey(2047)).assertEqual(false);
      expect(pressHardKey(2020)).assertEqual(true);
      expect(releaseHardKey(2020)).assertEqual(true);
      expect(releaseHardKey(2019)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2047)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('abcd');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testShiftBehindHoldTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_RELEASE_CONTRACT_0001
     * @tc.name      testReleaseContractTest_001
     * @tc.desc      Verify that releasing an unheld alphabet key returns true and inserts nothing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testReleaseContractTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testReleaseContractTest_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');

      expect(releaseHardKey(2017)).assertEqual(true);
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('abc');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testReleaseContractTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_RELEASE_CONTRACT_0002
     * @tc.name      testReleaseContractTest_002
     * @tc.desc      Verify that every function code is absorbed on release and returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testReleaseContractTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testReleaseContractTest_002 begin');
      const codes: number[] = [2055, 2071, 2012, 2013, 2014, 2015, 2016];

      for (let i = 0; i < codes.length; i++) {
        expect(releaseHardKey(codes[i])).assertEqual(true);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testReleaseContractTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_RELEASE_CONTRACT_0003
     * @tc.name      testReleaseContractTest_003
     * @tc.desc      Verify that an unheld alt release returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testReleaseContractTest_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testReleaseContractTest_003 begin');

      expect(releaseHardKey(2045)).assertEqual(true);
      expect(releaseHardKey(2046)).assertEqual(true);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testReleaseContractTest_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_RELEASE_CONTRACT_0004
     * @tc.name      testReleaseContractTest_004
     * @tc.desc      Verify that releasing punctuation and whitespace never inserts their glyphs.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testReleaseContractTest_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testReleaseContractTest_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const codes: number[] = [2043, 2044, 2050, 2065];

      for (let i = 0; i < codes.length; i++) {
        expect(releaseHardKey(codes[i])).assertEqual(true);
      }
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testReleaseContractTest_004 end');
      await yieldToEventLoop();
    });

  });
}
