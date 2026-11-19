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
import { isOutsideTransition } from '../model/ComponentSampleLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ComponentCollection]';
const BUNDLE: string = 'ComponentCollection_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for isOutsideTransition (50 cases). */
export default function isOutsideTransitionTest(): void {
  describe('IsOutsideTransitionTest', () => {
    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0001
     * @tc.name      ComponentCollection_IsOutsideTransition_0001
     * @tc.desc      isOutsideTransition(position=0, index=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_IsOutsideTransition_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0001 begin`);
      const actual: boolean = isOutsideTransition(0, 0);
      logInfo(`isOutsideTransition(position=0, index=0): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsOutsideTransition_0001 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0002
     * @tc.name      ComponentCollection_IsOutsideTransition_0002
     * @tc.desc      isOutsideTransition(position=0, index=-1) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_IsOutsideTransition_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0002 begin`);
      const actual: boolean = isOutsideTransition(0, -1);
      logInfo(`isOutsideTransition(position=0, index=-1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsOutsideTransition_0002 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0003
     * @tc.name      ComponentCollection_IsOutsideTransition_0003
     * @tc.desc      isOutsideTransition(position=0, index=1) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsOutsideTransition_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0003 begin`);
      const actual: boolean = isOutsideTransition(0, 1);
      logInfo(`isOutsideTransition(position=0, index=1): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsOutsideTransition_0003 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0004
     * @tc.name      ComponentCollection_IsOutsideTransition_0004
     * @tc.desc      isOutsideTransition(position=0, index=2) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsOutsideTransition_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0004 begin`);
      const actual: boolean = isOutsideTransition(0, 2);
      logInfo(`isOutsideTransition(position=0, index=2): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsOutsideTransition_0004 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0005
     * @tc.name      ComponentCollection_IsOutsideTransition_0005
     * @tc.desc      isOutsideTransition(position=0, index=5) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsOutsideTransition_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0005 begin`);
      const actual: boolean = isOutsideTransition(0, 5);
      logInfo(`isOutsideTransition(position=0, index=5): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsOutsideTransition_0005 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0006
     * @tc.name      ComponentCollection_IsOutsideTransition_0006
     * @tc.desc      isOutsideTransition(position=0, index=10) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsOutsideTransition_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0006 begin`);
      const actual: boolean = isOutsideTransition(0, 10);
      logInfo(`isOutsideTransition(position=0, index=10): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsOutsideTransition_0006 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0007
     * @tc.name      ComponentCollection_IsOutsideTransition_0007
     * @tc.desc      isOutsideTransition(position=0, index=3) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsOutsideTransition_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0007 begin`);
      const actual: boolean = isOutsideTransition(0, 3);
      logInfo(`isOutsideTransition(position=0, index=3): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsOutsideTransition_0007 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0008
     * @tc.name      ComponentCollection_IsOutsideTransition_0008
     * @tc.desc      isOutsideTransition(position=0, index=100) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsOutsideTransition_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0008 begin`);
      const actual: boolean = isOutsideTransition(0, 100);
      logInfo(`isOutsideTransition(position=0, index=100): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsOutsideTransition_0008 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0009
     * @tc.name      ComponentCollection_IsOutsideTransition_0009
     * @tc.desc      isOutsideTransition(position=0, index=15) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsOutsideTransition_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0009 begin`);
      const actual: boolean = isOutsideTransition(0, 15);
      logInfo(`isOutsideTransition(position=0, index=15): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsOutsideTransition_0009 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0010
     * @tc.name      ComponentCollection_IsOutsideTransition_0010
     * @tc.desc      isOutsideTransition(position=0, index=20) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsOutsideTransition_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0010 begin`);
      const actual: boolean = isOutsideTransition(0, 20);
      logInfo(`isOutsideTransition(position=0, index=20): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsOutsideTransition_0010 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0011
     * @tc.name      ComponentCollection_IsOutsideTransition_0011
     * @tc.desc      isOutsideTransition(position=0, index=25) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsOutsideTransition_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0011 begin`);
      const actual: boolean = isOutsideTransition(0, 25);
      logInfo(`isOutsideTransition(position=0, index=25): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsOutsideTransition_0011 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0012
     * @tc.name      ComponentCollection_IsOutsideTransition_0012
     * @tc.desc      isOutsideTransition(position=0, index=30) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsOutsideTransition_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0012 begin`);
      const actual: boolean = isOutsideTransition(0, 30);
      logInfo(`isOutsideTransition(position=0, index=30): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsOutsideTransition_0012 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0013
     * @tc.name      ComponentCollection_IsOutsideTransition_0013
     * @tc.desc      isOutsideTransition(position=0, index=35) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsOutsideTransition_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0013 begin`);
      const actual: boolean = isOutsideTransition(0, 35);
      logInfo(`isOutsideTransition(position=0, index=35): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsOutsideTransition_0013 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0014
     * @tc.name      ComponentCollection_IsOutsideTransition_0014
     * @tc.desc      isOutsideTransition(position=0, index=40) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsOutsideTransition_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0014 begin`);
      const actual: boolean = isOutsideTransition(0, 40);
      logInfo(`isOutsideTransition(position=0, index=40): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsOutsideTransition_0014 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0015
     * @tc.name      ComponentCollection_IsOutsideTransition_0015
     * @tc.desc      isOutsideTransition(position=0, index=45) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsOutsideTransition_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0015 begin`);
      const actual: boolean = isOutsideTransition(0, 45);
      logInfo(`isOutsideTransition(position=0, index=45): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsOutsideTransition_0015 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0016
     * @tc.name      ComponentCollection_IsOutsideTransition_0016
     * @tc.desc      isOutsideTransition(position=0, index=50) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsOutsideTransition_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0016 begin`);
      const actual: boolean = isOutsideTransition(0, 50);
      logInfo(`isOutsideTransition(position=0, index=50): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsOutsideTransition_0016 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0017
     * @tc.name      ComponentCollection_IsOutsideTransition_0017
     * @tc.desc      isOutsideTransition(position=0, index=55) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsOutsideTransition_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0017 begin`);
      const actual: boolean = isOutsideTransition(0, 55);
      logInfo(`isOutsideTransition(position=0, index=55): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsOutsideTransition_0017 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0018
     * @tc.name      ComponentCollection_IsOutsideTransition_0018
     * @tc.desc      isOutsideTransition(position=0, index=60) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsOutsideTransition_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0018 begin`);
      const actual: boolean = isOutsideTransition(0, 60);
      logInfo(`isOutsideTransition(position=0, index=60): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsOutsideTransition_0018 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0019
     * @tc.name      ComponentCollection_IsOutsideTransition_0019
     * @tc.desc      isOutsideTransition(position=0, index=65) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsOutsideTransition_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0019 begin`);
      const actual: boolean = isOutsideTransition(0, 65);
      logInfo(`isOutsideTransition(position=0, index=65): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsOutsideTransition_0019 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0020
     * @tc.name      ComponentCollection_IsOutsideTransition_0020
     * @tc.desc      isOutsideTransition(position=0, index=70) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsOutsideTransition_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0020 begin`);
      const actual: boolean = isOutsideTransition(0, 70);
      logInfo(`isOutsideTransition(position=0, index=70): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsOutsideTransition_0020 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0021
     * @tc.name      ComponentCollection_IsOutsideTransition_0021
     * @tc.desc      isOutsideTransition(position=0, index=75) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsOutsideTransition_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0021 begin`);
      const actual: boolean = isOutsideTransition(0, 75);
      logInfo(`isOutsideTransition(position=0, index=75): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsOutsideTransition_0021 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0022
     * @tc.name      ComponentCollection_IsOutsideTransition_0022
     * @tc.desc      isOutsideTransition(position=0, index=80) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsOutsideTransition_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0022 begin`);
      const actual: boolean = isOutsideTransition(0, 80);
      logInfo(`isOutsideTransition(position=0, index=80): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsOutsideTransition_0022 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0023
     * @tc.name      ComponentCollection_IsOutsideTransition_0023
     * @tc.desc      isOutsideTransition(position=0, index=85) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsOutsideTransition_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0023 begin`);
      const actual: boolean = isOutsideTransition(0, 85);
      logInfo(`isOutsideTransition(position=0, index=85): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsOutsideTransition_0023 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0024
     * @tc.name      ComponentCollection_IsOutsideTransition_0024
     * @tc.desc      isOutsideTransition(position=0, index=90) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsOutsideTransition_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0024 begin`);
      const actual: boolean = isOutsideTransition(0, 90);
      logInfo(`isOutsideTransition(position=0, index=90): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsOutsideTransition_0024 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0025
     * @tc.name      ComponentCollection_IsOutsideTransition_0025
     * @tc.desc      isOutsideTransition(position=0, index=95) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsOutsideTransition_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0025 begin`);
      const actual: boolean = isOutsideTransition(0, 95);
      logInfo(`isOutsideTransition(position=0, index=95): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsOutsideTransition_0025 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0026
     * @tc.name      ComponentCollection_IsOutsideTransition_0026
     * @tc.desc      isOutsideTransition(position=0, index=105) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsOutsideTransition_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0026 begin`);
      const actual: boolean = isOutsideTransition(0, 105);
      logInfo(`isOutsideTransition(position=0, index=105): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsOutsideTransition_0026 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0027
     * @tc.name      ComponentCollection_IsOutsideTransition_0027
     * @tc.desc      isOutsideTransition(position=0, index=110) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsOutsideTransition_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0027 begin`);
      const actual: boolean = isOutsideTransition(0, 110);
      logInfo(`isOutsideTransition(position=0, index=110): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsOutsideTransition_0027 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0028
     * @tc.name      ComponentCollection_IsOutsideTransition_0028
     * @tc.desc      isOutsideTransition(position=0, index=-21) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_IsOutsideTransition_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0028 begin`);
      const actual: boolean = isOutsideTransition(0, -21);
      logInfo(`isOutsideTransition(position=0, index=-21): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsOutsideTransition_0028 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0029
     * @tc.name      ComponentCollection_IsOutsideTransition_0029
     * @tc.desc      isOutsideTransition(position=0, index=-3) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_IsOutsideTransition_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0029 begin`);
      const actual: boolean = isOutsideTransition(0, -3);
      logInfo(`isOutsideTransition(position=0, index=-3): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsOutsideTransition_0029 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0030
     * @tc.name      ComponentCollection_IsOutsideTransition_0030
     * @tc.desc      isOutsideTransition(position=0, index=125) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsOutsideTransition_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0030 begin`);
      const actual: boolean = isOutsideTransition(0, 125);
      logInfo(`isOutsideTransition(position=0, index=125): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsOutsideTransition_0030 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0031
     * @tc.name      ComponentCollection_IsOutsideTransition_0031
     * @tc.desc      isOutsideTransition(position=1, index=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsOutsideTransition_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0031 begin`);
      const actual: boolean = isOutsideTransition(1, 0);
      logInfo(`isOutsideTransition(position=1, index=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsOutsideTransition_0031 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0032
     * @tc.name      ComponentCollection_IsOutsideTransition_0032
     * @tc.desc      isOutsideTransition(position=1, index=1) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsOutsideTransition_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0032 begin`);
      const actual: boolean = isOutsideTransition(1, 1);
      logInfo(`isOutsideTransition(position=1, index=1): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsOutsideTransition_0032 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0033
     * @tc.name      ComponentCollection_IsOutsideTransition_0033
     * @tc.desc      isOutsideTransition(position=1, index=2) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsOutsideTransition_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0033 begin`);
      const actual: boolean = isOutsideTransition(1, 2);
      logInfo(`isOutsideTransition(position=1, index=2): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsOutsideTransition_0033 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0034
     * @tc.name      ComponentCollection_IsOutsideTransition_0034
     * @tc.desc      isOutsideTransition(position=1, index=-1) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_IsOutsideTransition_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0034 begin`);
      const actual: boolean = isOutsideTransition(1, -1);
      logInfo(`isOutsideTransition(position=1, index=-1): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsOutsideTransition_0034 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0035
     * @tc.name      ComponentCollection_IsOutsideTransition_0035
     * @tc.desc      isOutsideTransition(position=1, index=5) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsOutsideTransition_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0035 begin`);
      const actual: boolean = isOutsideTransition(1, 5);
      logInfo(`isOutsideTransition(position=1, index=5): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsOutsideTransition_0035 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0036
     * @tc.name      ComponentCollection_IsOutsideTransition_0036
     * @tc.desc      isOutsideTransition(position=1, index=10) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsOutsideTransition_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0036 begin`);
      const actual: boolean = isOutsideTransition(1, 10);
      logInfo(`isOutsideTransition(position=1, index=10): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsOutsideTransition_0036 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0037
     * @tc.name      ComponentCollection_IsOutsideTransition_0037
     * @tc.desc      isOutsideTransition(position=1, index=3) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsOutsideTransition_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0037 begin`);
      const actual: boolean = isOutsideTransition(1, 3);
      logInfo(`isOutsideTransition(position=1, index=3): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsOutsideTransition_0037 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0038
     * @tc.name      ComponentCollection_IsOutsideTransition_0038
     * @tc.desc      isOutsideTransition(position=1, index=100) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsOutsideTransition_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0038 begin`);
      const actual: boolean = isOutsideTransition(1, 100);
      logInfo(`isOutsideTransition(position=1, index=100): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsOutsideTransition_0038 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0039
     * @tc.name      ComponentCollection_IsOutsideTransition_0039
     * @tc.desc      isOutsideTransition(position=1, index=15) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsOutsideTransition_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0039 begin`);
      const actual: boolean = isOutsideTransition(1, 15);
      logInfo(`isOutsideTransition(position=1, index=15): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsOutsideTransition_0039 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0040
     * @tc.name      ComponentCollection_IsOutsideTransition_0040
     * @tc.desc      isOutsideTransition(position=1, index=20) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsOutsideTransition_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0040 begin`);
      const actual: boolean = isOutsideTransition(1, 20);
      logInfo(`isOutsideTransition(position=1, index=20): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsOutsideTransition_0040 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0041
     * @tc.name      ComponentCollection_IsOutsideTransition_0041
     * @tc.desc      isOutsideTransition(position=1, index=25) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsOutsideTransition_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0041 begin`);
      const actual: boolean = isOutsideTransition(1, 25);
      logInfo(`isOutsideTransition(position=1, index=25): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsOutsideTransition_0041 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0042
     * @tc.name      ComponentCollection_IsOutsideTransition_0042
     * @tc.desc      isOutsideTransition(position=1, index=30) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsOutsideTransition_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0042 begin`);
      const actual: boolean = isOutsideTransition(1, 30);
      logInfo(`isOutsideTransition(position=1, index=30): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsOutsideTransition_0042 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0043
     * @tc.name      ComponentCollection_IsOutsideTransition_0043
     * @tc.desc      isOutsideTransition(position=1, index=35) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsOutsideTransition_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0043 begin`);
      const actual: boolean = isOutsideTransition(1, 35);
      logInfo(`isOutsideTransition(position=1, index=35): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsOutsideTransition_0043 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0044
     * @tc.name      ComponentCollection_IsOutsideTransition_0044
     * @tc.desc      isOutsideTransition(position=1, index=40) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsOutsideTransition_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0044 begin`);
      const actual: boolean = isOutsideTransition(1, 40);
      logInfo(`isOutsideTransition(position=1, index=40): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsOutsideTransition_0044 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0045
     * @tc.name      ComponentCollection_IsOutsideTransition_0045
     * @tc.desc      isOutsideTransition(position=1, index=45) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsOutsideTransition_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0045 begin`);
      const actual: boolean = isOutsideTransition(1, 45);
      logInfo(`isOutsideTransition(position=1, index=45): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsOutsideTransition_0045 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0046
     * @tc.name      ComponentCollection_IsOutsideTransition_0046
     * @tc.desc      isOutsideTransition(position=1, index=50) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsOutsideTransition_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0046 begin`);
      const actual: boolean = isOutsideTransition(1, 50);
      logInfo(`isOutsideTransition(position=1, index=50): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsOutsideTransition_0046 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0047
     * @tc.name      ComponentCollection_IsOutsideTransition_0047
     * @tc.desc      isOutsideTransition(position=1, index=55) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsOutsideTransition_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0047 begin`);
      const actual: boolean = isOutsideTransition(1, 55);
      logInfo(`isOutsideTransition(position=1, index=55): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsOutsideTransition_0047 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0048
     * @tc.name      ComponentCollection_IsOutsideTransition_0048
     * @tc.desc      isOutsideTransition(position=1, index=60) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsOutsideTransition_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0048 begin`);
      const actual: boolean = isOutsideTransition(1, 60);
      logInfo(`isOutsideTransition(position=1, index=60): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsOutsideTransition_0048 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0049
     * @tc.name      ComponentCollection_IsOutsideTransition_0049
     * @tc.desc      isOutsideTransition(position=1, index=65) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsOutsideTransition_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0049 begin`);
      const actual: boolean = isOutsideTransition(1, 65);
      logInfo(`isOutsideTransition(position=1, index=65): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsOutsideTransition_0049 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_IS_OUTSIDE_TRANSITION_0050
     * @tc.name      ComponentCollection_IsOutsideTransition_0050
     * @tc.desc      isOutsideTransition(position=1, index=70) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_IsOutsideTransition_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsOutsideTransition_0050 begin`);
      const actual: boolean = isOutsideTransition(1, 70);
      logInfo(`isOutsideTransition(position=1, index=70): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsOutsideTransition_0050 end`);
    });
  });
}
