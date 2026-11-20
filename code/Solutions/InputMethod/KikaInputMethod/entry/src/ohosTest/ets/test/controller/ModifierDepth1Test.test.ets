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
const TAG: string = '[Sample_KikaInputMethodRound]';

export default function modifierDepth1Test(): void {
  describe('ModifierDepth1Test', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIERDEPTH1_0001
     * @tc.name      testModifierDepth_1001
     * @tc.desc      Verify the modifier path D2048, R2040, D2000, R2000, R2048.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierDepth_1001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierDepth_1001 begin');
      // Modifier semantics depend on the earliest held key, not on the last key pressed.
      const harness: PreviewHarness = await createPreviewHarness('a');
      for (const value of [pressHardKey(2048)]) {
        expect(value).assertEqual(false);
      }
      for (const value of [releaseHardKey(2040)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [pressHardKey(2000)]) {
        expect(value).assertEqual(false);
      }
      for (const value of [releaseHardKey(2000)]) {
        expect(value).assertEqual(false);
      }
      for (const value of [releaseHardKey(2048)]) {
        expect(value).assertEqual(false);
      }
      expect(harness.client.movedDirections.join(',')).assertEqual('');
      expect(harness.client.insertedTexts.join('')).assertEqual('');
      expect(harness.client.buffer).assertEqual('a');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierDepth_1001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIERDEPTH1_0002
     * @tc.name      testModifierDepth_1002
     * @tc.desc      Verify the modifier path D2048, R2015, R2024, R2048.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierDepth_1002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierDepth_1002 begin');
      const harness: PreviewHarness = await createPreviewHarness('a');
      expect(pressHardKey(2048)).assertEqual(false);
      expect(releaseHardKey(2015)).assertEqual(true);
      expect(releaseHardKey(2024)).assertEqual(true);
      expect(releaseHardKey(2048)).assertEqual(true);
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('a');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierDepth_1002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIERDEPTH1_0003
     * @tc.name      testModifierDepth_1003
     * @tc.desc      Verify the modifier path D2047, D2026, R2026, R2047.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierDepth_1003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierDepth_1003 begin');
      const harness: PreviewHarness = await createPreviewHarness('a');

      const outcomes: boolean[] = [];
      outcomes.push(pressHardKey(2047));
      outcomes.push(pressHardKey(2026));
      outcomes.push(releaseHardKey(2026));
      outcomes.push(releaseHardKey(2047));
      expect(outcomes.length).assertEqual(4);
      expect(outcomes.join(',')).assertEqual('false,true,true,true');
      expect(harness.client.insertedTexts.join('')).assertEqual('J');
      expect(harness.client.buffer.length).assertEqual(2);
      expect(harness.client.buffer.charAt(1)).assertEqual('J');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierDepth_1003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIERDEPTH1_0004
     * @tc.name      testModifierDepth_1004
     * @tc.desc      Verify the modifier path D2048, R2071, R2048.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierDepth_1004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierDepth_1004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const outcome1: boolean = pressHardKey(2048);
      expect(outcome1).assertEqual(false);
      const outcome2: boolean = releaseHardKey(2071);
      expect(outcome2).assertEqual(true);
      const outcome3: boolean = releaseHardKey(2048);
      expect(outcome3).assertEqual(true);
      expect(harness.client.forwardLengths.join(',')).assertEqual('');
      expect(harness.client.backwardLengths.join(',')).assertEqual('');
      expect(harness.client.buffer).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierDepth_1004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIERDEPTH1_0005
     * @tc.name      testModifierDepth_1005
     * @tc.desc      Verify the modifier path D2048, R2055, D2003, R2003, R2003, R2048.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierDepth_1005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierDepth_1005 begin');
      const harness: PreviewHarness = await createPreviewHarness('he');
      for (const value of [pressHardKey(2048)]) {
        expect(value).assertEqual(false);
      }
      for (const value of [releaseHardKey(2055)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [pressHardKey(2003)]) {
        expect(value).assertEqual(false);
      }
      for (const value of [releaseHardKey(2003)]) {
        expect(value).assertEqual(false);
      }
      for (const value of [releaseHardKey(2003)]) {
        expect(value).assertEqual(false);
      }
      for (const value of [releaseHardKey(2048)]) {
        expect(value).assertEqual(false);
      }
      expect(harness.client.movedDirections.join(',')).assertEqual('');
      expect(harness.client.insertedTexts.join('')).assertEqual('');
      expect(harness.client.buffer).assertEqual('he');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierDepth_1005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIERDEPTH1_0006
     * @tc.name      testModifierDepth_1006
     * @tc.desc      Verify the modifier path D2047, D2022, R2071, D2040, R2055, R2040, R2022, R2047.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierDepth_1006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierDepth_1006 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      expect(pressHardKey(2047)).assertEqual(false);
      expect(pressHardKey(2022)).assertEqual(true);
      expect(releaseHardKey(2071)).assertEqual(true);
      expect(pressHardKey(2040)).assertEqual(true);
      expect(releaseHardKey(2055)).assertEqual(true);
      expect(releaseHardKey(2040)).assertEqual(true);
      expect(releaseHardKey(2022)).assertEqual(true);
      expect(releaseHardKey(2047)).assertEqual(true);
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('FX');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierDepth_1006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIERDEPTH1_0007
     * @tc.name      testModifierDepth_1007
     * @tc.desc      Verify the modifier path D2045, D2023, R2038, R2039, R2023, R2045.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierDepth_1007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierDepth_1007 begin');
      const harness: PreviewHarness = await createPreviewHarness('a');
      expect(pressHardKey(2045)).assertEqual(false);
      expect(pressHardKey(2023)).assertEqual(true);
      expect(releaseHardKey(2038)).assertEqual(true);
      expect(releaseHardKey(2039)).assertEqual(true);
      expect(releaseHardKey(2023)).assertEqual(true);
      expect(releaseHardKey(2045)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('g');
      expect(harness.client.buffer).assertEqual('ag');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierDepth_1007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIERDEPTH1_0008
     * @tc.name      testModifierDepth_1008
     * @tc.desc      Verify the modifier path D2048, D2042, R2042, R2048.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierDepth_1008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierDepth_1008 begin');
      const harness: PreviewHarness = await createPreviewHarness('x1');
      const outcome1: boolean = pressHardKey(2048);
      expect(outcome1).assertEqual(false);
      const outcome2: boolean = pressHardKey(2042);
      expect(outcome2).assertEqual(true);
      const outcome3: boolean = releaseHardKey(2042);
      expect(outcome3).assertEqual(true);
      const outcome4: boolean = releaseHardKey(2048);
      expect(outcome4).assertEqual(true);
      expect(harness.client.forwardLengths.join(',')).assertEqual('');
      expect(harness.client.backwardLengths.join(',')).assertEqual('');
      expect(harness.client.buffer).assertEqual('x1Z');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierDepth_1008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIERDEPTH1_0009
     * @tc.name      testModifierDepth_1009
     * @tc.desc      Verify the modifier path D2048, R2005, D2023, D2013, R2017, R2013, R2023, R2048.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierDepth_1009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierDepth_1009 begin');
      const harness: PreviewHarness = await createPreviewHarness('a');
      for (const value of [pressHardKey(2048)]) {
        expect(value).assertEqual(false);
      }
      for (const value of [releaseHardKey(2005)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [pressHardKey(2023)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [pressHardKey(2013)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2017)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2013)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2023)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2048)]) {
        expect(value).assertEqual(true);
      }
      expect(harness.client.movedDirections.join(',')).assertEqual('2');
      expect(harness.client.insertedTexts.join('')).assertEqual('G');
      expect(harness.client.buffer).assertEqual('aG');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierDepth_1009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIERDEPTH1_0010
     * @tc.name      testModifierDepth_1010
     * @tc.desc      Verify the modifier path D2048, R2022, R2048.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierDepth_1010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierDepth_1010 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      expect(pressHardKey(2048)).assertEqual(false);
      expect(releaseHardKey(2022)).assertEqual(true);
      expect(releaseHardKey(2048)).assertEqual(true);
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierDepth_1010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIERDEPTH1_0011
     * @tc.name      testModifierDepth_1011
     * @tc.desc      Verify the modifier path D2045, D2039, R2028, D2016, D2008, D2013, R2013, R2008, R2016, R2039, R2045.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierDepth_1011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierDepth_1011 begin');
      const harness: PreviewHarness = await createPreviewHarness('he');
      expect(pressHardKey(2045)).assertEqual(false);
      expect(pressHardKey(2039)).assertEqual(true);
      expect(releaseHardKey(2028)).assertEqual(true);
      expect(pressHardKey(2016)).assertEqual(true);
      expect(pressHardKey(2008)).assertEqual(true);
      expect(pressHardKey(2013)).assertEqual(true);
      expect(releaseHardKey(2013)).assertEqual(true);
      expect(releaseHardKey(2008)).assertEqual(true);
      expect(releaseHardKey(2016)).assertEqual(true);
      expect(releaseHardKey(2039)).assertEqual(true);
      expect(releaseHardKey(2045)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('wKEYCODE_DPAD_CENTER8');
      expect(harness.client.buffer).assertEqual('hewKEYCODE_DPAD_CENTER8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierDepth_1011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIERDEPTH1_0012
     * @tc.name      testModifierDepth_1012
     * @tc.desc      Verify the modifier path D2047, D2034, R2036, D2018, D2055, R2055, R2018, R2034, R2047.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierDepth_1012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierDepth_1012 begin');
      const harness: PreviewHarness = await createPreviewHarness('#a');
      const outcome1: boolean = pressHardKey(2047);
      expect(outcome1).assertEqual(false);
      const outcome2: boolean = pressHardKey(2034);
      expect(outcome2).assertEqual(true);
      const outcome3: boolean = releaseHardKey(2036);
      expect(outcome3).assertEqual(true);
      const outcome4: boolean = pressHardKey(2018);
      expect(outcome4).assertEqual(true);
      const outcome5: boolean = pressHardKey(2055);
      expect(outcome5).assertEqual(true);
      const outcome6: boolean = releaseHardKey(2055);
      expect(outcome6).assertEqual(true);
      const outcomeStep7: boolean = releaseHardKey(2018);
      expect(outcomeStep7).assertEqual(true);
      const outcome8: boolean = releaseHardKey(2034);
      expect(outcome8).assertEqual(true);
      const outcome9: boolean = releaseHardKey(2047);
      expect(outcome9).assertEqual(true);
      expect(harness.client.forwardLengths.join(',')).assertEqual('1');
      expect(harness.client.backwardLengths.join(',')).assertEqual('');
      expect(harness.client.buffer).assertEqual('#aRB');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierDepth_1012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIERDEPTH1_0013
     * @tc.name      testModifierDepth_1013
     * @tc.desc      Verify the modifier path D2048, R2013, D2005, D2002, D2030, D2027, R2027, R2030, R2002, R2005, R2048.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierDepth_1013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierDepth_1013 begin');
      const harness: PreviewHarness = await createPreviewHarness('#a');
      for (const value of [pressHardKey(2048)]) {
        expect(value).assertEqual(false);
      }
      for (const value of [releaseHardKey(2013)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [pressHardKey(2005)]) {
        expect(value).assertEqual(false);
      }
      for (const value of [pressHardKey(2002)]) {
        expect(value).assertEqual(false);
      }
      for (const value of [pressHardKey(2030)]) {
        expect(value).assertEqual(false);
      }
      for (const value of [pressHardKey(2027)]) {
        expect(value).assertEqual(false);
      }
      for (const value of [releaseHardKey(2027)]) {
        expect(value).assertEqual(false);
      }
      for (const value of [releaseHardKey(2030)]) {
        expect(value).assertEqual(false);
      }
      for (const value of [releaseHardKey(2002)]) {
        expect(value).assertEqual(false);
      }
      for (const value of [releaseHardKey(2005)]) {
        expect(value).assertEqual(false);
      }
      for (const value of [releaseHardKey(2048)]) {
        expect(value).assertEqual(false);
      }
      expect(harness.client.movedDirections.join(',')).assertEqual('');
      expect(harness.client.insertedTexts.join('')).assertEqual('');
      expect(harness.client.buffer).assertEqual('#a');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierDepth_1013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIERDEPTH1_0014
     * @tc.name      testModifierDepth_1014
     * @tc.desc      Verify the modifier path D2047, D2035, D2031, R2005, R2033, D2022, R2022, R2031, R2035, R2047.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierDepth_1014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierDepth_1014 begin');
      const harness: PreviewHarness = await createPreviewHarness('#a');
      expect(pressHardKey(2047)).assertEqual(false);
      expect(pressHardKey(2035)).assertEqual(true);
      expect(pressHardKey(2031)).assertEqual(true);
      expect(releaseHardKey(2005)).assertEqual(true);
      expect(releaseHardKey(2033)).assertEqual(true);
      expect(pressHardKey(2022)).assertEqual(true);
      expect(releaseHardKey(2022)).assertEqual(true);
      expect(releaseHardKey(2031)).assertEqual(true);
      expect(releaseHardKey(2035)).assertEqual(true);
      expect(releaseHardKey(2047)).assertEqual(true);
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('#aSOF');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierDepth_1014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIERDEPTH1_0015
     * @tc.name      testModifierDepth_1015
     * @tc.desc      Verify the modifier path D2045, D2025, R2024, D2020, D2030, R2030, R2020, R2025, R2045.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierDepth_1015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierDepth_1015 begin');
      const harness: PreviewHarness = await createPreviewHarness('a');
      expect(pressHardKey(2045)).assertEqual(false);
      expect(pressHardKey(2025)).assertEqual(true);
      expect(releaseHardKey(2024)).assertEqual(true);
      expect(pressHardKey(2020)).assertEqual(true);
      expect(pressHardKey(2030)).assertEqual(true);
      expect(releaseHardKey(2030)).assertEqual(true);
      expect(releaseHardKey(2020)).assertEqual(true);
      expect(releaseHardKey(2025)).assertEqual(true);
      expect(releaseHardKey(2045)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('idn');
      expect(harness.client.buffer).assertEqual('aidn');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierDepth_1015 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIERDEPTH1_0016
     * @tc.name      testModifierDepth_1016
     * @tc.desc      Verify the modifier path D2045, D2055, D2006, D2016, R2016, R2006, R2055, R2045.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierDepth_1016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierDepth_1016 begin');
      const harness: PreviewHarness = await createPreviewHarness('he');
      const outcome1: boolean = pressHardKey(2045);
      expect(outcome1).assertEqual(false);
      const outcome2: boolean = pressHardKey(2055);
      expect(outcome2).assertEqual(true);
      const outcome3: boolean = pressHardKey(2006);
      expect(outcome3).assertEqual(true);
      const outcome4: boolean = pressHardKey(2016);
      expect(outcome4).assertEqual(true);
      const outcome5: boolean = releaseHardKey(2016);
      expect(outcome5).assertEqual(true);
      const outcome6: boolean = releaseHardKey(2006);
      expect(outcome6).assertEqual(true);
      const outcomeStep7: boolean = releaseHardKey(2055);
      expect(outcomeStep7).assertEqual(true);
      const outcome8: boolean = releaseHardKey(2045);
      expect(outcome8).assertEqual(true);
      expect(harness.client.forwardLengths.join(',')).assertEqual('1');
      expect(harness.client.backwardLengths.join(',')).assertEqual('');
      expect(harness.client.buffer).assertEqual('he6KEYCODE_DPAD_CENTER');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierDepth_1016 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIERDEPTH1_0017
     * @tc.name      testModifierDepth_1017
     * @tc.desc      Verify the modifier path D2048, R2041, D2034, D2003, D2023, R2023, R2003, R2034, R2048.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierDepth_1017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierDepth_1017 begin');
      const harness: PreviewHarness = await createPreviewHarness('ab');
      for (const value of [pressHardKey(2048)]) {
        expect(value).assertEqual(false);
      }
      for (const value of [releaseHardKey(2041)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [pressHardKey(2034)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [pressHardKey(2003)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [pressHardKey(2023)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2023)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2003)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2034)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2048)]) {
        expect(value).assertEqual(true);
      }
      expect(harness.client.movedDirections.join(',')).assertEqual('');
      expect(harness.client.insertedTexts.join('')).assertEqual('R3G');
      expect(harness.client.buffer).assertEqual('abR3G');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierDepth_1017 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIERDEPTH1_0018
     * @tc.name      testModifierDepth_1018
     * @tc.desc      Verify the modifier path D2048, R2016, D2016, D2036, R2036, R2016, R2048.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierDepth_1018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierDepth_1018 begin');
      const harness: PreviewHarness = await createPreviewHarness('ab');
      expect(pressHardKey(2048)).assertEqual(false);
      expect(releaseHardKey(2016)).assertEqual(true);
      expect(pressHardKey(2016)).assertEqual(false);
      expect(pressHardKey(2036)).assertEqual(false);
      expect(releaseHardKey(2036)).assertEqual(false);
      expect(releaseHardKey(2016)).assertEqual(true);
      expect(releaseHardKey(2048)).assertEqual(false);
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('ab');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierDepth_1018 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIERDEPTH1_0019
     * @tc.name      testModifierDepth_1019
     * @tc.desc      Verify the modifier path D2048, R2031, R2048.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierDepth_1019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierDepth_1019 begin');
      const harness: PreviewHarness = await createPreviewHarness('#a');
      expect(pressHardKey(2048)).assertEqual(false);
      expect(releaseHardKey(2031)).assertEqual(true);
      expect(releaseHardKey(2048)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('');
      expect(harness.client.buffer).assertEqual('#a');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierDepth_1019 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MODIFIERDEPTH1_0020
     * @tc.name      testModifierDepth_1020
     * @tc.desc      Verify the modifier path D2048, R2042, R2036, D2016, R2016, R2048.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierDepth_1020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierDepth_1020 begin');
      const harness: PreviewHarness = await createPreviewHarness('he');
      const outcome1: boolean = pressHardKey(2048);
      expect(outcome1).assertEqual(false);
      const outcome2: boolean = releaseHardKey(2042);
      expect(outcome2).assertEqual(true);
      const outcome3: boolean = releaseHardKey(2036);
      expect(outcome3).assertEqual(true);
      const outcome4: boolean = pressHardKey(2016);
      expect(outcome4).assertEqual(false);
      const outcome5: boolean = releaseHardKey(2016);
      expect(outcome5).assertEqual(true);
      const outcome6: boolean = releaseHardKey(2048);
      expect(outcome6).assertEqual(false);
      expect(harness.client.forwardLengths.join(',')).assertEqual('');
      expect(harness.client.backwardLengths.join(',')).assertEqual('');
      expect(harness.client.buffer).assertEqual('he');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierDepth_1020 end');
      await yieldToEventLoop();
    });

  });

}
