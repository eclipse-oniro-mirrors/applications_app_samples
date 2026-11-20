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
import { clampSlideOf } from '../model/ComponentSampleLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ComponentCollection]';
const BUNDLE: string = 'ComponentCollection_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for clampSlideOf (50 cases). */
export default function clampSlideOfTest(): void {
  describe('ClampSlideOfTest', () => {
    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0001
     * @tc.name      ComponentCollection_ClampSlideOf_0001
     * @tc.desc      clampSlideOf(sx=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_ClampSlideOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0001 begin`);
      const actual: number = clampSlideOf(1);
      logInfo(`clampSlideOf(sx=1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ClampSlideOf_0001 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0002
     * @tc.name      ComponentCollection_ClampSlideOf_0002
     * @tc.desc      clampSlideOf(sx=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_ClampSlideOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0002 begin`);
      const actual: number = clampSlideOf(0);
      logInfo(`clampSlideOf(sx=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ClampSlideOf_0002 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0003
     * @tc.name      ComponentCollection_ClampSlideOf_0003
     * @tc.desc      clampSlideOf(sx=0.9) returns 0.9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ClampSlideOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0003 begin`);
      const actual: number = clampSlideOf(0.9);
      logInfo(`clampSlideOf(sx=0.9): actual=${actual}`);
      expect(actual).assertClose(0.9, PRECISION);
      logInfo(`${BUNDLE}ClampSlideOf_0003 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0004
     * @tc.name      ComponentCollection_ClampSlideOf_0004
     * @tc.desc      clampSlideOf(sx=2) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_ClampSlideOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0004 begin`);
      const actual: number = clampSlideOf(2);
      logInfo(`clampSlideOf(sx=2): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ClampSlideOf_0004 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0005
     * @tc.name      ComponentCollection_ClampSlideOf_0005
     * @tc.desc      clampSlideOf(sx=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_ClampSlideOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0005 begin`);
      const actual: number = clampSlideOf(-1);
      logInfo(`clampSlideOf(sx=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ClampSlideOf_0005 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0006
     * @tc.name      ComponentCollection_ClampSlideOf_0006
     * @tc.desc      clampSlideOf(sx=3) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ClampSlideOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0006 begin`);
      const actual: number = clampSlideOf(3);
      logInfo(`clampSlideOf(sx=3): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ClampSlideOf_0006 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0007
     * @tc.name      ComponentCollection_ClampSlideOf_0007
     * @tc.desc      clampSlideOf(sx=10) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ClampSlideOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0007 begin`);
      const actual: number = clampSlideOf(10);
      logInfo(`clampSlideOf(sx=10): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ClampSlideOf_0007 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0008
     * @tc.name      ComponentCollection_ClampSlideOf_0008
     * @tc.desc      clampSlideOf(sx=100) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ClampSlideOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0008 begin`);
      const actual: number = clampSlideOf(100);
      logInfo(`clampSlideOf(sx=100): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ClampSlideOf_0008 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0009
     * @tc.name      ComponentCollection_ClampSlideOf_0009
     * @tc.desc      clampSlideOf(sx=5) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ClampSlideOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0009 begin`);
      const actual: number = clampSlideOf(5);
      logInfo(`clampSlideOf(sx=5): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ClampSlideOf_0009 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0010
     * @tc.name      ComponentCollection_ClampSlideOf_0010
     * @tc.desc      clampSlideOf(sx=15) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ClampSlideOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0010 begin`);
      const actual: number = clampSlideOf(15);
      logInfo(`clampSlideOf(sx=15): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ClampSlideOf_0010 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0011
     * @tc.name      ComponentCollection_ClampSlideOf_0011
     * @tc.desc      clampSlideOf(sx=20) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ClampSlideOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0011 begin`);
      const actual: number = clampSlideOf(20);
      logInfo(`clampSlideOf(sx=20): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ClampSlideOf_0011 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0012
     * @tc.name      ComponentCollection_ClampSlideOf_0012
     * @tc.desc      clampSlideOf(sx=25) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ClampSlideOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0012 begin`);
      const actual: number = clampSlideOf(25);
      logInfo(`clampSlideOf(sx=25): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ClampSlideOf_0012 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0013
     * @tc.name      ComponentCollection_ClampSlideOf_0013
     * @tc.desc      clampSlideOf(sx=30) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ClampSlideOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0013 begin`);
      const actual: number = clampSlideOf(30);
      logInfo(`clampSlideOf(sx=30): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ClampSlideOf_0013 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0014
     * @tc.name      ComponentCollection_ClampSlideOf_0014
     * @tc.desc      clampSlideOf(sx=35) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ClampSlideOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0014 begin`);
      const actual: number = clampSlideOf(35);
      logInfo(`clampSlideOf(sx=35): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ClampSlideOf_0014 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0015
     * @tc.name      ComponentCollection_ClampSlideOf_0015
     * @tc.desc      clampSlideOf(sx=40) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ClampSlideOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0015 begin`);
      const actual: number = clampSlideOf(40);
      logInfo(`clampSlideOf(sx=40): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ClampSlideOf_0015 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0016
     * @tc.name      ComponentCollection_ClampSlideOf_0016
     * @tc.desc      clampSlideOf(sx=45) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ClampSlideOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0016 begin`);
      const actual: number = clampSlideOf(45);
      logInfo(`clampSlideOf(sx=45): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ClampSlideOf_0016 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0017
     * @tc.name      ComponentCollection_ClampSlideOf_0017
     * @tc.desc      clampSlideOf(sx=50) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ClampSlideOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0017 begin`);
      const actual: number = clampSlideOf(50);
      logInfo(`clampSlideOf(sx=50): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ClampSlideOf_0017 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0018
     * @tc.name      ComponentCollection_ClampSlideOf_0018
     * @tc.desc      clampSlideOf(sx=55) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ClampSlideOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0018 begin`);
      const actual: number = clampSlideOf(55);
      logInfo(`clampSlideOf(sx=55): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ClampSlideOf_0018 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0019
     * @tc.name      ComponentCollection_ClampSlideOf_0019
     * @tc.desc      clampSlideOf(sx=60) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ClampSlideOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0019 begin`);
      const actual: number = clampSlideOf(60);
      logInfo(`clampSlideOf(sx=60): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ClampSlideOf_0019 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0020
     * @tc.name      ComponentCollection_ClampSlideOf_0020
     * @tc.desc      clampSlideOf(sx=65) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ClampSlideOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0020 begin`);
      const actual: number = clampSlideOf(65);
      logInfo(`clampSlideOf(sx=65): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ClampSlideOf_0020 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0021
     * @tc.name      ComponentCollection_ClampSlideOf_0021
     * @tc.desc      clampSlideOf(sx=70) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ClampSlideOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0021 begin`);
      const actual: number = clampSlideOf(70);
      logInfo(`clampSlideOf(sx=70): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ClampSlideOf_0021 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0022
     * @tc.name      ComponentCollection_ClampSlideOf_0022
     * @tc.desc      clampSlideOf(sx=75) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ClampSlideOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0022 begin`);
      const actual: number = clampSlideOf(75);
      logInfo(`clampSlideOf(sx=75): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ClampSlideOf_0022 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0023
     * @tc.name      ComponentCollection_ClampSlideOf_0023
     * @tc.desc      clampSlideOf(sx=80) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ClampSlideOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0023 begin`);
      const actual: number = clampSlideOf(80);
      logInfo(`clampSlideOf(sx=80): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ClampSlideOf_0023 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0024
     * @tc.name      ComponentCollection_ClampSlideOf_0024
     * @tc.desc      clampSlideOf(sx=85) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ClampSlideOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0024 begin`);
      const actual: number = clampSlideOf(85);
      logInfo(`clampSlideOf(sx=85): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ClampSlideOf_0024 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0025
     * @tc.name      ComponentCollection_ClampSlideOf_0025
     * @tc.desc      clampSlideOf(sx=90) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ClampSlideOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0025 begin`);
      const actual: number = clampSlideOf(90);
      logInfo(`clampSlideOf(sx=90): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ClampSlideOf_0025 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0026
     * @tc.name      ComponentCollection_ClampSlideOf_0026
     * @tc.desc      clampSlideOf(sx=95) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ClampSlideOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0026 begin`);
      const actual: number = clampSlideOf(95);
      logInfo(`clampSlideOf(sx=95): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ClampSlideOf_0026 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0027
     * @tc.name      ComponentCollection_ClampSlideOf_0027
     * @tc.desc      clampSlideOf(sx=105) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ClampSlideOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0027 begin`);
      const actual: number = clampSlideOf(105);
      logInfo(`clampSlideOf(sx=105): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ClampSlideOf_0027 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0028
     * @tc.name      ComponentCollection_ClampSlideOf_0028
     * @tc.desc      clampSlideOf(sx=110) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ClampSlideOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0028 begin`);
      const actual: number = clampSlideOf(110);
      logInfo(`clampSlideOf(sx=110): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ClampSlideOf_0028 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0029
     * @tc.name      ComponentCollection_ClampSlideOf_0029
     * @tc.desc      clampSlideOf(sx=115) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ClampSlideOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0029 begin`);
      const actual: number = clampSlideOf(115);
      logInfo(`clampSlideOf(sx=115): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ClampSlideOf_0029 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0030
     * @tc.name      ComponentCollection_ClampSlideOf_0030
     * @tc.desc      clampSlideOf(sx=120) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ClampSlideOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0030 begin`);
      const actual: number = clampSlideOf(120);
      logInfo(`clampSlideOf(sx=120): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ClampSlideOf_0030 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0031
     * @tc.name      ComponentCollection_ClampSlideOf_0031
     * @tc.desc      clampSlideOf(sx=125) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ClampSlideOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0031 begin`);
      const actual: number = clampSlideOf(125);
      logInfo(`clampSlideOf(sx=125): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ClampSlideOf_0031 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0032
     * @tc.name      ComponentCollection_ClampSlideOf_0032
     * @tc.desc      clampSlideOf(sx=130) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ClampSlideOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0032 begin`);
      const actual: number = clampSlideOf(130);
      logInfo(`clampSlideOf(sx=130): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ClampSlideOf_0032 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0033
     * @tc.name      ComponentCollection_ClampSlideOf_0033
     * @tc.desc      clampSlideOf(sx=135) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ClampSlideOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0033 begin`);
      const actual: number = clampSlideOf(135);
      logInfo(`clampSlideOf(sx=135): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ClampSlideOf_0033 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0034
     * @tc.name      ComponentCollection_ClampSlideOf_0034
     * @tc.desc      clampSlideOf(sx=140) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ClampSlideOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0034 begin`);
      const actual: number = clampSlideOf(140);
      logInfo(`clampSlideOf(sx=140): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ClampSlideOf_0034 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0035
     * @tc.name      ComponentCollection_ClampSlideOf_0035
     * @tc.desc      clampSlideOf(sx=145) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ClampSlideOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0035 begin`);
      const actual: number = clampSlideOf(145);
      logInfo(`clampSlideOf(sx=145): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ClampSlideOf_0035 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0036
     * @tc.name      ComponentCollection_ClampSlideOf_0036
     * @tc.desc      clampSlideOf(sx=150) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ClampSlideOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0036 begin`);
      const actual: number = clampSlideOf(150);
      logInfo(`clampSlideOf(sx=150): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ClampSlideOf_0036 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0037
     * @tc.name      ComponentCollection_ClampSlideOf_0037
     * @tc.desc      clampSlideOf(sx=155) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ClampSlideOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0037 begin`);
      const actual: number = clampSlideOf(155);
      logInfo(`clampSlideOf(sx=155): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ClampSlideOf_0037 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0038
     * @tc.name      ComponentCollection_ClampSlideOf_0038
     * @tc.desc      clampSlideOf(sx=160) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ClampSlideOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0038 begin`);
      const actual: number = clampSlideOf(160);
      logInfo(`clampSlideOf(sx=160): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ClampSlideOf_0038 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0039
     * @tc.name      ComponentCollection_ClampSlideOf_0039
     * @tc.desc      clampSlideOf(sx=165) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ClampSlideOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0039 begin`);
      const actual: number = clampSlideOf(165);
      logInfo(`clampSlideOf(sx=165): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ClampSlideOf_0039 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0040
     * @tc.name      ComponentCollection_ClampSlideOf_0040
     * @tc.desc      clampSlideOf(sx=170) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ClampSlideOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0040 begin`);
      const actual: number = clampSlideOf(170);
      logInfo(`clampSlideOf(sx=170): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ClampSlideOf_0040 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0041
     * @tc.name      ComponentCollection_ClampSlideOf_0041
     * @tc.desc      clampSlideOf(sx=175) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ClampSlideOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0041 begin`);
      const actual: number = clampSlideOf(175);
      logInfo(`clampSlideOf(sx=175): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ClampSlideOf_0041 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0042
     * @tc.name      ComponentCollection_ClampSlideOf_0042
     * @tc.desc      clampSlideOf(sx=180) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ClampSlideOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0042 begin`);
      const actual: number = clampSlideOf(180);
      logInfo(`clampSlideOf(sx=180): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ClampSlideOf_0042 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0043
     * @tc.name      ComponentCollection_ClampSlideOf_0043
     * @tc.desc      clampSlideOf(sx=185) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ClampSlideOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0043 begin`);
      const actual: number = clampSlideOf(185);
      logInfo(`clampSlideOf(sx=185): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ClampSlideOf_0043 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0044
     * @tc.name      ComponentCollection_ClampSlideOf_0044
     * @tc.desc      clampSlideOf(sx=190) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ClampSlideOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0044 begin`);
      const actual: number = clampSlideOf(190);
      logInfo(`clampSlideOf(sx=190): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ClampSlideOf_0044 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0045
     * @tc.name      ComponentCollection_ClampSlideOf_0045
     * @tc.desc      clampSlideOf(sx=195) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ClampSlideOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0045 begin`);
      const actual: number = clampSlideOf(195);
      logInfo(`clampSlideOf(sx=195): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ClampSlideOf_0045 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0046
     * @tc.name      ComponentCollection_ClampSlideOf_0046
     * @tc.desc      clampSlideOf(sx=200) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ClampSlideOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0046 begin`);
      const actual: number = clampSlideOf(200);
      logInfo(`clampSlideOf(sx=200): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ClampSlideOf_0046 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0047
     * @tc.name      ComponentCollection_ClampSlideOf_0047
     * @tc.desc      clampSlideOf(sx=-11) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_ClampSlideOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0047 begin`);
      const actual: number = clampSlideOf(-11);
      logInfo(`clampSlideOf(sx=-11): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ClampSlideOf_0047 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0048
     * @tc.name      ComponentCollection_ClampSlideOf_0048
     * @tc.desc      clampSlideOf(sx=-64) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_ClampSlideOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0048 begin`);
      const actual: number = clampSlideOf(-64);
      logInfo(`clampSlideOf(sx=-64): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ClampSlideOf_0048 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0049
     * @tc.name      ComponentCollection_ClampSlideOf_0049
     * @tc.desc      clampSlideOf(sx=74.87) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ClampSlideOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0049 begin`);
      const actual: number = clampSlideOf(74.87);
      logInfo(`clampSlideOf(sx=74.87): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ClampSlideOf_0049 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CLAMP_SLIDE_OF_0050
     * @tc.name      ComponentCollection_ClampSlideOf_0050
     * @tc.desc      clampSlideOf(sx=-77) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_ClampSlideOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClampSlideOf_0050 begin`);
      const actual: number = clampSlideOf(-77);
      logInfo(`clampSlideOf(sx=-77): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ClampSlideOf_0050 end`);
    });
  });
}
