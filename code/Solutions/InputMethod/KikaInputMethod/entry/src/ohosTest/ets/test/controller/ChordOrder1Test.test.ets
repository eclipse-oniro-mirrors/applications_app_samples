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
const TAG: string = '[Sample_KikaInputMethodMore2]';

export default function chordOrder1Test(): void {
  describe('ChordOrder1Test', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDORDER1_0001
     * @tc.name      testChordOrder_1001
     * @tc.desc      Verify the extended chord 2017-2018-2019-2020 released as 2017-2018-2019-2020.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordOrder_1001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_1001 begin');
      // Release order is observable because the controller keeps a held stack.
      const harness: PreviewHarness = await createPreviewHarness('');
      const step1: boolean = pressHardKey(2017);
      expect(step1).assertEqual(true);
      const step2: boolean = pressHardKey(2018);
      expect(step2).assertEqual(true);
      const step3: boolean = pressHardKey(2019);
      expect(step3).assertEqual(true);
      const step4: boolean = pressHardKey(2020);
      expect(step4).assertEqual(true);
      const step5: boolean = releaseHardKey(2017);
      expect(step5).assertEqual(true);
      const step6: boolean = releaseHardKey(2018);
      expect(step6).assertEqual(true);
      const step7: boolean = releaseHardKey(2019);
      expect(step7).assertEqual(true);
      const step8: boolean = releaseHardKey(2020);
      expect(step8).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('abcd');
      expect(harness.client.buffer).assertEqual('abcd');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_1001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDORDER1_0002
     * @tc.name      testChordOrder_1002
     * @tc.desc      Verify the extended chord 2017-2018-2019-2020 released as 2020-2019-2018-2017.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordOrder_1002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_1002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      expect(pressHardKey(2017)).assertEqual(true);
      expect(pressHardKey(2018)).assertEqual(true);
      expect(pressHardKey(2019)).assertEqual(true);
      expect(pressHardKey(2020)).assertEqual(true);
      expect(releaseHardKey(2020)).assertEqual(true);
      expect(releaseHardKey(2019)).assertEqual(true);
      expect(releaseHardKey(2018)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      // The last release must clear every modifier, otherwise the next case inherits it.
      expect(harness.client.insertedTexts.join('')).assertEqual('abcd');
      expect(harness.client.buffer).assertEqual('abcd');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_1002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDORDER1_0003
     * @tc.name      testChordOrder_1003
     * @tc.desc      Verify the extended chord 2017-2018-2019-2020 released as 2018-2020-2017-2019.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordOrder_1003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_1003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const held: number[] = [2017, 2018, 2019, 2020];
      const released: number[] = [2018, 2020, 2017, 2019];
      for (let i: number = 0; i < held.length; i++) {
        expect(pressHardKey(held[i])).assertEqual(true);
      }
      for (let i: number = 0; i < released.length; i++) {
        expect(releaseHardKey(released[i])).assertEqual(true);
      }
      expect(harness.client.insertedTexts.join('')).assertEqual('abcd');
      expect(harness.client.buffer).assertEqual('abcd');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_1003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDORDER1_0004
     * @tc.name      testChordOrder_1004
     * @tc.desc      Verify the extended chord 2017-2018-2019-2020 released as 2019-2017-2020-2018.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordOrder_1004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_1004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const pressOrder: number[] = [2017, 2018, 2019, 2020];
      let index: number = 0;
      while (index < pressOrder.length) {
        expect(pressHardKey(pressOrder[index])).assertEqual(true);
        index = index + 1;
      }
      const releaseOrder: number[] = [2019, 2017, 2020, 2018];
      for (let i: number = 0; i < releaseOrder.length; i++) {
        expect(releaseHardKey(releaseOrder[i])).assertEqual(true);
      }
      expect(harness.client.insertedTexts.join('')).assertEqual('abcd');
      expect(harness.client.buffer.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_1004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDORDER1_0005
     * @tc.name      testChordOrder_1005
     * @tc.desc      Verify the extended chord 2017-2018-2019-2020 released as 2017-2019-2020-2018.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordOrder_1005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_1005 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      expect(pressHardKey(2017)).assertEqual(true);
      expect(pressHardKey(2018)).assertEqual(true);
      expect(pressHardKey(2019)).assertEqual(true);
      expect(pressHardKey(2020)).assertEqual(true);
      const releaseOrder: number[] = [2017, 2019, 2020, 2018];
      for (let i: number = 0; i < releaseOrder.length; i++) {
        expect(releaseHardKey(releaseOrder[i])).assertEqual(true);
      }
      const joined: string = harness.client.insertedTexts.join('');
      expect(joined.length).assertEqual(4);
      expect(joined).assertEqual(harness.client.buffer);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_1005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDORDER1_0006
     * @tc.name      testChordOrder_1006
     * @tc.desc      Verify the extended chord 2017-2018-2019-2020 released as 2020-2017-2018-2019.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordOrder_1006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_1006 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      expect(pressHardKey(2017)).assertEqual(true);
      expect(pressHardKey(2018)).assertEqual(true);
      expect(pressHardKey(2019)).assertEqual(true);
      expect(pressHardKey(2020)).assertEqual(true);
      const releaseOrder: number[] = [2020, 2017, 2018, 2019];
      const releaseExpected: boolean[] = [true, true, true, true];
      for (let i: number = 0; i < releaseOrder.length; i++) {
        expect(releaseHardKey(releaseOrder[i])).assertEqual(releaseExpected[i]);
      }
      expect(harness.client.insertedTexts.join('')).assertEqual('abcd');
      expect(harness.client.buffer).assertEqual('abcd');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_1006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDORDER1_0007
     * @tc.name      testChordOrder_1007
     * @tc.desc      Verify the extended chord 2017-2018-2047 released as 2017-2018-2047.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordOrder_1007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_1007 begin');
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
      expect(harness.client.buffer).assertEqual('ab');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_1007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDORDER1_0008
     * @tc.name      testChordOrder_1008
     * @tc.desc      Verify the extended chord 2017-2018-2047 released as 2017-2047-2018.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordOrder_1008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_1008 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      expect(pressHardKey(2017)).assertEqual(true);
      expect(pressHardKey(2018)).assertEqual(true);
      expect(pressHardKey(2047)).assertEqual(false);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2047)).assertEqual(true);
      expect(releaseHardKey(2018)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('ab');
      expect(harness.client.buffer).assertEqual('ab');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_1008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDORDER1_0009
     * @tc.name      testChordOrder_1009
     * @tc.desc      Verify the extended chord 2017-2018-2047 released as 2018-2017-2047.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordOrder_1009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_1009 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const pressKeys: number[] = [2017, 2018, 2047];
      const pressExpected: boolean[] = [true, true, false];
      for (let i: number = 0; i < pressKeys.length; i++) {
        expect(pressHardKey(pressKeys[i])).assertEqual(pressExpected[i]);
      }
      const releaseKeys: number[] = [2018, 2017, 2047];
      for (let i: number = 0; i < releaseKeys.length; i++) {
        expect(releaseHardKey(releaseKeys[i])).assertEqual(true);
      }
      expect(harness.client.insertedTexts.join('')).assertEqual('ab');
      expect(harness.client.buffer).assertEqual('ab');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_1009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDORDER1_0010
     * @tc.name      testChordOrder_1010
     * @tc.desc      Verify the extended chord 2017-2018-2047 released as 2018-2047-2017.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordOrder_1010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_1010 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const pressResults: boolean[] = [pressHardKey(2017), pressHardKey(2018), pressHardKey(2047)];
      expect(pressResults.join(',')).assertEqual('true,true,false');
      const releaseResults: boolean[] = [releaseHardKey(2018), releaseHardKey(2047), releaseHardKey(2017)];
      expect(releaseResults.length).assertEqual(3);
      expect(releaseResults.join(',')).assertEqual('true,true,true');
      expect(harness.client.insertedTexts.join('')).assertEqual('ab');
      expect(harness.client.buffer).assertEqual('ab');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_1010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDORDER1_0011
     * @tc.name      testChordOrder_1011
     * @tc.desc      Verify the extended chord 2017-2018-2047 released as 2047-2017-2018.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordOrder_1011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_1011 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const results: boolean[] = [];
      results.push(pressHardKey(2017));
      results.push(pressHardKey(2018));
      results.push(pressHardKey(2047));
      results.push(releaseHardKey(2047));
      results.push(releaseHardKey(2017));
      results.push(releaseHardKey(2018));
      expect(results.join('|')).assertEqual('true|true|false|true|true|true');
      expect(harness.client.insertedTexts.join('')).assertEqual('ab');
      expect(harness.client.buffer).assertEqual('ab');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_1011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDORDER1_0012
     * @tc.name      testChordOrder_1012
     * @tc.desc      Verify the extended chord 2017-2018-2047 released as 2047-2018-2017.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordOrder_1012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_1012 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const expected: string = 'ab';
      expect(pressHardKey(2017)).assertEqual(true);
      expect(pressHardKey(2018)).assertEqual(true);
      expect(pressHardKey(2047)).assertEqual(false);
      const releaseOrder: number[] = [2047, 2018, 2017];
      let index: number = 0;
      while (index < releaseOrder.length) {
        expect(releaseHardKey(releaseOrder[index])).assertEqual(true);
        index = index + 1;
      }
      expect(harness.client.insertedTexts.join('')).assertEqual(expected);
      expect(harness.client.buffer).assertEqual(expected);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_1012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDORDER1_0013
     * @tc.name      testChordOrder_1013
     * @tc.desc      Verify the extended chord 2017-2018-2045 released as 2017-2018-2045.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordOrder_1013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_1013 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const keys: number[] = [2017, 2018, 2045];
      const accepted: boolean[] = [true, true, false];
      let index: number = 0;
      while (index < keys.length) {
        expect(pressHardKey(keys[index])).assertEqual(accepted[index]);
        index = index + 1;
      }
      for (let i: number = 0; i < keys.length; i++) {
        expect(releaseHardKey(keys[i])).assertEqual(true);
      }
      expect(harness.client.insertedTexts.join('')).assertEqual('ab');
      expect(harness.client.buffer.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_1013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDORDER1_0014
     * @tc.name      testChordOrder_1014
     * @tc.desc      Verify the extended chord 2017-2018-2045 released as 2017-2045-2018.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordOrder_1014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_1014 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const first: boolean = pressHardKey(2017);
      const second: boolean = pressHardKey(2018);
      const blocked: boolean = pressHardKey(2045);
      expect(first).assertEqual(true);
      expect(second).assertEqual(true);
      expect(blocked).assertEqual(false);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2045)).assertEqual(true);
      expect(releaseHardKey(2018)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('ab');
      expect(harness.client.buffer.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_1014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDORDER1_0015
     * @tc.name      testChordOrder_1015
     * @tc.desc      Verify the extended chord 2017-2018-2045 released as 2018-2017-2045.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordOrder_1015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_1015 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const expected: string = 'ab';
      expect(pressHardKey(2017)).assertEqual(true);
      expect(pressHardKey(2018)).assertEqual(true);
      expect(pressHardKey(2045)).assertEqual(false);
      const releaseOrder: number[] = [2018, 2017, 2045];
      for (let i: number = 0; i < releaseOrder.length; i++) {
        expect(releaseHardKey(releaseOrder[i])).assertEqual(true);
      }
      expect(harness.client.insertedTexts.join('')).assertEqual(expected);
      expect(harness.client.buffer.length).assertEqual(expected.length);
      expect(harness.client.buffer.charCodeAt(1)).assertEqual(98);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_1015 end');
      await yieldToEventLoop();
    });

  });

}
