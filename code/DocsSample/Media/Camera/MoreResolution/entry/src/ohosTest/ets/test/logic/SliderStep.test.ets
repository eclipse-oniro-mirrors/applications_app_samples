/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { logInfo, BUNDLE } from '../common/ResolutionTestSupport';
import {
  sliderStep,
} from '../model/ResolutionLogic';

/** SliderStepTest logic checks (46 cases). */
export default function sliderStepTest(): void {
  describe('SliderStepTest', (): void => {
    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_STEP_0001
     * @tc.name      Resolution_SliderStep_0001
     * @tc.desc      sliderStep(-0.5) returns 0.01.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_SliderStep_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderStep_0001 begin`);
      logInfo("sliderStep(-0.5)");
      const actual: number = sliderStep(-0.5);
      logInfo('actual=' + String(actual) + ', expected=' + "0.01");
      expect(actual).assertEqual(0.01);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SliderStep_0001 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_STEP_0002
     * @tc.name      Resolution_SliderStep_0002
     * @tc.desc      sliderStep(-0.13) returns 0.01.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SliderStep_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderStep_0002 begin`);
      logInfo("sliderStep(-0.13)");
      const actual: number = sliderStep(-0.13);
      logInfo('actual=' + String(actual) + ', expected=' + "0.01");
      expect(actual).assertEqual(0.01);
      logInfo(`${BUNDLE}SliderStep_0002 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_STEP_0003
     * @tc.name      Resolution_SliderStep_0003
     * @tc.desc      sliderStep(0.24) returns 0.01.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SliderStep_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderStep_0003 begin`);
      logInfo("sliderStep(0.24)");
      const actual: number = sliderStep(0.24);
      logInfo('actual=' + String(actual) + ', expected=' + "0.01");
      expect(actual).assertEqual(0.01);
      logInfo(`${BUNDLE}SliderStep_0003 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_STEP_0004
     * @tc.name      Resolution_SliderStep_0004
     * @tc.desc      sliderStep(0.61) returns 0.01.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SliderStep_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderStep_0004 begin`);
      logInfo("sliderStep(0.61)");
      const actual: number = sliderStep(0.61);
      logInfo('actual=' + String(actual) + ', expected=' + "0.01");
      expect(actual).assertEqual(0.01);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SliderStep_0004 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_STEP_0005
     * @tc.name      Resolution_SliderStep_0005
     * @tc.desc      sliderStep(0.98) returns 0.01.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SliderStep_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderStep_0005 begin`);
      logInfo("sliderStep(0.98)");
      const actual: number = sliderStep(0.98);
      logInfo('actual=' + String(actual) + ', expected=' + "0.01");
      expect(actual).assertEqual(0.01);
      logInfo(`${BUNDLE}SliderStep_0005 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_STEP_0006
     * @tc.name      Resolution_SliderStep_0006
     * @tc.desc      sliderStep(1.35) returns 0.01.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SliderStep_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderStep_0006 begin`);
      logInfo("sliderStep(1.35)");
      const actual: number = sliderStep(1.35);
      logInfo('actual=' + String(actual) + ', expected=' + "0.01");
      expect(actual).assertEqual(0.01);
      logInfo(`${BUNDLE}SliderStep_0006 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_STEP_0007
     * @tc.name      Resolution_SliderStep_0007
     * @tc.desc      sliderStep(1.72) returns 0.01.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SliderStep_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderStep_0007 begin`);
      logInfo("sliderStep(1.72)");
      const actual: number = sliderStep(1.72);
      logInfo('actual=' + String(actual) + ', expected=' + "0.01");
      expect(actual).assertEqual(0.01);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SliderStep_0007 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_STEP_0008
     * @tc.name      Resolution_SliderStep_0008
     * @tc.desc      sliderStep(2.09) returns 0.01.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SliderStep_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderStep_0008 begin`);
      logInfo("sliderStep(2.09)");
      const actual: number = sliderStep(2.09);
      logInfo('actual=' + String(actual) + ', expected=' + "0.01");
      expect(actual).assertEqual(0.01);
      logInfo(`${BUNDLE}SliderStep_0008 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_STEP_0009
     * @tc.name      Resolution_SliderStep_0009
     * @tc.desc      sliderStep(2.46) returns 0.01.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SliderStep_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderStep_0009 begin`);
      logInfo("sliderStep(2.46)");
      const actual: number = sliderStep(2.46);
      logInfo('actual=' + String(actual) + ', expected=' + "0.01");
      expect(actual).assertEqual(0.01);
      logInfo(`${BUNDLE}SliderStep_0009 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_STEP_0010
     * @tc.name      Resolution_SliderStep_0010
     * @tc.desc      sliderStep(2.83) returns 0.01.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SliderStep_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderStep_0010 begin`);
      logInfo("sliderStep(2.83)");
      const actual: number = sliderStep(2.83);
      logInfo('actual=' + String(actual) + ', expected=' + "0.01");
      expect(actual).assertEqual(0.01);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SliderStep_0010 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_STEP_0011
     * @tc.name      Resolution_SliderStep_0011
     * @tc.desc      sliderStep(3.2) returns 0.01.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SliderStep_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderStep_0011 begin`);
      logInfo("sliderStep(3.2)");
      const actual: number = sliderStep(3.2);
      logInfo('actual=' + String(actual) + ', expected=' + "0.01");
      expect(actual).assertEqual(0.01);
      logInfo(`${BUNDLE}SliderStep_0011 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_STEP_0012
     * @tc.name      Resolution_SliderStep_0012
     * @tc.desc      sliderStep(3.57) returns 0.01.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_SliderStep_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderStep_0012 begin`);
      logInfo("sliderStep(3.57)");
      const actual: number = sliderStep(3.57);
      logInfo('actual=' + String(actual) + ', expected=' + "0.01");
      expect(actual).assertEqual(0.01);
      logInfo(`${BUNDLE}SliderStep_0012 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_STEP_0013
     * @tc.name      Resolution_SliderStep_0013
     * @tc.desc      sliderStep(3.94) returns 0.01.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SliderStep_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderStep_0013 begin`);
      logInfo("sliderStep(3.94)");
      const actual: number = sliderStep(3.94);
      logInfo('actual=' + String(actual) + ', expected=' + "0.01");
      expect(actual).assertEqual(0.01);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SliderStep_0013 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_STEP_0014
     * @tc.name      Resolution_SliderStep_0014
     * @tc.desc      sliderStep(4.31) returns 0.01.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SliderStep_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderStep_0014 begin`);
      logInfo("sliderStep(4.31)");
      const actual: number = sliderStep(4.31);
      logInfo('actual=' + String(actual) + ', expected=' + "0.01");
      expect(actual).assertEqual(0.01);
      logInfo(`${BUNDLE}SliderStep_0014 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_STEP_0015
     * @tc.name      Resolution_SliderStep_0015
     * @tc.desc      sliderStep(4.68) returns 0.01.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SliderStep_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderStep_0015 begin`);
      logInfo("sliderStep(4.68)");
      const actual: number = sliderStep(4.68);
      logInfo('actual=' + String(actual) + ', expected=' + "0.01");
      expect(actual).assertEqual(0.01);
      logInfo(`${BUNDLE}SliderStep_0015 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_STEP_0016
     * @tc.name      Resolution_SliderStep_0016
     * @tc.desc      sliderStep(5.05) returns 0.01.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SliderStep_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderStep_0016 begin`);
      logInfo("sliderStep(5.05)");
      const actual: number = sliderStep(5.05);
      logInfo('actual=' + String(actual) + ', expected=' + "0.01");
      expect(actual).assertEqual(0.01);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SliderStep_0016 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_STEP_0017
     * @tc.name      Resolution_SliderStep_0017
     * @tc.desc      sliderStep(5.42) returns 0.01.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SliderStep_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderStep_0017 begin`);
      logInfo("sliderStep(5.42)");
      const actual: number = sliderStep(5.42);
      logInfo('actual=' + String(actual) + ', expected=' + "0.01");
      expect(actual).assertEqual(0.01);
      logInfo(`${BUNDLE}SliderStep_0017 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_STEP_0018
     * @tc.name      Resolution_SliderStep_0018
     * @tc.desc      sliderStep(5.79) returns 0.01.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_SliderStep_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SliderStep_0018 begin`);
      logInfo("sliderStep(5.79)");
      const actual: number = sliderStep(5.79);
      logInfo('actual=' + String(actual) + ', expected=' + "0.01");
      expect(actual).assertEqual(0.01);
      logInfo(`${BUNDLE}SliderStep_0018 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_STEP_0019
     * @tc.name      Resolution_SliderStep_0019
     * @tc.desc      sliderStep(6.16) returns 0.1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SliderStep_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderStep_0019 begin`);
      logInfo("sliderStep(6.16)");
      const actual: number = sliderStep(6.16);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1");
      expect(actual).assertEqual(0.1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SliderStep_0019 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_STEP_0020
     * @tc.name      Resolution_SliderStep_0020
     * @tc.desc      sliderStep(6.53) returns 0.1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SliderStep_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderStep_0020 begin`);
      logInfo("sliderStep(6.53)");
      const actual: number = sliderStep(6.53);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1");
      expect(actual).assertEqual(0.1);
      logInfo(`${BUNDLE}SliderStep_0020 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_STEP_0021
     * @tc.name      Resolution_SliderStep_0021
     * @tc.desc      sliderStep(6.9) returns 0.1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SliderStep_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderStep_0021 begin`);
      logInfo("sliderStep(6.9)");
      const actual: number = sliderStep(6.9);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1");
      expect(actual).assertEqual(0.1);
      logInfo(`${BUNDLE}SliderStep_0021 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_STEP_0022
     * @tc.name      Resolution_SliderStep_0022
     * @tc.desc      sliderStep(7.27) returns 0.1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SliderStep_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderStep_0022 begin`);
      logInfo("sliderStep(7.27)");
      const actual: number = sliderStep(7.27);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1");
      expect(actual).assertEqual(0.1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SliderStep_0022 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_STEP_0023
     * @tc.name      Resolution_SliderStep_0023
     * @tc.desc      sliderStep(7.64) returns 0.1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_SliderStep_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderStep_0023 begin`);
      logInfo("sliderStep(7.64)");
      const actual: number = sliderStep(7.64);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1");
      expect(actual).assertEqual(0.1);
      logInfo(`${BUNDLE}SliderStep_0023 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_STEP_0024
     * @tc.name      Resolution_SliderStep_0024
     * @tc.desc      sliderStep(8.01) returns 0.1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SliderStep_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderStep_0024 begin`);
      logInfo("sliderStep(8.01)");
      const actual: number = sliderStep(8.01);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1");
      expect(actual).assertEqual(0.1);
      logInfo(`${BUNDLE}SliderStep_0024 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_STEP_0025
     * @tc.name      Resolution_SliderStep_0025
     * @tc.desc      sliderStep(8.38) returns 0.1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SliderStep_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderStep_0025 begin`);
      logInfo("sliderStep(8.38)");
      const actual: number = sliderStep(8.38);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1");
      expect(actual).assertEqual(0.1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SliderStep_0025 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_STEP_0026
     * @tc.name      Resolution_SliderStep_0026
     * @tc.desc      sliderStep(8.75) returns 0.1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SliderStep_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderStep_0026 begin`);
      logInfo("sliderStep(8.75)");
      const actual: number = sliderStep(8.75);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1");
      expect(actual).assertEqual(0.1);
      logInfo(`${BUNDLE}SliderStep_0026 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_STEP_0027
     * @tc.name      Resolution_SliderStep_0027
     * @tc.desc      sliderStep(9.12) returns 0.1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SliderStep_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderStep_0027 begin`);
      logInfo("sliderStep(9.12)");
      const actual: number = sliderStep(9.12);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1");
      expect(actual).assertEqual(0.1);
      logInfo(`${BUNDLE}SliderStep_0027 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_STEP_0028
     * @tc.name      Resolution_SliderStep_0028
     * @tc.desc      sliderStep(9.49) returns 0.1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SliderStep_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderStep_0028 begin`);
      logInfo("sliderStep(9.49)");
      const actual: number = sliderStep(9.49);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1");
      expect(actual).assertEqual(0.1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SliderStep_0028 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_STEP_0029
     * @tc.name      Resolution_SliderStep_0029
     * @tc.desc      sliderStep(9.86) returns 0.1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SliderStep_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderStep_0029 begin`);
      logInfo("sliderStep(9.86)");
      const actual: number = sliderStep(9.86);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1");
      expect(actual).assertEqual(0.1);
      logInfo(`${BUNDLE}SliderStep_0029 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_STEP_0030
     * @tc.name      Resolution_SliderStep_0030
     * @tc.desc      sliderStep(10.23) returns 0.1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SliderStep_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderStep_0030 begin`);
      logInfo("sliderStep(10.23)");
      const actual: number = sliderStep(10.23);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1");
      expect(actual).assertEqual(0.1);
      logInfo(`${BUNDLE}SliderStep_0030 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_STEP_0031
     * @tc.name      Resolution_SliderStep_0031
     * @tc.desc      sliderStep(10.6) returns 0.1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SliderStep_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderStep_0031 begin`);
      logInfo("sliderStep(10.6)");
      const actual: number = sliderStep(10.6);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1");
      expect(actual).assertEqual(0.1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SliderStep_0031 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_STEP_0032
     * @tc.name      Resolution_SliderStep_0032
     * @tc.desc      sliderStep(10.97) returns 0.1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SliderStep_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderStep_0032 begin`);
      logInfo("sliderStep(10.97)");
      const actual: number = sliderStep(10.97);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1");
      expect(actual).assertEqual(0.1);
      logInfo(`${BUNDLE}SliderStep_0032 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_STEP_0033
     * @tc.name      Resolution_SliderStep_0033
     * @tc.desc      sliderStep(11.34) returns 0.1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SliderStep_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderStep_0033 begin`);
      logInfo("sliderStep(11.34)");
      const actual: number = sliderStep(11.34);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1");
      expect(actual).assertEqual(0.1);
      logInfo(`${BUNDLE}SliderStep_0033 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_STEP_0034
     * @tc.name      Resolution_SliderStep_0034
     * @tc.desc      sliderStep(11.71) returns 0.1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_SliderStep_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderStep_0034 begin`);
      logInfo("sliderStep(11.71)");
      const actual: number = sliderStep(11.71);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1");
      expect(actual).assertEqual(0.1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SliderStep_0034 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_STEP_0035
     * @tc.name      Resolution_SliderStep_0035
     * @tc.desc      sliderStep(12.08) returns 0.1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_SliderStep_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SliderStep_0035 begin`);
      logInfo("sliderStep(12.08)");
      const actual: number = sliderStep(12.08);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1");
      expect(actual).assertEqual(0.1);
      logInfo(`${BUNDLE}SliderStep_0035 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_STEP_0036
     * @tc.name      Resolution_SliderStep_0036
     * @tc.desc      sliderStep(12.45) returns 0.1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SliderStep_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderStep_0036 begin`);
      logInfo("sliderStep(12.45)");
      const actual: number = sliderStep(12.45);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1");
      expect(actual).assertEqual(0.1);
      logInfo(`${BUNDLE}SliderStep_0036 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_STEP_0037
     * @tc.name      Resolution_SliderStep_0037
     * @tc.desc      sliderStep(12.82) returns 0.1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SliderStep_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderStep_0037 begin`);
      logInfo("sliderStep(12.82)");
      const actual: number = sliderStep(12.82);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1");
      expect(actual).assertEqual(0.1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SliderStep_0037 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_STEP_0038
     * @tc.name      Resolution_SliderStep_0038
     * @tc.desc      sliderStep(13.19) returns 0.1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SliderStep_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderStep_0038 begin`);
      logInfo("sliderStep(13.19)");
      const actual: number = sliderStep(13.19);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1");
      expect(actual).assertEqual(0.1);
      logInfo(`${BUNDLE}SliderStep_0038 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_STEP_0039
     * @tc.name      Resolution_SliderStep_0039
     * @tc.desc      sliderStep(13.56) returns 0.1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SliderStep_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderStep_0039 begin`);
      logInfo("sliderStep(13.56)");
      const actual: number = sliderStep(13.56);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1");
      expect(actual).assertEqual(0.1);
      logInfo(`${BUNDLE}SliderStep_0039 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_STEP_0040
     * @tc.name      Resolution_SliderStep_0040
     * @tc.desc      sliderStep(13.93) returns 0.1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SliderStep_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderStep_0040 begin`);
      logInfo("sliderStep(13.93)");
      const actual: number = sliderStep(13.93);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1");
      expect(actual).assertEqual(0.1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SliderStep_0040 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_STEP_0041
     * @tc.name      Resolution_SliderStep_0041
     * @tc.desc      sliderStep(14.3) returns 0.1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SliderStep_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderStep_0041 begin`);
      logInfo("sliderStep(14.3)");
      const actual: number = sliderStep(14.3);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1");
      expect(actual).assertEqual(0.1);
      logInfo(`${BUNDLE}SliderStep_0041 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_STEP_0042
     * @tc.name      Resolution_SliderStep_0042
     * @tc.desc      sliderStep(14.67) returns 0.1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SliderStep_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderStep_0042 begin`);
      logInfo("sliderStep(14.67)");
      const actual: number = sliderStep(14.67);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1");
