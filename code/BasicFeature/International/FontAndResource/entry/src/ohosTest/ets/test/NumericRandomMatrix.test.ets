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

// Registers every matrix case of the NumericRandomMatrixSuite suite.
export default function numericRandomMatrixTest() {
  // Group the cases under the "NumericRandomMatrixSuite" describe block.
  describe('NumericRandomMatrixSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'NumericRandomMatrixSuite, begin');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_RAND_0100
     * @tc.name      testRandomIntRange0001
     * @tc.desc      Verify randomInt always returns a value inside [0, 0].
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRandomIntRange0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRandomIntRange0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: randomInt(0, 0) stays inside the inclusive range.
      const r1_1: number = NumberUtils.randomInt(0, 0);
      logCase(TAG, 'randomInt(0, 0) = ' + r1_1.toString());
      expect(r1_1 >= 0 && r1_1 <= 0).assertTrue();
      // Vector 2: randomInt(0, 0) stays inside the inclusive range.
      const r1_2: number = NumberUtils.randomInt(0, 0);
      logCase(TAG, 'randomInt(0, 0) = ' + r1_2.toString());
      expect(r1_2 >= 0 && r1_2 <= 0).assertTrue();
      // Vector 3: randomInt(0, 0) stays inside the inclusive range.
      const r1_3: number = NumberUtils.randomInt(0, 0);
      logCase(TAG, 'randomInt(0, 0) = ' + r1_3.toString());
      expect(r1_3 >= 0 && r1_3 <= 0).assertTrue();
      // Vector 4: randomInt(0, 0) stays inside the inclusive range.
      const r1_4: number = NumberUtils.randomInt(0, 0);
      logCase(TAG, 'randomInt(0, 0) = ' + r1_4.toString());
      expect(r1_4 >= 0 && r1_4 <= 0).assertTrue();
      // Vector 5: randomInt(0, 0) stays inside the inclusive range.
      const r1_5: number = NumberUtils.randomInt(0, 0);
      logCase(TAG, 'randomInt(0, 0) = ' + r1_5.toString());
      expect(r1_5 >= 0 && r1_5 <= 0).assertTrue();
      // Vector 6: randomInt(0, 0) stays inside the inclusive range.
      const r1_6: number = NumberUtils.randomInt(0, 0);
      logCase(TAG, 'randomInt(0, 0) = ' + r1_6.toString());
      expect(r1_6 >= 0 && r1_6 <= 0).assertTrue();
      // Vector 7: randomInt(0, 0) stays inside the inclusive range.
      const r1_7: number = NumberUtils.randomInt(0, 0);
      logCase(TAG, 'randomInt(0, 0) = ' + r1_7.toString());
      expect(r1_7 >= 0 && r1_7 <= 0).assertTrue();
      // Vector 8: randomInt(0, 0) stays inside the inclusive range.
      const r1_8: number = NumberUtils.randomInt(0, 0);
      logCase(TAG, 'randomInt(0, 0) = ' + r1_8.toString());
      expect(r1_8 >= 0 && r1_8 <= 0).assertTrue();
      // Vector 9: randomInt(0, 0) stays inside the inclusive range.
      const r1_9: number = NumberUtils.randomInt(0, 0);
      logCase(TAG, 'randomInt(0, 0) = ' + r1_9.toString());
      expect(r1_9 >= 0 && r1_9 <= 0).assertTrue();
      // Vector 10: randomInt(0, 0) stays inside the inclusive range.
      const r1_10: number = NumberUtils.randomInt(0, 0);
      logCase(TAG, 'randomInt(0, 0) = ' + r1_10.toString());
      expect(r1_10 >= 0 && r1_10 <= 0).assertTrue();
      // Vector 11: randomInt(0, 0) stays inside the inclusive range.
      const r1_11: number = NumberUtils.randomInt(0, 0);
      logCase(TAG, 'randomInt(0, 0) = ' + r1_11.toString());
      expect(r1_11 >= 0 && r1_11 <= 0).assertTrue();
      // Vector 12: randomInt(0, 0) stays inside the inclusive range.
      const r1_12: number = NumberUtils.randomInt(0, 0);
      logCase(TAG, 'randomInt(0, 0) = ' + r1_12.toString());
      expect(r1_12 >= 0 && r1_12 <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_RAND_0200
     * @tc.name      testRandomIntRange0002
     * @tc.desc      Verify randomInt always returns a value inside [0, 1].
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRandomIntRange0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRandomIntRange0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: randomInt(0, 1) stays inside the inclusive range.
      const r2_1: number = NumberUtils.randomInt(0, 1);
      logCase(TAG, 'randomInt(0, 1) = ' + r2_1.toString());
      expect(r2_1 >= 0 && r2_1 <= 1).assertTrue();
      // Vector 2: randomInt(0, 1) stays inside the inclusive range.
      const r2_2: number = NumberUtils.randomInt(0, 1);
      logCase(TAG, 'randomInt(0, 1) = ' + r2_2.toString());
      expect(r2_2 >= 0 && r2_2 <= 1).assertTrue();
      // Vector 3: randomInt(0, 1) stays inside the inclusive range.
      const r2_3: number = NumberUtils.randomInt(0, 1);
      logCase(TAG, 'randomInt(0, 1) = ' + r2_3.toString());
      expect(r2_3 >= 0 && r2_3 <= 1).assertTrue();
      // Vector 4: randomInt(0, 1) stays inside the inclusive range.
      const r2_4: number = NumberUtils.randomInt(0, 1);
      logCase(TAG, 'randomInt(0, 1) = ' + r2_4.toString());
      expect(r2_4 >= 0 && r2_4 <= 1).assertTrue();
      // Vector 5: randomInt(0, 1) stays inside the inclusive range.
      const r2_5: number = NumberUtils.randomInt(0, 1);
      logCase(TAG, 'randomInt(0, 1) = ' + r2_5.toString());
      expect(r2_5 >= 0 && r2_5 <= 1).assertTrue();
      // Vector 6: randomInt(0, 1) stays inside the inclusive range.
      const r2_6: number = NumberUtils.randomInt(0, 1);
      logCase(TAG, 'randomInt(0, 1) = ' + r2_6.toString());
      expect(r2_6 >= 0 && r2_6 <= 1).assertTrue();
      // Vector 7: randomInt(0, 1) stays inside the inclusive range.
      const r2_7: number = NumberUtils.randomInt(0, 1);
      logCase(TAG, 'randomInt(0, 1) = ' + r2_7.toString());
      expect(r2_7 >= 0 && r2_7 <= 1).assertTrue();
      // Vector 8: randomInt(0, 1) stays inside the inclusive range.
      const r2_8: number = NumberUtils.randomInt(0, 1);
      logCase(TAG, 'randomInt(0, 1) = ' + r2_8.toString());
      expect(r2_8 >= 0 && r2_8 <= 1).assertTrue();
      // Vector 9: randomInt(0, 1) stays inside the inclusive range.
      const r2_9: number = NumberUtils.randomInt(0, 1);
      logCase(TAG, 'randomInt(0, 1) = ' + r2_9.toString());
      expect(r2_9 >= 0 && r2_9 <= 1).assertTrue();
      // Vector 10: randomInt(0, 1) stays inside the inclusive range.
      const r2_10: number = NumberUtils.randomInt(0, 1);
      logCase(TAG, 'randomInt(0, 1) = ' + r2_10.toString());
      expect(r2_10 >= 0 && r2_10 <= 1).assertTrue();
      // Vector 11: randomInt(0, 1) stays inside the inclusive range.
      const r2_11: number = NumberUtils.randomInt(0, 1);
      logCase(TAG, 'randomInt(0, 1) = ' + r2_11.toString());
      expect(r2_11 >= 0 && r2_11 <= 1).assertTrue();
      // Vector 12: randomInt(0, 1) stays inside the inclusive range.
      const r2_12: number = NumberUtils.randomInt(0, 1);
      logCase(TAG, 'randomInt(0, 1) = ' + r2_12.toString());
      expect(r2_12 >= 0 && r2_12 <= 1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_RAND_0300
     * @tc.name      testRandomIntRange0003
     * @tc.desc      Verify randomInt always returns a value inside [3, 9].
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRandomIntRange0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRandomIntRange0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: randomInt(3, 9) stays inside the inclusive range.
      const r3_1: number = NumberUtils.randomInt(3, 9);
      logCase(TAG, 'randomInt(3, 9) = ' + r3_1.toString());
      expect(r3_1 >= 3 && r3_1 <= 9).assertTrue();
      // Vector 2: randomInt(3, 9) stays inside the inclusive range.
      const r3_2: number = NumberUtils.randomInt(3, 9);
      logCase(TAG, 'randomInt(3, 9) = ' + r3_2.toString());
      expect(r3_2 >= 3 && r3_2 <= 9).assertTrue();
      // Vector 3: randomInt(3, 9) stays inside the inclusive range.
      const r3_3: number = NumberUtils.randomInt(3, 9);
      logCase(TAG, 'randomInt(3, 9) = ' + r3_3.toString());
      expect(r3_3 >= 3 && r3_3 <= 9).assertTrue();
      // Vector 4: randomInt(3, 9) stays inside the inclusive range.
      const r3_4: number = NumberUtils.randomInt(3, 9);
      logCase(TAG, 'randomInt(3, 9) = ' + r3_4.toString());
      expect(r3_4 >= 3 && r3_4 <= 9).assertTrue();
      // Vector 5: randomInt(3, 9) stays inside the inclusive range.
      const r3_5: number = NumberUtils.randomInt(3, 9);
      logCase(TAG, 'randomInt(3, 9) = ' + r3_5.toString());
      expect(r3_5 >= 3 && r3_5 <= 9).assertTrue();
      // Vector 6: randomInt(3, 9) stays inside the inclusive range.
      const r3_6: number = NumberUtils.randomInt(3, 9);
      logCase(TAG, 'randomInt(3, 9) = ' + r3_6.toString());
      expect(r3_6 >= 3 && r3_6 <= 9).assertTrue();
      // Vector 7: randomInt(3, 9) stays inside the inclusive range.
      const r3_7: number = NumberUtils.randomInt(3, 9);
      logCase(TAG, 'randomInt(3, 9) = ' + r3_7.toString());
      expect(r3_7 >= 3 && r3_7 <= 9).assertTrue();
      // Vector 8: randomInt(3, 9) stays inside the inclusive range.
      const r3_8: number = NumberUtils.randomInt(3, 9);
      logCase(TAG, 'randomInt(3, 9) = ' + r3_8.toString());
      expect(r3_8 >= 3 && r3_8 <= 9).assertTrue();
      // Vector 9: randomInt(3, 9) stays inside the inclusive range.
      const r3_9: number = NumberUtils.randomInt(3, 9);
      logCase(TAG, 'randomInt(3, 9) = ' + r3_9.toString());
      expect(r3_9 >= 3 && r3_9 <= 9).assertTrue();
      // Vector 10: randomInt(3, 9) stays inside the inclusive range.
      const r3_10: number = NumberUtils.randomInt(3, 9);
      logCase(TAG, 'randomInt(3, 9) = ' + r3_10.toString());
      expect(r3_10 >= 3 && r3_10 <= 9).assertTrue();
      // Vector 11: randomInt(3, 9) stays inside the inclusive range.
      const r3_11: number = NumberUtils.randomInt(3, 9);
      logCase(TAG, 'randomInt(3, 9) = ' + r3_11.toString());
      expect(r3_11 >= 3 && r3_11 <= 9).assertTrue();
      // Vector 12: randomInt(3, 9) stays inside the inclusive range.
      const r3_12: number = NumberUtils.randomInt(3, 9);
      logCase(TAG, 'randomInt(3, 9) = ' + r3_12.toString());
      expect(r3_12 >= 3 && r3_12 <= 9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_RAND_0400
     * @tc.name      testRandomIntRange0004
     * @tc.desc      Verify randomInt always returns a value inside [10, 20].
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRandomIntRange0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRandomIntRange0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: randomInt(10, 20) stays inside the inclusive range.
      const r4_1: number = NumberUtils.randomInt(10, 20);
      logCase(TAG, 'randomInt(10, 20) = ' + r4_1.toString());
      expect(r4_1 >= 10 && r4_1 <= 20).assertTrue();
      // Vector 2: randomInt(10, 20) stays inside the inclusive range.
      const r4_2: number = NumberUtils.randomInt(10, 20);
      logCase(TAG, 'randomInt(10, 20) = ' + r4_2.toString());
      expect(r4_2 >= 10 && r4_2 <= 20).assertTrue();
      // Vector 3: randomInt(10, 20) stays inside the inclusive range.
      const r4_3: number = NumberUtils.randomInt(10, 20);
      logCase(TAG, 'randomInt(10, 20) = ' + r4_3.toString());
      expect(r4_3 >= 10 && r4_3 <= 20).assertTrue();
      // Vector 4: randomInt(10, 20) stays inside the inclusive range.
      const r4_4: number = NumberUtils.randomInt(10, 20);
      logCase(TAG, 'randomInt(10, 20) = ' + r4_4.toString());
      expect(r4_4 >= 10 && r4_4 <= 20).assertTrue();
      // Vector 5: randomInt(10, 20) stays inside the inclusive range.
      const r4_5: number = NumberUtils.randomInt(10, 20);
      logCase(TAG, 'randomInt(10, 20) = ' + r4_5.toString());
      expect(r4_5 >= 10 && r4_5 <= 20).assertTrue();
      // Vector 6: randomInt(10, 20) stays inside the inclusive range.
      const r4_6: number = NumberUtils.randomInt(10, 20);
      logCase(TAG, 'randomInt(10, 20) = ' + r4_6.toString());
      expect(r4_6 >= 10 && r4_6 <= 20).assertTrue();
      // Vector 7: randomInt(10, 20) stays inside the inclusive range.
      const r4_7: number = NumberUtils.randomInt(10, 20);
      logCase(TAG, 'randomInt(10, 20) = ' + r4_7.toString());
      expect(r4_7 >= 10 && r4_7 <= 20).assertTrue();
      // Vector 8: randomInt(10, 20) stays inside the inclusive range.
      const r4_8: number = NumberUtils.randomInt(10, 20);
      logCase(TAG, 'randomInt(10, 20) = ' + r4_8.toString());
      expect(r4_8 >= 10 && r4_8 <= 20).assertTrue();
      // Vector 9: randomInt(10, 20) stays inside the inclusive range.
      const r4_9: number = NumberUtils.randomInt(10, 20);
      logCase(TAG, 'randomInt(10, 20) = ' + r4_9.toString());
      expect(r4_9 >= 10 && r4_9 <= 20).assertTrue();
      // Vector 10: randomInt(10, 20) stays inside the inclusive range.
      const r4_10: number = NumberUtils.randomInt(10, 20);
      logCase(TAG, 'randomInt(10, 20) = ' + r4_10.toString());
      expect(r4_10 >= 10 && r4_10 <= 20).assertTrue();
      // Vector 11: randomInt(10, 20) stays inside the inclusive range.
      const r4_11: number = NumberUtils.randomInt(10, 20);
      logCase(TAG, 'randomInt(10, 20) = ' + r4_11.toString());
      expect(r4_11 >= 10 && r4_11 <= 20).assertTrue();
      // Vector 12: randomInt(10, 20) stays inside the inclusive range.
      const r4_12: number = NumberUtils.randomInt(10, 20);
      logCase(TAG, 'randomInt(10, 20) = ' + r4_12.toString());
      expect(r4_12 >= 10 && r4_12 <= 20).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_RAND_0500
     * @tc.name      testRandomIntRange0005
     * @tc.desc      Verify randomInt always returns a value inside [-5, 5].
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRandomIntRange0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRandomIntRange0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: randomInt(-5, 5) stays inside the inclusive range.
      const r5_1: number = NumberUtils.randomInt(-5, 5);
      logCase(TAG, 'randomInt(-5, 5) = ' + r5_1.toString());
      expect(r5_1 >= -5 && r5_1 <= 5).assertTrue();
      // Vector 2: randomInt(-5, 5) stays inside the inclusive range.
      const r5_2: number = NumberUtils.randomInt(-5, 5);
      logCase(TAG, 'randomInt(-5, 5) = ' + r5_2.toString());
      expect(r5_2 >= -5 && r5_2 <= 5).assertTrue();
      // Vector 3: randomInt(-5, 5) stays inside the inclusive range.
      const r5_3: number = NumberUtils.randomInt(-5, 5);
      logCase(TAG, 'randomInt(-5, 5) = ' + r5_3.toString());
      expect(r5_3 >= -5 && r5_3 <= 5).assertTrue();
      // Vector 4: randomInt(-5, 5) stays inside the inclusive range.
      const r5_4: number = NumberUtils.randomInt(-5, 5);
      logCase(TAG, 'randomInt(-5, 5) = ' + r5_4.toString());
      expect(r5_4 >= -5 && r5_4 <= 5).assertTrue();
      // Vector 5: randomInt(-5, 5) stays inside the inclusive range.
      const r5_5: number = NumberUtils.randomInt(-5, 5);
      logCase(TAG, 'randomInt(-5, 5) = ' + r5_5.toString());
      expect(r5_5 >= -5 && r5_5 <= 5).assertTrue();
      // Vector 6: randomInt(-5, 5) stays inside the inclusive range.
      const r5_6: number = NumberUtils.randomInt(-5, 5);
      logCase(TAG, 'randomInt(-5, 5) = ' + r5_6.toString());
      expect(r5_6 >= -5 && r5_6 <= 5).assertTrue();
      // Vector 7: randomInt(-5, 5) stays inside the inclusive range.
      const r5_7: number = NumberUtils.randomInt(-5, 5);
      logCase(TAG, 'randomInt(-5, 5) = ' + r5_7.toString());
      expect(r5_7 >= -5 && r5_7 <= 5).assertTrue();
      // Vector 8: randomInt(-5, 5) stays inside the inclusive range.
      const r5_8: number = NumberUtils.randomInt(-5, 5);
      logCase(TAG, 'randomInt(-5, 5) = ' + r5_8.toString());
      expect(r5_8 >= -5 && r5_8 <= 5).assertTrue();
      // Vector 9: randomInt(-5, 5) stays inside the inclusive range.
      const r5_9: number = NumberUtils.randomInt(-5, 5);
      logCase(TAG, 'randomInt(-5, 5) = ' + r5_9.toString());
      expect(r5_9 >= -5 && r5_9 <= 5).assertTrue();
      // Vector 10: randomInt(-5, 5) stays inside the inclusive range.
      const r5_10: number = NumberUtils.randomInt(-5, 5);
      logCase(TAG, 'randomInt(-5, 5) = ' + r5_10.toString());
      expect(r5_10 >= -5 && r5_10 <= 5).assertTrue();
      // Vector 11: randomInt(-5, 5) stays inside the inclusive range.
      const r5_11: number = NumberUtils.randomInt(-5, 5);
      logCase(TAG, 'randomInt(-5, 5) = ' + r5_11.toString());
      expect(r5_11 >= -5 && r5_11 <= 5).assertTrue();
      // Vector 12: randomInt(-5, 5) stays inside the inclusive range.
      const r5_12: number = NumberUtils.randomInt(-5, 5);
      logCase(TAG, 'randomInt(-5, 5) = ' + r5_12.toString());
      expect(r5_12 >= -5 && r5_12 <= 5).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_RAND_0600
     * @tc.name      testRandomIntRange0006
     * @tc.desc      Verify randomInt always returns a value inside [-100, 100].
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRandomIntRange0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRandomIntRange0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: randomInt(-100, 100) stays inside the inclusive range.
      const r6_1: number = NumberUtils.randomInt(-100, 100);
      logCase(TAG, 'randomInt(-100, 100) = ' + r6_1.toString());
      expect(r6_1 >= -100 && r6_1 <= 100).assertTrue();
      // Vector 2: randomInt(-100, 100) stays inside the inclusive range.
      const r6_2: number = NumberUtils.randomInt(-100, 100);
      logCase(TAG, 'randomInt(-100, 100) = ' + r6_2.toString());
      expect(r6_2 >= -100 && r6_2 <= 100).assertTrue();
      // Vector 3: randomInt(-100, 100) stays inside the inclusive range.
      const r6_3: number = NumberUtils.randomInt(-100, 100);
      logCase(TAG, 'randomInt(-100, 100) = ' + r6_3.toString());
      expect(r6_3 >= -100 && r6_3 <= 100).assertTrue();
      // Vector 4: randomInt(-100, 100) stays inside the inclusive range.
      const r6_4: number = NumberUtils.randomInt(-100, 100);
      logCase(TAG, 'randomInt(-100, 100) = ' + r6_4.toString());
      expect(r6_4 >= -100 && r6_4 <= 100).assertTrue();
      // Vector 5: randomInt(-100, 100) stays inside the inclusive range.
      const r6_5: number = NumberUtils.randomInt(-100, 100);
      logCase(TAG, 'randomInt(-100, 100) = ' + r6_5.toString());
      expect(r6_5 >= -100 && r6_5 <= 100).assertTrue();
      // Vector 6: randomInt(-100, 100) stays inside the inclusive range.
      const r6_6: number = NumberUtils.randomInt(-100, 100);
      logCase(TAG, 'randomInt(-100, 100) = ' + r6_6.toString());
      expect(r6_6 >= -100 && r6_6 <= 100).assertTrue();
      // Vector 7: randomInt(-100, 100) stays inside the inclusive range.
      const r6_7: number = NumberUtils.randomInt(-100, 100);
      logCase(TAG, 'randomInt(-100, 100) = ' + r6_7.toString());
      expect(r6_7 >= -100 && r6_7 <= 100).assertTrue();
      // Vector 8: randomInt(-100, 100) stays inside the inclusive range.
      const r6_8: number = NumberUtils.randomInt(-100, 100);
      logCase(TAG, 'randomInt(-100, 100) = ' + r6_8.toString());
      expect(r6_8 >= -100 && r6_8 <= 100).assertTrue();
      // Vector 9: randomInt(-100, 100) stays inside the inclusive range.
      const r6_9: number = NumberUtils.randomInt(-100, 100);
      logCase(TAG, 'randomInt(-100, 100) = ' + r6_9.toString());
      expect(r6_9 >= -100 && r6_9 <= 100).assertTrue();
      // Vector 10: randomInt(-100, 100) stays inside the inclusive range.
      const r6_10: number = NumberUtils.randomInt(-100, 100);
      logCase(TAG, 'randomInt(-100, 100) = ' + r6_10.toString());
      expect(r6_10 >= -100 && r6_10 <= 100).assertTrue();
      // Vector 11: randomInt(-100, 100) stays inside the inclusive range.
      const r6_11: number = NumberUtils.randomInt(-100, 100);
      logCase(TAG, 'randomInt(-100, 100) = ' + r6_11.toString());
      expect(r6_11 >= -100 && r6_11 <= 100).assertTrue();
      // Vector 12: randomInt(-100, 100) stays inside the inclusive range.
      const r6_12: number = NumberUtils.randomInt(-100, 100);
      logCase(TAG, 'randomInt(-100, 100) = ' + r6_12.toString());
      expect(r6_12 >= -100 && r6_12 <= 100).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_RAND_0700
     * @tc.name      testRandomFiniteAccept0001
     * @tc.desc      Verify isFiniteNumber accepts ordinary finite values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRandomFiniteAccept0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRandomFiniteAccept0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: isFiniteNumber(0) accepts finite values.
      logCase(TAG, "isFiniteNumber(0)");
      expect(NumberUtils.isFiniteNumber(0)).assertTrue();
      // Vector 2: isFiniteNumber(1) accepts finite values.
      logCase(TAG, "isFiniteNumber(1)");
      expect(NumberUtils.isFiniteNumber(1)).assertTrue();
      // Vector 3: isFiniteNumber(-1) accepts finite values.
      logCase(TAG, "isFiniteNumber(-1)");
      expect(NumberUtils.isFiniteNumber(-1)).assertTrue();
      // Vector 4: isFiniteNumber(42) accepts finite values.
      logCase(TAG, "isFiniteNumber(42)");
      expect(NumberUtils.isFiniteNumber(42)).assertTrue();
      // Vector 5: isFiniteNumber(-42) accepts finite values.
      logCase(TAG, "isFiniteNumber(-42)");
      expect(NumberUtils.isFiniteNumber(-42)).assertTrue();
      // Vector 6: isFiniteNumber(3.14) accepts finite values.
      logCase(TAG, "isFiniteNumber(3.14)");
      expect(NumberUtils.isFiniteNumber(3.14)).assertTrue();
      // Vector 7: isFiniteNumber(-3.14) accepts finite values.
      logCase(TAG, "isFiniteNumber(-3.14)");
      expect(NumberUtils.isFiniteNumber(-3.14)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_RAND_0800
     * @tc.name      testRandomFiniteReject0001
     * @tc.desc      Verify isFiniteNumber rejects NaN and both infinities.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRandomFiniteReject0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRandomFiniteReject0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: isFiniteNumber(NaN) rejects non-finite values.
      logCase(TAG, "isFiniteNumber(NaN)");
      expect(NumberUtils.isFiniteNumber(NaN)).assertFalse();
      // Vector 2: isFiniteNumber(Infinity) rejects non-finite values.
      logCase(TAG, "isFiniteNumber(Infinity)");
      expect(NumberUtils.isFiniteNumber(Infinity)).assertFalse();
      // Vector 3: isFiniteNumber(-Infinity) rejects non-finite values.
      logCase(TAG, "isFiniteNumber(-Infinity)");
      expect(NumberUtils.isFiniteNumber(-Infinity)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
