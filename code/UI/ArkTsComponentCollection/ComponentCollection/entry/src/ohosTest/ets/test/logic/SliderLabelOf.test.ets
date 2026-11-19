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
import { sliderLabelOf } from '../model/ComponentSampleLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ComponentCollection]';
const BUNDLE: string = 'ComponentCollection_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for sliderLabelOf (49 cases). */
export default function sliderLabelOfTest(): void {
  describe('SliderLabelOfTest', () => {
    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_LABEL_OF_0001
     * @tc.name      ComponentCollection_SliderLabelOf_0001
     * @tc.desc      sliderLabelOf(value=0) returns "0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_SliderLabelOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderLabelOf_0001 begin`);
      const actual: string = sliderLabelOf(0);
      logInfo(`sliderLabelOf(value=0): actual=${actual}`);
      expect(actual).assertEqual('0');
      logInfo(`${BUNDLE}SliderLabelOf_0001 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_LABEL_OF_0002
     * @tc.name      ComponentCollection_SliderLabelOf_0002
     * @tc.desc      sliderLabelOf(value=1) returns "1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_SliderLabelOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderLabelOf_0002 begin`);
      const actual: string = sliderLabelOf(1);
      logInfo(`sliderLabelOf(value=1): actual=${actual}`);
      expect(actual).assertEqual('1');
      logInfo(`${BUNDLE}SliderLabelOf_0002 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_LABEL_OF_0003
     * @tc.name      ComponentCollection_SliderLabelOf_0003
     * @tc.desc      sliderLabelOf(value=-1) returns "-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_SliderLabelOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SliderLabelOf_0003 begin`);
      const actual: string = sliderLabelOf(-1);
      logInfo(`sliderLabelOf(value=-1): actual=${actual}`);
      expect(actual).assertEqual('-1');
      logInfo(`${BUNDLE}SliderLabelOf_0003 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_LABEL_OF_0004
     * @tc.name      ComponentCollection_SliderLabelOf_0004
     * @tc.desc      sliderLabelOf(value=2) returns "2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderLabelOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderLabelOf_0004 begin`);
      const actual: string = sliderLabelOf(2);
      logInfo(`sliderLabelOf(value=2): actual=${actual}`);
      expect(actual).assertEqual('2');
      logInfo(`${BUNDLE}SliderLabelOf_0004 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_LABEL_OF_0005
     * @tc.name      ComponentCollection_SliderLabelOf_0005
     * @tc.desc      sliderLabelOf(value=3) returns "3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderLabelOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderLabelOf_0005 begin`);
      const actual: string = sliderLabelOf(3);
      logInfo(`sliderLabelOf(value=3): actual=${actual}`);
      expect(actual).assertEqual('3');
      logInfo(`${BUNDLE}SliderLabelOf_0005 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_LABEL_OF_0006
     * @tc.name      ComponentCollection_SliderLabelOf_0006
     * @tc.desc      sliderLabelOf(value=10) returns "10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderLabelOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderLabelOf_0006 begin`);
      const actual: string = sliderLabelOf(10);
      logInfo(`sliderLabelOf(value=10): actual=${actual}`);
      expect(actual).assertEqual('10');
      logInfo(`${BUNDLE}SliderLabelOf_0006 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_LABEL_OF_0007
     * @tc.name      ComponentCollection_SliderLabelOf_0007
     * @tc.desc      sliderLabelOf(value=100) returns "100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderLabelOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderLabelOf_0007 begin`);
      const actual: string = sliderLabelOf(100);
      logInfo(`sliderLabelOf(value=100): actual=${actual}`);
      expect(actual).assertEqual('100');
      logInfo(`${BUNDLE}SliderLabelOf_0007 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_LABEL_OF_0008
     * @tc.name      ComponentCollection_SliderLabelOf_0008
     * @tc.desc      sliderLabelOf(value=5) returns "5"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderLabelOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderLabelOf_0008 begin`);
      const actual: string = sliderLabelOf(5);
      logInfo(`sliderLabelOf(value=5): actual=${actual}`);
      expect(actual).assertEqual('5');
      logInfo(`${BUNDLE}SliderLabelOf_0008 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_LABEL_OF_0009
     * @tc.name      ComponentCollection_SliderLabelOf_0009
     * @tc.desc      sliderLabelOf(value=15) returns "15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderLabelOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderLabelOf_0009 begin`);
      const actual: string = sliderLabelOf(15);
      logInfo(`sliderLabelOf(value=15): actual=${actual}`);
      expect(actual).assertEqual('15');
      logInfo(`${BUNDLE}SliderLabelOf_0009 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_LABEL_OF_0010
     * @tc.name      ComponentCollection_SliderLabelOf_0010
     * @tc.desc      sliderLabelOf(value=20) returns "20"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderLabelOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderLabelOf_0010 begin`);
      const actual: string = sliderLabelOf(20);
      logInfo(`sliderLabelOf(value=20): actual=${actual}`);
      expect(actual).assertEqual('20');
      logInfo(`${BUNDLE}SliderLabelOf_0010 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_LABEL_OF_0011
     * @tc.name      ComponentCollection_SliderLabelOf_0011
     * @tc.desc      sliderLabelOf(value=25) returns "25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderLabelOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderLabelOf_0011 begin`);
      const actual: string = sliderLabelOf(25);
      logInfo(`sliderLabelOf(value=25): actual=${actual}`);
      expect(actual).assertEqual('25');
      logInfo(`${BUNDLE}SliderLabelOf_0011 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_LABEL_OF_0012
     * @tc.name      ComponentCollection_SliderLabelOf_0012
     * @tc.desc      sliderLabelOf(value=30) returns "30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderLabelOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderLabelOf_0012 begin`);
      const actual: string = sliderLabelOf(30);
      logInfo(`sliderLabelOf(value=30): actual=${actual}`);
      expect(actual).assertEqual('30');
      logInfo(`${BUNDLE}SliderLabelOf_0012 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_LABEL_OF_0013
     * @tc.name      ComponentCollection_SliderLabelOf_0013
     * @tc.desc      sliderLabelOf(value=35) returns "35"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderLabelOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderLabelOf_0013 begin`);
      const actual: string = sliderLabelOf(35);
      logInfo(`sliderLabelOf(value=35): actual=${actual}`);
      expect(actual).assertEqual('35');
      logInfo(`${BUNDLE}SliderLabelOf_0013 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_LABEL_OF_0014
     * @tc.name      ComponentCollection_SliderLabelOf_0014
     * @tc.desc      sliderLabelOf(value=40) returns "40"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderLabelOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderLabelOf_0014 begin`);
      const actual: string = sliderLabelOf(40);
      logInfo(`sliderLabelOf(value=40): actual=${actual}`);
      expect(actual).assertEqual('40');
      logInfo(`${BUNDLE}SliderLabelOf_0014 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_LABEL_OF_0015
     * @tc.name      ComponentCollection_SliderLabelOf_0015
     * @tc.desc      sliderLabelOf(value=45) returns "45"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderLabelOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderLabelOf_0015 begin`);
      const actual: string = sliderLabelOf(45);
      logInfo(`sliderLabelOf(value=45): actual=${actual}`);
      expect(actual).assertEqual('45');
      logInfo(`${BUNDLE}SliderLabelOf_0015 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_LABEL_OF_0016
     * @tc.name      ComponentCollection_SliderLabelOf_0016
     * @tc.desc      sliderLabelOf(value=50) returns "50"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderLabelOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderLabelOf_0016 begin`);
      const actual: string = sliderLabelOf(50);
      logInfo(`sliderLabelOf(value=50): actual=${actual}`);
      expect(actual).assertEqual('50');
      logInfo(`${BUNDLE}SliderLabelOf_0016 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_LABEL_OF_0017
     * @tc.name      ComponentCollection_SliderLabelOf_0017
     * @tc.desc      sliderLabelOf(value=55) returns "55"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderLabelOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderLabelOf_0017 begin`);
      const actual: string = sliderLabelOf(55);
      logInfo(`sliderLabelOf(value=55): actual=${actual}`);
      expect(actual).assertEqual('55');
      logInfo(`${BUNDLE}SliderLabelOf_0017 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_LABEL_OF_0018
     * @tc.name      ComponentCollection_SliderLabelOf_0018
     * @tc.desc      sliderLabelOf(value=60) returns "60"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderLabelOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderLabelOf_0018 begin`);
      const actual: string = sliderLabelOf(60);
      logInfo(`sliderLabelOf(value=60): actual=${actual}`);
      expect(actual).assertEqual('60');
      logInfo(`${BUNDLE}SliderLabelOf_0018 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_LABEL_OF_0019
     * @tc.name      ComponentCollection_SliderLabelOf_0019
     * @tc.desc      sliderLabelOf(value=65) returns "65"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderLabelOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderLabelOf_0019 begin`);
      const actual: string = sliderLabelOf(65);
      logInfo(`sliderLabelOf(value=65): actual=${actual}`);
      expect(actual).assertEqual('65');
      logInfo(`${BUNDLE}SliderLabelOf_0019 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_LABEL_OF_0020
     * @tc.name      ComponentCollection_SliderLabelOf_0020
     * @tc.desc      sliderLabelOf(value=70) returns "70"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderLabelOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderLabelOf_0020 begin`);
      const actual: string = sliderLabelOf(70);
      logInfo(`sliderLabelOf(value=70): actual=${actual}`);
      expect(actual).assertEqual('70');
      logInfo(`${BUNDLE}SliderLabelOf_0020 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_LABEL_OF_0021
     * @tc.name      ComponentCollection_SliderLabelOf_0021
     * @tc.desc      sliderLabelOf(value=75) returns "75"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderLabelOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderLabelOf_0021 begin`);
      const actual: string = sliderLabelOf(75);
      logInfo(`sliderLabelOf(value=75): actual=${actual}`);
      expect(actual).assertEqual('75');
      logInfo(`${BUNDLE}SliderLabelOf_0021 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_LABEL_OF_0022
     * @tc.name      ComponentCollection_SliderLabelOf_0022
     * @tc.desc      sliderLabelOf(value=80) returns "80"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderLabelOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderLabelOf_0022 begin`);
      const actual: string = sliderLabelOf(80);
      logInfo(`sliderLabelOf(value=80): actual=${actual}`);
      expect(actual).assertEqual('80');
      logInfo(`${BUNDLE}SliderLabelOf_0022 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_LABEL_OF_0023
     * @tc.name      ComponentCollection_SliderLabelOf_0023
     * @tc.desc      sliderLabelOf(value=85) returns "85"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderLabelOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderLabelOf_0023 begin`);
      const actual: string = sliderLabelOf(85);
      logInfo(`sliderLabelOf(value=85): actual=${actual}`);
      expect(actual).assertEqual('85');
      logInfo(`${BUNDLE}SliderLabelOf_0023 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_LABEL_OF_0024
     * @tc.name      ComponentCollection_SliderLabelOf_0024
     * @tc.desc      sliderLabelOf(value=90) returns "90"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderLabelOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderLabelOf_0024 begin`);
      const actual: string = sliderLabelOf(90);
      logInfo(`sliderLabelOf(value=90): actual=${actual}`);
      expect(actual).assertEqual('90');
      logInfo(`${BUNDLE}SliderLabelOf_0024 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_LABEL_OF_0025
     * @tc.name      ComponentCollection_SliderLabelOf_0025
     * @tc.desc      sliderLabelOf(value=95) returns "95"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderLabelOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderLabelOf_0025 begin`);
      const actual: string = sliderLabelOf(95);
      logInfo(`sliderLabelOf(value=95): actual=${actual}`);
      expect(actual).assertEqual('95');
      logInfo(`${BUNDLE}SliderLabelOf_0025 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_LABEL_OF_0026
     * @tc.name      ComponentCollection_SliderLabelOf_0026
     * @tc.desc      sliderLabelOf(value=105) returns "105"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderLabelOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderLabelOf_0026 begin`);
      const actual: string = sliderLabelOf(105);
      logInfo(`sliderLabelOf(value=105): actual=${actual}`);
      expect(actual).assertEqual('105');
      logInfo(`${BUNDLE}SliderLabelOf_0026 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_LABEL_OF_0027
     * @tc.name      ComponentCollection_SliderLabelOf_0027
     * @tc.desc      sliderLabelOf(value=110) returns "110"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderLabelOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderLabelOf_0027 begin`);
      const actual: string = sliderLabelOf(110);
      logInfo(`sliderLabelOf(value=110): actual=${actual}`);
      expect(actual).assertEqual('110');
      logInfo(`${BUNDLE}SliderLabelOf_0027 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_LABEL_OF_0028
     * @tc.name      ComponentCollection_SliderLabelOf_0028
     * @tc.desc      sliderLabelOf(value=115) returns "115"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderLabelOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderLabelOf_0028 begin`);
      const actual: string = sliderLabelOf(115);
      logInfo(`sliderLabelOf(value=115): actual=${actual}`);
      expect(actual).assertEqual('115');
      logInfo(`${BUNDLE}SliderLabelOf_0028 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_LABEL_OF_0029
     * @tc.name      ComponentCollection_SliderLabelOf_0029
     * @tc.desc      sliderLabelOf(value=120) returns "120"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderLabelOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderLabelOf_0029 begin`);
      const actual: string = sliderLabelOf(120);
      logInfo(`sliderLabelOf(value=120): actual=${actual}`);
      expect(actual).assertEqual('120');
      logInfo(`${BUNDLE}SliderLabelOf_0029 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_LABEL_OF_0030
     * @tc.name      ComponentCollection_SliderLabelOf_0030
     * @tc.desc      sliderLabelOf(value=125) returns "125"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderLabelOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderLabelOf_0030 begin`);
      const actual: string = sliderLabelOf(125);
      logInfo(`sliderLabelOf(value=125): actual=${actual}`);
      expect(actual).assertEqual('125');
      logInfo(`${BUNDLE}SliderLabelOf_0030 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_LABEL_OF_0031
     * @tc.name      ComponentCollection_SliderLabelOf_0031
     * @tc.desc      sliderLabelOf(value=130) returns "130"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderLabelOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderLabelOf_0031 begin`);
      const actual: string = sliderLabelOf(130);
      logInfo(`sliderLabelOf(value=130): actual=${actual}`);
      expect(actual).assertEqual('130');
      logInfo(`${BUNDLE}SliderLabelOf_0031 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_LABEL_OF_0032
     * @tc.name      ComponentCollection_SliderLabelOf_0032
     * @tc.desc      sliderLabelOf(value=135) returns "135"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderLabelOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderLabelOf_0032 begin`);
      const actual: string = sliderLabelOf(135);
      logInfo(`sliderLabelOf(value=135): actual=${actual}`);
      expect(actual).assertEqual('135');
      logInfo(`${BUNDLE}SliderLabelOf_0032 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_LABEL_OF_0033
     * @tc.name      ComponentCollection_SliderLabelOf_0033
     * @tc.desc      sliderLabelOf(value=140) returns "140"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderLabelOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderLabelOf_0033 begin`);
      const actual: string = sliderLabelOf(140);
      logInfo(`sliderLabelOf(value=140): actual=${actual}`);
      expect(actual).assertEqual('140');
      logInfo(`${BUNDLE}SliderLabelOf_0033 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_LABEL_OF_0034
     * @tc.name      ComponentCollection_SliderLabelOf_0034
     * @tc.desc      sliderLabelOf(value=145) returns "145"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderLabelOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderLabelOf_0034 begin`);
      const actual: string = sliderLabelOf(145);
      logInfo(`sliderLabelOf(value=145): actual=${actual}`);
      expect(actual).assertEqual('145');
      logInfo(`${BUNDLE}SliderLabelOf_0034 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_LABEL_OF_0035
     * @tc.name      ComponentCollection_SliderLabelOf_0035
     * @tc.desc      sliderLabelOf(value=150) returns "150"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderLabelOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderLabelOf_0035 begin`);
      const actual: string = sliderLabelOf(150);
      logInfo(`sliderLabelOf(value=150): actual=${actual}`);
      expect(actual).assertEqual('150');
      logInfo(`${BUNDLE}SliderLabelOf_0035 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_LABEL_OF_0036
     * @tc.name      ComponentCollection_SliderLabelOf_0036
     * @tc.desc      sliderLabelOf(value=155) returns "155"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderLabelOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderLabelOf_0036 begin`);
      const actual: string = sliderLabelOf(155);
      logInfo(`sliderLabelOf(value=155): actual=${actual}`);
      expect(actual).assertEqual('155');
      logInfo(`${BUNDLE}SliderLabelOf_0036 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_LABEL_OF_0037
     * @tc.name      ComponentCollection_SliderLabelOf_0037
     * @tc.desc      sliderLabelOf(value=160) returns "160"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderLabelOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderLabelOf_0037 begin`);
      const actual: string = sliderLabelOf(160);
      logInfo(`sliderLabelOf(value=160): actual=${actual}`);
      expect(actual).assertEqual('160');
      logInfo(`${BUNDLE}SliderLabelOf_0037 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_LABEL_OF_0038
     * @tc.name      ComponentCollection_SliderLabelOf_0038
     * @tc.desc      sliderLabelOf(value=165) returns "165"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderLabelOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderLabelOf_0038 begin`);
      const actual: string = sliderLabelOf(165);
      logInfo(`sliderLabelOf(value=165): actual=${actual}`);
      expect(actual).assertEqual('165');
      logInfo(`${BUNDLE}SliderLabelOf_0038 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_LABEL_OF_0039
     * @tc.name      ComponentCollection_SliderLabelOf_0039
     * @tc.desc      sliderLabelOf(value=170) returns "170"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderLabelOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderLabelOf_0039 begin`);
      const actual: string = sliderLabelOf(170);
      logInfo(`sliderLabelOf(value=170): actual=${actual}`);
      expect(actual).assertEqual('170');
      logInfo(`${BUNDLE}SliderLabelOf_0039 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_LABEL_OF_0040
     * @tc.name      ComponentCollection_SliderLabelOf_0040
     * @tc.desc      sliderLabelOf(value=175) returns "175"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderLabelOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderLabelOf_0040 begin`);
      const actual: string = sliderLabelOf(175);
      logInfo(`sliderLabelOf(value=175): actual=${actual}`);
      expect(actual).assertEqual('175');
      logInfo(`${BUNDLE}SliderLabelOf_0040 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_LABEL_OF_0041
     * @tc.name      ComponentCollection_SliderLabelOf_0041
     * @tc.desc      sliderLabelOf(value=180) returns "180"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderLabelOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderLabelOf_0041 begin`);
      const actual: string = sliderLabelOf(180);
      logInfo(`sliderLabelOf(value=180): actual=${actual}`);
      expect(actual).assertEqual('180');
      logInfo(`${BUNDLE}SliderLabelOf_0041 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_LABEL_OF_0042
     * @tc.name      ComponentCollection_SliderLabelOf_0042
     * @tc.desc      sliderLabelOf(value=185) returns "185"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderLabelOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderLabelOf_0042 begin`);
      const actual: string = sliderLabelOf(185);
      logInfo(`sliderLabelOf(value=185): actual=${actual}`);
      expect(actual).assertEqual('185');
      logInfo(`${BUNDLE}SliderLabelOf_0042 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_LABEL_OF_0043
     * @tc.name      ComponentCollection_SliderLabelOf_0043
     * @tc.desc      sliderLabelOf(value=190) returns "190"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderLabelOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderLabelOf_0043 begin`);
      const actual: string = sliderLabelOf(190);
      logInfo(`sliderLabelOf(value=190): actual=${actual}`);
      expect(actual).assertEqual('190');
      logInfo(`${BUNDLE}SliderLabelOf_0043 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_LABEL_OF_0044
     * @tc.name      ComponentCollection_SliderLabelOf_0044
     * @tc.desc      sliderLabelOf(value=195) returns "195"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderLabelOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderLabelOf_0044 begin`);
      const actual: string = sliderLabelOf(195);
      logInfo(`sliderLabelOf(value=195): actual=${actual}`);
      expect(actual).assertEqual('195');
      logInfo(`${BUNDLE}SliderLabelOf_0044 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_LABEL_OF_0045
     * @tc.name      ComponentCollection_SliderLabelOf_0045
     * @tc.desc      sliderLabelOf(value=200) returns "200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderLabelOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderLabelOf_0045 begin`);
      const actual: string = sliderLabelOf(200);
      logInfo(`sliderLabelOf(value=200): actual=${actual}`);
      expect(actual).assertEqual('200');
      logInfo(`${BUNDLE}SliderLabelOf_0045 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_LABEL_OF_0046
     * @tc.name      ComponentCollection_SliderLabelOf_0046
     * @tc.desc      sliderLabelOf(value=37.16) returns "37"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderLabelOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderLabelOf_0046 begin`);
      const actual: string = sliderLabelOf(37.16);
      logInfo(`sliderLabelOf(value=37.16): actual=${actual}`);
      expect(actual).assertEqual('37');
      logInfo(`${BUNDLE}SliderLabelOf_0046 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_LABEL_OF_0047
     * @tc.name      ComponentCollection_SliderLabelOf_0047
     * @tc.desc      sliderLabelOf(value=7) returns "7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderLabelOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderLabelOf_0047 begin`);
      const actual: string = sliderLabelOf(7);
      logInfo(`sliderLabelOf(value=7): actual=${actual}`);
      expect(actual).assertEqual('7');
      logInfo(`${BUNDLE}SliderLabelOf_0047 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_LABEL_OF_0048
     * @tc.name      ComponentCollection_SliderLabelOf_0048
     * @tc.desc      sliderLabelOf(value=142) returns "142"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderLabelOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderLabelOf_0048 begin`);
      const actual: string = sliderLabelOf(142);
      logInfo(`sliderLabelOf(value=142): actual=${actual}`);
      expect(actual).assertEqual('142');
      logInfo(`${BUNDLE}SliderLabelOf_0048 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SLIDER_LABEL_OF_0049
     * @tc.name      ComponentCollection_SliderLabelOf_0049
     * @tc.desc      sliderLabelOf(value=192) returns "192"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SliderLabelOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderLabelOf_0049 begin`);
      const actual: string = sliderLabelOf(192);
      logInfo(`sliderLabelOf(value=192): actual=${actual}`);
      expect(actual).assertEqual('192');
      logInfo(`${BUNDLE}SliderLabelOf_0049 end`);
    });
  });
}
