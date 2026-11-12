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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { paceTurn } from './shared/TestPace';
import {
  CustomCircleStyleOptions,
  CustomPatternLockChallengeResult,
  CustomPatternLockController
} from '../../../main/ets/pages/CustomPatternLock';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PatternLock_CircleStyleOptionsExtended]';


export default function circleStyleOptionsExtendedTest() {
  describe('circleStyleOptionsExtendedTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0065
     * @tc.name      testCircleStyleOptions0065
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 64.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0065 begin');
      const index: number = 64;
      const variant: number = index % 4;
      let expectedColor: number | string | undefined = '#AABBCC';
      if (variant === 1) {
        expectedColor = 0x112233;
      } else if (variant === 2) {
        expectedColor = undefined;
      }
      const expectedRadius: number | undefined = (index % 11 === 10) ? undefined : (index % 10) + 1;
      const expectedWave: boolean = index % 2 === 0;
      const expectedForeground: boolean = (index % 4) < 2;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(
        expectedColor, expectedRadius, expectedWave, expectedForeground);
      if (expectedColor === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(expectedColor);
      }
      if (expectedRadius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(expectedRadius);
      }
      expect(options.enableWaveEffect).assertEqual(expectedWave);
      expect(options.enableForeground).assertEqual(expectedForeground);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#FFFFFF', 5, false, true);
      expect(second.color).assertEqual('#FFFFFF');
      expect(second.radius).assertEqual(5);
      expect(options === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0065 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0066
     * @tc.name      testCircleStyleOptions0066
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 65.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0066 begin');
      const index: number = 65;
      const variant: number = index % 4;
      let expectedColor: number | string | undefined = '#AABBCC';
      if (variant === 1) {
        expectedColor = 0x112233;
      } else if (variant === 2) {
        expectedColor = undefined;
      }
      const expectedRadius: number | undefined = (index % 11 === 10) ? undefined : (index % 10) + 1;
      const expectedWave: boolean = index % 2 === 0;
      const expectedForeground: boolean = (index % 4) < 2;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(
        expectedColor, expectedRadius, expectedWave, expectedForeground);
      if (expectedColor === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(expectedColor);
      }
      if (expectedRadius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(expectedRadius);
      }
      expect(options.enableWaveEffect).assertEqual(expectedWave);
      expect(options.enableForeground).assertEqual(expectedForeground);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#FFFFFF', 5, false, true);
      expect(second.color).assertEqual('#FFFFFF');
      expect(second.radius).assertEqual(5);
      expect(options === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0066 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0067
     * @tc.name      testCircleStyleOptions0067
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 66.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0067 begin');
      const index: number = 66;
      const variant: number = index % 4;
      let expectedColor: number | string | undefined = '#AABBCC';
      if (variant === 1) {
        expectedColor = 0x112233;
      } else if (variant === 2) {
        expectedColor = undefined;
      }
      const expectedRadius: number | undefined = (index % 11 === 10) ? undefined : (index % 10) + 1;
      const expectedWave: boolean = index % 2 === 0;
      const expectedForeground: boolean = (index % 4) < 2;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(
        expectedColor, expectedRadius, expectedWave, expectedForeground);
      if (expectedColor === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(expectedColor);
      }
      if (expectedRadius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(expectedRadius);
      }
      expect(options.enableWaveEffect).assertEqual(expectedWave);
      expect(options.enableForeground).assertEqual(expectedForeground);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#FFFFFF', 5, false, true);
      expect(second.color).assertEqual('#FFFFFF');
      expect(second.radius).assertEqual(5);
      expect(options === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0067 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0068
     * @tc.name      testCircleStyleOptions0068
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 67.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0068 begin');
      const index: number = 67;
      const variant: number = index % 4;
      let expectedColor: number | string | undefined = '#AABBCC';
      if (variant === 1) {
        expectedColor = 0x112233;
      } else if (variant === 2) {
        expectedColor = undefined;
      }
      const expectedRadius: number | undefined = (index % 11 === 10) ? undefined : (index % 10) + 1;
      const expectedWave: boolean = index % 2 === 0;
      const expectedForeground: boolean = (index % 4) < 2;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(
        expectedColor, expectedRadius, expectedWave, expectedForeground);
      if (expectedColor === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(expectedColor);
      }
      if (expectedRadius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(expectedRadius);
      }
      expect(options.enableWaveEffect).assertEqual(expectedWave);
      expect(options.enableForeground).assertEqual(expectedForeground);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#FFFFFF', 5, false, true);
      expect(second.color).assertEqual('#FFFFFF');
      expect(second.radius).assertEqual(5);
      expect(options === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0068 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0069
     * @tc.name      testCircleStyleOptions0069
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 68.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0069 begin');
      const index: number = 68;
      const variant: number = index % 4;
      let expectedColor: number | string | undefined = '#AABBCC';
      if (variant === 1) {
        expectedColor = 0x112233;
      } else if (variant === 2) {
        expectedColor = undefined;
      }
      const expectedRadius: number | undefined = (index % 11 === 10) ? undefined : (index % 10) + 1;
      const expectedWave: boolean = index % 2 === 0;
      const expectedForeground: boolean = (index % 4) < 2;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(
        expectedColor, expectedRadius, expectedWave, expectedForeground);
      if (expectedColor === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(expectedColor);
      }
      if (expectedRadius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(expectedRadius);
      }
      expect(options.enableWaveEffect).assertEqual(expectedWave);
      expect(options.enableForeground).assertEqual(expectedForeground);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#FFFFFF', 5, false, true);
      expect(second.color).assertEqual('#FFFFFF');
      expect(second.radius).assertEqual(5);
      expect(options === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0069 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0070
     * @tc.name      testCircleStyleOptions0070
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 69.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0070 begin');
      const index: number = 69;
      const variant: number = index % 4;
      let expectedColor: number | string | undefined = '#AABBCC';
      if (variant === 1) {
        expectedColor = 0x112233;
      } else if (variant === 2) {
        expectedColor = undefined;
      }
      const expectedRadius: number | undefined = (index % 11 === 10) ? undefined : (index % 10) + 1;
      const expectedWave: boolean = index % 2 === 0;
      const expectedForeground: boolean = (index % 4) < 2;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(
        expectedColor, expectedRadius, expectedWave, expectedForeground);
      if (expectedColor === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(expectedColor);
      }
      if (expectedRadius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(expectedRadius);
      }
      expect(options.enableWaveEffect).assertEqual(expectedWave);
      expect(options.enableForeground).assertEqual(expectedForeground);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#FFFFFF', 5, false, true);
      expect(second.color).assertEqual('#FFFFFF');
      expect(second.radius).assertEqual(5);
      expect(options === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0070 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0071
     * @tc.name      testCircleStyleOptions0071
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 70.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0071 begin');
      const index: number = 70;
      const variant: number = index % 4;
      let expectedColor: number | string | undefined = '#AABBCC';
      if (variant === 1) {
        expectedColor = 0x112233;
      } else if (variant === 2) {
        expectedColor = undefined;
      }
      const expectedRadius: number | undefined = (index % 11 === 10) ? undefined : (index % 10) + 1;
      const expectedWave: boolean = index % 2 === 0;
      const expectedForeground: boolean = (index % 4) < 2;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(
        expectedColor, expectedRadius, expectedWave, expectedForeground);
      if (expectedColor === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(expectedColor);
      }
      if (expectedRadius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(expectedRadius);
      }
      expect(options.enableWaveEffect).assertEqual(expectedWave);
      expect(options.enableForeground).assertEqual(expectedForeground);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#FFFFFF', 5, false, true);
      expect(second.color).assertEqual('#FFFFFF');
      expect(second.radius).assertEqual(5);
      expect(options === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0071 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0072
     * @tc.name      testCircleStyleOptions0072
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 71.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0072 begin');
      const index: number = 71;
      const variant: number = index % 4;
      let expectedColor: number | string | undefined = '#AABBCC';
      if (variant === 1) {
        expectedColor = 0x112233;
      } else if (variant === 2) {
        expectedColor = undefined;
      }
      const expectedRadius: number | undefined = (index % 11 === 10) ? undefined : (index % 10) + 1;
      const expectedWave: boolean = index % 2 === 0;
      const expectedForeground: boolean = (index % 4) < 2;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(
        expectedColor, expectedRadius, expectedWave, expectedForeground);
      if (expectedColor === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(expectedColor);
      }
      if (expectedRadius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(expectedRadius);
      }
      expect(options.enableWaveEffect).assertEqual(expectedWave);
      expect(options.enableForeground).assertEqual(expectedForeground);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#FFFFFF', 5, false, true);
      expect(second.color).assertEqual('#FFFFFF');
      expect(second.radius).assertEqual(5);
      expect(options === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0072 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0073
     * @tc.name      testCircleStyleOptions0073
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 72.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0073 begin');
      const index: number = 72;
      const variant: number = index % 4;
      let expectedColor: number | string | undefined = '#AABBCC';
      if (variant === 1) {
        expectedColor = 0x112233;
      } else if (variant === 2) {
        expectedColor = undefined;
      }
      const expectedRadius: number | undefined = (index % 11 === 10) ? undefined : (index % 10) + 1;
      const expectedWave: boolean = index % 2 === 0;
      const expectedForeground: boolean = (index % 4) < 2;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(
        expectedColor, expectedRadius, expectedWave, expectedForeground);
      if (expectedColor === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(expectedColor);
      }
      if (expectedRadius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(expectedRadius);
      }
      expect(options.enableWaveEffect).assertEqual(expectedWave);
      expect(options.enableForeground).assertEqual(expectedForeground);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#FFFFFF', 5, false, true);
      expect(second.color).assertEqual('#FFFFFF');
      expect(second.radius).assertEqual(5);
      expect(options === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0073 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0074
     * @tc.name      testCircleStyleOptions0074
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 73.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0074 begin');
      const index: number = 73;
      const variant: number = index % 4;
      let expectedColor: number | string | undefined = '#AABBCC';
      if (variant === 1) {
        expectedColor = 0x112233;
      } else if (variant === 2) {
        expectedColor = undefined;
      }
      const expectedRadius: number | undefined = (index % 11 === 10) ? undefined : (index % 10) + 1;
      const expectedWave: boolean = index % 2 === 0;
      const expectedForeground: boolean = (index % 4) < 2;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(
        expectedColor, expectedRadius, expectedWave, expectedForeground);
      if (expectedColor === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(expectedColor);
      }
      if (expectedRadius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(expectedRadius);
      }
      expect(options.enableWaveEffect).assertEqual(expectedWave);
      expect(options.enableForeground).assertEqual(expectedForeground);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#FFFFFF', 5, false, true);
      expect(second.color).assertEqual('#FFFFFF');
      expect(second.radius).assertEqual(5);
      expect(options === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0074 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0075
     * @tc.name      testCircleStyleOptions0075
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 74.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0075 begin');
      const index: number = 74;
      const variant: number = index % 4;
      let expectedColor: number | string | undefined = '#AABBCC';
      if (variant === 1) {
        expectedColor = 0x112233;
      } else if (variant === 2) {
        expectedColor = undefined;
      }
      const expectedRadius: number | undefined = (index % 11 === 10) ? undefined : (index % 10) + 1;
      const expectedWave: boolean = index % 2 === 0;
      const expectedForeground: boolean = (index % 4) < 2;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(
        expectedColor, expectedRadius, expectedWave, expectedForeground);
      if (expectedColor === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(expectedColor);
      }
      if (expectedRadius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(expectedRadius);
      }
      expect(options.enableWaveEffect).assertEqual(expectedWave);
      expect(options.enableForeground).assertEqual(expectedForeground);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#FFFFFF', 5, false, true);
      expect(second.color).assertEqual('#FFFFFF');
      expect(second.radius).assertEqual(5);
      expect(options === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0075 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0076
     * @tc.name      testCircleStyleOptions0076
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 75.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0076 begin');
      const index: number = 75;
      const variant: number = index % 4;
      let expectedColor: number | string | undefined = '#AABBCC';
      if (variant === 1) {
        expectedColor = 0x112233;
      } else if (variant === 2) {
        expectedColor = undefined;
      }
      const expectedRadius: number | undefined = (index % 11 === 10) ? undefined : (index % 10) + 1;
      const expectedWave: boolean = index % 2 === 0;
      const expectedForeground: boolean = (index % 4) < 2;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(
        expectedColor, expectedRadius, expectedWave, expectedForeground);
      if (expectedColor === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(expectedColor);
      }
      if (expectedRadius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(expectedRadius);
      }
      expect(options.enableWaveEffect).assertEqual(expectedWave);
      expect(options.enableForeground).assertEqual(expectedForeground);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#FFFFFF', 5, false, true);
      expect(second.color).assertEqual('#FFFFFF');
      expect(second.radius).assertEqual(5);
      expect(options === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0076 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0077
     * @tc.name      testCircleStyleOptions0077
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 76.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0077 begin');
      const index: number = 76;
      const variant: number = index % 4;
      let expectedColor: number | string | undefined = '#AABBCC';
      if (variant === 1) {
        expectedColor = 0x112233;
      } else if (variant === 2) {
        expectedColor = undefined;
      }
      const expectedRadius: number | undefined = (index % 11 === 10) ? undefined : (index % 10) + 1;
      const expectedWave: boolean = index % 2 === 0;
      const expectedForeground: boolean = (index % 4) < 2;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(
        expectedColor, expectedRadius, expectedWave, expectedForeground);
      if (expectedColor === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(expectedColor);
      }
      if (expectedRadius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(expectedRadius);
      }
      expect(options.enableWaveEffect).assertEqual(expectedWave);
      expect(options.enableForeground).assertEqual(expectedForeground);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#FFFFFF', 5, false, true);
      expect(second.color).assertEqual('#FFFFFF');
      expect(second.radius).assertEqual(5);
      expect(options === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0077 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0078
     * @tc.name      testCircleStyleOptions0078
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 77.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0078 begin');
      const index: number = 77;
      const variant: number = index % 4;
      let expectedColor: number | string | undefined = '#AABBCC';
      if (variant === 1) {
        expectedColor = 0x112233;
      } else if (variant === 2) {
        expectedColor = undefined;
      }
      const expectedRadius: number | undefined = (index % 11 === 10) ? undefined : (index % 10) + 1;
      const expectedWave: boolean = index % 2 === 0;
      const expectedForeground: boolean = (index % 4) < 2;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(
        expectedColor, expectedRadius, expectedWave, expectedForeground);
      if (expectedColor === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(expectedColor);
      }
      if (expectedRadius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(expectedRadius);
      }
      expect(options.enableWaveEffect).assertEqual(expectedWave);
      expect(options.enableForeground).assertEqual(expectedForeground);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#FFFFFF', 5, false, true);
      expect(second.color).assertEqual('#FFFFFF');
      expect(second.radius).assertEqual(5);
      expect(options === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0078 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0079
     * @tc.name      testCircleStyleOptions0079
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 78.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0079 begin');
      const index: number = 78;
      const variant: number = index % 4;
      let expectedColor: number | string | undefined = '#AABBCC';
      if (variant === 1) {
        expectedColor = 0x112233;
      } else if (variant === 2) {
        expectedColor = undefined;
      }
      const expectedRadius: number | undefined = (index % 11 === 10) ? undefined : (index % 10) + 1;
      const expectedWave: boolean = index % 2 === 0;
      const expectedForeground: boolean = (index % 4) < 2;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(
        expectedColor, expectedRadius, expectedWave, expectedForeground);
      if (expectedColor === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(expectedColor);
      }
      if (expectedRadius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(expectedRadius);
      }
      expect(options.enableWaveEffect).assertEqual(expectedWave);
      expect(options.enableForeground).assertEqual(expectedForeground);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#FFFFFF', 5, false, true);
      expect(second.color).assertEqual('#FFFFFF');
      expect(second.radius).assertEqual(5);
      expect(options === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0079 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0080
     * @tc.name      testCircleStyleOptions0080
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 79.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0080 begin');
      const index: number = 79;
      const variant: number = index % 4;
      let expectedColor: number | string | undefined = '#AABBCC';
      if (variant === 1) {
        expectedColor = 0x112233;
      } else if (variant === 2) {
        expectedColor = undefined;
      }
      const expectedRadius: number | undefined = (index % 11 === 10) ? undefined : (index % 10) + 1;
      const expectedWave: boolean = index % 2 === 0;
      const expectedForeground: boolean = (index % 4) < 2;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(
        expectedColor, expectedRadius, expectedWave, expectedForeground);
      if (expectedColor === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(expectedColor);
      }
      if (expectedRadius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(expectedRadius);
      }
      expect(options.enableWaveEffect).assertEqual(expectedWave);
      expect(options.enableForeground).assertEqual(expectedForeground);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#FFFFFF', 5, false, true);
      expect(second.color).assertEqual('#FFFFFF');
      expect(second.radius).assertEqual(5);
      expect(options === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0080 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0081
     * @tc.name      testCircleStyleOptions0081
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 80.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0081 begin');
      const index: number = 80;
      const variant: number = index % 4;
      let expectedColor: number | string | undefined = '#AABBCC';
      if (variant === 1) {
        expectedColor = 0x112233;
      } else if (variant === 2) {
        expectedColor = undefined;
      }
      const expectedRadius: number | undefined = (index % 11 === 10) ? undefined : (index % 10) + 1;
      const expectedWave: boolean = index % 2 === 0;
      const expectedForeground: boolean = (index % 4) < 2;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(
        expectedColor, expectedRadius, expectedWave, expectedForeground);
      if (expectedColor === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(expectedColor);
      }
      if (expectedRadius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(expectedRadius);
      }
      expect(options.enableWaveEffect).assertEqual(expectedWave);
      expect(options.enableForeground).assertEqual(expectedForeground);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#FFFFFF', 5, false, true);
      expect(second.color).assertEqual('#FFFFFF');
      expect(second.radius).assertEqual(5);
      expect(options === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0081 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0082
     * @tc.name      testCircleStyleOptions0082
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 81.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0082 begin');
      const index: number = 81;
      const variant: number = index % 4;
      let expectedColor: number | string | undefined = '#AABBCC';
      if (variant === 1) {
        expectedColor = 0x112233;
      } else if (variant === 2) {
        expectedColor = undefined;
      }
      const expectedRadius: number | undefined = (index % 11 === 10) ? undefined : (index % 10) + 1;
      const expectedWave: boolean = index % 2 === 0;
      const expectedForeground: boolean = (index % 4) < 2;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(
        expectedColor, expectedRadius, expectedWave, expectedForeground);
      if (expectedColor === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(expectedColor);
      }
      if (expectedRadius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(expectedRadius);
      }
      expect(options.enableWaveEffect).assertEqual(expectedWave);
      expect(options.enableForeground).assertEqual(expectedForeground);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#FFFFFF', 5, false, true);
      expect(second.color).assertEqual('#FFFFFF');
      expect(second.radius).assertEqual(5);
      expect(options === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0082 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0083
     * @tc.name      testCircleStyleOptions0083
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 82.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0083 begin');
      const index: number = 82;
      const variant: number = index % 4;
      let expectedColor: number | string | undefined = '#AABBCC';
      if (variant === 1) {
        expectedColor = 0x112233;
      } else if (variant === 2) {
        expectedColor = undefined;
      }
      const expectedRadius: number | undefined = (index % 11 === 10) ? undefined : (index % 10) + 1;
      const expectedWave: boolean = index % 2 === 0;
      const expectedForeground: boolean = (index % 4) < 2;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(
        expectedColor, expectedRadius, expectedWave, expectedForeground);
      if (expectedColor === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(expectedColor);
      }
      if (expectedRadius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(expectedRadius);
      }
      expect(options.enableWaveEffect).assertEqual(expectedWave);
      expect(options.enableForeground).assertEqual(expectedForeground);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#FFFFFF', 5, false, true);
      expect(second.color).assertEqual('#FFFFFF');
      expect(second.radius).assertEqual(5);
      expect(options === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0083 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0084
     * @tc.name      testCircleStyleOptions0084
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 83.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0084 begin');
      const index: number = 83;
      const variant: number = index % 4;
      let expectedColor: number | string | undefined = '#AABBCC';
      if (variant === 1) {
        expectedColor = 0x112233;
      } else if (variant === 2) {
        expectedColor = undefined;
      }
      const expectedRadius: number | undefined = (index % 11 === 10) ? undefined : (index % 10) + 1;
      const expectedWave: boolean = index % 2 === 0;
      const expectedForeground: boolean = (index % 4) < 2;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(
        expectedColor, expectedRadius, expectedWave, expectedForeground);
      if (expectedColor === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(expectedColor);
      }
      if (expectedRadius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(expectedRadius);
      }
      expect(options.enableWaveEffect).assertEqual(expectedWave);
      expect(options.enableForeground).assertEqual(expectedForeground);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#FFFFFF', 5, false, true);
      expect(second.color).assertEqual('#FFFFFF');
      expect(second.radius).assertEqual(5);
      expect(options === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0084 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0085
     * @tc.name      testCircleStyleOptions0085
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 84.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0085 begin');
      const index: number = 84;
      const variant: number = index % 4;
      let expectedColor: number | string | undefined = '#AABBCC';
      if (variant === 1) {
        expectedColor = 0x112233;
      } else if (variant === 2) {
        expectedColor = undefined;
      }
      const expectedRadius: number | undefined = (index % 11 === 10) ? undefined : (index % 10) + 1;
      const expectedWave: boolean = index % 2 === 0;
      const expectedForeground: boolean = (index % 4) < 2;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(
        expectedColor, expectedRadius, expectedWave, expectedForeground);
      if (expectedColor === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(expectedColor);
      }
      if (expectedRadius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(expectedRadius);
      }
      expect(options.enableWaveEffect).assertEqual(expectedWave);
      expect(options.enableForeground).assertEqual(expectedForeground);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#FFFFFF', 5, false, true);
      expect(second.color).assertEqual('#FFFFFF');
      expect(second.radius).assertEqual(5);
      expect(options === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0085 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0086
     * @tc.name      testCircleStyleOptions0086
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 85.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0086 begin');
      const index: number = 85;
      const variant: number = index % 4;
      let expectedColor: number | string | undefined = '#AABBCC';
      if (variant === 1) {
        expectedColor = 0x112233;
      } else if (variant === 2) {
        expectedColor = undefined;
      }
      const expectedRadius: number | undefined = (index % 11 === 10) ? undefined : (index % 10) + 1;
      const expectedWave: boolean = index % 2 === 0;
      const expectedForeground: boolean = (index % 4) < 2;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(
        expectedColor, expectedRadius, expectedWave, expectedForeground);
      if (expectedColor === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(expectedColor);
      }
      if (expectedRadius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(expectedRadius);
      }
      expect(options.enableWaveEffect).assertEqual(expectedWave);
      expect(options.enableForeground).assertEqual(expectedForeground);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#FFFFFF', 5, false, true);
      expect(second.color).assertEqual('#FFFFFF');
      expect(second.radius).assertEqual(5);
      expect(options === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0086 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0087
     * @tc.name      testCircleStyleOptions0087
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 86.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0087 begin');
      const index: number = 86;
      const variant: number = index % 4;
      let expectedColor: number | string | undefined = '#AABBCC';
      if (variant === 1) {
        expectedColor = 0x112233;
      } else if (variant === 2) {
        expectedColor = undefined;
      }
      const expectedRadius: number | undefined = (index % 11 === 10) ? undefined : (index % 10) + 1;
      const expectedWave: boolean = index % 2 === 0;
      const expectedForeground: boolean = (index % 4) < 2;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(
        expectedColor, expectedRadius, expectedWave, expectedForeground);
      if (expectedColor === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(expectedColor);
      }
      if (expectedRadius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(expectedRadius);
      }
      expect(options.enableWaveEffect).assertEqual(expectedWave);
      expect(options.enableForeground).assertEqual(expectedForeground);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#FFFFFF', 5, false, true);
      expect(second.color).assertEqual('#FFFFFF');
      expect(second.radius).assertEqual(5);
      expect(options === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0087 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0088
     * @tc.name      testCircleStyleOptions0088
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 87.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0088 begin');
      const index: number = 87;
      const variant: number = index % 4;
      let expectedColor: number | string | undefined = '#AABBCC';
      if (variant === 1) {
        expectedColor = 0x112233;
      } else if (variant === 2) {
        expectedColor = undefined;
      }
      const expectedRadius: number | undefined = (index % 11 === 10) ? undefined : (index % 10) + 1;
      const expectedWave: boolean = index % 2 === 0;
      const expectedForeground: boolean = (index % 4) < 2;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(
        expectedColor, expectedRadius, expectedWave, expectedForeground);
      if (expectedColor === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(expectedColor);
      }
      if (expectedRadius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(expectedRadius);
      }
      expect(options.enableWaveEffect).assertEqual(expectedWave);
      expect(options.enableForeground).assertEqual(expectedForeground);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#FFFFFF', 5, false, true);
      expect(second.color).assertEqual('#FFFFFF');
      expect(second.radius).assertEqual(5);
      expect(options === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0088 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0089
     * @tc.name      testCircleStyleOptions0089
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 88.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0089 begin');
      const index: number = 88;
      const variant: number = index % 4;
      let expectedColor: number | string | undefined = '#AABBCC';
      if (variant === 1) {
        expectedColor = 0x112233;
      } else if (variant === 2) {
        expectedColor = undefined;
      }
      const expectedRadius: number | undefined = (index % 11 === 10) ? undefined : (index % 10) + 1;
      const expectedWave: boolean = index % 2 === 0;
      const expectedForeground: boolean = (index % 4) < 2;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(
        expectedColor, expectedRadius, expectedWave, expectedForeground);
      if (expectedColor === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(expectedColor);
      }
      if (expectedRadius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(expectedRadius);
      }
      expect(options.enableWaveEffect).assertEqual(expectedWave);
      expect(options.enableForeground).assertEqual(expectedForeground);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#FFFFFF', 5, false, true);
      expect(second.color).assertEqual('#FFFFFF');
      expect(second.radius).assertEqual(5);
      expect(options === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0089 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0090
     * @tc.name      testCircleStyleOptions0090
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 89.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0090 begin');
      const index: number = 89;
      const variant: number = index % 4;
      let expectedColor: number | string | undefined = '#AABBCC';
      if (variant === 1) {
        expectedColor = 0x112233;
      } else if (variant === 2) {
        expectedColor = undefined;
      }
      const expectedRadius: number | undefined = (index % 11 === 10) ? undefined : (index % 10) + 1;
      const expectedWave: boolean = index % 2 === 0;
      const expectedForeground: boolean = (index % 4) < 2;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(
        expectedColor, expectedRadius, expectedWave, expectedForeground);
      if (expectedColor === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(expectedColor);
      }
      if (expectedRadius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(expectedRadius);
      }
      expect(options.enableWaveEffect).assertEqual(expectedWave);
      expect(options.enableForeground).assertEqual(expectedForeground);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#FFFFFF', 5, false, true);
      expect(second.color).assertEqual('#FFFFFF');
      expect(second.radius).assertEqual(5);
      expect(options === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0090 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0091
     * @tc.name      testCircleStyleOptions0091
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 90.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0091 begin');
      const index: number = 90;
      const variant: number = index % 4;
      let expectedColor: number | string | undefined = '#AABBCC';
      if (variant === 1) {
        expectedColor = 0x112233;
      } else if (variant === 2) {
        expectedColor = undefined;
      }
      const expectedRadius: number | undefined = (index % 11 === 10) ? undefined : (index % 10) + 1;
      const expectedWave: boolean = index % 2 === 0;
      const expectedForeground: boolean = (index % 4) < 2;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(
        expectedColor, expectedRadius, expectedWave, expectedForeground);
      if (expectedColor === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(expectedColor);
      }
      if (expectedRadius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(expectedRadius);
      }
      expect(options.enableWaveEffect).assertEqual(expectedWave);
      expect(options.enableForeground).assertEqual(expectedForeground);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#FFFFFF', 5, false, true);
      expect(second.color).assertEqual('#FFFFFF');
      expect(second.radius).assertEqual(5);
      expect(options === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0091 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0092
     * @tc.name      testCircleStyleOptions0092
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 91.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0092 begin');
      const index: number = 91;
      const variant: number = index % 4;
      let expectedColor: number | string | undefined = '#AABBCC';
      if (variant === 1) {
        expectedColor = 0x112233;
      } else if (variant === 2) {
        expectedColor = undefined;
      }
      const expectedRadius: number | undefined = (index % 11 === 10) ? undefined : (index % 10) + 1;
      const expectedWave: boolean = index % 2 === 0;
      const expectedForeground: boolean = (index % 4) < 2;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(
        expectedColor, expectedRadius, expectedWave, expectedForeground);
      if (expectedColor === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(expectedColor);
      }
      if (expectedRadius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(expectedRadius);
      }
      expect(options.enableWaveEffect).assertEqual(expectedWave);
      expect(options.enableForeground).assertEqual(expectedForeground);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#FFFFFF', 5, false, true);
      expect(second.color).assertEqual('#FFFFFF');
      expect(second.radius).assertEqual(5);
      expect(options === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0092 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0093
     * @tc.name      testCircleStyleOptions0093
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 92.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0093 begin');
      const index: number = 92;
      const variant: number = index % 4;
      let expectedColor: number | string | undefined = '#AABBCC';
      if (variant === 1) {
        expectedColor = 0x112233;
      } else if (variant === 2) {
        expectedColor = undefined;
      }
      const expectedRadius: number | undefined = (index % 11 === 10) ? undefined : (index % 10) + 1;
      const expectedWave: boolean = index % 2 === 0;
      const expectedForeground: boolean = (index % 4) < 2;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(
        expectedColor, expectedRadius, expectedWave, expectedForeground);
      if (expectedColor === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(expectedColor);
      }
      if (expectedRadius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(expectedRadius);
      }
      expect(options.enableWaveEffect).assertEqual(expectedWave);
      expect(options.enableForeground).assertEqual(expectedForeground);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#FFFFFF', 5, false, true);
      expect(second.color).assertEqual('#FFFFFF');
      expect(second.radius).assertEqual(5);
      expect(options === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0093 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0094
     * @tc.name      testCircleStyleOptions0094
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 93.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0094 begin');
      const index: number = 93;
      const variant: number = index % 4;
      let expectedColor: number | string | undefined = '#AABBCC';
      if (variant === 1) {
        expectedColor = 0x112233;
      } else if (variant === 2) {
        expectedColor = undefined;
      }
      const expectedRadius: number | undefined = (index % 11 === 10) ? undefined : (index % 10) + 1;
      const expectedWave: boolean = index % 2 === 0;
      const expectedForeground: boolean = (index % 4) < 2;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(
        expectedColor, expectedRadius, expectedWave, expectedForeground);
      if (expectedColor === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(expectedColor);
      }
      if (expectedRadius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(expectedRadius);
      }
      expect(options.enableWaveEffect).assertEqual(expectedWave);
      expect(options.enableForeground).assertEqual(expectedForeground);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#FFFFFF', 5, false, true);
      expect(second.color).assertEqual('#FFFFFF');
      expect(second.radius).assertEqual(5);
      expect(options === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0094 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0095
     * @tc.name      testCircleStyleOptions0095
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 94.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0095 begin');
      const index: number = 94;
      const variant: number = index % 4;
      let expectedColor: number | string | undefined = '#AABBCC';
      if (variant === 1) {
        expectedColor = 0x112233;
      } else if (variant === 2) {
        expectedColor = undefined;
      }
      const expectedRadius: number | undefined = (index % 11 === 10) ? undefined : (index % 10) + 1;
      const expectedWave: boolean = index % 2 === 0;
      const expectedForeground: boolean = (index % 4) < 2;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(
        expectedColor, expectedRadius, expectedWave, expectedForeground);
      if (expectedColor === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(expectedColor);
      }
      if (expectedRadius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(expectedRadius);
      }
      expect(options.enableWaveEffect).assertEqual(expectedWave);
      expect(options.enableForeground).assertEqual(expectedForeground);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#FFFFFF', 5, false, true);
      expect(second.color).assertEqual('#FFFFFF');
      expect(second.radius).assertEqual(5);
      expect(options === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0095 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0096
     * @tc.name      testCircleStyleOptions0096
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 95.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0096 begin');
      const index: number = 95;
      const variant: number = index % 4;
      let expectedColor: number | string | undefined = '#AABBCC';
      if (variant === 1) {
        expectedColor = 0x112233;
      } else if (variant === 2) {
        expectedColor = undefined;
      }
      const expectedRadius: number | undefined = (index % 11 === 10) ? undefined : (index % 10) + 1;
      const expectedWave: boolean = index % 2 === 0;
      const expectedForeground: boolean = (index % 4) < 2;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(
        expectedColor, expectedRadius, expectedWave, expectedForeground);
      if (expectedColor === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(expectedColor);
      }
      if (expectedRadius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(expectedRadius);
      }
      expect(options.enableWaveEffect).assertEqual(expectedWave);
      expect(options.enableForeground).assertEqual(expectedForeground);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#FFFFFF', 5, false, true);
      expect(second.color).assertEqual('#FFFFFF');
      expect(second.radius).assertEqual(5);
      expect(options === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0096 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0097
     * @tc.name      testCircleStyleOptions0097
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 96.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0097 begin');
      const index: number = 96;
      const variant: number = index % 4;
      let expectedColor: number | string | undefined = '#AABBCC';
      if (variant === 1) {
        expectedColor = 0x112233;
      } else if (variant === 2) {
        expectedColor = undefined;
      }
      const expectedRadius: number | undefined = (index % 11 === 10) ? undefined : (index % 10) + 1;
      const expectedWave: boolean = index % 2 === 0;
      const expectedForeground: boolean = (index % 4) < 2;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(
        expectedColor, expectedRadius, expectedWave, expectedForeground);
      if (expectedColor === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(expectedColor);
      }
      if (expectedRadius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(expectedRadius);
      }
      expect(options.enableWaveEffect).assertEqual(expectedWave);
      expect(options.enableForeground).assertEqual(expectedForeground);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#FFFFFF', 5, false, true);
      expect(second.color).assertEqual('#FFFFFF');
      expect(second.radius).assertEqual(5);
      expect(options === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0097 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0098
     * @tc.name      testCircleStyleOptions0098
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 97.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0098 begin');
      const index: number = 97;
      const variant: number = index % 4;
      let expectedColor: number | string | undefined = '#AABBCC';
      if (variant === 1) {
        expectedColor = 0x112233;
      } else if (variant === 2) {
        expectedColor = undefined;
      }
      const expectedRadius: number | undefined = (index % 11 === 10) ? undefined : (index % 10) + 1;
      const expectedWave: boolean = index % 2 === 0;
      const expectedForeground: boolean = (index % 4) < 2;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(
        expectedColor, expectedRadius, expectedWave, expectedForeground);
      if (expectedColor === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(expectedColor);
      }
      if (expectedRadius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(expectedRadius);
      }
      expect(options.enableWaveEffect).assertEqual(expectedWave);
      expect(options.enableForeground).assertEqual(expectedForeground);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#FFFFFF', 5, false, true);
      expect(second.color).assertEqual('#FFFFFF');
      expect(second.radius).assertEqual(5);
      expect(options === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0098 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0099
     * @tc.name      testCircleStyleOptions0099
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 98.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0099 begin');
      const index: number = 98;
      const variant: number = index % 4;
      let expectedColor: number | string | undefined = '#AABBCC';
      if (variant === 1) {
        expectedColor = 0x112233;
      } else if (variant === 2) {
        expectedColor = undefined;
      }
      const expectedRadius: number | undefined = (index % 11 === 10) ? undefined : (index % 10) + 1;
      const expectedWave: boolean = index % 2 === 0;
      const expectedForeground: boolean = (index % 4) < 2;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(
        expectedColor, expectedRadius, expectedWave, expectedForeground);
      if (expectedColor === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(expectedColor);
      }
      if (expectedRadius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(expectedRadius);
      }
      expect(options.enableWaveEffect).assertEqual(expectedWave);
      expect(options.enableForeground).assertEqual(expectedForeground);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#FFFFFF', 5, false, true);
      expect(second.color).assertEqual('#FFFFFF');
      expect(second.radius).assertEqual(5);
      expect(options === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0099 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0100
     * @tc.name      testCircleStyleOptions0100
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 99.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0100 begin');
      const index: number = 99;
      const variant: number = index % 4;
      let expectedColor: number | string | undefined = '#AABBCC';
      if (variant === 1) {
        expectedColor = 0x112233;
      } else if (variant === 2) {
        expectedColor = undefined;
      }
      const expectedRadius: number | undefined = (index % 11 === 10) ? undefined : (index % 10) + 1;
      const expectedWave: boolean = index % 2 === 0;
      const expectedForeground: boolean = (index % 4) < 2;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(
        expectedColor, expectedRadius, expectedWave, expectedForeground);
      if (expectedColor === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(expectedColor);
      }
      if (expectedRadius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(expectedRadius);
      }
      expect(options.enableWaveEffect).assertEqual(expectedWave);
      expect(options.enableForeground).assertEqual(expectedForeground);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#FFFFFF', 5, false, true);
      expect(second.color).assertEqual('#FFFFFF');
      expect(second.radius).assertEqual(5);
      expect(options === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0100 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0101
     * @tc.name      testCircleStyleOptions0101
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 100.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0101 begin');
      const index: number = 100;
      const variant: number = index % 4;
      let expectedColor: number | string | undefined = '#AABBCC';
      if (variant === 1) {
        expectedColor = 0x112233;
      } else if (variant === 2) {
        expectedColor = undefined;
      }
      const expectedRadius: number | undefined = (index % 11 === 10) ? undefined : (index % 10) + 1;
      const expectedWave: boolean = index % 2 === 0;
      const expectedForeground: boolean = (index % 4) < 2;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(
        expectedColor, expectedRadius, expectedWave, expectedForeground);
      if (expectedColor === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(expectedColor);
      }
      if (expectedRadius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(expectedRadius);
      }
      expect(options.enableWaveEffect).assertEqual(expectedWave);
      expect(options.enableForeground).assertEqual(expectedForeground);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#FFFFFF', 5, false, true);
      expect(second.color).assertEqual('#FFFFFF');
      expect(second.radius).assertEqual(5);
      expect(options === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0101 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0102
     * @tc.name      testCircleStyleOptions0102
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 101.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0102 begin');
      const index: number = 101;
      const variant: number = index % 4;
      let expectedColor: number | string | undefined = '#AABBCC';
      if (variant === 1) {
        expectedColor = 0x112233;
      } else if (variant === 2) {
        expectedColor = undefined;
      }
      const expectedRadius: number | undefined = (index % 11 === 10) ? undefined : (index % 10) + 1;
      const expectedWave: boolean = index % 2 === 0;
      const expectedForeground: boolean = (index % 4) < 2;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(
        expectedColor, expectedRadius, expectedWave, expectedForeground);
      if (expectedColor === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(expectedColor);
      }
      if (expectedRadius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(expectedRadius);
      }
      expect(options.enableWaveEffect).assertEqual(expectedWave);
      expect(options.enableForeground).assertEqual(expectedForeground);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#FFFFFF', 5, false, true);
      expect(second.color).assertEqual('#FFFFFF');
      expect(second.radius).assertEqual(5);
      expect(options === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0102 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0103
     * @tc.name      testCircleStyleOptions0103
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 102.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0103 begin');
      const index: number = 102;
      const variant: number = index % 4;
      let expectedColor: number | string | undefined = '#AABBCC';
      if (variant === 1) {
        expectedColor = 0x112233;
      } else if (variant === 2) {
        expectedColor = undefined;
      }
      const expectedRadius: number | undefined = (index % 11 === 10) ? undefined : (index % 10) + 1;
      const expectedWave: boolean = index % 2 === 0;
      const expectedForeground: boolean = (index % 4) < 2;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(
        expectedColor, expectedRadius, expectedWave, expectedForeground);
      if (expectedColor === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(expectedColor);
      }
      if (expectedRadius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(expectedRadius);
      }
      expect(options.enableWaveEffect).assertEqual(expectedWave);
      expect(options.enableForeground).assertEqual(expectedForeground);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#FFFFFF', 5, false, true);
      expect(second.color).assertEqual('#FFFFFF');
      expect(second.radius).assertEqual(5);
      expect(options === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0103 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0104
     * @tc.name      testCircleStyleOptions0104
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 103.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0104 begin');
      const index: number = 103;
      const variant: number = index % 4;
      let expectedColor: number | string | undefined = '#AABBCC';
      if (variant === 1) {
        expectedColor = 0x112233;
      } else if (variant === 2) {
        expectedColor = undefined;
      }
      const expectedRadius: number | undefined = (index % 11 === 10) ? undefined : (index % 10) + 1;
      const expectedWave: boolean = index % 2 === 0;
      const expectedForeground: boolean = (index % 4) < 2;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(
        expectedColor, expectedRadius, expectedWave, expectedForeground);
      if (expectedColor === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(expectedColor);
      }
      if (expectedRadius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(expectedRadius);
      }
      expect(options.enableWaveEffect).assertEqual(expectedWave);
      expect(options.enableForeground).assertEqual(expectedForeground);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#FFFFFF', 5, false, true);
      expect(second.color).assertEqual('#FFFFFF');
      expect(second.radius).assertEqual(5);
      expect(options === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0104 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0105
     * @tc.name      testCircleStyleOptions0105
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 104.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0105 begin');
      const index: number = 104;
      const variant: number = index % 4;
      let expectedColor: number | string | undefined = '#AABBCC';
      if (variant === 1) {
        expectedColor = 0x112233;
      } else if (variant === 2) {
        expectedColor = undefined;
      }
      const expectedRadius: number | undefined = (index % 11 === 10) ? undefined : (index % 10) + 1;
      const expectedWave: boolean = index % 2 === 0;
      const expectedForeground: boolean = (index % 4) < 2;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(
        expectedColor, expectedRadius, expectedWave, expectedForeground);
      if (expectedColor === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(expectedColor);
      }
      if (expectedRadius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(expectedRadius);
      }
      expect(options.enableWaveEffect).assertEqual(expectedWave);
      expect(options.enableForeground).assertEqual(expectedForeground);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#FFFFFF', 5, false, true);
      expect(second.color).assertEqual('#FFFFFF');
      expect(second.radius).assertEqual(5);
      expect(options === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0105 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0106
     * @tc.name      testCircleStyleOptions0106
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 105.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0106 begin');
      const index: number = 105;
      const variant: number = index % 4;
      let expectedColor: number | string | undefined = '#AABBCC';
      if (variant === 1) {
        expectedColor = 0x112233;
      } else if (variant === 2) {
        expectedColor = undefined;
      }
      const expectedRadius: number | undefined = (index % 11 === 10) ? undefined : (index % 10) + 1;
      const expectedWave: boolean = index % 2 === 0;
      const expectedForeground: boolean = (index % 4) < 2;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(
        expectedColor, expectedRadius, expectedWave, expectedForeground);
      if (expectedColor === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(expectedColor);
      }
      if (expectedRadius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(expectedRadius);
      }
      expect(options.enableWaveEffect).assertEqual(expectedWave);
      expect(options.enableForeground).assertEqual(expectedForeground);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#FFFFFF', 5, false, true);
      expect(second.color).assertEqual('#FFFFFF');
      expect(second.radius).assertEqual(5);
      expect(options === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0106 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0107
     * @tc.name      testCircleStyleOptions0107
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 106.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0107 begin');
      const index: number = 106;
      const variant: number = index % 4;
      let expectedColor: number | string | undefined = '#AABBCC';
      if (variant === 1) {
        expectedColor = 0x112233;
      } else if (variant === 2) {
        expectedColor = undefined;
      }
      const expectedRadius: number | undefined = (index % 11 === 10) ? undefined : (index % 10) + 1;
      const expectedWave: boolean = index % 2 === 0;
      const expectedForeground: boolean = (index % 4) < 2;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(
        expectedColor, expectedRadius, expectedWave, expectedForeground);
      if (expectedColor === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(expectedColor);
      }
      if (expectedRadius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(expectedRadius);
      }
      expect(options.enableWaveEffect).assertEqual(expectedWave);
      expect(options.enableForeground).assertEqual(expectedForeground);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#FFFFFF', 5, false, true);
      expect(second.color).assertEqual('#FFFFFF');
      expect(second.radius).assertEqual(5);
      expect(options === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0107 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0108
     * @tc.name      testCircleStyleOptions0108
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 107.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0108 begin');
      const index: number = 107;
      const variant: number = index % 4;
      let expectedColor: number | string | undefined = '#AABBCC';
      if (variant === 1) {
        expectedColor = 0x112233;
      } else if (variant === 2) {
        expectedColor = undefined;
      }
      const expectedRadius: number | undefined = (index % 11 === 10) ? undefined : (index % 10) + 1;
      const expectedWave: boolean = index % 2 === 0;
      const expectedForeground: boolean = (index % 4) < 2;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(
        expectedColor, expectedRadius, expectedWave, expectedForeground);
      if (expectedColor === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(expectedColor);
      }
      if (expectedRadius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(expectedRadius);
      }
      expect(options.enableWaveEffect).assertEqual(expectedWave);
      expect(options.enableForeground).assertEqual(expectedForeground);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#FFFFFF', 5, false, true);
      expect(second.color).assertEqual('#FFFFFF');
      expect(second.radius).assertEqual(5);
      expect(options === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0108 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0109
     * @tc.name      testCircleStyleOptions0109
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 108.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0109 begin');
      const index: number = 108;
      const variant: number = index % 4;
      let expectedColor: number | string | undefined = '#AABBCC';
      if (variant === 1) {
        expectedColor = 0x112233;
      } else if (variant === 2) {
        expectedColor = undefined;
      }
      const expectedRadius: number | undefined = (index % 11 === 10) ? undefined : (index % 10) + 1;
      const expectedWave: boolean = index % 2 === 0;
      const expectedForeground: boolean = (index % 4) < 2;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(
        expectedColor, expectedRadius, expectedWave, expectedForeground);
      if (expectedColor === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(expectedColor);
      }
      if (expectedRadius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(expectedRadius);
      }
      expect(options.enableWaveEffect).assertEqual(expectedWave);
      expect(options.enableForeground).assertEqual(expectedForeground);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#FFFFFF', 5, false, true);
      expect(second.color).assertEqual('#FFFFFF');
      expect(second.radius).assertEqual(5);
      expect(options === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0109 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0110
     * @tc.name      testCircleStyleOptions0110
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 109.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0110 begin');
      const index: number = 109;
      const variant: number = index % 4;
      let expectedColor: number | string | undefined = '#AABBCC';
      if (variant === 1) {
        expectedColor = 0x112233;
      } else if (variant === 2) {
        expectedColor = undefined;
      }
      const expectedRadius: number | undefined = (index % 11 === 10) ? undefined : (index % 10) + 1;
      const expectedWave: boolean = index % 2 === 0;
      const expectedForeground: boolean = (index % 4) < 2;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(
        expectedColor, expectedRadius, expectedWave, expectedForeground);
      if (expectedColor === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(expectedColor);
      }
      if (expectedRadius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(expectedRadius);
      }
      expect(options.enableWaveEffect).assertEqual(expectedWave);
      expect(options.enableForeground).assertEqual(expectedForeground);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#FFFFFF', 5, false, true);
      expect(second.color).assertEqual('#FFFFFF');
      expect(second.radius).assertEqual(5);
      expect(options === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0110 end');
    })


  })
}
