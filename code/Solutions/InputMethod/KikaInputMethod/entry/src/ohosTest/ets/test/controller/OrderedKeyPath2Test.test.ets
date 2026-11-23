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

export default function orderedKeyPath2Test(): void {
  describe('OrderedKeyPath2Test', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH2_0001
     * @tc.name      testOrderedKeyPath_2001
     * @tc.desc      Verify the ordered key path D2071, R2041, D2025, D2002, R2016, R2003, R2002, R2025, R2071.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_2001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2001 begin');
      const harness: PreviewHarness = await createPreviewHarness('hello');
      const outcome1: boolean = pressHardKey(2071);
      expect(outcome1).assertEqual(true);
      const outcome2: boolean = releaseHardKey(2041);
      expect(outcome2).assertEqual(true);
      const outcome3: boolean = pressHardKey(2025);
      expect(outcome3).assertEqual(true);
      const outcome4: boolean = pressHardKey(2002);
      expect(outcome4).assertEqual(true);
      const outcome5: boolean = releaseHardKey(2016);
      expect(outcome5).assertEqual(true);
      const outcome6: boolean = releaseHardKey(2003);
      expect(outcome6).assertEqual(true);
      const outcomeStep7: boolean = releaseHardKey(2002);
      expect(outcomeStep7).assertEqual(true);
      const outcome8: boolean = releaseHardKey(2025);
      expect(outcome8).assertEqual(true);
      const outcome9: boolean = releaseHardKey(2071);
      expect(outcome9).assertEqual(true);
      expect(harness.client.forwardLengths.join(',')).assertEqual('');
      expect(harness.client.backwardLengths.join(',')).assertEqual('1');
      expect(harness.client.buffer).assertEqual('hello world2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH2_0002
     * @tc.name      testOrderedKeyPath_2002
     * @tc.desc      Verify the ordered key path D2017, R2006, D2012, D2071, R2071, R2012, R2017.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_2002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2002 begin');
      const harness: PreviewHarness = await createPreviewHarness('a');
      for (const value of [pressHardKey(2017)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2006)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [pressHardKey(2012)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [pressHardKey(2071)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2071)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2012)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2017)]) {
        expect(value).assertEqual(true);
      }
      expect(harness.client.movedDirections.join(',')).assertEqual('1');
      expect(harness.client.insertedTexts.join('')).assertEqual('a');
      expect(harness.client.buffer).assertEqual('aa');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH2_0003
     * @tc.name      testOrderedKeyPath_2003
     * @tc.desc      Verify the ordered key path D2023, D2005, R2003, R2005, R2023.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_2003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2003 begin');
      const harness: PreviewHarness = await createPreviewHarness('ab');
      expect(pressHardKey(2023)).assertEqual(true);
      expect(pressHardKey(2005)).assertEqual(true);
      expect(releaseHardKey(2003)).assertEqual(true);
      expect(releaseHardKey(2005)).assertEqual(true);
      expect(releaseHardKey(2023)).assertEqual(true);
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('abg5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH2_0004
     * @tc.name      testOrderedKeyPath_2004
     * @tc.desc      Verify the ordered key path D2026, R2041, R2021, R2003, D2003, D2013, D2004, D2019, R2019, R2004, R2013, R2003, R2026.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_2004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2004 begin');
      const harness: PreviewHarness = await createPreviewHarness('hello');
      expect(pressHardKey(2026)).assertEqual(true);
      expect(releaseHardKey(2041)).assertEqual(true);
      expect(releaseHardKey(2021)).assertEqual(true);
      expect(releaseHardKey(2003)).assertEqual(true);
      expect(pressHardKey(2003)).assertEqual(true);
      expect(pressHardKey(2013)).assertEqual(true);
      expect(pressHardKey(2004)).assertEqual(true);
      expect(pressHardKey(2019)).assertEqual(true);
      expect(releaseHardKey(2019)).assertEqual(true);
      expect(releaseHardKey(2004)).assertEqual(true);
      expect(releaseHardKey(2013)).assertEqual(true);
      expect(releaseHardKey(2003)).assertEqual(true);
      expect(releaseHardKey(2026)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('j34c');
      expect(harness.client.buffer).assertEqual('hello world34c');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH2_0005
     * @tc.name      testOrderedKeyPath_2005
     * @tc.desc      Verify the ordered key path D2013, R2008, R2021, D2071, D2032, D2030, D2009, R2009, R2030, R2032, R2071, R2013.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_2005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2005 begin');
      const harness: PreviewHarness = await createPreviewHarness('x1');
      const outcome1: boolean = pressHardKey(2013);
      expect(outcome1).assertEqual(true);
      const outcome2: boolean = releaseHardKey(2008);
      expect(outcome2).assertEqual(true);
      const outcome3: boolean = releaseHardKey(2021);
      expect(outcome3).assertEqual(true);
      const outcome4: boolean = pressHardKey(2071);
      expect(outcome4).assertEqual(true);
      const outcome5: boolean = pressHardKey(2032);
      expect(outcome5).assertEqual(true);
      const outcome6: boolean = pressHardKey(2030);
      expect(outcome6).assertEqual(true);
      const outcomeStep7: boolean = pressHardKey(2009);
      expect(outcomeStep7).assertEqual(true);
      const outcome8: boolean = releaseHardKey(2009);
      expect(outcome8).assertEqual(true);
      const outcome9: boolean = releaseHardKey(2030);
      expect(outcome9).assertEqual(true);
      const outcome10: boolean = releaseHardKey(2032);
      expect(outcome10).assertEqual(true);
      const outcome11: boolean = releaseHardKey(2071);
      expect(outcome11).assertEqual(true);
      const outcome12: boolean = releaseHardKey(2013);
      expect(outcome12).assertEqual(true);
      expect(harness.client.forwardLengths.join(',')).assertEqual('');
      expect(harness.client.backwardLengths.join(',')).assertEqual('1');
      expect(harness.client.buffer).assertEqual('x1pn9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH2_0006
     * @tc.name      testOrderedKeyPath_2006
     * @tc.desc      Verify the ordered key path R2004, D2012, D2025, R2016, D2033, R2032, R2033, R2025, R2012.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_2006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2006 begin');
      const harness: PreviewHarness = await createPreviewHarness('he');
      for (const value of [releaseHardKey(2004)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [pressHardKey(2012)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [pressHardKey(2025)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2016)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [pressHardKey(2033)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2032)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2033)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2025)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2012)]) {
        expect(value).assertEqual(true);
      }
      expect(harness.client.movedDirections.join(',')).assertEqual('1');
      expect(harness.client.insertedTexts.join('')).assertEqual('iq');
      expect(harness.client.buffer).assertEqual('heiq');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH2_0007
     * @tc.name      testOrderedKeyPath_2007
     * @tc.desc      Verify the ordered key path D2055, D2012, D2038, D2002, R2002, R2038, R2012, R2055.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_2007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2007 begin');
      const harness: PreviewHarness = await createPreviewHarness('x1');
      expect(pressHardKey(2055)).assertEqual(true);
      expect(pressHardKey(2012)).assertEqual(true);
      expect(pressHardKey(2038)).assertEqual(true);
      expect(pressHardKey(2002)).assertEqual(true);
      expect(releaseHardKey(2002)).assertEqual(true);
      expect(releaseHardKey(2038)).assertEqual(true);
      expect(releaseHardKey(2012)).assertEqual(true);
      expect(releaseHardKey(2055)).assertEqual(true);
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('x1v2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH2_0008
     * @tc.name      testOrderedKeyPath_2008
     * @tc.desc      Verify the ordered key path D2030, D2016, R2000, D2108, D2036, R2017, D2003, D2029, R2029, R2003, R2036, R2108, R2016, R2030.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_2008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2008 begin');
      const harness: PreviewHarness = await createPreviewHarness('he');
      expect(pressHardKey(2030)).assertEqual(true);
      expect(pressHardKey(2016)).assertEqual(true);
      expect(releaseHardKey(2000)).assertEqual(true);
      expect(pressHardKey(2108)).assertEqual(false);
      expect(pressHardKey(2036)).assertEqual(false);
      expect(releaseHardKey(2017)).assertEqual(false);
      expect(pressHardKey(2003)).assertEqual(false);
      expect(pressHardKey(2029)).assertEqual(false);
      expect(releaseHardKey(2029)).assertEqual(false);
      expect(releaseHardKey(2003)).assertEqual(false);
      expect(releaseHardKey(2036)).assertEqual(false);
      expect(releaseHardKey(2108)).assertEqual(false);
      expect(releaseHardKey(2016)).assertEqual(true);
      expect(releaseHardKey(2030)).assertEqual(false);
      expect(harness.client.insertedTexts.join('')).assertEqual('nKEYCODE_DPAD_CENTER');
      expect(harness.client.buffer).assertEqual('henKEYCODE_DPAD_CENTER');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH2_0009
     * @tc.name      testOrderedKeyPath_2009
     * @tc.desc      Verify the ordered key path R2024, R2027, R2023, D2071, D2017, R2071, D2012, D2032, R2032, R2012, R2017.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_2009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2009 begin');
      const harness: PreviewHarness = await createPreviewHarness('he');
      const outcome1: boolean = releaseHardKey(2024);
      expect(outcome1).assertEqual(true);
      const outcome2: boolean = releaseHardKey(2027);
      expect(outcome2).assertEqual(true);
      const outcome3: boolean = releaseHardKey(2023);
      expect(outcome3).assertEqual(true);
      const outcome4: boolean = pressHardKey(2071);
      expect(outcome4).assertEqual(true);
      const outcome5: boolean = pressHardKey(2017);
      expect(outcome5).assertEqual(true);
      const outcome6: boolean = releaseHardKey(2071);
      expect(outcome6).assertEqual(true);
      const outcomeStep7: boolean = pressHardKey(2012);
      expect(outcomeStep7).assertEqual(true);
      const outcome8: boolean = pressHardKey(2032);
      expect(outcome8).assertEqual(true);
      const outcome9: boolean = releaseHardKey(2032);
      expect(outcome9).assertEqual(true);
      const outcome10: boolean = releaseHardKey(2012);
      expect(outcome10).assertEqual(true);
      const outcome11: boolean = releaseHardKey(2017);
      expect(outcome11).assertEqual(true);
      expect(harness.client.forwardLengths.join(',')).assertEqual('');
      expect(harness.client.backwardLengths.join(',')).assertEqual('1');
      expect(harness.client.buffer).assertEqual('heap');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH2_0010
     * @tc.name      testOrderedKeyPath_2010
     * @tc.desc      Verify the ordered key path D2016, D2015, R2015, R2016.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_2010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2010 begin');
      const harness: PreviewHarness = await createPreviewHarness('he');
      for (const value of [pressHardKey(2016)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [pressHardKey(2015)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2015)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2016)]) {
        expect(value).assertEqual(true);
      }
      expect(harness.client.movedDirections.join(',')).assertEqual('4');
      expect(harness.client.insertedTexts.join('')).assertEqual('KEYCODE_DPAD_CENTER');
      expect(harness.client.buffer).assertEqual('heKEYCODE_DPAD_CENTER');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH2_0011
     * @tc.name      testOrderedKeyPath_2011
     * @tc.desc      Verify the ordered key path D2001, D2024, D2103, R2103, R2024, R2001.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_2011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2011 begin');
      const harness: PreviewHarness = await createPreviewHarness('he');
      expect(pressHardKey(2001)).assertEqual(true);
      expect(pressHardKey(2024)).assertEqual(true);
      expect(pressHardKey(2103)).assertEqual(false);
      expect(releaseHardKey(2103)).assertEqual(false);
      expect(releaseHardKey(2024)).assertEqual(false);
      expect(releaseHardKey(2001)).assertEqual(false);
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('he1h');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH2_0012
     * @tc.name      testOrderedKeyPath_2012
     * @tc.desc      Verify the ordered key path R2030, R1999, D2033, R2026, D2024, D2055, D2071, R2012, R2071, R2055, R2024, R2033.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_2012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2012 begin');
      const harness: PreviewHarness = await createPreviewHarness('a');
      expect(releaseHardKey(2030)).assertEqual(true);
      expect(releaseHardKey(1999)).assertEqual(true);
      expect(pressHardKey(2033)).assertEqual(true);
      expect(releaseHardKey(2026)).assertEqual(true);
      expect(pressHardKey(2024)).assertEqual(true);
      expect(pressHardKey(2055)).assertEqual(true);
      expect(pressHardKey(2071)).assertEqual(true);
      expect(releaseHardKey(2012)).assertEqual(true);
      expect(releaseHardKey(2071)).assertEqual(true);
      expect(releaseHardKey(2055)).assertEqual(true);
      expect(releaseHardKey(2024)).assertEqual(true);
      expect(releaseHardKey(2033)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('qh');
      expect(harness.client.buffer).assertEqual('aqh');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH2_0013
     * @tc.name      testOrderedKeyPath_2013
     * @tc.desc      Verify the ordered key path R2007, R2018, R2027, R2103, D2031, R2020, R2031.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_2013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2013 begin');
      const harness: PreviewHarness = await createPreviewHarness('#a');
      const outcome1: boolean = releaseHardKey(2007);
      expect(outcome1).assertEqual(true);
      const outcome2: boolean = releaseHardKey(2018);
      expect(outcome2).assertEqual(true);
      const outcome3: boolean = releaseHardKey(2027);
      expect(outcome3).assertEqual(true);
      const outcome4: boolean = releaseHardKey(2103);
      expect(outcome4).assertEqual(true);
      const outcome5: boolean = pressHardKey(2031);
      expect(outcome5).assertEqual(true);
      const outcome6: boolean = releaseHardKey(2020);
      expect(outcome6).assertEqual(true);
      const outcomeStep7: boolean = releaseHardKey(2031);
      expect(outcomeStep7).assertEqual(true);
      expect(harness.client.forwardLengths.join(',')).assertEqual('');
      expect(harness.client.backwardLengths.join(',')).assertEqual('');
      expect(harness.client.buffer).assertEqual('#ao');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH2_0014
     * @tc.name      testOrderedKeyPath_2014
     * @tc.desc      Verify the ordered key path D2022, D2013, D2012, D2020, R2020, R2012, R2013, R2022.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_2014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2014 begin');
      const harness: PreviewHarness = await createPreviewHarness('ab');
      for (const value of [pressHardKey(2022)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [pressHardKey(2013)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [pressHardKey(2012)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [pressHardKey(2020)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2020)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2012)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2013)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2022)]) {
        expect(value).assertEqual(true);
      }
      expect(harness.client.movedDirections.join(',')).assertEqual('2,1');
      expect(harness.client.insertedTexts.join('')).assertEqual('fd');
      expect(harness.client.buffer).assertEqual('abfd');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH2_0015
     * @tc.name      testOrderedKeyPath_2015
     * @tc.desc      Verify the ordered key path R2012, D2040, R2040.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_2015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2015 begin');
      const harness: PreviewHarness = await createPreviewHarness('#a');
      expect(releaseHardKey(2012)).assertEqual(true);
      expect(pressHardKey(2040)).assertEqual(true);
      expect(releaseHardKey(2040)).assertEqual(true);
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('#ax');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2015 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH2_0016
     * @tc.name      testOrderedKeyPath_2016
     * @tc.desc      Verify the ordered key path R2009, R2035, D2071, R2021, D2009, D2033, R2033, R2009, R2071.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_2016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2016 begin');
      const harness: PreviewHarness = await createPreviewHarness('a');
      expect(releaseHardKey(2009)).assertEqual(true);
      expect(releaseHardKey(2035)).assertEqual(true);
      expect(pressHardKey(2071)).assertEqual(true);
      expect(releaseHardKey(2021)).assertEqual(true);
      expect(pressHardKey(2009)).assertEqual(true);
      expect(pressHardKey(2033)).assertEqual(true);
      expect(releaseHardKey(2033)).assertEqual(true);
      expect(releaseHardKey(2009)).assertEqual(true);
      expect(releaseHardKey(2071)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('9q');
      expect(harness.client.buffer).assertEqual('a9q');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2016 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH2_0017
     * @tc.name      testOrderedKeyPath_2017
     * @tc.desc      Verify the ordered key path D2103, D2009, D2023, R2007, R2019, R2023, R2009, R2103.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_2017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2017 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const outcome1: boolean = pressHardKey(2103);
      expect(outcome1).assertEqual(false);
      const outcome2: boolean = pressHardKey(2009);
      expect(outcome2).assertEqual(false);
      const outcome3: boolean = pressHardKey(2023);
      expect(outcome3).assertEqual(false);
      const outcome4: boolean = releaseHardKey(2007);
      expect(outcome4).assertEqual(false);
      const outcome5: boolean = releaseHardKey(2019);
      expect(outcome5).assertEqual(false);
      const outcome6: boolean = releaseHardKey(2023);
      expect(outcome6).assertEqual(false);
      const outcomeStep7: boolean = releaseHardKey(2009);
      expect(outcomeStep7).assertEqual(false);
      const outcome8: boolean = releaseHardKey(2103);
      expect(outcome8).assertEqual(false);
      expect(harness.client.forwardLengths.join(',')).assertEqual('');
      expect(harness.client.backwardLengths.join(',')).assertEqual('');
      expect(harness.client.buffer).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2017 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH2_0018
     * @tc.name      testOrderedKeyPath_2018
     * @tc.desc      Verify the ordered key path D2036, R2007, D2108, R2017, D2024, D2028, R2022, R3000, R2028, R2024, R2108, R2036.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_2018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2018 begin');
      const harness: PreviewHarness = await createPreviewHarness('a');
      for (const value of [pressHardKey(2036)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2007)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [pressHardKey(2108)]) {
        expect(value).assertEqual(false);
      }
      for (const value of [releaseHardKey(2017)]) {
        expect(value).assertEqual(false);
      }
      for (const value of [pressHardKey(2024)]) {
        expect(value).assertEqual(false);
      }
      for (const value of [pressHardKey(2028)]) {
        expect(value).assertEqual(false);
      }
      for (const value of [releaseHardKey(2022)]) {
        expect(value).assertEqual(false);
      }
      for (const value of [releaseHardKey(3000)]) {
        expect(value).assertEqual(false);
      }
      for (const value of [releaseHardKey(2028)]) {
        expect(value).assertEqual(false);
      }
      for (const value of [releaseHardKey(2024)]) {
        expect(value).assertEqual(false);
      }
      for (const value of [releaseHardKey(2108)]) {
        expect(value).assertEqual(false);
      }
      for (const value of [releaseHardKey(2036)]) {
        expect(value).assertEqual(false);
      }
      expect(harness.client.movedDirections.join(',')).assertEqual('');
      expect(harness.client.insertedTexts.join('')).assertEqual('t');
      expect(harness.client.buffer).assertEqual('at');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2018 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH2_0019
     * @tc.name      testOrderedKeyPath_2019
     * @tc.desc      Verify the ordered key path D2013, D2027, D2021, D2005, D2029, D2035, D2006, D2039, R2039, R2006, R2035, R2029, R2005, R2021, R2027, R2013.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_2019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2019 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      expect(pressHardKey(2013)).assertEqual(true);
      expect(pressHardKey(2027)).assertEqual(true);
      expect(pressHardKey(2021)).assertEqual(true);
      expect(pressHardKey(2005)).assertEqual(true);
      expect(pressHardKey(2029)).assertEqual(true);
      expect(pressHardKey(2035)).assertEqual(true);
      expect(pressHardKey(2006)).assertEqual(true);
      expect(pressHardKey(2039)).assertEqual(true);
      expect(releaseHardKey(2039)).assertEqual(true);
      expect(releaseHardKey(2006)).assertEqual(true);
      expect(releaseHardKey(2035)).assertEqual(true);
      expect(releaseHardKey(2029)).assertEqual(true);
      expect(releaseHardKey(2005)).assertEqual(true);
      expect(releaseHardKey(2021)).assertEqual(true);
      expect(releaseHardKey(2027)).assertEqual(true);
      expect(releaseHardKey(2013)).assertEqual(true);
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('ke5ms6w');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2019 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH2_0020
     * @tc.name      testOrderedKeyPath_2020
     * @tc.desc      Verify the ordered key path R1999, R2039.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_2020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2020 begin');
      const harness: PreviewHarness = await createPreviewHarness('x1');
      expect(releaseHardKey(1999)).assertEqual(true);
      expect(releaseHardKey(2039)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('');
      expect(harness.client.buffer).assertEqual('x1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2020 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH2_0021
     * @tc.name      testOrderedKeyPath_2021
     * @tc.desc      Verify the ordered key path D2008, D2002, R2033, D2005, D2029, D2027, R2036, D2025, R2025, R2027, R2029, R2005, R2002, R2008.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_2021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2021 begin');
      const harness: PreviewHarness = await createPreviewHarness('he');
      const outcome1: boolean = pressHardKey(2008);
      expect(outcome1).assertEqual(true);
      const outcome2: boolean = pressHardKey(2002);
      expect(outcome2).assertEqual(true);
      const outcome3: boolean = releaseHardKey(2033);
      expect(outcome3).assertEqual(true);
      const outcome4: boolean = pressHardKey(2005);
      expect(outcome4).assertEqual(true);
      const outcome5: boolean = pressHardKey(2029);
      expect(outcome5).assertEqual(true);
      const outcome6: boolean = pressHardKey(2027);
      expect(outcome6).assertEqual(true);
      const outcomeStep7: boolean = releaseHardKey(2036);
      expect(outcomeStep7).assertEqual(true);
      const outcome8: boolean = pressHardKey(2025);
      expect(outcome8).assertEqual(true);
      const outcome9: boolean = releaseHardKey(2025);
      expect(outcome9).assertEqual(true);
      const outcome10: boolean = releaseHardKey(2027);
      expect(outcome10).assertEqual(true);
      const outcome11: boolean = releaseHardKey(2029);
      expect(outcome11).assertEqual(true);
      const outcome12: boolean = releaseHardKey(2005);
      expect(outcome12).assertEqual(true);
      const outcome13: boolean = releaseHardKey(2002);
      expect(outcome13).assertEqual(true);
      const outcome14: boolean = releaseHardKey(2008);
      expect(outcome14).assertEqual(true);
      expect(harness.client.forwardLengths.join(',')).assertEqual('');
      expect(harness.client.backwardLengths.join(',')).assertEqual('');
      expect(harness.client.buffer).assertEqual('he825mki');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2021 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH2_0022
     * @tc.name      testOrderedKeyPath_2022
     * @tc.desc      Verify the ordered key path R2032, D2014, R2026, R2030, D2039, D2023, D2031, D2027, R2027, R2031, R2023, R2039, R2014.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_2022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2022 begin');
      const harness: PreviewHarness = await createPreviewHarness('a');
      for (const value of [releaseHardKey(2032)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [pressHardKey(2014)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2026)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2030)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [pressHardKey(2039)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [pressHardKey(2023)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [pressHardKey(2031)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [pressHardKey(2027)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2027)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2031)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2023)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2039)]) {
        expect(value).assertEqual(true);
      }
      for (const value of [releaseHardKey(2014)]) {
        expect(value).assertEqual(true);
      }
      expect(harness.client.movedDirections.join(',')).assertEqual('3');
      expect(harness.client.insertedTexts.join('')).assertEqual('wgok');
      expect(harness.client.buffer).assertEqual('awgok');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2022 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH2_0023
     * @tc.name      testOrderedKeyPath_2023
     * @tc.desc      Verify the ordered key path D2034, D2026, D2026, D2035, D2020, R2001, D2027, D2025, R2025, R2027, R2020, R2035, R2026, R2034.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_2023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2023 begin');
      const harness: PreviewHarness = await createPreviewHarness('x1');
      expect(pressHardKey(2034)).assertEqual(true);
      expect(pressHardKey(2026)).assertEqual(true);
      expect(pressHardKey(2026)).assertEqual(true);
      expect(pressHardKey(2035)).assertEqual(true);
      expect(pressHardKey(2020)).assertEqual(true);
      expect(releaseHardKey(2001)).assertEqual(true);
      expect(pressHardKey(2027)).assertEqual(true);
      expect(pressHardKey(2025)).assertEqual(true);
      expect(releaseHardKey(2025)).assertEqual(true);
      expect(releaseHardKey(2027)).assertEqual(true);
      expect(releaseHardKey(2020)).assertEqual(true);
      expect(releaseHardKey(2035)).assertEqual(true);
      expect(releaseHardKey(2026)).assertEqual(true);
      expect(releaseHardKey(2034)).assertEqual(true);
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('x1rjjsdki');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2023 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH2_0024
     * @tc.name      testOrderedKeyPath_2024
     * @tc.desc      Verify the ordered key path D2103, D2015, D2023, R2003, D2026, R2030, R2026, R2023, R2015, R2103.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_2024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2024 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      expect(pressHardKey(2103)).assertEqual(false);
      expect(pressHardKey(2015)).assertEqual(false);
      expect(pressHardKey(2023)).assertEqual(false);
      expect(releaseHardKey(2003)).assertEqual(false);
      expect(pressHardKey(2026)).assertEqual(false);
      expect(releaseHardKey(2030)).assertEqual(false);
      expect(releaseHardKey(2026)).assertEqual(false);
      expect(releaseHardKey(2023)).assertEqual(false);
      expect(releaseHardKey(2015)).assertEqual(true);
      expect(releaseHardKey(2103)).assertEqual(false);
      expect(harness.client.insertedTexts.join('')).assertEqual('');
      expect(harness.client.buffer).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2024 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ORDEREDKEYPATH2_0025
     * @tc.name      testOrderedKeyPath_2025
     * @tc.desc      Verify the ordered key path R2031, R2023.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testOrderedKeyPath_2025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2025 begin');
      const harness: PreviewHarness = await createPreviewHarness('#a');
      const outcome1: boolean = releaseHardKey(2031);
      expect(outcome1).assertEqual(true);
      const outcome2: boolean = releaseHardKey(2023);
      expect(outcome2).assertEqual(true);
      expect(harness.client.forwardLengths.join(',')).assertEqual('');
      expect(harness.client.backwardLengths.join(',')).assertEqual('');
      expect(harness.client.buffer).assertEqual('#a');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOrderedKeyPath_2025 end');
      await yieldToEventLoop();
    });

  });

}
