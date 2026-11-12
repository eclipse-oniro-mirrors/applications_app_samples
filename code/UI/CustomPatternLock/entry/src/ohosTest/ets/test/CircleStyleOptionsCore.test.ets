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
const TAG: string = '[Sample_PatternLock_CircleStyleOptionsCore]';


export default function circleStyleOptionsCoreTest() {
  describe('circleStyleOptionsCoreTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0001
     * @tc.name      testCircleStyleOptions0001
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 0.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0001 begin');
      const index: number = 0;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0001 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0002
     * @tc.name      testCircleStyleOptions0002
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 1.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0002 begin');
      const index: number = 1;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0002 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0003
     * @tc.name      testCircleStyleOptions0003
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 2.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0003 begin');
      const index: number = 2;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0003 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0004
     * @tc.name      testCircleStyleOptions0004
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 3.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0004 begin');
      const index: number = 3;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0004 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0005
     * @tc.name      testCircleStyleOptions0005
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 4.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0005 begin');
      const index: number = 4;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0005 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0006
     * @tc.name      testCircleStyleOptions0006
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 5.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0006 begin');
      const index: number = 5;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0006 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0007
     * @tc.name      testCircleStyleOptions0007
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 6.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0007 begin');
      const index: number = 6;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0007 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0008
     * @tc.name      testCircleStyleOptions0008
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 7.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0008 begin');
      const index: number = 7;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0008 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0009
     * @tc.name      testCircleStyleOptions0009
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 8.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0009 begin');
      const index: number = 8;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0009 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0010
     * @tc.name      testCircleStyleOptions0010
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 9.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0010 begin');
      const index: number = 9;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0010 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0011
     * @tc.name      testCircleStyleOptions0011
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 10.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0011 begin');
      const index: number = 10;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0011 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0012
     * @tc.name      testCircleStyleOptions0012
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 11.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0012 begin');
      const index: number = 11;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0012 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0013
     * @tc.name      testCircleStyleOptions0013
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 12.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0013 begin');
      const index: number = 12;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0013 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0014
     * @tc.name      testCircleStyleOptions0014
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 13.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0014 begin');
      const index: number = 13;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0014 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0015
     * @tc.name      testCircleStyleOptions0015
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 14.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0015 begin');
      const index: number = 14;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0015 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0016
     * @tc.name      testCircleStyleOptions0016
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 15.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0016 begin');
      const index: number = 15;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0016 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0017
     * @tc.name      testCircleStyleOptions0017
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 16.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0017 begin');
      const index: number = 16;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0017 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0018
     * @tc.name      testCircleStyleOptions0018
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 17.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0018 begin');
      const index: number = 17;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0018 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0019
     * @tc.name      testCircleStyleOptions0019
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 18.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0019 begin');
      const index: number = 18;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0019 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0020
     * @tc.name      testCircleStyleOptions0020
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 19.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0020 begin');
      const index: number = 19;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0020 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0021
     * @tc.name      testCircleStyleOptions0021
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 20.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0021 begin');
      const index: number = 20;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0021 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0022
     * @tc.name      testCircleStyleOptions0022
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 21.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0022 begin');
      const index: number = 21;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0022 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0023
     * @tc.name      testCircleStyleOptions0023
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 22.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0023 begin');
      const index: number = 22;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0023 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0024
     * @tc.name      testCircleStyleOptions0024
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 23.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0024 begin');
      const index: number = 23;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0024 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0025
     * @tc.name      testCircleStyleOptions0025
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 24.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0025 begin');
      const index: number = 24;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0025 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0026
     * @tc.name      testCircleStyleOptions0026
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 25.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0026 begin');
      const index: number = 25;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0026 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0027
     * @tc.name      testCircleStyleOptions0027
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 26.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0027 begin');
      const index: number = 26;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0027 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0028
     * @tc.name      testCircleStyleOptions0028
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 27.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0028 begin');
      const index: number = 27;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0028 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0029
     * @tc.name      testCircleStyleOptions0029
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 28.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0029 begin');
      const index: number = 28;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0029 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0030
     * @tc.name      testCircleStyleOptions0030
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 29.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0030 begin');
      const index: number = 29;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0030 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0031
     * @tc.name      testCircleStyleOptions0031
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 30.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0031 begin');
      const index: number = 30;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0031 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0032
     * @tc.name      testCircleStyleOptions0032
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 31.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0032 begin');
      const index: number = 31;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0032 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0033
     * @tc.name      testCircleStyleOptions0033
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 32.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0033 begin');
      const index: number = 32;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0033 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0034
     * @tc.name      testCircleStyleOptions0034
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 33.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0034 begin');
      const index: number = 33;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0034 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0035
     * @tc.name      testCircleStyleOptions0035
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 34.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0035 begin');
      const index: number = 34;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0035 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0036
     * @tc.name      testCircleStyleOptions0036
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 35.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0036 begin');
      const index: number = 35;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0036 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0037
     * @tc.name      testCircleStyleOptions0037
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 36.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0037 begin');
      const index: number = 36;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0037 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0038
     * @tc.name      testCircleStyleOptions0038
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 37.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0038 begin');
      const index: number = 37;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0038 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0039
     * @tc.name      testCircleStyleOptions0039
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 38.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0039 begin');
      const index: number = 38;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0039 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0040
     * @tc.name      testCircleStyleOptions0040
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 39.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0040 begin');
      const index: number = 39;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0040 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0041
     * @tc.name      testCircleStyleOptions0041
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 40.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0041 begin');
      const index: number = 40;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0041 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0042
     * @tc.name      testCircleStyleOptions0042
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 41.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0042 begin');
      const index: number = 41;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0042 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0043
     * @tc.name      testCircleStyleOptions0043
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 42.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0043 begin');
      const index: number = 42;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0043 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0044
     * @tc.name      testCircleStyleOptions0044
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 43.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0044 begin');
      const index: number = 43;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0044 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0045
     * @tc.name      testCircleStyleOptions0045
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 44.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0045 begin');
      const index: number = 44;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0045 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CIRCLE_OPTIONS_0046
     * @tc.name      testCircleStyleOptions0046
     * @tc.desc      Verify circleStyleOptions behavior for matrix index 45.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCircleStyleOptions0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0046 begin');
      const index: number = 45;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleStyleOptions0046 end');
    })


  })
}
