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
const TAG: string = '[Sample_PatternLock_CircleStyleOptionsTail]';


export default function circleStyleOptionsTailTest() {
  describe('circleStyleOptionsTailTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0193
     * @tc.name      testCircleStyleOptions0193
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 192.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0193 begin');
      const index: number = 192;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0193 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0194
     * @tc.name      testCircleStyleOptions0194
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 193.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0194 begin');
      const index: number = 193;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0194 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0195
     * @tc.name      testCircleStyleOptions0195
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 194.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0195 begin');
      const index: number = 194;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0195 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0196
     * @tc.name      testCircleStyleOptions0196
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 195.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0196 begin');
      const index: number = 195;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0196 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0197
     * @tc.name      testCircleStyleOptions0197
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 196.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0197 begin');
      const index: number = 196;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0197 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0198
     * @tc.name      testCircleStyleOptions0198
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 197.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0198 begin');
      const index: number = 197;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0198 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0199
     * @tc.name      testCircleStyleOptions0199
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 198.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0199 begin');
      const index: number = 198;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0199 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0200
     * @tc.name      testCircleStyleOptions0200
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 199.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0200 begin');
      const index: number = 199;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0200 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0201
     * @tc.name      testCircleStyleOptions0201
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 200.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0201 begin');
      const index: number = 200;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0201 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0202
     * @tc.name      testCircleStyleOptions0202
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 201.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0202 begin');
      const index: number = 201;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0202 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0203
     * @tc.name      testCircleStyleOptions0203
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 202.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0203 begin');
      const index: number = 202;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0203 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0204
     * @tc.name      testCircleStyleOptions0204
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 203.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0204 begin');
      const index: number = 203;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0204 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0205
     * @tc.name      testCircleStyleOptions0205
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 204.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0205 begin');
      const index: number = 204;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0205 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0206
     * @tc.name      testCircleStyleOptions0206
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 205.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0206 begin');
      const index: number = 205;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0206 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0207
     * @tc.name      testCircleStyleOptions0207
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 206.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0207 begin');
      const index: number = 206;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0207 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0208
     * @tc.name      testCircleStyleOptions0208
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 207.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0208 begin');
      const index: number = 207;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0208 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0209
     * @tc.name      testCircleStyleOptions0209
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 208.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0209 begin');
      const index: number = 208;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0209 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0210
     * @tc.name      testCircleStyleOptions0210
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 209.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0210 begin');
      const index: number = 209;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0210 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0211
     * @tc.name      testCircleStyleOptions0211
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 210.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0211 begin');
      const index: number = 210;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0211 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0212
     * @tc.name      testCircleStyleOptions0212
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 211.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0212 begin');
      const index: number = 211;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0212 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0213
     * @tc.name      testCircleStyleOptions0213
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 212.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0213 begin');
      const index: number = 212;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0213 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0214
     * @tc.name      testCircleStyleOptions0214
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 213.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0214 begin');
      const index: number = 213;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0214 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0215
     * @tc.name      testCircleStyleOptions0215
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 214.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0215 begin');
      const index: number = 214;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0215 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0216
     * @tc.name      testCircleStyleOptions0216
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 215.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0216 begin');
      const index: number = 215;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0216 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0217
     * @tc.name      testCircleStyleOptions0217
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 216.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0217 begin');
      const index: number = 216;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0217 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0218
     * @tc.name      testCircleStyleOptions0218
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 217.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0218 begin');
      const index: number = 217;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0218 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0219
     * @tc.name      testCircleStyleOptions0219
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 218.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0219 begin');
      const index: number = 218;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0219 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0220
     * @tc.name      testCircleStyleOptions0220
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 219.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0220 begin');
      const index: number = 219;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0220 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0221
     * @tc.name      testCircleStyleOptions0221
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 220.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0221 begin');
      const index: number = 220;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0221 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0222
     * @tc.name      testCircleStyleOptions0222
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 221.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0222 begin');
      const index: number = 221;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0222 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0223
     * @tc.name      testCircleStyleOptions0223
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 222.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0223 begin');
      const index: number = 222;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0223 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0224
     * @tc.name      testCircleStyleOptions0224
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 223.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0224 begin');
      const index: number = 223;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0224 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0225
     * @tc.name      testCircleStyleOptions0225
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 224.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0225 begin');
      const index: number = 224;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0225 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0226
     * @tc.name      testCircleStyleOptions0226
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 225.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0226 begin');
      const index: number = 225;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0226 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0227
     * @tc.name      testCircleStyleOptions0227
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 226.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0227 begin');
      const index: number = 226;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0227 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0228
     * @tc.name      testCircleStyleOptions0228
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 227.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0228 begin');
      const index: number = 227;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0228 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0229
     * @tc.name      testCircleStyleOptions0229
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 228.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0229 begin');
      const index: number = 228;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0229 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0230
     * @tc.name      testCircleStyleOptions0230
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 229.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0230 begin');
      const index: number = 229;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0230 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0231
     * @tc.name      testCircleStyleOptions0231
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 230.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0231 begin');
      const index: number = 230;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0231 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0232
     * @tc.name      testCircleStyleOptions0232
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 231.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0232 begin');
      const index: number = 231;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0232 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0233
     * @tc.name      testCircleStyleOptions0233
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 232.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0233 begin');
      const index: number = 232;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0233 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0234
     * @tc.name      testCircleStyleOptions0234
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 233.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0234 begin');
      const index: number = 233;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0234 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0235
     * @tc.name      testCircleStyleOptions0235
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 234.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0235 begin');
      const index: number = 234;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0235 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0236
     * @tc.name      testCircleStyleOptions0236
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 235.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0236 begin');
      const index: number = 235;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0236 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0237
     * @tc.name      testCircleStyleOptions0237
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 236.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0237 begin');
      const index: number = 236;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0237 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0238
     * @tc.name      testCircleStyleOptions0238
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 237.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0238 begin');
      const index: number = 237;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0238 end');
    })

  

  })
}
