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

export default function orderedKeyPath1Test(): void {
  describe('OrderedKeyPath1Test', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH1_0001
     * @tc.name      testOrderedKeyPath_1001
     * @tc.desc      Verify the ordered key path D2036, D2026, R2026, R2036.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_1001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1001 begin');
      const harness: PreviewHarness = await createPreviewHarness('a');
      const outcome1: boolean = pressHardKey(2036);
      expect(outcome1).assertEqual(true);
      const outcome2: boolean = pressHardKey(2026);
      expect(outcome2).assertEqual(true);
      const outcome3: boolean = releaseHardKey(2026);
      expect(outcome3).assertEqual(true);
      const outcome4: boolean = releaseHardKey(2036);
      expect(outcome4).assertEqual(true);
      expect(harness.client.forwardLengths.join(',')).assertEqual('');
      expect(harness.client.backwardLengths.join(',')).assertEqual('');
      expect(harness.client.buffer).assertEqual('atj');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH1_0002
     * @tc.name      testOrderedKeyPath_1002
     * @tc.desc      Verify the ordered key path D2034, R2027, D2027, R2019, R2027, R2034.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_1002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1002 begin');
      const harness: PreviewHarness = await createPreviewHarness('x1');
      for (const value of [pressHardKey(2034)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2027)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [pressHardKey(2027)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2019)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2027)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2034)]) {
        expect(value).assertEqual(true);
      }
      expect(harness.client.movedDirections.join(',')).assertEqual('');
      expect(harness.client.insertedTexts.join('')).assertEqual('rk');
      expect(harness.client.buffer).assertEqual('x1rk');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH1_0003
     * @tc.name      testOrderedKeyPath_1003
     * @tc.desc      Verify the ordered key path R2026, R2018, D2007, R2015, R2008, R2004, R2007.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_1003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      expect(releaseHardKey(2026)).assertEqual(true);
      expect(releaseHardKey(2018)).assertEqual(true);
      expect(pressHardKey(2007)).assertEqual(true);
      expect(releaseHardKey(2015)).assertEqual(true);
      expect(releaseHardKey(2008)).assertEqual(true);
      expect(releaseHardKey(2004)).assertEqual(true);
      expect(releaseHardKey(2007)).assertEqual(true);
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH1_0004
     * @tc.name      testOrderedKeyPath_1004
     * @tc.desc      Verify the ordered key path R2006, D2033, R2026, D2000, D2003, R2003, R2000, R2033.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_1004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1004 begin');
      const harness: PreviewHarness = await createPreviewHarness('#a');
      expect(releaseHardKey(2006)).assertEqual(true);
      expect(pressHardKey(2033)).assertEqual(true);
      expect(releaseHardKey(2026)).assertEqual(true);
      expect(pressHardKey(2000)).assertEqual(true);
      expect(pressHardKey(2003)).assertEqual(true);
      expect(releaseHardKey(2003)).assertEqual(true);
      expect(releaseHardKey(2000)).assertEqual(true);
      expect(releaseHardKey(2033)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('q03');
      expect(harness.client.buffer).assertEqual('#aq03');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH1_0005
     * @tc.name      testOrderedKeyPath_1005
     * @tc.desc      Verify the ordered key path D2006, D2016, R3000, R2016, R2006.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_1005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1005 begin');
      const harness: PreviewHarness = await createPreviewHarness('ab');
      const outcome1: boolean = pressHardKey(2006);
      expect(outcome1).assertEqual(true);
      const outcome2: boolean = pressHardKey(2016);
      expect(outcome2).assertEqual(true);
      const outcome3: boolean = releaseHardKey(3000);
      expect(outcome3).assertEqual(true);
      const outcome4: boolean = releaseHardKey(2016);
      expect(outcome4).assertEqual(true);
      const outcome5: boolean = releaseHardKey(2006);
      expect(outcome5).assertEqual(true);
      expect(harness.client.forwardLengths.join(',')).assertEqual('');
      expect(harness.client.backwardLengths.join(',')).assertEqual('');
      expect(harness.client.buffer).assertEqual('ab6KEYCODE_DPAD_CENTER');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH1_0006
     * @tc.name      testOrderedKeyPath_1006
     * @tc.desc      Verify the ordered key path R2037, R2005.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_1006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1006 begin');
      const harness: PreviewHarness = await createPreviewHarness('a');
      for (const value of [releaseHardKey(2037)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2005)]) {
        expect(value).assertEqual(true);
      }
      expect(harness.client.movedDirections.join(',')).assertEqual('');
      expect(harness.client.insertedTexts.join('')).assertEqual('');
      expect(harness.client.buffer).assertEqual('a');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH1_0007
     * @tc.name      testOrderedKeyPath_1007
     * @tc.desc      Verify the ordered key path D2018, R2012, R2035, D2038, D2033, D2022, R2022, R2033, R2038, R2018.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_1007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1007 begin');
      const harness: PreviewHarness = await createPreviewHarness('x1');
      expect(pressHardKey(2018)).assertEqual(true);
      expect(releaseHardKey(2012)).assertEqual(true);
      expect(releaseHardKey(2035)).assertEqual(true);
      expect(pressHardKey(2038)).assertEqual(true);
      expect(pressHardKey(2033)).assertEqual(true);
      expect(pressHardKey(2022)).assertEqual(true);
      expect(releaseHardKey(2022)).assertEqual(true);
      expect(releaseHardKey(2033)).assertEqual(true);
      expect(releaseHardKey(2038)).assertEqual(true);
      expect(releaseHardKey(2018)).assertEqual(true);
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('x1bvqf');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH1_0008
     * @tc.name      testOrderedKeyPath_1008
     * @tc.desc      Verify the ordered key path D2005, R2008, D1999, D2001, R2001, R1999, R2005.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_1008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1008 begin');
      const harness: PreviewHarness = await createPreviewHarness('a');
      expect(pressHardKey(2005)).assertEqual(true);
      expect(releaseHardKey(2008)).assertEqual(true);
      expect(pressHardKey(1999)).assertEqual(false);
      expect(pressHardKey(2001)).assertEqual(false);
      expect(releaseHardKey(2001)).assertEqual(false);
      expect(releaseHardKey(1999)).assertEqual(false);
      expect(releaseHardKey(2005)).assertEqual(false);
      expect(harness.client.insertedTexts.join('')).assertEqual('5');
      expect(harness.client.buffer).assertEqual('a5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH1_0009
     * @tc.name      testOrderedKeyPath_1009
     * @tc.desc      Verify the ordered key path D2023, D1999, R2035, D2021, D2020, R2031, D2034, D2020, R2034, R2020, R2021, R1999, R2023.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_1009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1009 begin');
      const harness: PreviewHarness = await createPreviewHarness('hello');
      const outcome1: boolean = pressHardKey(2023);
      expect(outcome1).assertEqual(true);
      const outcome2: boolean = pressHardKey(1999);
      expect(outcome2).assertEqual(false);
      const outcome3: boolean = releaseHardKey(2035);
      expect(outcome3).assertEqual(false);
      const outcome4: boolean = pressHardKey(2021);
      expect(outcome4).assertEqual(false);
      const outcome5: boolean = pressHardKey(2020);
      expect(outcome5).assertEqual(false);
      const outcome6: boolean = releaseHardKey(2031);
      expect(outcome6).assertEqual(false);
      const outcomeStep7: boolean = pressHardKey(2034);
      expect(outcomeStep7).assertEqual(false);
      const outcome8: boolean = pressHardKey(2020);
      expect(outcome8).assertEqual(false);
      const outcome9: boolean = releaseHardKey(2034);
      expect(outcome9).assertEqual(false);
      const outcome10: boolean = releaseHardKey(2020);
      expect(outcome10).assertEqual(false);
      const outcome11: boolean = releaseHardKey(2021);
      expect(outcome11).assertEqual(false);
      const outcome12: boolean = releaseHardKey(1999);
      expect(outcome12).assertEqual(false);
      const outcome13: boolean = releaseHardKey(2023);
      expect(outcome13).assertEqual(false);
      expect(harness.client.forwardLengths.join(',')).assertEqual('');
      expect(harness.client.backwardLengths.join(',')).assertEqual('');
      expect(harness.client.buffer).assertEqual('hello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH1_0010
     * @tc.name      testOrderedKeyPath_1010
     * @tc.desc      Verify the ordered key path D2034, R2026, R2034.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_1010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1010 begin');
      const harness: PreviewHarness = await createPreviewHarness('hello');
      for (const value of [pressHardKey(2034)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2026)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2034)]) {
        expect(value).assertEqual(true);
      }
      expect(harness.client.movedDirections.join(',')).assertEqual('');
      expect(harness.client.insertedTexts.join('')).assertEqual('r');
      expect(harness.client.buffer).assertEqual('hello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH1_0011
     * @tc.name      testOrderedKeyPath_1011
     * @tc.desc      Verify the ordered key path D2008, R2003, D2019, D2027, D2108, R2108, R2027, R2019, R2008.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_1011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1011 begin');
      const harness: PreviewHarness = await createPreviewHarness('x1');
      expect(pressHardKey(2008)).assertEqual(true);
      expect(releaseHardKey(2003)).assertEqual(true);
      expect(pressHardKey(2019)).assertEqual(true);
      expect(pressHardKey(2027)).assertEqual(true);
      expect(pressHardKey(2108)).assertEqual(false);
      expect(releaseHardKey(2108)).assertEqual(false);
      expect(releaseHardKey(2027)).assertEqual(false);
      expect(releaseHardKey(2019)).assertEqual(false);
      expect(releaseHardKey(2008)).assertEqual(false);
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('x18ck');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH1_0012
     * @tc.name      testOrderedKeyPath_1012
     * @tc.desc      Verify the ordered key path R2026, R2002, D2009, R2008, R2002, D2041, D2005, R2028, R2005, R2041, R2009.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_1012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1012 begin');
      const harness: PreviewHarness = await createPreviewHarness('x1');
      expect(releaseHardKey(2026)).assertEqual(true);
      expect(releaseHardKey(2002)).assertEqual(true);
      expect(pressHardKey(2009)).assertEqual(true);
      expect(releaseHardKey(2008)).assertEqual(true);
      expect(releaseHardKey(2002)).assertEqual(true);
      expect(pressHardKey(2041)).assertEqual(true);
      expect(pressHardKey(2005)).assertEqual(true);
      expect(releaseHardKey(2028)).assertEqual(true);
      expect(releaseHardKey(2005)).assertEqual(true);
      expect(releaseHardKey(2041)).assertEqual(true);
      expect(releaseHardKey(2009)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('9y5');
      expect(harness.client.buffer).assertEqual('x19y5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH1_0013
     * @tc.name      testOrderedKeyPath_1013
     * @tc.desc      Verify the ordered key path D2032, R2006, D2022, D2007, D2026, D2103, D2034, D2031, R2031, R2034, R2103, R2026, R2007, R2022, R2032.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_1013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1013 begin');
      const harness: PreviewHarness = await createPreviewHarness('x1');
      const outcome1: boolean = pressHardKey(2032);
      expect(outcome1).assertEqual(true);
      const outcome2: boolean = releaseHardKey(2006);
      expect(outcome2).assertEqual(true);
      const outcome3: boolean = pressHardKey(2022);
      expect(outcome3).assertEqual(true);
      const outcome4: boolean = pressHardKey(2007);
      expect(outcome4).assertEqual(true);
      const outcome5: boolean = pressHardKey(2026);
      expect(outcome5).assertEqual(true);
      const outcome6: boolean = pressHardKey(2103);
      expect(outcome6).assertEqual(false);
      const outcomeStep7: boolean = pressHardKey(2034);
      expect(outcomeStep7).assertEqual(false);
      const outcome8: boolean = pressHardKey(2031);
      expect(outcome8).assertEqual(false);
      const outcome9: boolean = releaseHardKey(2031);
      expect(outcome9).assertEqual(false);
      const outcome10: boolean = releaseHardKey(2034);
      expect(outcome10).assertEqual(false);
      const outcome11: boolean = releaseHardKey(2103);
      expect(outcome11).assertEqual(false);
      const outcome12: boolean = releaseHardKey(2026);
      expect(outcome12).assertEqual(false);
      const outcome13: boolean = releaseHardKey(2007);
      expect(outcome13).assertEqual(false);
      const outcome14: boolean = releaseHardKey(2022);
      expect(outcome14).assertEqual(false);
      const outcome15: boolean = releaseHardKey(2032);
      expect(outcome15).assertEqual(false);
      expect(harness.client.forwardLengths.join(',')).assertEqual('');
      expect(harness.client.backwardLengths.join(',')).assertEqual('');
      expect(harness.client.buffer).assertEqual('x1pf7j');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH1_0014
     * @tc.name      testOrderedKeyPath_1014
     * @tc.desc      Verify the ordered key path D2040, D2008, D2014, D2007, R2018, D2006, D2030, R2012, R2030, R2006, R2007, R2014, R2008, R2040.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_1014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1014 begin');
      const harness: PreviewHarness = await createPreviewHarness('a');
      for (const value of [pressHardKey(2040)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [pressHardKey(2008)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [pressHardKey(2014)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [pressHardKey(2007)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2018)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [pressHardKey(2006)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [pressHardKey(2030)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2012)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2030)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2006)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2007)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2014)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2008)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2040)]) {
        expect(value).assertEqual(true);
      }
      expect(harness.client.movedDirections.join(',')).assertEqual('3');
      expect(harness.client.insertedTexts.join('')).assertEqual('x876n');
      expect(harness.client.buffer).assertEqual('ax876n');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH1_0015
     * @tc.name      testOrderedKeyPath_1015
     * @tc.desc      Verify the ordered key path D2042, R2040, R2008, D2018, D2024, D2004, R2041, R2004, R2024, R2018, R2042.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_1015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1015 begin');
      const harness: PreviewHarness = await createPreviewHarness('x1');
      expect(pressHardKey(2042)).assertEqual(true);
      expect(releaseHardKey(2040)).assertEqual(true);
      expect(releaseHardKey(2008)).assertEqual(true);
      expect(pressHardKey(2018)).assertEqual(true);
      expect(pressHardKey(2024)).assertEqual(true);
      expect(pressHardKey(2004)).assertEqual(true);
      expect(releaseHardKey(2041)).assertEqual(true);
      expect(releaseHardKey(2004)).assertEqual(true);
      expect(releaseHardKey(2024)).assertEqual(true);
      expect(releaseHardKey(2018)).assertEqual(true);
      expect(releaseHardKey(2042)).assertEqual(true);
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('x1zbh4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1015 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH1_0016
     * @tc.name      testOrderedKeyPath_1016
     * @tc.desc      Verify the ordered key path D2026, D2024, R2017, R2024, R2026.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_1016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1016 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      expect(pressHardKey(2026)).assertEqual(true);
      expect(pressHardKey(2024)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2024)).assertEqual(true);
      expect(releaseHardKey(2026)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('jh');
      expect(harness.client.buffer).assertEqual('jh');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1016 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH1_0017
     * @tc.name      testOrderedKeyPath_1017
     * @tc.desc      Verify the ordered key path D2008, D2005, D2004, R2004, R2005, R2008.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_1017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1017 begin');
      const harness: PreviewHarness = await createPreviewHarness('a');
      const outcome1: boolean = pressHardKey(2008);
      expect(outcome1).assertEqual(true);
      const outcome2: boolean = pressHardKey(2005);
      expect(outcome2).assertEqual(true);
      const outcome3: boolean = pressHardKey(2004);
      expect(outcome3).assertEqual(true);
      const outcome4: boolean = releaseHardKey(2004);
      expect(outcome4).assertEqual(true);
      const outcome5: boolean = releaseHardKey(2005);
      expect(outcome5).assertEqual(true);
      const outcome6: boolean = releaseHardKey(2008);
      expect(outcome6).assertEqual(true);
      expect(harness.client.forwardLengths.join(',')).assertEqual('');
      expect(harness.client.backwardLengths.join(',')).assertEqual('');
      expect(harness.client.buffer).assertEqual('a854');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1017 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH1_0018
     * @tc.name      testOrderedKeyPath_1018
     * @tc.desc      Verify the ordered key path D2033, R2017, D2032, D2013, D2028, R2029, D2013, R2028, R2013, R2032, R2033.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_1018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1018 begin');
      const harness: PreviewHarness = await createPreviewHarness('a');
      for (const value of [pressHardKey(2033)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2017)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [pressHardKey(2032)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [pressHardKey(2013)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [pressHardKey(2028)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2029)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [pressHardKey(2013)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2028)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2013)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2032)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2033)]) {
        expect(value).assertEqual(true);
      }
      expect(harness.client.movedDirections.join(',')).assertEqual('2,2');
      expect(harness.client.insertedTexts.join('')).assertEqual('qpl');
      expect(harness.client.buffer).assertEqual('aqpl');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1018 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH1_0019
     * @tc.name      testOrderedKeyPath_1019
     * @tc.desc      Verify the ordered key path D2019, D2035, R2035, R2019.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_1019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1019 begin');
      const harness: PreviewHarness = await createPreviewHarness('x1');
      expect(pressHardKey(2019)).assertEqual(true);
      expect(pressHardKey(2035)).assertEqual(true);
      expect(releaseHardKey(2035)).assertEqual(true);
      expect(releaseHardKey(2019)).assertEqual(true);
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('x1cs');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1019 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH1_0020
     * @tc.name      testOrderedKeyPath_1020
     * @tc.desc      Verify the ordered key path R2027, R2015, R2016.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_1020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1020 begin');
      const harness: PreviewHarness = await createPreviewHarness('x1');
      expect(releaseHardKey(2027)).assertEqual(true);
      expect(releaseHardKey(2015)).assertEqual(true);
      expect(releaseHardKey(2016)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('');
      expect(harness.client.buffer).assertEqual('x1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1020 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH1_0021
     * @tc.name      testOrderedKeyPath_1021
     * @tc.desc      Verify the ordered key path R2020, D2026, R2026.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_1021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1021 begin');
      const harness: PreviewHarness = await createPreviewHarness('he');
      const outcome1: boolean = releaseHardKey(2020);
      expect(outcome1).assertEqual(true);
      const outcome2: boolean = pressHardKey(2026);
      expect(outcome2).assertEqual(true);
      const outcome3: boolean = releaseHardKey(2026);
      expect(outcome3).assertEqual(true);
      expect(harness.client.forwardLengths.join(',')).assertEqual('');
      expect(harness.client.backwardLengths.join(',')).assertEqual('');
      expect(harness.client.buffer).assertEqual('hej');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1021 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH1_0022
     * @tc.name      testOrderedKeyPath_1022
     * @tc.desc      Verify the ordered key path D2024, D2021, R2103, R2021, R2024.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_1022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1022 begin');
      const harness: PreviewHarness = await createPreviewHarness('a');
      for (const value of [pressHardKey(2024)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [pressHardKey(2021)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2103)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2021)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2024)]) {
        expect(value).assertEqual(true);
      }
      expect(harness.client.movedDirections.join(',')).assertEqual('');
      expect(harness.client.insertedTexts.join('')).assertEqual('he');
      expect(harness.client.buffer).assertEqual('ahe');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1022 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH1_0023
     * @tc.name      testOrderedKeyPath_1023
     * @tc.desc      Verify the ordered key path D2031, D2017, D2027, D2032, D2009, D2108, R2108, R2009, R2032, R2027, R2017, R2031.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_1023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1023 begin');
      const harness: PreviewHarness = await createPreviewHarness('hello');
      expect(pressHardKey(2031)).assertEqual(true);
      expect(pressHardKey(2017)).assertEqual(true);
      expect(pressHardKey(2027)).assertEqual(true);
      expect(pressHardKey(2032)).assertEqual(true);
      expect(pressHardKey(2009)).assertEqual(true);
      expect(pressHardKey(2108)).assertEqual(false);
      expect(releaseHardKey(2108)).assertEqual(false);
      expect(releaseHardKey(2009)).assertEqual(false);
      expect(releaseHardKey(2032)).assertEqual(false);
      expect(releaseHardKey(2027)).assertEqual(false);
      expect(releaseHardKey(2017)).assertEqual(false);
      expect(releaseHardKey(2031)).assertEqual(false);
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hello worldakp9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1023 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH1_0024
     * @tc.name      testOrderedKeyPath_1024
     * @tc.desc      Verify the ordered key path D2014, D2071, R2071, R2014.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_1024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1024 begin');
      const harness: PreviewHarness = await createPreviewHarness('x1');
      expect(pressHardKey(2014)).assertEqual(true);
      expect(pressHardKey(2071)).assertEqual(true);
      expect(releaseHardKey(2071)).assertEqual(true);
      expect(releaseHardKey(2014)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('');
      expect(harness.client.buffer).assertEqual('x1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1024 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH1_0025
     * @tc.name      testOrderedKeyPath_1025
     * @tc.desc      Verify the ordered key path R2001, D2013, R2017, D2028, D2023, D2040, R2040, R2023, R2028, R2013.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_1025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1025 begin');
      const harness: PreviewHarness = await createPreviewHarness('x1');
      const outcome1: boolean = releaseHardKey(2001);
      expect(outcome1).assertEqual(true);
      const outcome2: boolean = pressHardKey(2013);
      expect(outcome2).assertEqual(true);
      const outcome3: boolean = releaseHardKey(2017);
      expect(outcome3).assertEqual(true);
      const outcome4: boolean = pressHardKey(2028);
      expect(outcome4).assertEqual(true);
      const outcome5: boolean = pressHardKey(2023);
      expect(outcome5).assertEqual(true);
      const outcome6: boolean = pressHardKey(2040);
      expect(outcome6).assertEqual(true);
      const outcomeStep7: boolean = releaseHardKey(2040);
      expect(outcomeStep7).assertEqual(true);
      const outcome8: boolean = releaseHardKey(2023);
      expect(outcome8).assertEqual(true);
      const outcome9: boolean = releaseHardKey(2028);
      expect(outcome9).assertEqual(true);
      const outcome10: boolean = releaseHardKey(2013);
      expect(outcome10).assertEqual(true);
      expect(harness.client.forwardLengths.join(',')).assertEqual('');
      expect(harness.client.backwardLengths.join(',')).assertEqual('');
      expect(harness.client.buffer).assertEqual('x1lgx');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_1025 end');
      await yieldToEventLoop();
    });

  });

}
