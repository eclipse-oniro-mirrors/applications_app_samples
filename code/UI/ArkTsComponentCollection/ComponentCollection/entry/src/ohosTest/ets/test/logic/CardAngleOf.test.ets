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
import { cardAngleOf } from '../model/ComponentSampleLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ComponentCollection]';
const BUNDLE: string = 'ComponentCollection_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for cardAngleOf (50 cases). */
export default function cardAngleOfTest(): void {
  describe('CardAngleOfTest', () => {
    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0001
     * @tc.name      ComponentCollection_CardAngleOf_0001
     * @tc.desc      cardAngleOf(sx=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_CardAngleOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CardAngleOf_0001 begin`);
      const actual: number = cardAngleOf(1);
      logInfo(`cardAngleOf(sx=1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CardAngleOf_0001 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0002
     * @tc.name      ComponentCollection_CardAngleOf_0002
     * @tc.desc      cardAngleOf(sx=0) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_CardAngleOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CardAngleOf_0002 begin`);
      const actual: number = cardAngleOf(0);
      logInfo(`cardAngleOf(sx=0): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CardAngleOf_0002 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0003
     * @tc.name      ComponentCollection_CardAngleOf_0003
     * @tc.desc      cardAngleOf(sx=2) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardAngleOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardAngleOf_0003 begin`);
      const actual: number = cardAngleOf(2);
      logInfo(`cardAngleOf(sx=2): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CardAngleOf_0003 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0004
     * @tc.name      ComponentCollection_CardAngleOf_0004
     * @tc.desc      cardAngleOf(sx=30) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardAngleOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardAngleOf_0004 begin`);
      const actual: number = cardAngleOf(30);
      logInfo(`cardAngleOf(sx=30): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CardAngleOf_0004 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0005
     * @tc.name      ComponentCollection_CardAngleOf_0005
     * @tc.desc      cardAngleOf(sx=29) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardAngleOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardAngleOf_0005 begin`);
      const actual: number = cardAngleOf(29);
      logInfo(`cardAngleOf(sx=29): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CardAngleOf_0005 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0006
     * @tc.name      ComponentCollection_CardAngleOf_0006
     * @tc.desc      cardAngleOf(sx=31) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardAngleOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardAngleOf_0006 begin`);
      const actual: number = cardAngleOf(31);
      logInfo(`cardAngleOf(sx=31): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CardAngleOf_0006 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0007
     * @tc.name      ComponentCollection_CardAngleOf_0007
     * @tc.desc      cardAngleOf(sx=60) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardAngleOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardAngleOf_0007 begin`);
      const actual: number = cardAngleOf(60);
      logInfo(`cardAngleOf(sx=60): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CardAngleOf_0007 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0008
     * @tc.name      ComponentCollection_CardAngleOf_0008
     * @tc.desc      cardAngleOf(sx=15) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardAngleOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardAngleOf_0008 begin`);
      const actual: number = cardAngleOf(15);
      logInfo(`cardAngleOf(sx=15): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CardAngleOf_0008 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0009
     * @tc.name      ComponentCollection_CardAngleOf_0009
     * @tc.desc      cardAngleOf(sx=3) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardAngleOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardAngleOf_0009 begin`);
      const actual: number = cardAngleOf(3);
      logInfo(`cardAngleOf(sx=3): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CardAngleOf_0009 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0010
     * @tc.name      ComponentCollection_CardAngleOf_0010
     * @tc.desc      cardAngleOf(sx=90) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardAngleOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardAngleOf_0010 begin`);
      const actual: number = cardAngleOf(90);
      logInfo(`cardAngleOf(sx=90): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CardAngleOf_0010 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0011
     * @tc.name      ComponentCollection_CardAngleOf_0011
     * @tc.desc      cardAngleOf(sx=89) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardAngleOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardAngleOf_0011 begin`);
      const actual: number = cardAngleOf(89);
      logInfo(`cardAngleOf(sx=89): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CardAngleOf_0011 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0012
     * @tc.name      ComponentCollection_CardAngleOf_0012
     * @tc.desc      cardAngleOf(sx=91) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardAngleOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardAngleOf_0012 begin`);
      const actual: number = cardAngleOf(91);
      logInfo(`cardAngleOf(sx=91): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CardAngleOf_0012 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0013
     * @tc.name      ComponentCollection_CardAngleOf_0013
     * @tc.desc      cardAngleOf(sx=180) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardAngleOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardAngleOf_0013 begin`);
      const actual: number = cardAngleOf(180);
      logInfo(`cardAngleOf(sx=180): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CardAngleOf_0013 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0014
     * @tc.name      ComponentCollection_CardAngleOf_0014
     * @tc.desc      cardAngleOf(sx=45) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardAngleOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardAngleOf_0014 begin`);
      const actual: number = cardAngleOf(45);
      logInfo(`cardAngleOf(sx=45): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CardAngleOf_0014 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0015
     * @tc.name      ComponentCollection_CardAngleOf_0015
     * @tc.desc      cardAngleOf(sx=-1) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_CardAngleOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CardAngleOf_0015 begin`);
      const actual: number = cardAngleOf(-1);
      logInfo(`cardAngleOf(sx=-1): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CardAngleOf_0015 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0016
     * @tc.name      ComponentCollection_CardAngleOf_0016
     * @tc.desc      cardAngleOf(sx=10) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardAngleOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardAngleOf_0016 begin`);
      const actual: number = cardAngleOf(10);
      logInfo(`cardAngleOf(sx=10): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CardAngleOf_0016 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0017
     * @tc.name      ComponentCollection_CardAngleOf_0017
     * @tc.desc      cardAngleOf(sx=100) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardAngleOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardAngleOf_0017 begin`);
      const actual: number = cardAngleOf(100);
      logInfo(`cardAngleOf(sx=100): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CardAngleOf_0017 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0018
     * @tc.name      ComponentCollection_CardAngleOf_0018
     * @tc.desc      cardAngleOf(sx=9) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardAngleOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardAngleOf_0018 begin`);
      const actual: number = cardAngleOf(9);
      logInfo(`cardAngleOf(sx=9): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CardAngleOf_0018 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0019
     * @tc.name      ComponentCollection_CardAngleOf_0019
     * @tc.desc      cardAngleOf(sx=18) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardAngleOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardAngleOf_0019 begin`);
      const actual: number = cardAngleOf(18);
      logInfo(`cardAngleOf(sx=18): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CardAngleOf_0019 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0020
     * @tc.name      ComponentCollection_CardAngleOf_0020
     * @tc.desc      cardAngleOf(sx=27) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardAngleOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardAngleOf_0020 begin`);
      const actual: number = cardAngleOf(27);
      logInfo(`cardAngleOf(sx=27): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CardAngleOf_0020 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0021
     * @tc.name      ComponentCollection_CardAngleOf_0021
     * @tc.desc      cardAngleOf(sx=36) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardAngleOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardAngleOf_0021 begin`);
      const actual: number = cardAngleOf(36);
      logInfo(`cardAngleOf(sx=36): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CardAngleOf_0021 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0022
     * @tc.name      ComponentCollection_CardAngleOf_0022
     * @tc.desc      cardAngleOf(sx=54) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardAngleOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardAngleOf_0022 begin`);
      const actual: number = cardAngleOf(54);
      logInfo(`cardAngleOf(sx=54): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CardAngleOf_0022 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0023
     * @tc.name      ComponentCollection_CardAngleOf_0023
     * @tc.desc      cardAngleOf(sx=63) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardAngleOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardAngleOf_0023 begin`);
      const actual: number = cardAngleOf(63);
      logInfo(`cardAngleOf(sx=63): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CardAngleOf_0023 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0024
     * @tc.name      ComponentCollection_CardAngleOf_0024
     * @tc.desc      cardAngleOf(sx=72) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardAngleOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardAngleOf_0024 begin`);
      const actual: number = cardAngleOf(72);
      logInfo(`cardAngleOf(sx=72): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CardAngleOf_0024 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0025
     * @tc.name      ComponentCollection_CardAngleOf_0025
     * @tc.desc      cardAngleOf(sx=81) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardAngleOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardAngleOf_0025 begin`);
      const actual: number = cardAngleOf(81);
      logInfo(`cardAngleOf(sx=81): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CardAngleOf_0025 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0026
     * @tc.name      ComponentCollection_CardAngleOf_0026
     * @tc.desc      cardAngleOf(sx=99) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardAngleOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardAngleOf_0026 begin`);
      const actual: number = cardAngleOf(99);
      logInfo(`cardAngleOf(sx=99): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CardAngleOf_0026 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0027
     * @tc.name      ComponentCollection_CardAngleOf_0027
     * @tc.desc      cardAngleOf(sx=108) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardAngleOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardAngleOf_0027 begin`);
      const actual: number = cardAngleOf(108);
      logInfo(`cardAngleOf(sx=108): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CardAngleOf_0027 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0028
     * @tc.name      ComponentCollection_CardAngleOf_0028
     * @tc.desc      cardAngleOf(sx=117) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardAngleOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardAngleOf_0028 begin`);
      const actual: number = cardAngleOf(117);
      logInfo(`cardAngleOf(sx=117): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CardAngleOf_0028 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0029
     * @tc.name      ComponentCollection_CardAngleOf_0029
     * @tc.desc      cardAngleOf(sx=126) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardAngleOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardAngleOf_0029 begin`);
      const actual: number = cardAngleOf(126);
      logInfo(`cardAngleOf(sx=126): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CardAngleOf_0029 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0030
     * @tc.name      ComponentCollection_CardAngleOf_0030
     * @tc.desc      cardAngleOf(sx=135) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardAngleOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardAngleOf_0030 begin`);
      const actual: number = cardAngleOf(135);
      logInfo(`cardAngleOf(sx=135): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CardAngleOf_0030 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0031
     * @tc.name      ComponentCollection_CardAngleOf_0031
     * @tc.desc      cardAngleOf(sx=144) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardAngleOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardAngleOf_0031 begin`);
      const actual: number = cardAngleOf(144);
      logInfo(`cardAngleOf(sx=144): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CardAngleOf_0031 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0032
     * @tc.name      ComponentCollection_CardAngleOf_0032
     * @tc.desc      cardAngleOf(sx=153) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardAngleOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardAngleOf_0032 begin`);
      const actual: number = cardAngleOf(153);
      logInfo(`cardAngleOf(sx=153): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CardAngleOf_0032 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0033
     * @tc.name      ComponentCollection_CardAngleOf_0033
     * @tc.desc      cardAngleOf(sx=162) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardAngleOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardAngleOf_0033 begin`);
      const actual: number = cardAngleOf(162);
      logInfo(`cardAngleOf(sx=162): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CardAngleOf_0033 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0034
     * @tc.name      ComponentCollection_CardAngleOf_0034
     * @tc.desc      cardAngleOf(sx=171) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardAngleOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardAngleOf_0034 begin`);
      const actual: number = cardAngleOf(171);
      logInfo(`cardAngleOf(sx=171): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CardAngleOf_0034 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0035
     * @tc.name      ComponentCollection_CardAngleOf_0035
     * @tc.desc      cardAngleOf(sx=189) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardAngleOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardAngleOf_0035 begin`);
      const actual: number = cardAngleOf(189);
      logInfo(`cardAngleOf(sx=189): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CardAngleOf_0035 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0036
     * @tc.name      ComponentCollection_CardAngleOf_0036
     * @tc.desc      cardAngleOf(sx=198) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardAngleOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardAngleOf_0036 begin`);
      const actual: number = cardAngleOf(198);
      logInfo(`cardAngleOf(sx=198): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CardAngleOf_0036 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0037
     * @tc.name      ComponentCollection_CardAngleOf_0037
     * @tc.desc      cardAngleOf(sx=207) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardAngleOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardAngleOf_0037 begin`);
      const actual: number = cardAngleOf(207);
      logInfo(`cardAngleOf(sx=207): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CardAngleOf_0037 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0038
     * @tc.name      ComponentCollection_CardAngleOf_0038
     * @tc.desc      cardAngleOf(sx=216) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardAngleOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardAngleOf_0038 begin`);
      const actual: number = cardAngleOf(216);
      logInfo(`cardAngleOf(sx=216): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CardAngleOf_0038 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0039
     * @tc.name      ComponentCollection_CardAngleOf_0039
     * @tc.desc      cardAngleOf(sx=225) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardAngleOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardAngleOf_0039 begin`);
      const actual: number = cardAngleOf(225);
      logInfo(`cardAngleOf(sx=225): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CardAngleOf_0039 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0040
     * @tc.name      ComponentCollection_CardAngleOf_0040
     * @tc.desc      cardAngleOf(sx=234) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardAngleOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardAngleOf_0040 begin`);
      const actual: number = cardAngleOf(234);
      logInfo(`cardAngleOf(sx=234): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CardAngleOf_0040 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0041
     * @tc.name      ComponentCollection_CardAngleOf_0041
     * @tc.desc      cardAngleOf(sx=243) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardAngleOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardAngleOf_0041 begin`);
      const actual: number = cardAngleOf(243);
      logInfo(`cardAngleOf(sx=243): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CardAngleOf_0041 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0042
     * @tc.name      ComponentCollection_CardAngleOf_0042
     * @tc.desc      cardAngleOf(sx=252) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardAngleOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardAngleOf_0042 begin`);
      const actual: number = cardAngleOf(252);
      logInfo(`cardAngleOf(sx=252): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CardAngleOf_0042 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0043
     * @tc.name      ComponentCollection_CardAngleOf_0043
     * @tc.desc      cardAngleOf(sx=261) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardAngleOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardAngleOf_0043 begin`);
      const actual: number = cardAngleOf(261);
      logInfo(`cardAngleOf(sx=261): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CardAngleOf_0043 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0044
     * @tc.name      ComponentCollection_CardAngleOf_0044
     * @tc.desc      cardAngleOf(sx=270) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardAngleOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardAngleOf_0044 begin`);
      const actual: number = cardAngleOf(270);
      logInfo(`cardAngleOf(sx=270): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CardAngleOf_0044 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0045
     * @tc.name      ComponentCollection_CardAngleOf_0045
     * @tc.desc      cardAngleOf(sx=279) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardAngleOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardAngleOf_0045 begin`);
      const actual: number = cardAngleOf(279);
      logInfo(`cardAngleOf(sx=279): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CardAngleOf_0045 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0046
     * @tc.name      ComponentCollection_CardAngleOf_0046
     * @tc.desc      cardAngleOf(sx=288) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardAngleOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardAngleOf_0046 begin`);
      const actual: number = cardAngleOf(288);
      logInfo(`cardAngleOf(sx=288): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CardAngleOf_0046 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0047
     * @tc.name      ComponentCollection_CardAngleOf_0047
     * @tc.desc      cardAngleOf(sx=297) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardAngleOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardAngleOf_0047 begin`);
      const actual: number = cardAngleOf(297);
      logInfo(`cardAngleOf(sx=297): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CardAngleOf_0047 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0048
     * @tc.name      ComponentCollection_CardAngleOf_0048
     * @tc.desc      cardAngleOf(sx=306) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardAngleOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardAngleOf_0048 begin`);
      const actual: number = cardAngleOf(306);
      logInfo(`cardAngleOf(sx=306): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CardAngleOf_0048 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0049
     * @tc.name      ComponentCollection_CardAngleOf_0049
     * @tc.desc      cardAngleOf(sx=315) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardAngleOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardAngleOf_0049 begin`);
      const actual: number = cardAngleOf(315);
      logInfo(`cardAngleOf(sx=315): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CardAngleOf_0049 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_ANGLE_OF_0050
     * @tc.name      ComponentCollection_CardAngleOf_0050
     * @tc.desc      cardAngleOf(sx=324) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardAngleOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardAngleOf_0050 begin`);
      const actual: number = cardAngleOf(324);
      logInfo(`cardAngleOf(sx=324): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CardAngleOf_0050 end`);
    });
  });
}
