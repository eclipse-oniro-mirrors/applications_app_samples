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
import { pressHardKey, releaseHardKey } from '../support/TestSupport';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodMore]';

export default function chordRelease1Test(): void {
  describe('ChordRelease1Test', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDRELEASE1_0001
     * @tc.name      testChordRelease_1001
     * @tc.desc      Verify the chord release order 2017-2018-2019 after holding 2017-2018-2019.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordRelease_1001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordRelease_1001 begin');
      // The controller keeps a held stack, so the release order is part of the contract.
      const harness: PreviewHarness = await createPreviewHarness('');
      const step1: boolean = pressHardKey(2017);
      expect(step1).assertEqual(true);
      const step2: boolean = pressHardKey(2018);
      expect(step2).assertEqual(true);
      const step3: boolean = pressHardKey(2019);
      expect(step3).assertEqual(true);
      const step4: boolean = releaseHardKey(2017);
      expect(step4).assertEqual(true);
      const step5: boolean = releaseHardKey(2018);
      expect(step5).assertEqual(true);
      const step6: boolean = releaseHardKey(2019);
      expect(step6).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('abc');
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordRelease_1001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDRELEASE1_0002
     * @tc.name      testChordRelease_1002
     * @tc.desc      Verify the chord release order 2017-2019-2018 after holding 2017-2018-2019.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordRelease_1002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordRelease_1002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      expect(pressHardKey(2017)).assertEqual(true);
      expect(pressHardKey(2018)).assertEqual(true);
      expect(pressHardKey(2019)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2019)).assertEqual(true);
      expect(releaseHardKey(2018)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('abc');
      // A clean end state proves the stack did not retain a modifier.
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordRelease_1002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDRELEASE1_0003
     * @tc.name      testChordRelease_1003
     * @tc.desc      Verify the chord release order 2018-2017-2019 after holding 2017-2018-2019.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordRelease_1003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordRelease_1003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const pressOrder: number[] = [2017, 2018, 2019];
      const releaseOrder: number[] = [2018, 2017, 2019];
      for (let i: number = 0; i < pressOrder.length; i++) {
        expect(pressHardKey(pressOrder[i])).assertEqual(true);
      }
      for (let i: number = 0; i < releaseOrder.length; i++) {
        expect(releaseHardKey(releaseOrder[i])).assertEqual(true);
      }
      expect(harness.client.insertedTexts.join('')).assertEqual('abc');
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordRelease_1003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDRELEASE1_0004
     * @tc.name      testChordRelease_1004
     * @tc.desc      Verify the chord release order 2018-2019-2017 after holding 2017-2018-2019.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordRelease_1004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordRelease_1004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const expected: string = 'abc';
      const outcomes: boolean[] = [
        pressHardKey(2017), pressHardKey(2018), pressHardKey(2019),
        releaseHardKey(2018), releaseHardKey(2019), releaseHardKey(2017)
      ];
      expect(outcomes.join(',')).assertEqual('true,true,true,true,true,true');
      expect(harness.client.insertedTexts.join('')).assertEqual(expected);
      expect(harness.client.buffer).assertEqual(expected);
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordRelease_1004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDRELEASE1_0005
     * @tc.name      testChordRelease_1005
     * @tc.desc      Verify the chord release order 2019-2017-2018 after holding 2017-2018-2019.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordRelease_1005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordRelease_1005 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      expect(pressHardKey(2017)).assertEqual(true);
      expect(pressHardKey(2018)).assertEqual(true);
      expect(pressHardKey(2019)).assertEqual(true);
      const releaseOrder: number[] = [2019, 2017, 2018];
      for (let i: number = 0; i < releaseOrder.length; i++) {
        expect(releaseHardKey(releaseOrder[i])).assertEqual(true);
      }
      expect(harness.client.insertedTexts.join('')).assertEqual('abc');
      expect(harness.client.buffer).assertEqual('abc');
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordRelease_1005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDRELEASE1_0006
     * @tc.name      testChordRelease_1006
     * @tc.desc      Verify the chord release order 2019-2018-2017 after holding 2017-2018-2019.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordRelease_1006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordRelease_1006 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const pressOrder: number[] = [2017, 2018, 2019];
      let index: number = 0;
      while (index < pressOrder.length) {
        expect(pressHardKey(pressOrder[index])).assertEqual(true);
        index = index + 1;
      }
      const releaseOrder: number[] = [2019, 2018, 2017];
      for (let i: number = 0; i < releaseOrder.length; i++) {
        expect(releaseHardKey(releaseOrder[i])).assertEqual(true);
      }
      expect(harness.client.insertedTexts.join('')).assertEqual('abc');
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordRelease_1006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDRELEASE1_0007
     * @tc.name      testChordRelease_1007
     * @tc.desc      Verify the chord release order 2017-2047 after holding 2017-2047.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordRelease_1007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordRelease_1007 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const step1: boolean = pressHardKey(2017);
      expect(step1).assertEqual(true);
      const step2: boolean = pressHardKey(2047);
      expect(step2).assertEqual(false);
      const step3: boolean = releaseHardKey(2017);
      expect(step3).assertEqual(true);
      const step4: boolean = releaseHardKey(2047);
      expect(step4).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('a');
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordRelease_1007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDRELEASE1_0008
     * @tc.name      testChordRelease_1008
     * @tc.desc      Verify the chord release order 2047-2017 after holding 2017-2047.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordRelease_1008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordRelease_1008 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      expect(pressHardKey(2017)).assertEqual(true);
      expect(pressHardKey(2047)).assertEqual(false);
      expect(releaseHardKey(2047)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('a');
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordRelease_1008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDRELEASE1_0009
     * @tc.name      testChordRelease_1009
     * @tc.desc      Verify the chord release order 2017-2018-2047 after holding 2017-2018-2047.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordRelease_1009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordRelease_1009 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const step1: boolean = pressHardKey(2017);
      expect(step1).assertEqual(true);
      const step2: boolean = pressHardKey(2018);
      expect(step2).assertEqual(true);
      const step3: boolean = pressHardKey(2047);
      expect(step3).assertEqual(false);
      const step4: boolean = releaseHardKey(2017);
      expect(step4).assertEqual(true);
      const step5: boolean = releaseHardKey(2018);
      expect(step5).assertEqual(true);
      const step6: boolean = releaseHardKey(2047);
      expect(step6).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('ab');
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordRelease_1009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDRELEASE1_0010
     * @tc.name      testChordRelease_1010
     * @tc.desc      Verify the chord release order 2017-2047-2018 after holding 2017-2018-2047.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordRelease_1010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordRelease_1010 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      expect(pressHardKey(2017)).assertEqual(true);
      expect(pressHardKey(2018)).assertEqual(true);
      expect(pressHardKey(2047)).assertEqual(false);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2047)).assertEqual(true);
      expect(releaseHardKey(2018)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('ab');
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordRelease_1010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDRELEASE1_0011
     * @tc.name      testChordRelease_1011
     * @tc.desc      Verify the chord release order 2018-2017-2047 after holding 2017-2018-2047.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordRelease_1011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordRelease_1011 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const pressOrder: number[] = [2017, 2018, 2047];
      const pressFlags: boolean[] = [true, true, false];
      for (let i: number = 0; i < pressOrder.length; i++) {
        expect(pressHardKey(pressOrder[i])).assertEqual(pressFlags[i]);
      }
      const releaseOrder: number[] = [2018, 2017, 2047];
      for (let i: number = 0; i < releaseOrder.length; i++) {
        expect(releaseHardKey(releaseOrder[i])).assertEqual(true);
      }
      expect(harness.client.insertedTexts.join('')).assertEqual('ab');
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordRelease_1011 end');
      await yieldToEventLoop();
    });

  });

}
