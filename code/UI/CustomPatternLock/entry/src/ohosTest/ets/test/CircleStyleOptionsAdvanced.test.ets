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
const TAG: string = '[Sample_PatternLock_CircleStyleOptionsAdvanced]';


export default function circleStyleOptionsAdvancedTest() {
  describe('circleStyleOptionsAdvancedTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0129
     * @tc.name      testCircleStyleOptions0129
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 128.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0129 begin');
      const index: number = 128;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0129 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0130
     * @tc.name      testCircleStyleOptions0130
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 129.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0130 begin');
      const index: number = 129;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0130 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0131
     * @tc.name      testCircleStyleOptions0131
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 130.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0131 begin');
      const index: number = 130;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0131 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0132
     * @tc.name      testCircleStyleOptions0132
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 131.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0132 begin');
      const index: number = 131;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0132 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0133
     * @tc.name      testCircleStyleOptions0133
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 132.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0133 begin');
      const index: number = 132;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0133 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0134
     * @tc.name      testCircleStyleOptions0134
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 133.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0134 begin');
      const index: number = 133;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0134 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0135
     * @tc.name      testCircleStyleOptions0135
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 134.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0135 begin');
      const index: number = 134;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0135 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0136
     * @tc.name      testCircleStyleOptions0136
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 135.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0136 begin');
      const index: number = 135;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0136 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0137
     * @tc.name      testCircleStyleOptions0137
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 136.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0137 begin');
      const index: number = 136;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0137 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0138
     * @tc.name      testCircleStyleOptions0138
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 137.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0138 begin');
      const index: number = 137;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0138 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0139
     * @tc.name      testCircleStyleOptions0139
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 138.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0139 begin');
      const index: number = 138;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0139 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0140
     * @tc.name      testCircleStyleOptions0140
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 139.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0140 begin');
      const index: number = 139;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0140 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0141
     * @tc.name      testCircleStyleOptions0141
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 140.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0141 begin');
      const index: number = 140;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0141 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0142
     * @tc.name      testCircleStyleOptions0142
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 141.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0142 begin');
      const index: number = 141;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0142 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0143
     * @tc.name      testCircleStyleOptions0143
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 142.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0143 begin');
      const index: number = 142;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0143 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0144
     * @tc.name      testCircleStyleOptions0144
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 143.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0144 begin');
      const index: number = 143;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0144 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0145
     * @tc.name      testCircleStyleOptions0145
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 144.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0145 begin');
      const index: number = 144;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0145 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0146
     * @tc.name      testCircleStyleOptions0146
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 145.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0146 begin');
      const index: number = 145;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0146 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0147
     * @tc.name      testCircleStyleOptions0147
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 146.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0147 begin');
      const index: number = 146;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0147 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0148
     * @tc.name      testCircleStyleOptions0148
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 147.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0148 begin');
      const index: number = 147;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0148 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0149
     * @tc.name      testCircleStyleOptions0149
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 148.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0149 begin');
      const index: number = 148;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0149 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0150
     * @tc.name      testCircleStyleOptions0150
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 149.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0150 begin');
      const index: number = 149;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0150 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0151
     * @tc.name      testCircleStyleOptions0151
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 150.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0151 begin');
      const index: number = 150;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0151 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0152
     * @tc.name      testCircleStyleOptions0152
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 151.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0152 begin');
      const index: number = 151;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0152 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0153
     * @tc.name      testCircleStyleOptions0153
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 152.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0153 begin');
      const index: number = 152;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0153 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0154
     * @tc.name      testCircleStyleOptions0154
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 153.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0154 begin');
      const index: number = 153;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0154 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0155
     * @tc.name      testCircleStyleOptions0155
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 154.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0155 begin');
      const index: number = 154;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0155 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0156
     * @tc.name      testCircleStyleOptions0156
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 155.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0156 begin');
      const index: number = 155;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0156 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0157
     * @tc.name      testCircleStyleOptions0157
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 156.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0157 begin');
      const index: number = 156;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0157 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0158
     * @tc.name      testCircleStyleOptions0158
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 157.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0158 begin');
      const index: number = 157;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0158 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0159
     * @tc.name      testCircleStyleOptions0159
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 158.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0159 begin');
      const index: number = 158;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0159 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0160
     * @tc.name      testCircleStyleOptions0160
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 159.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0160 begin');
      const index: number = 159;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0160 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0161
     * @tc.name      testCircleStyleOptions0161
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 160.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0161 begin');
      const index: number = 160;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0161 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0162
     * @tc.name      testCircleStyleOptions0162
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 161.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0162 begin');
      const index: number = 161;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0162 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0163
     * @tc.name      testCircleStyleOptions0163
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 162.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0163 begin');
      const index: number = 162;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0163 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0164
     * @tc.name      testCircleStyleOptions0164
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 163.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0164 begin');
      const index: number = 163;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0164 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0165
     * @tc.name      testCircleStyleOptions0165
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 164.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0165 begin');
      const index: number = 164;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0165 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0166
     * @tc.name      testCircleStyleOptions0166
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 165.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0166 begin');
      const index: number = 165;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0166 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0167
     * @tc.name      testCircleStyleOptions0167
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 166.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0167 begin');
      const index: number = 166;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0167 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0168
     * @tc.name      testCircleStyleOptions0168
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 167.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0168 begin');
      const index: number = 167;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0168 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0169
     * @tc.name      testCircleStyleOptions0169
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 168.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0169 begin');
      const index: number = 168;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0169 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0170
     * @tc.name      testCircleStyleOptions0170
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 169.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0170 begin');
      const index: number = 169;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0170 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0171
     * @tc.name      testCircleStyleOptions0171
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 170.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0171 begin');
      const index: number = 170;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0171 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0172
     * @tc.name      testCircleStyleOptions0172
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 171.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0172 begin');
      const index: number = 171;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0172 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0173
     * @tc.name      testCircleStyleOptions0173
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 172.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0173 begin');
      const index: number = 172;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0173 end');
    })


  })
}
