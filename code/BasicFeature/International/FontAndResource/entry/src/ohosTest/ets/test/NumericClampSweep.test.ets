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

// Import hilog directly for device side test logging.
import { hilog } from '@kit.PerformanceAnalysisKit';
// Import the hypium test framework primitives used by this suite.
import { beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
// Import the NumberUtils helpers under test from the library HAR package.
import { NumberUtils } from 'library';

// The suite-level hilog tag, distinct from the per-case TAG values.
const SUITE_TAG: string = '[Sample_FontAndResource]';
// The hilog domain used by this suite.
const DOMAIN: number = 0xF811;
// The prefix attached to every case log message.
const BUNDLE: string = 'FontAndResource_';

// Logs one structured case progress line into hilog under the case TAG.
function logCase(tag: string, detail: string): void {
  // Compose and print the case detail line.
  hilog.info(DOMAIN, tag, '%{public}s', BUNDLE + tag + ', ' + detail);
}

// Registers every matrix case of the NumericClampSweepSuite suite.
export default function numericClampSweepTest() {
  // Group the cases under the "NumericClampSweepSuite" describe block.
  describe('NumericClampSweepSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'NumericClampSweepSuite, begin');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_CLAMP_0100
     * @tc.name      testClampSweepInside0001
     * @tc.desc      Verify clamp keeps a dense sweep of values that already sit inside the range.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testClampSweepInside0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testClampSweepInside0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: clamp(-90, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(-90, -100, 100)");
      expect(NumberUtils.clamp(-90, -100, 100)).assertEqual(-90);
      // Vector 2: clamp(-87, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(-87, -100, 100)");
      expect(NumberUtils.clamp(-87, -100, 100)).assertEqual(-87);
      // Vector 3: clamp(-84, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(-84, -100, 100)");
      expect(NumberUtils.clamp(-84, -100, 100)).assertEqual(-84);
      // Vector 4: clamp(-81, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(-81, -100, 100)");
      expect(NumberUtils.clamp(-81, -100, 100)).assertEqual(-81);
      // Vector 5: clamp(-78, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(-78, -100, 100)");
      expect(NumberUtils.clamp(-78, -100, 100)).assertEqual(-78);
      // Vector 6: clamp(-75, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(-75, -100, 100)");
      expect(NumberUtils.clamp(-75, -100, 100)).assertEqual(-75);
      // Vector 7: clamp(-72, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(-72, -100, 100)");
      expect(NumberUtils.clamp(-72, -100, 100)).assertEqual(-72);
      // Vector 8: clamp(-69, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(-69, -100, 100)");
      expect(NumberUtils.clamp(-69, -100, 100)).assertEqual(-69);
      // Vector 9: clamp(-66, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(-66, -100, 100)");
      expect(NumberUtils.clamp(-66, -100, 100)).assertEqual(-66);
      // Vector 10: clamp(-63, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(-63, -100, 100)");
      expect(NumberUtils.clamp(-63, -100, 100)).assertEqual(-63);
      // Vector 11: clamp(-60, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(-60, -100, 100)");
      expect(NumberUtils.clamp(-60, -100, 100)).assertEqual(-60);
      // Vector 12: clamp(-57, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(-57, -100, 100)");
      expect(NumberUtils.clamp(-57, -100, 100)).assertEqual(-57);
      // Vector 13: clamp(-54, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(-54, -100, 100)");
      expect(NumberUtils.clamp(-54, -100, 100)).assertEqual(-54);
      // Vector 14: clamp(-51, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(-51, -100, 100)");
      expect(NumberUtils.clamp(-51, -100, 100)).assertEqual(-51);
      // Vector 15: clamp(-48, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(-48, -100, 100)");
      expect(NumberUtils.clamp(-48, -100, 100)).assertEqual(-48);
      // Vector 16: clamp(-45, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(-45, -100, 100)");
      expect(NumberUtils.clamp(-45, -100, 100)).assertEqual(-45);
      // Vector 17: clamp(-42, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(-42, -100, 100)");
      expect(NumberUtils.clamp(-42, -100, 100)).assertEqual(-42);
      // Vector 18: clamp(-39, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(-39, -100, 100)");
      expect(NumberUtils.clamp(-39, -100, 100)).assertEqual(-39);
      // Vector 19: clamp(-36, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(-36, -100, 100)");
      expect(NumberUtils.clamp(-36, -100, 100)).assertEqual(-36);
      // Vector 20: clamp(-33, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(-33, -100, 100)");
      expect(NumberUtils.clamp(-33, -100, 100)).assertEqual(-33);
      // Vector 21: clamp(-30, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(-30, -100, 100)");
      expect(NumberUtils.clamp(-30, -100, 100)).assertEqual(-30);
      // Vector 22: clamp(-27, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(-27, -100, 100)");
      expect(NumberUtils.clamp(-27, -100, 100)).assertEqual(-27);
      // Vector 23: clamp(-24, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(-24, -100, 100)");
      expect(NumberUtils.clamp(-24, -100, 100)).assertEqual(-24);
      // Vector 24: clamp(-21, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(-21, -100, 100)");
      expect(NumberUtils.clamp(-21, -100, 100)).assertEqual(-21);
      // Vector 25: clamp(-18, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(-18, -100, 100)");
      expect(NumberUtils.clamp(-18, -100, 100)).assertEqual(-18);
      // Vector 26: clamp(-15, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(-15, -100, 100)");
      expect(NumberUtils.clamp(-15, -100, 100)).assertEqual(-15);
      // Vector 27: clamp(-12, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(-12, -100, 100)");
      expect(NumberUtils.clamp(-12, -100, 100)).assertEqual(-12);
      // Vector 28: clamp(-9, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(-9, -100, 100)");
      expect(NumberUtils.clamp(-9, -100, 100)).assertEqual(-9);
      // Vector 29: clamp(-6, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(-6, -100, 100)");
      expect(NumberUtils.clamp(-6, -100, 100)).assertEqual(-6);
      // Vector 30: clamp(-3, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(-3, -100, 100)");
      expect(NumberUtils.clamp(-3, -100, 100)).assertEqual(-3);
      // Vector 31: clamp(0, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(0, -100, 100)");
      expect(NumberUtils.clamp(0, -100, 100)).assertEqual(0);
      // Vector 32: clamp(3, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(3, -100, 100)");
      expect(NumberUtils.clamp(3, -100, 100)).assertEqual(3);
      // Vector 33: clamp(6, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(6, -100, 100)");
      expect(NumberUtils.clamp(6, -100, 100)).assertEqual(6);
      // Vector 34: clamp(9, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(9, -100, 100)");
      expect(NumberUtils.clamp(9, -100, 100)).assertEqual(9);
      // Vector 35: clamp(12, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(12, -100, 100)");
      expect(NumberUtils.clamp(12, -100, 100)).assertEqual(12);
      // Vector 36: clamp(15, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(15, -100, 100)");
      expect(NumberUtils.clamp(15, -100, 100)).assertEqual(15);
      // Vector 37: clamp(18, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(18, -100, 100)");
      expect(NumberUtils.clamp(18, -100, 100)).assertEqual(18);
      // Vector 38: clamp(21, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(21, -100, 100)");
      expect(NumberUtils.clamp(21, -100, 100)).assertEqual(21);
      // Vector 39: clamp(24, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(24, -100, 100)");
      expect(NumberUtils.clamp(24, -100, 100)).assertEqual(24);
      // Vector 40: clamp(27, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(27, -100, 100)");
      expect(NumberUtils.clamp(27, -100, 100)).assertEqual(27);
      // Vector 41: clamp(30, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(30, -100, 100)");
      expect(NumberUtils.clamp(30, -100, 100)).assertEqual(30);
      // Vector 42: clamp(33, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(33, -100, 100)");
      expect(NumberUtils.clamp(33, -100, 100)).assertEqual(33);
      // Vector 43: clamp(36, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(36, -100, 100)");
      expect(NumberUtils.clamp(36, -100, 100)).assertEqual(36);
      // Vector 44: clamp(39, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(39, -100, 100)");
      expect(NumberUtils.clamp(39, -100, 100)).assertEqual(39);
      // Vector 45: clamp(42, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(42, -100, 100)");
      expect(NumberUtils.clamp(42, -100, 100)).assertEqual(42);
      // Vector 46: clamp(45, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(45, -100, 100)");
      expect(NumberUtils.clamp(45, -100, 100)).assertEqual(45);
      // Vector 47: clamp(48, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(48, -100, 100)");
      expect(NumberUtils.clamp(48, -100, 100)).assertEqual(48);
      // Vector 48: clamp(51, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(51, -100, 100)");
      expect(NumberUtils.clamp(51, -100, 100)).assertEqual(51);
      // Vector 49: clamp(54, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(54, -100, 100)");
      expect(NumberUtils.clamp(54, -100, 100)).assertEqual(54);
      // Vector 50: clamp(57, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(57, -100, 100)");
      expect(NumberUtils.clamp(57, -100, 100)).assertEqual(57);
      // Vector 51: clamp(60, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(60, -100, 100)");
      expect(NumberUtils.clamp(60, -100, 100)).assertEqual(60);
      // Vector 52: clamp(63, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(63, -100, 100)");
      expect(NumberUtils.clamp(63, -100, 100)).assertEqual(63);
      // Vector 53: clamp(66, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(66, -100, 100)");
      expect(NumberUtils.clamp(66, -100, 100)).assertEqual(66);
      // Vector 54: clamp(69, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(69, -100, 100)");
      expect(NumberUtils.clamp(69, -100, 100)).assertEqual(69);
      // Vector 55: clamp(72, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(72, -100, 100)");
      expect(NumberUtils.clamp(72, -100, 100)).assertEqual(72);
      // Vector 56: clamp(75, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(75, -100, 100)");
      expect(NumberUtils.clamp(75, -100, 100)).assertEqual(75);
      // Vector 57: clamp(78, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(78, -100, 100)");
      expect(NumberUtils.clamp(78, -100, 100)).assertEqual(78);
      // Vector 58: clamp(81, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(81, -100, 100)");
      expect(NumberUtils.clamp(81, -100, 100)).assertEqual(81);
      // Vector 59: clamp(84, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(84, -100, 100)");
      expect(NumberUtils.clamp(84, -100, 100)).assertEqual(84);
      // Vector 60: clamp(87, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(87, -100, 100)");
      expect(NumberUtils.clamp(87, -100, 100)).assertEqual(87);
      // Vector 61: clamp(90, -100, 100) keeps the in-range value.
      logCase(TAG, "clamp(90, -100, 100)");
      expect(NumberUtils.clamp(90, -100, 100)).assertEqual(90);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_CLAMP_0200
     * @tc.name      testClampSweepBelow0001
     * @tc.desc      Verify clamp pins a dense sweep of below-range values to the lower bound.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testClampSweepBelow0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testClampSweepBelow0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: clamp(-200, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-200, 20, 80)");
      expect(NumberUtils.clamp(-200, 20, 80)).assertEqual(20);
      // Vector 2: clamp(-196, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-196, 20, 80)");
      expect(NumberUtils.clamp(-196, 20, 80)).assertEqual(20);
      // Vector 3: clamp(-192, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-192, 20, 80)");
      expect(NumberUtils.clamp(-192, 20, 80)).assertEqual(20);
      // Vector 4: clamp(-188, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-188, 20, 80)");
      expect(NumberUtils.clamp(-188, 20, 80)).assertEqual(20);
      // Vector 5: clamp(-184, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-184, 20, 80)");
      expect(NumberUtils.clamp(-184, 20, 80)).assertEqual(20);
      // Vector 6: clamp(-180, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-180, 20, 80)");
      expect(NumberUtils.clamp(-180, 20, 80)).assertEqual(20);
      // Vector 7: clamp(-176, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-176, 20, 80)");
      expect(NumberUtils.clamp(-176, 20, 80)).assertEqual(20);
      // Vector 8: clamp(-172, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-172, 20, 80)");
      expect(NumberUtils.clamp(-172, 20, 80)).assertEqual(20);
      // Vector 9: clamp(-168, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-168, 20, 80)");
      expect(NumberUtils.clamp(-168, 20, 80)).assertEqual(20);
      // Vector 10: clamp(-164, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-164, 20, 80)");
      expect(NumberUtils.clamp(-164, 20, 80)).assertEqual(20);
      // Vector 11: clamp(-160, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-160, 20, 80)");
      expect(NumberUtils.clamp(-160, 20, 80)).assertEqual(20);
      // Vector 12: clamp(-156, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-156, 20, 80)");
      expect(NumberUtils.clamp(-156, 20, 80)).assertEqual(20);
      // Vector 13: clamp(-152, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-152, 20, 80)");
      expect(NumberUtils.clamp(-152, 20, 80)).assertEqual(20);
      // Vector 14: clamp(-148, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-148, 20, 80)");
      expect(NumberUtils.clamp(-148, 20, 80)).assertEqual(20);
      // Vector 15: clamp(-144, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-144, 20, 80)");
      expect(NumberUtils.clamp(-144, 20, 80)).assertEqual(20);
      // Vector 16: clamp(-140, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-140, 20, 80)");
      expect(NumberUtils.clamp(-140, 20, 80)).assertEqual(20);
      // Vector 17: clamp(-136, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-136, 20, 80)");
      expect(NumberUtils.clamp(-136, 20, 80)).assertEqual(20);
      // Vector 18: clamp(-132, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-132, 20, 80)");
      expect(NumberUtils.clamp(-132, 20, 80)).assertEqual(20);
      // Vector 19: clamp(-128, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-128, 20, 80)");
      expect(NumberUtils.clamp(-128, 20, 80)).assertEqual(20);
      // Vector 20: clamp(-124, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-124, 20, 80)");
      expect(NumberUtils.clamp(-124, 20, 80)).assertEqual(20);
      // Vector 21: clamp(-120, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-120, 20, 80)");
      expect(NumberUtils.clamp(-120, 20, 80)).assertEqual(20);
      // Vector 22: clamp(-116, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-116, 20, 80)");
      expect(NumberUtils.clamp(-116, 20, 80)).assertEqual(20);
      // Vector 23: clamp(-112, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-112, 20, 80)");
      expect(NumberUtils.clamp(-112, 20, 80)).assertEqual(20);
      // Vector 24: clamp(-108, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-108, 20, 80)");
      expect(NumberUtils.clamp(-108, 20, 80)).assertEqual(20);
      // Vector 25: clamp(-104, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-104, 20, 80)");
      expect(NumberUtils.clamp(-104, 20, 80)).assertEqual(20);
      // Vector 26: clamp(-100, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-100, 20, 80)");
      expect(NumberUtils.clamp(-100, 20, 80)).assertEqual(20);
      // Vector 27: clamp(-96, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-96, 20, 80)");
      expect(NumberUtils.clamp(-96, 20, 80)).assertEqual(20);
      // Vector 28: clamp(-92, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-92, 20, 80)");
      expect(NumberUtils.clamp(-92, 20, 80)).assertEqual(20);
      // Vector 29: clamp(-88, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-88, 20, 80)");
      expect(NumberUtils.clamp(-88, 20, 80)).assertEqual(20);
      // Vector 30: clamp(-84, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-84, 20, 80)");
      expect(NumberUtils.clamp(-84, 20, 80)).assertEqual(20);
      // Vector 31: clamp(-80, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-80, 20, 80)");
      expect(NumberUtils.clamp(-80, 20, 80)).assertEqual(20);
      // Vector 32: clamp(-76, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-76, 20, 80)");
      expect(NumberUtils.clamp(-76, 20, 80)).assertEqual(20);
      // Vector 33: clamp(-72, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-72, 20, 80)");
      expect(NumberUtils.clamp(-72, 20, 80)).assertEqual(20);
      // Vector 34: clamp(-68, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-68, 20, 80)");
      expect(NumberUtils.clamp(-68, 20, 80)).assertEqual(20);
      // Vector 35: clamp(-64, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-64, 20, 80)");
      expect(NumberUtils.clamp(-64, 20, 80)).assertEqual(20);
      // Vector 36: clamp(-60, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-60, 20, 80)");
      expect(NumberUtils.clamp(-60, 20, 80)).assertEqual(20);
      // Vector 37: clamp(-56, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-56, 20, 80)");
      expect(NumberUtils.clamp(-56, 20, 80)).assertEqual(20);
      // Vector 38: clamp(-52, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-52, 20, 80)");
      expect(NumberUtils.clamp(-52, 20, 80)).assertEqual(20);
      // Vector 39: clamp(-48, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-48, 20, 80)");
      expect(NumberUtils.clamp(-48, 20, 80)).assertEqual(20);
      // Vector 40: clamp(-44, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-44, 20, 80)");
      expect(NumberUtils.clamp(-44, 20, 80)).assertEqual(20);
      // Vector 41: clamp(-40, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-40, 20, 80)");
      expect(NumberUtils.clamp(-40, 20, 80)).assertEqual(20);
      // Vector 42: clamp(-36, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-36, 20, 80)");
      expect(NumberUtils.clamp(-36, 20, 80)).assertEqual(20);
      // Vector 43: clamp(-32, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-32, 20, 80)");
      expect(NumberUtils.clamp(-32, 20, 80)).assertEqual(20);
      // Vector 44: clamp(-28, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-28, 20, 80)");
      expect(NumberUtils.clamp(-28, 20, 80)).assertEqual(20);
      // Vector 45: clamp(-24, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-24, 20, 80)");
      expect(NumberUtils.clamp(-24, 20, 80)).assertEqual(20);
      // Vector 46: clamp(-20, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-20, 20, 80)");
      expect(NumberUtils.clamp(-20, 20, 80)).assertEqual(20);
      // Vector 47: clamp(-16, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-16, 20, 80)");
      expect(NumberUtils.clamp(-16, 20, 80)).assertEqual(20);
      // Vector 48: clamp(-12, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-12, 20, 80)");
      expect(NumberUtils.clamp(-12, 20, 80)).assertEqual(20);
      // Vector 49: clamp(-8, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-8, 20, 80)");
      expect(NumberUtils.clamp(-8, 20, 80)).assertEqual(20);
      // Vector 50: clamp(-4, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(-4, 20, 80)");
      expect(NumberUtils.clamp(-4, 20, 80)).assertEqual(20);
      // Vector 51: clamp(0, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(0, 20, 80)");
      expect(NumberUtils.clamp(0, 20, 80)).assertEqual(20);
      // Vector 52: clamp(4, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(4, 20, 80)");
      expect(NumberUtils.clamp(4, 20, 80)).assertEqual(20);
      // Vector 53: clamp(8, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(8, 20, 80)");
      expect(NumberUtils.clamp(8, 20, 80)).assertEqual(20);
      // Vector 54: clamp(12, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(12, 20, 80)");
      expect(NumberUtils.clamp(12, 20, 80)).assertEqual(20);
      // Vector 55: clamp(16, 20, 80) pins the value to the lower bound.
      logCase(TAG, "clamp(16, 20, 80)");
      expect(NumberUtils.clamp(16, 20, 80)).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_CLAMP_0300
     * @tc.name      testClampSweepAbove0001
     * @tc.desc      Verify clamp pins a dense sweep of above-range values to the upper bound.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testClampSweepAbove0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testClampSweepAbove0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: clamp(81, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(81, 20, 80)");
      expect(NumberUtils.clamp(81, 20, 80)).assertEqual(80);
      // Vector 2: clamp(85, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(85, 20, 80)");
      expect(NumberUtils.clamp(85, 20, 80)).assertEqual(80);
      // Vector 3: clamp(89, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(89, 20, 80)");
      expect(NumberUtils.clamp(89, 20, 80)).assertEqual(80);
      // Vector 4: clamp(93, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(93, 20, 80)");
      expect(NumberUtils.clamp(93, 20, 80)).assertEqual(80);
      // Vector 5: clamp(97, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(97, 20, 80)");
      expect(NumberUtils.clamp(97, 20, 80)).assertEqual(80);
      // Vector 6: clamp(101, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(101, 20, 80)");
      expect(NumberUtils.clamp(101, 20, 80)).assertEqual(80);
      // Vector 7: clamp(105, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(105, 20, 80)");
      expect(NumberUtils.clamp(105, 20, 80)).assertEqual(80);
      // Vector 8: clamp(109, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(109, 20, 80)");
      expect(NumberUtils.clamp(109, 20, 80)).assertEqual(80);
      // Vector 9: clamp(113, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(113, 20, 80)");
      expect(NumberUtils.clamp(113, 20, 80)).assertEqual(80);
      // Vector 10: clamp(117, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(117, 20, 80)");
      expect(NumberUtils.clamp(117, 20, 80)).assertEqual(80);
      // Vector 11: clamp(121, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(121, 20, 80)");
      expect(NumberUtils.clamp(121, 20, 80)).assertEqual(80);
      // Vector 12: clamp(125, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(125, 20, 80)");
      expect(NumberUtils.clamp(125, 20, 80)).assertEqual(80);
      // Vector 13: clamp(129, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(129, 20, 80)");
      expect(NumberUtils.clamp(129, 20, 80)).assertEqual(80);
      // Vector 14: clamp(133, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(133, 20, 80)");
      expect(NumberUtils.clamp(133, 20, 80)).assertEqual(80);
      // Vector 15: clamp(137, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(137, 20, 80)");
      expect(NumberUtils.clamp(137, 20, 80)).assertEqual(80);
      // Vector 16: clamp(141, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(141, 20, 80)");
      expect(NumberUtils.clamp(141, 20, 80)).assertEqual(80);
      // Vector 17: clamp(145, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(145, 20, 80)");
      expect(NumberUtils.clamp(145, 20, 80)).assertEqual(80);
      // Vector 18: clamp(149, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(149, 20, 80)");
      expect(NumberUtils.clamp(149, 20, 80)).assertEqual(80);
      // Vector 19: clamp(153, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(153, 20, 80)");
      expect(NumberUtils.clamp(153, 20, 80)).assertEqual(80);
      // Vector 20: clamp(157, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(157, 20, 80)");
      expect(NumberUtils.clamp(157, 20, 80)).assertEqual(80);
      // Vector 21: clamp(161, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(161, 20, 80)");
      expect(NumberUtils.clamp(161, 20, 80)).assertEqual(80);
      // Vector 22: clamp(165, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(165, 20, 80)");
      expect(NumberUtils.clamp(165, 20, 80)).assertEqual(80);
      // Vector 23: clamp(169, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(169, 20, 80)");
      expect(NumberUtils.clamp(169, 20, 80)).assertEqual(80);
      // Vector 24: clamp(173, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(173, 20, 80)");
      expect(NumberUtils.clamp(173, 20, 80)).assertEqual(80);
      // Vector 25: clamp(177, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(177, 20, 80)");
      expect(NumberUtils.clamp(177, 20, 80)).assertEqual(80);
      // Vector 26: clamp(181, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(181, 20, 80)");
      expect(NumberUtils.clamp(181, 20, 80)).assertEqual(80);
      // Vector 27: clamp(185, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(185, 20, 80)");
      expect(NumberUtils.clamp(185, 20, 80)).assertEqual(80);
      // Vector 28: clamp(189, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(189, 20, 80)");
      expect(NumberUtils.clamp(189, 20, 80)).assertEqual(80);
      // Vector 29: clamp(193, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(193, 20, 80)");
      expect(NumberUtils.clamp(193, 20, 80)).assertEqual(80);
      // Vector 30: clamp(197, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(197, 20, 80)");
      expect(NumberUtils.clamp(197, 20, 80)).assertEqual(80);
      // Vector 31: clamp(201, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(201, 20, 80)");
      expect(NumberUtils.clamp(201, 20, 80)).assertEqual(80);
      // Vector 32: clamp(205, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(205, 20, 80)");
      expect(NumberUtils.clamp(205, 20, 80)).assertEqual(80);
      // Vector 33: clamp(209, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(209, 20, 80)");
      expect(NumberUtils.clamp(209, 20, 80)).assertEqual(80);
      // Vector 34: clamp(213, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(213, 20, 80)");
      expect(NumberUtils.clamp(213, 20, 80)).assertEqual(80);
      // Vector 35: clamp(217, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(217, 20, 80)");
      expect(NumberUtils.clamp(217, 20, 80)).assertEqual(80);
      // Vector 36: clamp(221, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(221, 20, 80)");
      expect(NumberUtils.clamp(221, 20, 80)).assertEqual(80);
      // Vector 37: clamp(225, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(225, 20, 80)");
      expect(NumberUtils.clamp(225, 20, 80)).assertEqual(80);
      // Vector 38: clamp(229, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(229, 20, 80)");
      expect(NumberUtils.clamp(229, 20, 80)).assertEqual(80);
      // Vector 39: clamp(233, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(233, 20, 80)");
      expect(NumberUtils.clamp(233, 20, 80)).assertEqual(80);
      // Vector 40: clamp(237, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(237, 20, 80)");
      expect(NumberUtils.clamp(237, 20, 80)).assertEqual(80);
      // Vector 41: clamp(241, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(241, 20, 80)");
      expect(NumberUtils.clamp(241, 20, 80)).assertEqual(80);
      // Vector 42: clamp(245, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(245, 20, 80)");
      expect(NumberUtils.clamp(245, 20, 80)).assertEqual(80);
      // Vector 43: clamp(249, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(249, 20, 80)");
      expect(NumberUtils.clamp(249, 20, 80)).assertEqual(80);
      // Vector 44: clamp(253, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(253, 20, 80)");
      expect(NumberUtils.clamp(253, 20, 80)).assertEqual(80);
      // Vector 45: clamp(257, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(257, 20, 80)");
      expect(NumberUtils.clamp(257, 20, 80)).assertEqual(80);
      // Vector 46: clamp(261, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(261, 20, 80)");
      expect(NumberUtils.clamp(261, 20, 80)).assertEqual(80);
      // Vector 47: clamp(265, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(265, 20, 80)");
      expect(NumberUtils.clamp(265, 20, 80)).assertEqual(80);
      // Vector 48: clamp(269, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(269, 20, 80)");
      expect(NumberUtils.clamp(269, 20, 80)).assertEqual(80);
      // Vector 49: clamp(273, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(273, 20, 80)");
      expect(NumberUtils.clamp(273, 20, 80)).assertEqual(80);
      // Vector 50: clamp(277, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(277, 20, 80)");
      expect(NumberUtils.clamp(277, 20, 80)).assertEqual(80);
      // Vector 51: clamp(281, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(281, 20, 80)");
      expect(NumberUtils.clamp(281, 20, 80)).assertEqual(80);
      // Vector 52: clamp(285, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(285, 20, 80)");
      expect(NumberUtils.clamp(285, 20, 80)).assertEqual(80);
      // Vector 53: clamp(289, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(289, 20, 80)");
      expect(NumberUtils.clamp(289, 20, 80)).assertEqual(80);
      // Vector 54: clamp(293, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(293, 20, 80)");
      expect(NumberUtils.clamp(293, 20, 80)).assertEqual(80);
      // Vector 55: clamp(297, 20, 80) pins the value to the upper bound.
      logCase(TAG, "clamp(297, 20, 80)");
      expect(NumberUtils.clamp(297, 20, 80)).assertEqual(80);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_CLAMP_0400
     * @tc.name      testClampSweepNegative0001
     * @tc.desc      Verify clamp sweeps an entirely negative range without crossing the bounds.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testClampSweepNegative0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testClampSweepNegative0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: clamp(-600, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-600, -500, -100)");
      expect(NumberUtils.clamp(-600, -500, -100)).assertEqual(-500);
      // Vector 2: clamp(-592, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-592, -500, -100)");
      expect(NumberUtils.clamp(-592, -500, -100)).assertEqual(-500);
      // Vector 3: clamp(-584, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-584, -500, -100)");
      expect(NumberUtils.clamp(-584, -500, -100)).assertEqual(-500);
      // Vector 4: clamp(-576, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-576, -500, -100)");
      expect(NumberUtils.clamp(-576, -500, -100)).assertEqual(-500);
      // Vector 5: clamp(-568, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-568, -500, -100)");
      expect(NumberUtils.clamp(-568, -500, -100)).assertEqual(-500);
      // Vector 6: clamp(-560, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-560, -500, -100)");
      expect(NumberUtils.clamp(-560, -500, -100)).assertEqual(-500);
      // Vector 7: clamp(-552, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-552, -500, -100)");
      expect(NumberUtils.clamp(-552, -500, -100)).assertEqual(-500);
      // Vector 8: clamp(-544, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-544, -500, -100)");
      expect(NumberUtils.clamp(-544, -500, -100)).assertEqual(-500);
      // Vector 9: clamp(-536, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-536, -500, -100)");
      expect(NumberUtils.clamp(-536, -500, -100)).assertEqual(-500);
      // Vector 10: clamp(-528, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-528, -500, -100)");
      expect(NumberUtils.clamp(-528, -500, -100)).assertEqual(-500);
      // Vector 11: clamp(-520, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-520, -500, -100)");
      expect(NumberUtils.clamp(-520, -500, -100)).assertEqual(-500);
      // Vector 12: clamp(-512, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-512, -500, -100)");
      expect(NumberUtils.clamp(-512, -500, -100)).assertEqual(-500);
      // Vector 13: clamp(-504, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-504, -500, -100)");
      expect(NumberUtils.clamp(-504, -500, -100)).assertEqual(-500);
      // Vector 14: clamp(-496, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-496, -500, -100)");
      expect(NumberUtils.clamp(-496, -500, -100)).assertEqual(-496);
      // Vector 15: clamp(-488, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-488, -500, -100)");
      expect(NumberUtils.clamp(-488, -500, -100)).assertEqual(-488);
      // Vector 16: clamp(-480, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-480, -500, -100)");
      expect(NumberUtils.clamp(-480, -500, -100)).assertEqual(-480);
      // Vector 17: clamp(-472, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-472, -500, -100)");
      expect(NumberUtils.clamp(-472, -500, -100)).assertEqual(-472);
      // Vector 18: clamp(-464, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-464, -500, -100)");
      expect(NumberUtils.clamp(-464, -500, -100)).assertEqual(-464);
      // Vector 19: clamp(-456, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-456, -500, -100)");
      expect(NumberUtils.clamp(-456, -500, -100)).assertEqual(-456);
      // Vector 20: clamp(-448, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-448, -500, -100)");
      expect(NumberUtils.clamp(-448, -500, -100)).assertEqual(-448);
      // Vector 21: clamp(-440, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-440, -500, -100)");
      expect(NumberUtils.clamp(-440, -500, -100)).assertEqual(-440);
      // Vector 22: clamp(-432, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-432, -500, -100)");
      expect(NumberUtils.clamp(-432, -500, -100)).assertEqual(-432);
      // Vector 23: clamp(-424, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-424, -500, -100)");
      expect(NumberUtils.clamp(-424, -500, -100)).assertEqual(-424);
      // Vector 24: clamp(-416, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-416, -500, -100)");
      expect(NumberUtils.clamp(-416, -500, -100)).assertEqual(-416);
      // Vector 25: clamp(-408, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-408, -500, -100)");
      expect(NumberUtils.clamp(-408, -500, -100)).assertEqual(-408);
      // Vector 26: clamp(-400, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-400, -500, -100)");
      expect(NumberUtils.clamp(-400, -500, -100)).assertEqual(-400);
      // Vector 27: clamp(-392, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-392, -500, -100)");
      expect(NumberUtils.clamp(-392, -500, -100)).assertEqual(-392);
      // Vector 28: clamp(-384, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-384, -500, -100)");
      expect(NumberUtils.clamp(-384, -500, -100)).assertEqual(-384);
      // Vector 29: clamp(-376, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-376, -500, -100)");
      expect(NumberUtils.clamp(-376, -500, -100)).assertEqual(-376);
      // Vector 30: clamp(-368, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-368, -500, -100)");
      expect(NumberUtils.clamp(-368, -500, -100)).assertEqual(-368);
      // Vector 31: clamp(-360, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-360, -500, -100)");
      expect(NumberUtils.clamp(-360, -500, -100)).assertEqual(-360);
      // Vector 32: clamp(-352, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-352, -500, -100)");
      expect(NumberUtils.clamp(-352, -500, -100)).assertEqual(-352);
      // Vector 33: clamp(-344, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-344, -500, -100)");
      expect(NumberUtils.clamp(-344, -500, -100)).assertEqual(-344);
      // Vector 34: clamp(-336, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-336, -500, -100)");
      expect(NumberUtils.clamp(-336, -500, -100)).assertEqual(-336);
      // Vector 35: clamp(-328, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-328, -500, -100)");
      expect(NumberUtils.clamp(-328, -500, -100)).assertEqual(-328);
      // Vector 36: clamp(-320, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-320, -500, -100)");
      expect(NumberUtils.clamp(-320, -500, -100)).assertEqual(-320);
      // Vector 37: clamp(-312, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-312, -500, -100)");
      expect(NumberUtils.clamp(-312, -500, -100)).assertEqual(-312);
      // Vector 38: clamp(-304, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-304, -500, -100)");
      expect(NumberUtils.clamp(-304, -500, -100)).assertEqual(-304);
      // Vector 39: clamp(-296, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-296, -500, -100)");
      expect(NumberUtils.clamp(-296, -500, -100)).assertEqual(-296);
      // Vector 40: clamp(-288, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-288, -500, -100)");
      expect(NumberUtils.clamp(-288, -500, -100)).assertEqual(-288);
      // Vector 41: clamp(-280, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-280, -500, -100)");
      expect(NumberUtils.clamp(-280, -500, -100)).assertEqual(-280);
      // Vector 42: clamp(-272, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-272, -500, -100)");
      expect(NumberUtils.clamp(-272, -500, -100)).assertEqual(-272);
      // Vector 43: clamp(-264, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-264, -500, -100)");
      expect(NumberUtils.clamp(-264, -500, -100)).assertEqual(-264);
      // Vector 44: clamp(-256, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-256, -500, -100)");
      expect(NumberUtils.clamp(-256, -500, -100)).assertEqual(-256);
      // Vector 45: clamp(-248, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-248, -500, -100)");
      expect(NumberUtils.clamp(-248, -500, -100)).assertEqual(-248);
      // Vector 46: clamp(-240, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-240, -500, -100)");
      expect(NumberUtils.clamp(-240, -500, -100)).assertEqual(-240);
      // Vector 47: clamp(-232, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-232, -500, -100)");
      expect(NumberUtils.clamp(-232, -500, -100)).assertEqual(-232);
      // Vector 48: clamp(-224, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-224, -500, -100)");
      expect(NumberUtils.clamp(-224, -500, -100)).assertEqual(-224);
      // Vector 49: clamp(-216, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-216, -500, -100)");
      expect(NumberUtils.clamp(-216, -500, -100)).assertEqual(-216);
      // Vector 50: clamp(-208, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-208, -500, -100)");
      expect(NumberUtils.clamp(-208, -500, -100)).assertEqual(-208);
      // Vector 51: clamp(-200, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-200, -500, -100)");
      expect(NumberUtils.clamp(-200, -500, -100)).assertEqual(-200);
      // Vector 52: clamp(-192, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-192, -500, -100)");
      expect(NumberUtils.clamp(-192, -500, -100)).assertEqual(-192);
      // Vector 53: clamp(-184, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-184, -500, -100)");
      expect(NumberUtils.clamp(-184, -500, -100)).assertEqual(-184);
      // Vector 54: clamp(-176, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-176, -500, -100)");
      expect(NumberUtils.clamp(-176, -500, -100)).assertEqual(-176);
      // Vector 55: clamp(-168, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-168, -500, -100)");
      expect(NumberUtils.clamp(-168, -500, -100)).assertEqual(-168);
      // Vector 56: clamp(-160, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-160, -500, -100)");
      expect(NumberUtils.clamp(-160, -500, -100)).assertEqual(-160);
      // Vector 57: clamp(-152, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-152, -500, -100)");
      expect(NumberUtils.clamp(-152, -500, -100)).assertEqual(-152);
      // Vector 58: clamp(-144, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-144, -500, -100)");
      expect(NumberUtils.clamp(-144, -500, -100)).assertEqual(-144);
      // Vector 59: clamp(-136, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-136, -500, -100)");
      expect(NumberUtils.clamp(-136, -500, -100)).assertEqual(-136);
      // Vector 60: clamp(-128, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-128, -500, -100)");
      expect(NumberUtils.clamp(-128, -500, -100)).assertEqual(-128);
      // Vector 61: clamp(-120, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-120, -500, -100)");
      expect(NumberUtils.clamp(-120, -500, -100)).assertEqual(-120);
      // Vector 62: clamp(-112, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-112, -500, -100)");
      expect(NumberUtils.clamp(-112, -500, -100)).assertEqual(-112);
      // Vector 63: clamp(-104, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-104, -500, -100)");
      expect(NumberUtils.clamp(-104, -500, -100)).assertEqual(-104);
      // Vector 64: clamp(-96, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-96, -500, -100)");
      expect(NumberUtils.clamp(-96, -500, -100)).assertEqual(-100);
      // Vector 65: clamp(-88, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-88, -500, -100)");
      expect(NumberUtils.clamp(-88, -500, -100)).assertEqual(-100);
      // Vector 66: clamp(-80, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-80, -500, -100)");
      expect(NumberUtils.clamp(-80, -500, -100)).assertEqual(-100);
      // Vector 67: clamp(-72, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-72, -500, -100)");
      expect(NumberUtils.clamp(-72, -500, -100)).assertEqual(-100);
      // Vector 68: clamp(-64, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-64, -500, -100)");
      expect(NumberUtils.clamp(-64, -500, -100)).assertEqual(-100);
      // Vector 69: clamp(-56, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-56, -500, -100)");
      expect(NumberUtils.clamp(-56, -500, -100)).assertEqual(-100);
      // Vector 70: clamp(-48, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-48, -500, -100)");
      expect(NumberUtils.clamp(-48, -500, -100)).assertEqual(-100);
      // Vector 71: clamp(-40, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-40, -500, -100)");
      expect(NumberUtils.clamp(-40, -500, -100)).assertEqual(-100);
      // Vector 72: clamp(-32, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-32, -500, -100)");
      expect(NumberUtils.clamp(-32, -500, -100)).assertEqual(-100);
      // Vector 73: clamp(-24, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-24, -500, -100)");
      expect(NumberUtils.clamp(-24, -500, -100)).assertEqual(-100);
      // Vector 74: clamp(-16, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-16, -500, -100)");
      expect(NumberUtils.clamp(-16, -500, -100)).assertEqual(-100);
      // Vector 75: clamp(-8, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(-8, -500, -100)");
      expect(NumberUtils.clamp(-8, -500, -100)).assertEqual(-100);
      // Vector 76: clamp(0, -500, -100) works on an all-negative range.
      logCase(TAG, "clamp(0, -500, -100)");
      expect(NumberUtils.clamp(0, -500, -100)).assertEqual(-100);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_CLAMP_0500
     * @tc.name      testClampSweepFractional0001
     * @tc.desc      Verify clamp sweeps fractional values across both fractional bounds.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testClampSweepFractional0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testClampSweepFractional0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: clamp(-3, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-3, -2.5, 2.5)");
      expect(NumberUtils.clamp(-3, -2.5, 2.5)).assertEqual(-2.5);
      // Vector 2: clamp(-2.95, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-2.95, -2.5, 2.5)");
      expect(NumberUtils.clamp(-2.95, -2.5, 2.5)).assertEqual(-2.5);
      // Vector 3: clamp(-2.9, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-2.9, -2.5, 2.5)");
      expect(NumberUtils.clamp(-2.9, -2.5, 2.5)).assertEqual(-2.5);
      // Vector 4: clamp(-2.85, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-2.85, -2.5, 2.5)");
      expect(NumberUtils.clamp(-2.85, -2.5, 2.5)).assertEqual(-2.5);
      // Vector 5: clamp(-2.8, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-2.8, -2.5, 2.5)");
      expect(NumberUtils.clamp(-2.8, -2.5, 2.5)).assertEqual(-2.5);
      // Vector 6: clamp(-2.75, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-2.75, -2.5, 2.5)");
      expect(NumberUtils.clamp(-2.75, -2.5, 2.5)).assertEqual(-2.5);
      // Vector 7: clamp(-2.7, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-2.7, -2.5, 2.5)");
      expect(NumberUtils.clamp(-2.7, -2.5, 2.5)).assertEqual(-2.5);
      // Vector 8: clamp(-2.65, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-2.65, -2.5, 2.5)");
      expect(NumberUtils.clamp(-2.65, -2.5, 2.5)).assertEqual(-2.5);
      // Vector 9: clamp(-2.6, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-2.6, -2.5, 2.5)");
      expect(NumberUtils.clamp(-2.6, -2.5, 2.5)).assertEqual(-2.5);
      // Vector 10: clamp(-2.55, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-2.55, -2.5, 2.5)");
      expect(NumberUtils.clamp(-2.55, -2.5, 2.5)).assertEqual(-2.5);
      // Vector 11: clamp(-2.5, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-2.5, -2.5, 2.5)");
      expect(NumberUtils.clamp(-2.5, -2.5, 2.5)).assertEqual(-2.5);
      // Vector 12: clamp(-2.45, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-2.45, -2.5, 2.5)");
      expect(NumberUtils.clamp(-2.45, -2.5, 2.5)).assertEqual(-2.45);
      // Vector 13: clamp(-2.4, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-2.4, -2.5, 2.5)");
      expect(NumberUtils.clamp(-2.4, -2.5, 2.5)).assertEqual(-2.4);
      // Vector 14: clamp(-2.35, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-2.35, -2.5, 2.5)");
      expect(NumberUtils.clamp(-2.35, -2.5, 2.5)).assertEqual(-2.35);
      // Vector 15: clamp(-2.3, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-2.3, -2.5, 2.5)");
      expect(NumberUtils.clamp(-2.3, -2.5, 2.5)).assertEqual(-2.3);
      // Vector 16: clamp(-2.25, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-2.25, -2.5, 2.5)");
      expect(NumberUtils.clamp(-2.25, -2.5, 2.5)).assertEqual(-2.25);
      // Vector 17: clamp(-2.2, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-2.2, -2.5, 2.5)");
      expect(NumberUtils.clamp(-2.2, -2.5, 2.5)).assertEqual(-2.2);
      // Vector 18: clamp(-2.15, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-2.15, -2.5, 2.5)");
      expect(NumberUtils.clamp(-2.15, -2.5, 2.5)).assertEqual(-2.15);
      // Vector 19: clamp(-2.1, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-2.1, -2.5, 2.5)");
      expect(NumberUtils.clamp(-2.1, -2.5, 2.5)).assertEqual(-2.1);
      // Vector 20: clamp(-2.05, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-2.05, -2.5, 2.5)");
      expect(NumberUtils.clamp(-2.05, -2.5, 2.5)).assertEqual(-2.05);
      // Vector 21: clamp(-2, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-2, -2.5, 2.5)");
      expect(NumberUtils.clamp(-2, -2.5, 2.5)).assertEqual(-2);
      // Vector 22: clamp(-1.95, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-1.95, -2.5, 2.5)");
      expect(NumberUtils.clamp(-1.95, -2.5, 2.5)).assertEqual(-1.95);
      // Vector 23: clamp(-1.9, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-1.9, -2.5, 2.5)");
      expect(NumberUtils.clamp(-1.9, -2.5, 2.5)).assertEqual(-1.9);
      // Vector 24: clamp(-1.85, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-1.85, -2.5, 2.5)");
      expect(NumberUtils.clamp(-1.85, -2.5, 2.5)).assertEqual(-1.85);
      // Vector 25: clamp(-1.8, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-1.8, -2.5, 2.5)");
      expect(NumberUtils.clamp(-1.8, -2.5, 2.5)).assertEqual(-1.8);
      // Vector 26: clamp(-1.75, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-1.75, -2.5, 2.5)");
      expect(NumberUtils.clamp(-1.75, -2.5, 2.5)).assertEqual(-1.75);
      // Vector 27: clamp(-1.7, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-1.7, -2.5, 2.5)");
      expect(NumberUtils.clamp(-1.7, -2.5, 2.5)).assertEqual(-1.7);
      // Vector 28: clamp(-1.65, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-1.65, -2.5, 2.5)");
      expect(NumberUtils.clamp(-1.65, -2.5, 2.5)).assertEqual(-1.65);
      // Vector 29: clamp(-1.6, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-1.6, -2.5, 2.5)");
      expect(NumberUtils.clamp(-1.6, -2.5, 2.5)).assertEqual(-1.6);
      // Vector 30: clamp(-1.55, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-1.55, -2.5, 2.5)");
      expect(NumberUtils.clamp(-1.55, -2.5, 2.5)).assertEqual(-1.55);
      // Vector 31: clamp(-1.5, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-1.5, -2.5, 2.5)");
      expect(NumberUtils.clamp(-1.5, -2.5, 2.5)).assertEqual(-1.5);
      // Vector 32: clamp(-1.45, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-1.45, -2.5, 2.5)");
      expect(NumberUtils.clamp(-1.45, -2.5, 2.5)).assertEqual(-1.45);
      // Vector 33: clamp(-1.4, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-1.4, -2.5, 2.5)");
      expect(NumberUtils.clamp(-1.4, -2.5, 2.5)).assertEqual(-1.4);
      // Vector 34: clamp(-1.35, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-1.35, -2.5, 2.5)");
      expect(NumberUtils.clamp(-1.35, -2.5, 2.5)).assertEqual(-1.35);
      // Vector 35: clamp(-1.3, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-1.3, -2.5, 2.5)");
      expect(NumberUtils.clamp(-1.3, -2.5, 2.5)).assertEqual(-1.3);
      // Vector 36: clamp(-1.25, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-1.25, -2.5, 2.5)");
      expect(NumberUtils.clamp(-1.25, -2.5, 2.5)).assertEqual(-1.25);
      // Vector 37: clamp(-1.2, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-1.2, -2.5, 2.5)");
      expect(NumberUtils.clamp(-1.2, -2.5, 2.5)).assertEqual(-1.2);
      // Vector 38: clamp(-1.15, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-1.15, -2.5, 2.5)");
      expect(NumberUtils.clamp(-1.15, -2.5, 2.5)).assertEqual(-1.15);
      // Vector 39: clamp(-1.1, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-1.1, -2.5, 2.5)");
      expect(NumberUtils.clamp(-1.1, -2.5, 2.5)).assertEqual(-1.1);
      // Vector 40: clamp(-1.05, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-1.05, -2.5, 2.5)");
      expect(NumberUtils.clamp(-1.05, -2.5, 2.5)).assertEqual(-1.05);
      // Vector 41: clamp(-1, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-1, -2.5, 2.5)");
      expect(NumberUtils.clamp(-1, -2.5, 2.5)).assertEqual(-1);
      // Vector 42: clamp(-0.95, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-0.95, -2.5, 2.5)");
      expect(NumberUtils.clamp(-0.95, -2.5, 2.5)).assertEqual(-0.95);
      // Vector 43: clamp(-0.9, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-0.9, -2.5, 2.5)");
      expect(NumberUtils.clamp(-0.9, -2.5, 2.5)).assertEqual(-0.9);
      // Vector 44: clamp(-0.85, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-0.85, -2.5, 2.5)");
      expect(NumberUtils.clamp(-0.85, -2.5, 2.5)).assertEqual(-0.85);
      // Vector 45: clamp(-0.8, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-0.8, -2.5, 2.5)");
      expect(NumberUtils.clamp(-0.8, -2.5, 2.5)).assertEqual(-0.8);
      // Vector 46: clamp(-0.75, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-0.75, -2.5, 2.5)");
      expect(NumberUtils.clamp(-0.75, -2.5, 2.5)).assertEqual(-0.75);
      // Vector 47: clamp(-0.7, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-0.7, -2.5, 2.5)");
      expect(NumberUtils.clamp(-0.7, -2.5, 2.5)).assertEqual(-0.7);
      // Vector 48: clamp(-0.65, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-0.65, -2.5, 2.5)");
      expect(NumberUtils.clamp(-0.65, -2.5, 2.5)).assertEqual(-0.65);
      // Vector 49: clamp(-0.6, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-0.6, -2.5, 2.5)");
      expect(NumberUtils.clamp(-0.6, -2.5, 2.5)).assertEqual(-0.6);
      // Vector 50: clamp(-0.55, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-0.55, -2.5, 2.5)");
      expect(NumberUtils.clamp(-0.55, -2.5, 2.5)).assertEqual(-0.55);
      // Vector 51: clamp(-0.5, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-0.5, -2.5, 2.5)");
      expect(NumberUtils.clamp(-0.5, -2.5, 2.5)).assertEqual(-0.5);
      // Vector 52: clamp(-0.45, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-0.45, -2.5, 2.5)");
      expect(NumberUtils.clamp(-0.45, -2.5, 2.5)).assertEqual(-0.45);
      // Vector 53: clamp(-0.4, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-0.4, -2.5, 2.5)");
      expect(NumberUtils.clamp(-0.4, -2.5, 2.5)).assertEqual(-0.4);
      // Vector 54: clamp(-0.35, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-0.35, -2.5, 2.5)");
      expect(NumberUtils.clamp(-0.35, -2.5, 2.5)).assertEqual(-0.35);
      // Vector 55: clamp(-0.3, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-0.3, -2.5, 2.5)");
      expect(NumberUtils.clamp(-0.3, -2.5, 2.5)).assertEqual(-0.3);
      // Vector 56: clamp(-0.25, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-0.25, -2.5, 2.5)");
      expect(NumberUtils.clamp(-0.25, -2.5, 2.5)).assertEqual(-0.25);
      // Vector 57: clamp(-0.2, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-0.2, -2.5, 2.5)");
      expect(NumberUtils.clamp(-0.2, -2.5, 2.5)).assertEqual(-0.2);
      // Vector 58: clamp(-0.15, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-0.15, -2.5, 2.5)");
      expect(NumberUtils.clamp(-0.15, -2.5, 2.5)).assertEqual(-0.15);
      // Vector 59: clamp(-0.1, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-0.1, -2.5, 2.5)");
      expect(NumberUtils.clamp(-0.1, -2.5, 2.5)).assertEqual(-0.1);
      // Vector 60: clamp(-0.05, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-0.05, -2.5, 2.5)");
      expect(NumberUtils.clamp(-0.05, -2.5, 2.5)).assertEqual(-0.05);
      // Vector 61: clamp(0, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(0, -2.5, 2.5)");
      expect(NumberUtils.clamp(0, -2.5, 2.5)).assertEqual(0);
      // Vector 62: clamp(0.05, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(0.05, -2.5, 2.5)");
      expect(NumberUtils.clamp(0.05, -2.5, 2.5)).assertEqual(0.05);
      // Vector 63: clamp(0.1, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(0.1, -2.5, 2.5)");
      expect(NumberUtils.clamp(0.1, -2.5, 2.5)).assertEqual(0.1);
      // Vector 64: clamp(0.15, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(0.15, -2.5, 2.5)");
      expect(NumberUtils.clamp(0.15, -2.5, 2.5)).assertEqual(0.15);
      // Vector 65: clamp(0.2, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(0.2, -2.5, 2.5)");
      expect(NumberUtils.clamp(0.2, -2.5, 2.5)).assertEqual(0.2);
      // Vector 66: clamp(0.25, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(0.25, -2.5, 2.5)");
      expect(NumberUtils.clamp(0.25, -2.5, 2.5)).assertEqual(0.25);
      // Vector 67: clamp(0.3, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(0.3, -2.5, 2.5)");
      expect(NumberUtils.clamp(0.3, -2.5, 2.5)).assertEqual(0.3);
      // Vector 68: clamp(0.35, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(0.35, -2.5, 2.5)");
      expect(NumberUtils.clamp(0.35, -2.5, 2.5)).assertEqual(0.35);
      // Vector 69: clamp(0.4, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(0.4, -2.5, 2.5)");
      expect(NumberUtils.clamp(0.4, -2.5, 2.5)).assertEqual(0.4);
      // Vector 70: clamp(0.45, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(0.45, -2.5, 2.5)");
      expect(NumberUtils.clamp(0.45, -2.5, 2.5)).assertEqual(0.45);
      // Vector 71: clamp(0.5, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(0.5, -2.5, 2.5)");
      expect(NumberUtils.clamp(0.5, -2.5, 2.5)).assertEqual(0.5);
      // Vector 72: clamp(0.55, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(0.55, -2.5, 2.5)");
      expect(NumberUtils.clamp(0.55, -2.5, 2.5)).assertEqual(0.55);
      // Vector 73: clamp(0.6, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(0.6, -2.5, 2.5)");
      expect(NumberUtils.clamp(0.6, -2.5, 2.5)).assertEqual(0.6);
      // Vector 74: clamp(0.65, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(0.65, -2.5, 2.5)");
      expect(NumberUtils.clamp(0.65, -2.5, 2.5)).assertEqual(0.65);
      // Vector 75: clamp(0.7, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(0.7, -2.5, 2.5)");
      expect(NumberUtils.clamp(0.7, -2.5, 2.5)).assertEqual(0.7);
      // Vector 76: clamp(0.75, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(0.75, -2.5, 2.5)");
      expect(NumberUtils.clamp(0.75, -2.5, 2.5)).assertEqual(0.75);
      // Vector 77: clamp(0.8, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(0.8, -2.5, 2.5)");
      expect(NumberUtils.clamp(0.8, -2.5, 2.5)).assertEqual(0.8);
      // Vector 78: clamp(0.85, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(0.85, -2.5, 2.5)");
      expect(NumberUtils.clamp(0.85, -2.5, 2.5)).assertEqual(0.85);
      // Vector 79: clamp(0.9, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(0.9, -2.5, 2.5)");
      expect(NumberUtils.clamp(0.9, -2.5, 2.5)).assertEqual(0.9);
      // Vector 80: clamp(0.95, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(0.95, -2.5, 2.5)");
      expect(NumberUtils.clamp(0.95, -2.5, 2.5)).assertEqual(0.95);
      // Vector 81: clamp(1, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(1, -2.5, 2.5)");
      expect(NumberUtils.clamp(1, -2.5, 2.5)).assertEqual(1);
      // Vector 82: clamp(1.05, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(1.05, -2.5, 2.5)");
      expect(NumberUtils.clamp(1.05, -2.5, 2.5)).assertEqual(1.05);
      // Vector 83: clamp(1.1, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(1.1, -2.5, 2.5)");
      expect(NumberUtils.clamp(1.1, -2.5, 2.5)).assertEqual(1.1);
      // Vector 84: clamp(1.15, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(1.15, -2.5, 2.5)");
      expect(NumberUtils.clamp(1.15, -2.5, 2.5)).assertEqual(1.15);
      // Vector 85: clamp(1.2, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(1.2, -2.5, 2.5)");
      expect(NumberUtils.clamp(1.2, -2.5, 2.5)).assertEqual(1.2);
      // Vector 86: clamp(1.25, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(1.25, -2.5, 2.5)");
      expect(NumberUtils.clamp(1.25, -2.5, 2.5)).assertEqual(1.25);
      // Vector 87: clamp(1.3, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(1.3, -2.5, 2.5)");
      expect(NumberUtils.clamp(1.3, -2.5, 2.5)).assertEqual(1.3);
      // Vector 88: clamp(1.35, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(1.35, -2.5, 2.5)");
      expect(NumberUtils.clamp(1.35, -2.5, 2.5)).assertEqual(1.35);
      // Vector 89: clamp(1.4, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(1.4, -2.5, 2.5)");
      expect(NumberUtils.clamp(1.4, -2.5, 2.5)).assertEqual(1.4);
      // Vector 90: clamp(1.45, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(1.45, -2.5, 2.5)");
      expect(NumberUtils.clamp(1.45, -2.5, 2.5)).assertEqual(1.45);
      // Vector 91: clamp(1.5, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(1.5, -2.5, 2.5)");
      expect(NumberUtils.clamp(1.5, -2.5, 2.5)).assertEqual(1.5);
      // Vector 92: clamp(1.55, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(1.55, -2.5, 2.5)");
      expect(NumberUtils.clamp(1.55, -2.5, 2.5)).assertEqual(1.55);
      // Vector 93: clamp(1.6, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(1.6, -2.5, 2.5)");
      expect(NumberUtils.clamp(1.6, -2.5, 2.5)).assertEqual(1.6);
      // Vector 94: clamp(1.65, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(1.65, -2.5, 2.5)");
      expect(NumberUtils.clamp(1.65, -2.5, 2.5)).assertEqual(1.65);
      // Vector 95: clamp(1.7, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(1.7, -2.5, 2.5)");
      expect(NumberUtils.clamp(1.7, -2.5, 2.5)).assertEqual(1.7);
      // Vector 96: clamp(1.75, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(1.75, -2.5, 2.5)");
      expect(NumberUtils.clamp(1.75, -2.5, 2.5)).assertEqual(1.75);
      // Vector 97: clamp(1.8, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(1.8, -2.5, 2.5)");
      expect(NumberUtils.clamp(1.8, -2.5, 2.5)).assertEqual(1.8);
      // Vector 98: clamp(1.85, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(1.85, -2.5, 2.5)");
      expect(NumberUtils.clamp(1.85, -2.5, 2.5)).assertEqual(1.85);
      // Vector 99: clamp(1.9, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(1.9, -2.5, 2.5)");
      expect(NumberUtils.clamp(1.9, -2.5, 2.5)).assertEqual(1.9);
      // Vector 100: clamp(1.95, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(1.95, -2.5, 2.5)");
      expect(NumberUtils.clamp(1.95, -2.5, 2.5)).assertEqual(1.95);
      // Vector 101: clamp(2, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(2, -2.5, 2.5)");
      expect(NumberUtils.clamp(2, -2.5, 2.5)).assertEqual(2);
      // Vector 102: clamp(2.05, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(2.05, -2.5, 2.5)");
      expect(NumberUtils.clamp(2.05, -2.5, 2.5)).assertEqual(2.05);
      // Vector 103: clamp(2.1, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(2.1, -2.5, 2.5)");
      expect(NumberUtils.clamp(2.1, -2.5, 2.5)).assertEqual(2.1);
      // Vector 104: clamp(2.15, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(2.15, -2.5, 2.5)");
      expect(NumberUtils.clamp(2.15, -2.5, 2.5)).assertEqual(2.15);
      // Vector 105: clamp(2.2, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(2.2, -2.5, 2.5)");
      expect(NumberUtils.clamp(2.2, -2.5, 2.5)).assertEqual(2.2);
      // Vector 106: clamp(2.25, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(2.25, -2.5, 2.5)");
      expect(NumberUtils.clamp(2.25, -2.5, 2.5)).assertEqual(2.25);
      // Vector 107: clamp(2.3, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(2.3, -2.5, 2.5)");
      expect(NumberUtils.clamp(2.3, -2.5, 2.5)).assertEqual(2.3);
      // Vector 108: clamp(2.35, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(2.35, -2.5, 2.5)");
      expect(NumberUtils.clamp(2.35, -2.5, 2.5)).assertEqual(2.35);
      // Vector 109: clamp(2.4, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(2.4, -2.5, 2.5)");
      expect(NumberUtils.clamp(2.4, -2.5, 2.5)).assertEqual(2.4);
      // Vector 110: clamp(2.45, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(2.45, -2.5, 2.5)");
      expect(NumberUtils.clamp(2.45, -2.5, 2.5)).assertEqual(2.45);
      // Vector 111: clamp(2.5, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(2.5, -2.5, 2.5)");
      expect(NumberUtils.clamp(2.5, -2.5, 2.5)).assertEqual(2.5);
      // Vector 112: clamp(2.55, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(2.55, -2.5, 2.5)");
      expect(NumberUtils.clamp(2.55, -2.5, 2.5)).assertEqual(2.5);
      // Vector 113: clamp(2.6, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(2.6, -2.5, 2.5)");
      expect(NumberUtils.clamp(2.6, -2.5, 2.5)).assertEqual(2.5);
      // Vector 114: clamp(2.65, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(2.65, -2.5, 2.5)");
      expect(NumberUtils.clamp(2.65, -2.5, 2.5)).assertEqual(2.5);
      // Vector 115: clamp(2.7, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(2.7, -2.5, 2.5)");
      expect(NumberUtils.clamp(2.7, -2.5, 2.5)).assertEqual(2.5);
      // Vector 116: clamp(2.75, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(2.75, -2.5, 2.5)");
      expect(NumberUtils.clamp(2.75, -2.5, 2.5)).assertEqual(2.5);
      // Vector 117: clamp(2.8, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(2.8, -2.5, 2.5)");
      expect(NumberUtils.clamp(2.8, -2.5, 2.5)).assertEqual(2.5);
      // Vector 118: clamp(2.85, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(2.85, -2.5, 2.5)");
      expect(NumberUtils.clamp(2.85, -2.5, 2.5)).assertEqual(2.5);
      // Vector 119: clamp(2.9, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(2.9, -2.5, 2.5)");
      expect(NumberUtils.clamp(2.9, -2.5, 2.5)).assertEqual(2.5);
      // Vector 120: clamp(2.95, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(2.95, -2.5, 2.5)");
      expect(NumberUtils.clamp(2.95, -2.5, 2.5)).assertEqual(2.5);
      // Vector 121: clamp(3, -2.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(3, -2.5, 2.5)");
      expect(NumberUtils.clamp(3, -2.5, 2.5)).assertEqual(2.5);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_CLAMP_0600
     * @tc.name      testClampSweepLarge0001
     * @tc.desc      Verify clamp sweeps large magnitudes around both one-billion bounds.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testClampSweepLarge0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testClampSweepLarge0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: clamp(-2000000000, -1e9, 1e9) keeps large magnitudes bounded.
      logCase(TAG, "clamp(-2000000000, -1000000000, 1000000000)");
      expect(NumberUtils.clamp(-2000000000, -1000000000, 1000000000)).assertEqual(-1000000000);
      // Vector 2: clamp(-1500000000, -1e9, 1e9) keeps large magnitudes bounded.
      logCase(TAG, "clamp(-1500000000, -1000000000, 1000000000)");
      expect(NumberUtils.clamp(-1500000000, -1000000000, 1000000000)).assertEqual(-1000000000);
      // Vector 3: clamp(-1000000001, -1e9, 1e9) keeps large magnitudes bounded.
      logCase(TAG, "clamp(-1000000001, -1000000000, 1000000000)");
      expect(NumberUtils.clamp(-1000000001, -1000000000, 1000000000)).assertEqual(-1000000000);
      // Vector 4: clamp(-1000000000, -1e9, 1e9) keeps large magnitudes bounded.
      logCase(TAG, "clamp(-1000000000, -1000000000, 1000000000)");
      expect(NumberUtils.clamp(-1000000000, -1000000000, 1000000000)).assertEqual(-1000000000);
      // Vector 5: clamp(-999999999, -1e9, 1e9) keeps large magnitudes bounded.
      logCase(TAG, "clamp(-999999999, -1000000000, 1000000000)");
      expect(NumberUtils.clamp(-999999999, -1000000000, 1000000000)).assertEqual(-999999999);
      // Vector 6: clamp(-1, -1e9, 1e9) keeps large magnitudes bounded.
      logCase(TAG, "clamp(-1, -1000000000, 1000000000)");
      expect(NumberUtils.clamp(-1, -1000000000, 1000000000)).assertEqual(-1);
      // Vector 7: clamp(0, -1e9, 1e9) keeps large magnitudes bounded.
      logCase(TAG, "clamp(0, -1000000000, 1000000000)");
      expect(NumberUtils.clamp(0, -1000000000, 1000000000)).assertEqual(0);
      // Vector 8: clamp(1, -1e9, 1e9) keeps large magnitudes bounded.
      logCase(TAG, "clamp(1, -1000000000, 1000000000)");
      expect(NumberUtils.clamp(1, -1000000000, 1000000000)).assertEqual(1);
      // Vector 9: clamp(999999999, -1e9, 1e9) keeps large magnitudes bounded.
      logCase(TAG, "clamp(999999999, -1000000000, 1000000000)");
      expect(NumberUtils.clamp(999999999, -1000000000, 1000000000)).assertEqual(999999999);
      // Vector 10: clamp(1000000000, -1e9, 1e9) keeps large magnitudes bounded.
      logCase(TAG, "clamp(1000000000, -1000000000, 1000000000)");
      expect(NumberUtils.clamp(1000000000, -1000000000, 1000000000)).assertEqual(1000000000);
      // Vector 11: clamp(1000000001, -1e9, 1e9) keeps large magnitudes bounded.
      logCase(TAG, "clamp(1000000001, -1000000000, 1000000000)");
      expect(NumberUtils.clamp(1000000001, -1000000000, 1000000000)).assertEqual(1000000000);
      // Vector 12: clamp(1500000000, -1e9, 1e9) keeps large magnitudes bounded.
      logCase(TAG, "clamp(1500000000, -1000000000, 1000000000)");
      expect(NumberUtils.clamp(1500000000, -1000000000, 1000000000)).assertEqual(1000000000);
      // Vector 13: clamp(2000000000, -1e9, 1e9) keeps large magnitudes bounded.
      logCase(TAG, "clamp(2000000000, -1000000000, 1000000000)");
      expect(NumberUtils.clamp(2000000000, -1000000000, 1000000000)).assertEqual(1000000000);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_CLAMP_0700
     * @tc.name      testClampSweepSinglePoint0001
     * @tc.desc      Verify clamp collapses a representative sweep onto a single-point range.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testClampSweepSinglePoint0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testClampSweepSinglePoint0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: clamp(-1000, 42, 42) collapses to the single-point range.
      logCase(TAG, "clamp(-1000, 42, 42)");
      expect(NumberUtils.clamp(-1000, 42, 42)).assertEqual(42);
      // Vector 2: clamp(-100, 42, 42) collapses to the single-point range.
      logCase(TAG, "clamp(-100, 42, 42)");
      expect(NumberUtils.clamp(-100, 42, 42)).assertEqual(42);
      // Vector 3: clamp(-1, 42, 42) collapses to the single-point range.
      logCase(TAG, "clamp(-1, 42, 42)");
      expect(NumberUtils.clamp(-1, 42, 42)).assertEqual(42);
      // Vector 4: clamp(0, 42, 42) collapses to the single-point range.
      logCase(TAG, "clamp(0, 42, 42)");
      expect(NumberUtils.clamp(0, 42, 42)).assertEqual(42);
      // Vector 5: clamp(1, 42, 42) collapses to the single-point range.
      logCase(TAG, "clamp(1, 42, 42)");
      expect(NumberUtils.clamp(1, 42, 42)).assertEqual(42);
      // Vector 6: clamp(41, 42, 42) collapses to the single-point range.
      logCase(TAG, "clamp(41, 42, 42)");
      expect(NumberUtils.clamp(41, 42, 42)).assertEqual(42);
      // Vector 7: clamp(42, 42, 42) collapses to the single-point range.
      logCase(TAG, "clamp(42, 42, 42)");
      expect(NumberUtils.clamp(42, 42, 42)).assertEqual(42);
      // Vector 8: clamp(43, 42, 42) collapses to the single-point range.
      logCase(TAG, "clamp(43, 42, 42)");
      expect(NumberUtils.clamp(43, 42, 42)).assertEqual(42);
      // Vector 9: clamp(100, 42, 42) collapses to the single-point range.
      logCase(TAG, "clamp(100, 42, 42)");
      expect(NumberUtils.clamp(100, 42, 42)).assertEqual(42);
      // Vector 10: clamp(1000, 42, 42) collapses to the single-point range.
      logCase(TAG, "clamp(1000, 42, 42)");
      expect(NumberUtils.clamp(1000, 42, 42)).assertEqual(42);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_CLAMP_0800
     * @tc.name      testClampSweepDeterministic0001
     * @tc.desc      Verify clamp across a larger deterministic sweep that repeatedly crosses both bounds.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testClampSweepDeterministic0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testClampSweepDeterministic0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: clamp(-147, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(-147, -75, 75)");
      expect(NumberUtils.clamp(-147, -75, 75)).assertEqual(-75);
      // Vector 2: clamp(-94, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(-94, -75, 75)");
      expect(NumberUtils.clamp(-94, -75, 75)).assertEqual(-75);
      // Vector 3: clamp(-41, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(-41, -75, 75)");
      expect(NumberUtils.clamp(-41, -75, 75)).assertEqual(-41);
      // Vector 4: clamp(12, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(12, -75, 75)");
      expect(NumberUtils.clamp(12, -75, 75)).assertEqual(12);
      // Vector 5: clamp(65, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(65, -75, 75)");
      expect(NumberUtils.clamp(65, -75, 75)).assertEqual(65);
      // Vector 6: clamp(118, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(118, -75, 75)");
      expect(NumberUtils.clamp(118, -75, 75)).assertEqual(75);
      // Vector 7: clamp(171, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(171, -75, 75)");
      expect(NumberUtils.clamp(171, -75, 75)).assertEqual(75);
      // Vector 8: clamp(-176, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(-176, -75, 75)");
      expect(NumberUtils.clamp(-176, -75, 75)).assertEqual(-75);
      // Vector 9: clamp(-123, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(-123, -75, 75)");
      expect(NumberUtils.clamp(-123, -75, 75)).assertEqual(-75);
      // Vector 10: clamp(-70, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(-70, -75, 75)");
      expect(NumberUtils.clamp(-70, -75, 75)).assertEqual(-70);
      // Vector 11: clamp(-17, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(-17, -75, 75)");
      expect(NumberUtils.clamp(-17, -75, 75)).assertEqual(-17);
      // Vector 12: clamp(36, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(36, -75, 75)");
      expect(NumberUtils.clamp(36, -75, 75)).assertEqual(36);
      // Vector 13: clamp(89, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(89, -75, 75)");
      expect(NumberUtils.clamp(89, -75, 75)).assertEqual(75);
      // Vector 14: clamp(142, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(142, -75, 75)");
      expect(NumberUtils.clamp(142, -75, 75)).assertEqual(75);
      // Vector 15: clamp(195, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(195, -75, 75)");
      expect(NumberUtils.clamp(195, -75, 75)).assertEqual(75);
      // Vector 16: clamp(-152, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(-152, -75, 75)");
      expect(NumberUtils.clamp(-152, -75, 75)).assertEqual(-75);
      // Vector 17: clamp(-99, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(-99, -75, 75)");
      expect(NumberUtils.clamp(-99, -75, 75)).assertEqual(-75);
      // Vector 18: clamp(-46, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(-46, -75, 75)");
      expect(NumberUtils.clamp(-46, -75, 75)).assertEqual(-46);
      // Vector 19: clamp(7, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(7, -75, 75)");
      expect(NumberUtils.clamp(7, -75, 75)).assertEqual(7);
      // Vector 20: clamp(60, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(60, -75, 75)");
      expect(NumberUtils.clamp(60, -75, 75)).assertEqual(60);
      // Vector 21: clamp(113, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(113, -75, 75)");
      expect(NumberUtils.clamp(113, -75, 75)).assertEqual(75);
      // Vector 22: clamp(166, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(166, -75, 75)");
      expect(NumberUtils.clamp(166, -75, 75)).assertEqual(75);
      // Vector 23: clamp(-181, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(-181, -75, 75)");
      expect(NumberUtils.clamp(-181, -75, 75)).assertEqual(-75);
      // Vector 24: clamp(-128, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(-128, -75, 75)");
      expect(NumberUtils.clamp(-128, -75, 75)).assertEqual(-75);
      // Vector 25: clamp(-75, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(-75, -75, 75)");
      expect(NumberUtils.clamp(-75, -75, 75)).assertEqual(-75);
      // Vector 26: clamp(-22, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(-22, -75, 75)");
      expect(NumberUtils.clamp(-22, -75, 75)).assertEqual(-22);
      // Vector 27: clamp(31, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(31, -75, 75)");
      expect(NumberUtils.clamp(31, -75, 75)).assertEqual(31);
      // Vector 28: clamp(84, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(84, -75, 75)");
      expect(NumberUtils.clamp(84, -75, 75)).assertEqual(75);
      // Vector 29: clamp(137, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(137, -75, 75)");
      expect(NumberUtils.clamp(137, -75, 75)).assertEqual(75);
      // Vector 30: clamp(190, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(190, -75, 75)");
      expect(NumberUtils.clamp(190, -75, 75)).assertEqual(75);
      // Vector 31: clamp(-157, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(-157, -75, 75)");
      expect(NumberUtils.clamp(-157, -75, 75)).assertEqual(-75);
      // Vector 32: clamp(-104, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(-104, -75, 75)");
      expect(NumberUtils.clamp(-104, -75, 75)).assertEqual(-75);
      // Vector 33: clamp(-51, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(-51, -75, 75)");
      expect(NumberUtils.clamp(-51, -75, 75)).assertEqual(-51);
      // Vector 34: clamp(2, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(2, -75, 75)");
      expect(NumberUtils.clamp(2, -75, 75)).assertEqual(2);
      // Vector 35: clamp(55, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(55, -75, 75)");
      expect(NumberUtils.clamp(55, -75, 75)).assertEqual(55);
      // Vector 36: clamp(108, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(108, -75, 75)");
      expect(NumberUtils.clamp(108, -75, 75)).assertEqual(75);
      // Vector 37: clamp(161, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(161, -75, 75)");
      expect(NumberUtils.clamp(161, -75, 75)).assertEqual(75);
      // Vector 38: clamp(-186, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(-186, -75, 75)");
      expect(NumberUtils.clamp(-186, -75, 75)).assertEqual(-75);
      // Vector 39: clamp(-133, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(-133, -75, 75)");
      expect(NumberUtils.clamp(-133, -75, 75)).assertEqual(-75);
      // Vector 40: clamp(-80, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(-80, -75, 75)");
      expect(NumberUtils.clamp(-80, -75, 75)).assertEqual(-75);
      // Vector 41: clamp(-27, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(-27, -75, 75)");
      expect(NumberUtils.clamp(-27, -75, 75)).assertEqual(-27);
      // Vector 42: clamp(26, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(26, -75, 75)");
      expect(NumberUtils.clamp(26, -75, 75)).assertEqual(26);
      // Vector 43: clamp(79, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(79, -75, 75)");
      expect(NumberUtils.clamp(79, -75, 75)).assertEqual(75);
      // Vector 44: clamp(132, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(132, -75, 75)");
      expect(NumberUtils.clamp(132, -75, 75)).assertEqual(75);
      // Vector 45: clamp(185, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(185, -75, 75)");
      expect(NumberUtils.clamp(185, -75, 75)).assertEqual(75);
      // Vector 46: clamp(-162, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(-162, -75, 75)");
      expect(NumberUtils.clamp(-162, -75, 75)).assertEqual(-75);
      // Vector 47: clamp(-109, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(-109, -75, 75)");
      expect(NumberUtils.clamp(-109, -75, 75)).assertEqual(-75);
      // Vector 48: clamp(-56, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(-56, -75, 75)");
      expect(NumberUtils.clamp(-56, -75, 75)).assertEqual(-56);
      // Vector 49: clamp(-3, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(-3, -75, 75)");
      expect(NumberUtils.clamp(-3, -75, 75)).assertEqual(-3);
      // Vector 50: clamp(50, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(50, -75, 75)");
      expect(NumberUtils.clamp(50, -75, 75)).assertEqual(50);
      // Vector 51: clamp(103, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(103, -75, 75)");
      expect(NumberUtils.clamp(103, -75, 75)).assertEqual(75);
      // Vector 52: clamp(156, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(156, -75, 75)");
      expect(NumberUtils.clamp(156, -75, 75)).assertEqual(75);
      // Vector 53: clamp(-191, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(-191, -75, 75)");
      expect(NumberUtils.clamp(-191, -75, 75)).assertEqual(-75);
      // Vector 54: clamp(-138, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(-138, -75, 75)");
      expect(NumberUtils.clamp(-138, -75, 75)).assertEqual(-75);
      // Vector 55: clamp(-85, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(-85, -75, 75)");
      expect(NumberUtils.clamp(-85, -75, 75)).assertEqual(-75);
      // Vector 56: clamp(-32, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(-32, -75, 75)");
      expect(NumberUtils.clamp(-32, -75, 75)).assertEqual(-32);
      // Vector 57: clamp(21, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(21, -75, 75)");
      expect(NumberUtils.clamp(21, -75, 75)).assertEqual(21);
      // Vector 58: clamp(74, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(74, -75, 75)");
      expect(NumberUtils.clamp(74, -75, 75)).assertEqual(74);
      // Vector 59: clamp(127, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(127, -75, 75)");
      expect(NumberUtils.clamp(127, -75, 75)).assertEqual(75);
      // Vector 60: clamp(180, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(180, -75, 75)");
      expect(NumberUtils.clamp(180, -75, 75)).assertEqual(75);
      // Vector 61: clamp(-167, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(-167, -75, 75)");
      expect(NumberUtils.clamp(-167, -75, 75)).assertEqual(-75);
      // Vector 62: clamp(-114, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(-114, -75, 75)");
      expect(NumberUtils.clamp(-114, -75, 75)).assertEqual(-75);
      // Vector 63: clamp(-61, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(-61, -75, 75)");
      expect(NumberUtils.clamp(-61, -75, 75)).assertEqual(-61);
      // Vector 64: clamp(-8, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(-8, -75, 75)");
      expect(NumberUtils.clamp(-8, -75, 75)).assertEqual(-8);
      // Vector 65: clamp(45, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(45, -75, 75)");
      expect(NumberUtils.clamp(45, -75, 75)).assertEqual(45);
      // Vector 66: clamp(98, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(98, -75, 75)");
      expect(NumberUtils.clamp(98, -75, 75)).assertEqual(75);
      // Vector 67: clamp(151, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(151, -75, 75)");
      expect(NumberUtils.clamp(151, -75, 75)).assertEqual(75);
      // Vector 68: clamp(-196, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(-196, -75, 75)");
      expect(NumberUtils.clamp(-196, -75, 75)).assertEqual(-75);
      // Vector 69: clamp(-143, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(-143, -75, 75)");
      expect(NumberUtils.clamp(-143, -75, 75)).assertEqual(-75);
      // Vector 70: clamp(-90, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(-90, -75, 75)");
      expect(NumberUtils.clamp(-90, -75, 75)).assertEqual(-75);
      // Vector 71: clamp(-37, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(-37, -75, 75)");
      expect(NumberUtils.clamp(-37, -75, 75)).assertEqual(-37);
      // Vector 72: clamp(16, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(16, -75, 75)");
      expect(NumberUtils.clamp(16, -75, 75)).assertEqual(16);
      // Vector 73: clamp(69, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(69, -75, 75)");
      expect(NumberUtils.clamp(69, -75, 75)).assertEqual(69);
      // Vector 74: clamp(122, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(122, -75, 75)");
      expect(NumberUtils.clamp(122, -75, 75)).assertEqual(75);
      // Vector 75: clamp(175, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(175, -75, 75)");
      expect(NumberUtils.clamp(175, -75, 75)).assertEqual(75);
      // Vector 76: clamp(-172, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(-172, -75, 75)");
      expect(NumberUtils.clamp(-172, -75, 75)).assertEqual(-75);
      // Vector 77: clamp(-119, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(-119, -75, 75)");
      expect(NumberUtils.clamp(-119, -75, 75)).assertEqual(-75);
      // Vector 78: clamp(-66, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(-66, -75, 75)");
      expect(NumberUtils.clamp(-66, -75, 75)).assertEqual(-66);
      // Vector 79: clamp(-13, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(-13, -75, 75)");
      expect(NumberUtils.clamp(-13, -75, 75)).assertEqual(-13);
      // Vector 80: clamp(40, -75, 75) follows the deterministic sweep.
      logCase(TAG, "clamp(40, -75, 75)");
      expect(NumberUtils.clamp(40, -75, 75)).assertEqual(40);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_CLAMP_0900
     * @tc.name      testClampSweepBoundary0001
     * @tc.desc      Verify clamp treats both endpoints of several ranges as valid in-range values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testClampSweepBoundary0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testClampSweepBoundary0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: clamp(-10, -10, 10) honours the boundary values.
      logCase(TAG, "clamp(-10, -10, 10)");
      expect(NumberUtils.clamp(-10, -10, 10)).assertEqual(-10);
      // Vector 2: clamp(10, -10, 10) honours the boundary values.
      logCase(TAG, "clamp(10, -10, 10)");
      expect(NumberUtils.clamp(10, -10, 10)).assertEqual(10);
      // Vector 3: clamp(0, 0, 0) honours the boundary values.
      logCase(TAG, "clamp(0, 0, 0)");
      expect(NumberUtils.clamp(0, 0, 0)).assertEqual(0);
      // Vector 4: clamp(5, 5, 9) honours the boundary values.
      logCase(TAG, "clamp(5, 5, 9)");
      expect(NumberUtils.clamp(5, 5, 9)).assertEqual(5);
      // Vector 5: clamp(9, 5, 9) honours the boundary values.
      logCase(TAG, "clamp(9, 5, 9)");
      expect(NumberUtils.clamp(9, 5, 9)).assertEqual(9);
      // Vector 6: clamp(-1, -1, 1) honours the boundary values.
      logCase(TAG, "clamp(-1, -1, 1)");
      expect(NumberUtils.clamp(-1, -1, 1)).assertEqual(-1);
      // Vector 7: clamp(1, -1, 1) honours the boundary values.
      logCase(TAG, "clamp(1, -1, 1)");
      expect(NumberUtils.clamp(1, -1, 1)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_CLAMP_1000
     * @tc.name      testClampSweepSymmetry0001
     * @tc.desc      Verify clamp keeps mirror symmetry around zero across a representative value set.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testClampSweepSymmetry0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testClampSweepSymmetry0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: clamp is symmetric around zero for value 0.
      logCase(TAG, "clamp symmetry for 0");
      expect(NumberUtils.clamp(-0, -1000, 1000)).assertEqual(-NumberUtils.clamp(0, -1000, 1000));
      // Vector 2: clamp is symmetric around zero for value 3.
      logCase(TAG, "clamp symmetry for 3");
      expect(NumberUtils.clamp(-3, -1000, 1000)).assertEqual(-NumberUtils.clamp(3, -1000, 1000));
      // Vector 3: clamp is symmetric around zero for value 17.
      logCase(TAG, "clamp symmetry for 17");
      expect(NumberUtils.clamp(-17, -1000, 1000)).assertEqual(-NumberUtils.clamp(17, -1000, 1000));
      // Vector 4: clamp is symmetric around zero for value 49.
      logCase(TAG, "clamp symmetry for 49");
      expect(NumberUtils.clamp(-49, -1000, 1000)).assertEqual(-NumberUtils.clamp(49, -1000, 1000));
      // Vector 5: clamp is symmetric around zero for value 75.
      logCase(TAG, "clamp symmetry for 75");
      expect(NumberUtils.clamp(-75, -1000, 1000)).assertEqual(-NumberUtils.clamp(75, -1000, 1000));
      // Vector 6: clamp is symmetric around zero for value 100.
      logCase(TAG, "clamp symmetry for 100");
      expect(NumberUtils.clamp(-100, -1000, 1000)).assertEqual(-NumberUtils.clamp(100, -1000, 1000));
      // Vector 7: clamp is symmetric around zero for value 250.
      logCase(TAG, "clamp symmetry for 250");
      expect(NumberUtils.clamp(-250, -1000, 1000)).assertEqual(-NumberUtils.clamp(250, -1000, 1000));
      // Vector 8: clamp is symmetric around zero for value 999.
      logCase(TAG, "clamp symmetry for 999");
      expect(NumberUtils.clamp(-999, -1000, 1000)).assertEqual(-NumberUtils.clamp(999, -1000, 1000));
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
