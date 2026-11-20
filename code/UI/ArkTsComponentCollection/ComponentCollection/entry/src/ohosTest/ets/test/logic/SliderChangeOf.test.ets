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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { sliderChangeOf } from '../model/ComponentSampleLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ComponentCollection]';
const BUNDLE: string = 'ComponentCollection_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for sliderChangeOf (49 cases). */
export default function sliderChangeOfTest(): void {
  describe('SliderChangeOfTest', () => {
    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_CHANGE_OF_0001
     * @tc.name      ComponentCollection_SliderChangeOf_0001
     * @tc.desc      sliderChangeOf(mode=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_SliderChangeOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderChangeOf_0001 begin`);
      const actual: number = sliderChangeOf(0);
      logInfo(`sliderChangeOf(mode=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SliderChangeOf_0001 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_CHANGE_OF_0002
     * @tc.name      ComponentCollection_SliderChangeOf_0002
     * @tc.desc      sliderChangeOf(mode=-1) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_SliderChangeOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderChangeOf_0002 begin`);
      const actual: number = sliderChangeOf(-1);
      logInfo(`sliderChangeOf(mode=-1): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SliderChangeOf_0002 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_CHANGE_OF_0003
     * @tc.name      ComponentCollection_SliderChangeOf_0003
     * @tc.desc      sliderChangeOf(mode=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_SliderChangeOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SliderChangeOf_0003 begin`);
      const actual: number = sliderChangeOf(1);
      logInfo(`sliderChangeOf(mode=1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SliderChangeOf_0003 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_CHANGE_OF_0004
     * @tc.name      ComponentCollection_SliderChangeOf_0004
     * @tc.desc      sliderChangeOf(mode=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_SliderChangeOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SliderChangeOf_0004 begin`);
      const actual: number = sliderChangeOf(3);
      logInfo(`sliderChangeOf(mode=3): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}SliderChangeOf_0004 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_CHANGE_OF_0005
     * @tc.name      ComponentCollection_SliderChangeOf_0005
     * @tc.desc      sliderChangeOf(mode=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_SliderChangeOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SliderChangeOf_0005 begin`);
      const actual: number = sliderChangeOf(2);
      logInfo(`sliderChangeOf(mode=2): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SliderChangeOf_0005 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_CHANGE_OF_0006
     * @tc.name      ComponentCollection_SliderChangeOf_0006
     * @tc.desc      sliderChangeOf(mode=4) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_SliderChangeOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SliderChangeOf_0006 begin`);
      const actual: number = sliderChangeOf(4);
      logInfo(`sliderChangeOf(mode=4): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SliderChangeOf_0006 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_CHANGE_OF_0007
     * @tc.name      ComponentCollection_SliderChangeOf_0007
     * @tc.desc      sliderChangeOf(mode=10) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderChangeOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderChangeOf_0007 begin`);
      const actual: number = sliderChangeOf(10);
      logInfo(`sliderChangeOf(mode=10): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SliderChangeOf_0007 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_CHANGE_OF_0008
     * @tc.name      ComponentCollection_SliderChangeOf_0008
     * @tc.desc      sliderChangeOf(mode=100) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderChangeOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderChangeOf_0008 begin`);
      const actual: number = sliderChangeOf(100);
      logInfo(`sliderChangeOf(mode=100): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SliderChangeOf_0008 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_CHANGE_OF_0009
     * @tc.name      ComponentCollection_SliderChangeOf_0009
     * @tc.desc      sliderChangeOf(mode=5) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderChangeOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderChangeOf_0009 begin`);
      const actual: number = sliderChangeOf(5);
      logInfo(`sliderChangeOf(mode=5): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SliderChangeOf_0009 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_CHANGE_OF_0010
     * @tc.name      ComponentCollection_SliderChangeOf_0010
     * @tc.desc      sliderChangeOf(mode=15) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderChangeOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderChangeOf_0010 begin`);
      const actual: number = sliderChangeOf(15);
      logInfo(`sliderChangeOf(mode=15): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SliderChangeOf_0010 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_CHANGE_OF_0011
     * @tc.name      ComponentCollection_SliderChangeOf_0011
     * @tc.desc      sliderChangeOf(mode=20) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderChangeOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderChangeOf_0011 begin`);
      const actual: number = sliderChangeOf(20);
      logInfo(`sliderChangeOf(mode=20): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SliderChangeOf_0011 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_CHANGE_OF_0012
     * @tc.name      ComponentCollection_SliderChangeOf_0012
     * @tc.desc      sliderChangeOf(mode=25) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderChangeOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderChangeOf_0012 begin`);
      const actual: number = sliderChangeOf(25);
      logInfo(`sliderChangeOf(mode=25): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SliderChangeOf_0012 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_CHANGE_OF_0013
     * @tc.name      ComponentCollection_SliderChangeOf_0013
     * @tc.desc      sliderChangeOf(mode=30) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderChangeOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderChangeOf_0013 begin`);
      const actual: number = sliderChangeOf(30);
      logInfo(`sliderChangeOf(mode=30): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SliderChangeOf_0013 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_CHANGE_OF_0014
     * @tc.name      ComponentCollection_SliderChangeOf_0014
     * @tc.desc      sliderChangeOf(mode=35) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderChangeOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderChangeOf_0014 begin`);
      const actual: number = sliderChangeOf(35);
      logInfo(`sliderChangeOf(mode=35): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SliderChangeOf_0014 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_CHANGE_OF_0015
     * @tc.name      ComponentCollection_SliderChangeOf_0015
     * @tc.desc      sliderChangeOf(mode=40) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderChangeOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderChangeOf_0015 begin`);
      const actual: number = sliderChangeOf(40);
      logInfo(`sliderChangeOf(mode=40): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SliderChangeOf_0015 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_CHANGE_OF_0016
     * @tc.name      ComponentCollection_SliderChangeOf_0016
     * @tc.desc      sliderChangeOf(mode=45) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderChangeOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderChangeOf_0016 begin`);
      const actual: number = sliderChangeOf(45);
      logInfo(`sliderChangeOf(mode=45): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SliderChangeOf_0016 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_CHANGE_OF_0017
     * @tc.name      ComponentCollection_SliderChangeOf_0017
     * @tc.desc      sliderChangeOf(mode=50) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderChangeOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderChangeOf_0017 begin`);
      const actual: number = sliderChangeOf(50);
      logInfo(`sliderChangeOf(mode=50): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SliderChangeOf_0017 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_CHANGE_OF_0018
     * @tc.name      ComponentCollection_SliderChangeOf_0018
     * @tc.desc      sliderChangeOf(mode=55) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderChangeOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderChangeOf_0018 begin`);
      const actual: number = sliderChangeOf(55);
      logInfo(`sliderChangeOf(mode=55): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SliderChangeOf_0018 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_CHANGE_OF_0019
     * @tc.name      ComponentCollection_SliderChangeOf_0019
     * @tc.desc      sliderChangeOf(mode=60) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderChangeOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderChangeOf_0019 begin`);
      const actual: number = sliderChangeOf(60);
      logInfo(`sliderChangeOf(mode=60): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SliderChangeOf_0019 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_CHANGE_OF_0020
     * @tc.name      ComponentCollection_SliderChangeOf_0020
     * @tc.desc      sliderChangeOf(mode=65) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderChangeOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderChangeOf_0020 begin`);
      const actual: number = sliderChangeOf(65);
      logInfo(`sliderChangeOf(mode=65): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SliderChangeOf_0020 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_CHANGE_OF_0021
     * @tc.name      ComponentCollection_SliderChangeOf_0021
     * @tc.desc      sliderChangeOf(mode=70) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderChangeOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderChangeOf_0021 begin`);
      const actual: number = sliderChangeOf(70);
      logInfo(`sliderChangeOf(mode=70): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SliderChangeOf_0021 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_CHANGE_OF_0022
     * @tc.name      ComponentCollection_SliderChangeOf_0022
     * @tc.desc      sliderChangeOf(mode=75) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderChangeOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderChangeOf_0022 begin`);
      const actual: number = sliderChangeOf(75);
      logInfo(`sliderChangeOf(mode=75): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SliderChangeOf_0022 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_CHANGE_OF_0023
     * @tc.name      ComponentCollection_SliderChangeOf_0023
     * @tc.desc      sliderChangeOf(mode=80) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderChangeOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderChangeOf_0023 begin`);
      const actual: number = sliderChangeOf(80);
      logInfo(`sliderChangeOf(mode=80): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SliderChangeOf_0023 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_CHANGE_OF_0024
     * @tc.name      ComponentCollection_SliderChangeOf_0024
     * @tc.desc      sliderChangeOf(mode=85) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderChangeOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderChangeOf_0024 begin`);
      const actual: number = sliderChangeOf(85);
      logInfo(`sliderChangeOf(mode=85): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SliderChangeOf_0024 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_CHANGE_OF_0025
     * @tc.name      ComponentCollection_SliderChangeOf_0025
     * @tc.desc      sliderChangeOf(mode=90) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderChangeOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderChangeOf_0025 begin`);
      const actual: number = sliderChangeOf(90);
      logInfo(`sliderChangeOf(mode=90): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SliderChangeOf_0025 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_CHANGE_OF_0026
     * @tc.name      ComponentCollection_SliderChangeOf_0026
     * @tc.desc      sliderChangeOf(mode=95) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderChangeOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderChangeOf_0026 begin`);
      const actual: number = sliderChangeOf(95);
      logInfo(`sliderChangeOf(mode=95): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SliderChangeOf_0026 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_CHANGE_OF_0027
     * @tc.name      ComponentCollection_SliderChangeOf_0027
     * @tc.desc      sliderChangeOf(mode=105) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderChangeOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderChangeOf_0027 begin`);
      const actual: number = sliderChangeOf(105);
      logInfo(`sliderChangeOf(mode=105): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SliderChangeOf_0027 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_CHANGE_OF_0028
     * @tc.name      ComponentCollection_SliderChangeOf_0028
     * @tc.desc      sliderChangeOf(mode=110) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderChangeOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderChangeOf_0028 begin`);
      const actual: number = sliderChangeOf(110);
      logInfo(`sliderChangeOf(mode=110): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SliderChangeOf_0028 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_CHANGE_OF_0029
     * @tc.name      ComponentCollection_SliderChangeOf_0029
     * @tc.desc      sliderChangeOf(mode=115) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderChangeOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderChangeOf_0029 begin`);
      const actual: number = sliderChangeOf(115);
      logInfo(`sliderChangeOf(mode=115): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SliderChangeOf_0029 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_CHANGE_OF_0030
     * @tc.name      ComponentCollection_SliderChangeOf_0030
     * @tc.desc      sliderChangeOf(mode=120) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderChangeOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderChangeOf_0030 begin`);
      const actual: number = sliderChangeOf(120);
      logInfo(`sliderChangeOf(mode=120): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SliderChangeOf_0030 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_CHANGE_OF_0031
     * @tc.name      ComponentCollection_SliderChangeOf_0031
     * @tc.desc      sliderChangeOf(mode=125) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderChangeOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderChangeOf_0031 begin`);
      const actual: number = sliderChangeOf(125);
      logInfo(`sliderChangeOf(mode=125): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SliderChangeOf_0031 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_CHANGE_OF_0032
     * @tc.name      ComponentCollection_SliderChangeOf_0032
     * @tc.desc      sliderChangeOf(mode=130) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderChangeOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderChangeOf_0032 begin`);
      const actual: number = sliderChangeOf(130);
      logInfo(`sliderChangeOf(mode=130): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SliderChangeOf_0032 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_CHANGE_OF_0033
     * @tc.name      ComponentCollection_SliderChangeOf_0033
     * @tc.desc      sliderChangeOf(mode=135) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderChangeOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderChangeOf_0033 begin`);
      const actual: number = sliderChangeOf(135);
      logInfo(`sliderChangeOf(mode=135): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SliderChangeOf_0033 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_CHANGE_OF_0034
     * @tc.name      ComponentCollection_SliderChangeOf_0034
     * @tc.desc      sliderChangeOf(mode=140) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderChangeOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderChangeOf_0034 begin`);
      const actual: number = sliderChangeOf(140);
      logInfo(`sliderChangeOf(mode=140): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SliderChangeOf_0034 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_CHANGE_OF_0035
     * @tc.name      ComponentCollection_SliderChangeOf_0035
     * @tc.desc      sliderChangeOf(mode=145) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderChangeOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderChangeOf_0035 begin`);
      const actual: number = sliderChangeOf(145);
      logInfo(`sliderChangeOf(mode=145): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SliderChangeOf_0035 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_CHANGE_OF_0036
     * @tc.name      ComponentCollection_SliderChangeOf_0036
     * @tc.desc      sliderChangeOf(mode=150) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderChangeOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderChangeOf_0036 begin`);
      const actual: number = sliderChangeOf(150);
      logInfo(`sliderChangeOf(mode=150): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SliderChangeOf_0036 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_CHANGE_OF_0037
     * @tc.name      ComponentCollection_SliderChangeOf_0037
     * @tc.desc      sliderChangeOf(mode=155) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderChangeOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderChangeOf_0037 begin`);
      const actual: number = sliderChangeOf(155);
      logInfo(`sliderChangeOf(mode=155): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SliderChangeOf_0037 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_CHANGE_OF_0038
     * @tc.name      ComponentCollection_SliderChangeOf_0038
     * @tc.desc      sliderChangeOf(mode=160) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderChangeOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderChangeOf_0038 begin`);
      const actual: number = sliderChangeOf(160);
      logInfo(`sliderChangeOf(mode=160): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SliderChangeOf_0038 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_CHANGE_OF_0039
     * @tc.name      ComponentCollection_SliderChangeOf_0039
     * @tc.desc      sliderChangeOf(mode=165) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderChangeOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderChangeOf_0039 begin`);
      const actual: number = sliderChangeOf(165);
      logInfo(`sliderChangeOf(mode=165): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SliderChangeOf_0039 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_CHANGE_OF_0040
     * @tc.name      ComponentCollection_SliderChangeOf_0040
     * @tc.desc      sliderChangeOf(mode=170) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderChangeOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderChangeOf_0040 begin`);
      const actual: number = sliderChangeOf(170);
      logInfo(`sliderChangeOf(mode=170): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SliderChangeOf_0040 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_CHANGE_OF_0041
     * @tc.name      ComponentCollection_SliderChangeOf_0041
     * @tc.desc      sliderChangeOf(mode=175) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderChangeOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderChangeOf_0041 begin`);
      const actual: number = sliderChangeOf(175);
      logInfo(`sliderChangeOf(mode=175): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SliderChangeOf_0041 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_CHANGE_OF_0042
     * @tc.name      ComponentCollection_SliderChangeOf_0042
     * @tc.desc      sliderChangeOf(mode=180) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderChangeOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderChangeOf_0042 begin`);
      const actual: number = sliderChangeOf(180);
      logInfo(`sliderChangeOf(mode=180): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SliderChangeOf_0042 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_CHANGE_OF_0043
     * @tc.name      ComponentCollection_SliderChangeOf_0043
     * @tc.desc      sliderChangeOf(mode=185) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderChangeOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderChangeOf_0043 begin`);
      const actual: number = sliderChangeOf(185);
      logInfo(`sliderChangeOf(mode=185): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SliderChangeOf_0043 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_CHANGE_OF_0044
     * @tc.name      ComponentCollection_SliderChangeOf_0044
     * @tc.desc      sliderChangeOf(mode=190) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderChangeOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderChangeOf_0044 begin`);
      const actual: number = sliderChangeOf(190);
      logInfo(`sliderChangeOf(mode=190): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SliderChangeOf_0044 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_CHANGE_OF_0045
     * @tc.name      ComponentCollection_SliderChangeOf_0045
     * @tc.desc      sliderChangeOf(mode=195) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderChangeOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderChangeOf_0045 begin`);
      const actual: number = sliderChangeOf(195);
      logInfo(`sliderChangeOf(mode=195): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SliderChangeOf_0045 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_CHANGE_OF_0046
     * @tc.name      ComponentCollection_SliderChangeOf_0046
     * @tc.desc      sliderChangeOf(mode=200) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderChangeOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderChangeOf_0046 begin`);
      const actual: number = sliderChangeOf(200);
      logInfo(`sliderChangeOf(mode=200): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SliderChangeOf_0046 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_CHANGE_OF_0047
     * @tc.name      ComponentCollection_SliderChangeOf_0047
     * @tc.desc      sliderChangeOf(mode=10.09) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderChangeOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderChangeOf_0047 begin`);
      const actual: number = sliderChangeOf(10.09);
      logInfo(`sliderChangeOf(mode=10.09): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SliderChangeOf_0047 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_CHANGE_OF_0048
     * @tc.name      ComponentCollection_SliderChangeOf_0048
     * @tc.desc      sliderChangeOf(mode=64.53) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderChangeOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderChangeOf_0048 begin`);
      const actual: number = sliderChangeOf(64.53);
      logInfo(`sliderChangeOf(mode=64.53): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SliderChangeOf_0048 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_CHANGE_OF_0049
     * @tc.name      ComponentCollection_SliderChangeOf_0049
     * @tc.desc      sliderChangeOf(mode=63) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderChangeOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderChangeOf_0049 begin`);
      const actual: number = sliderChangeOf(63);
      logInfo(`sliderChangeOf(mode=63): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SliderChangeOf_0049 end`);
    });
  });
}
