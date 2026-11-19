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
import { cardScaleOf } from '../model/ComponentSampleLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ComponentCollection]';
const BUNDLE: string = 'ComponentCollection_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for cardScaleOf (50 cases). */
export default function cardScaleOfTest(): void {
  describe('CardScaleOfTest', () => {
    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0001
     * @tc.name      ComponentCollection_CardScaleOf_0001
     * @tc.desc      cardScaleOf(sx=7) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_CardScaleOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CardScaleOf_0001 begin`);
      const actual: number = cardScaleOf(7);
      logInfo(`cardScaleOf(sx=7): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CardScaleOf_0001 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0002
     * @tc.name      ComponentCollection_CardScaleOf_0002
     * @tc.desc      cardScaleOf(sx=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_CardScaleOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CardScaleOf_0002 begin`);
      const actual: number = cardScaleOf(0);
      logInfo(`cardScaleOf(sx=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CardScaleOf_0002 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0003
     * @tc.name      ComponentCollection_CardScaleOf_0003
     * @tc.desc      cardScaleOf(sx=0.58) returns 0.02207984167551999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardScaleOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardScaleOf_0003 begin`);
      const actual: number = cardScaleOf(0.58);
      logInfo(`cardScaleOf(sx=0.58): actual=${actual}`);
      expect(actual).assertClose(0.02207984167551999, PRECISION);
      logInfo(`${BUNDLE}CardScaleOf_0003 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0004
     * @tc.name      ComponentCollection_CardScaleOf_0004
     * @tc.desc      cardScaleOf(sx=6) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardScaleOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardScaleOf_0004 begin`);
      const actual: number = cardScaleOf(6);
      logInfo(`cardScaleOf(sx=6): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CardScaleOf_0004 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0005
     * @tc.name      ComponentCollection_CardScaleOf_0005
     * @tc.desc      cardScaleOf(sx=8) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardScaleOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardScaleOf_0005 begin`);
      const actual: number = cardScaleOf(8);
      logInfo(`cardScaleOf(sx=8): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CardScaleOf_0005 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0006
     * @tc.name      ComponentCollection_CardScaleOf_0006
     * @tc.desc      cardScaleOf(sx=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardScaleOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardScaleOf_0006 begin`);
      const actual: number = cardScaleOf(1);
      logInfo(`cardScaleOf(sx=1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CardScaleOf_0006 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0007
     * @tc.name      ComponentCollection_CardScaleOf_0007
     * @tc.desc      cardScaleOf(sx=2) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardScaleOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardScaleOf_0007 begin`);
      const actual: number = cardScaleOf(2);
      logInfo(`cardScaleOf(sx=2): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CardScaleOf_0007 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0008
     * @tc.name      ComponentCollection_CardScaleOf_0008
     * @tc.desc      cardScaleOf(sx=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardScaleOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardScaleOf_0008 begin`);
      const actual: number = cardScaleOf(-1);
      logInfo(`cardScaleOf(sx=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CardScaleOf_0008 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0009
     * @tc.name      ComponentCollection_CardScaleOf_0009
     * @tc.desc      cardScaleOf(sx=3) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardScaleOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardScaleOf_0009 begin`);
      const actual: number = cardScaleOf(3);
      logInfo(`cardScaleOf(sx=3): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CardScaleOf_0009 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0010
     * @tc.name      ComponentCollection_CardScaleOf_0010
     * @tc.desc      cardScaleOf(sx=10) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardScaleOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardScaleOf_0010 begin`);
      const actual: number = cardScaleOf(10);
      logInfo(`cardScaleOf(sx=10): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CardScaleOf_0010 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0011
     * @tc.name      ComponentCollection_CardScaleOf_0011
     * @tc.desc      cardScaleOf(sx=100) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardScaleOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardScaleOf_0011 begin`);
      const actual: number = cardScaleOf(100);
      logInfo(`cardScaleOf(sx=100): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CardScaleOf_0011 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0012
     * @tc.name      ComponentCollection_CardScaleOf_0012
     * @tc.desc      cardScaleOf(sx=5) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardScaleOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardScaleOf_0012 begin`);
      const actual: number = cardScaleOf(5);
      logInfo(`cardScaleOf(sx=5): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CardScaleOf_0012 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0013
     * @tc.name      ComponentCollection_CardScaleOf_0013
     * @tc.desc      cardScaleOf(sx=15) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardScaleOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardScaleOf_0013 begin`);
      const actual: number = cardScaleOf(15);
      logInfo(`cardScaleOf(sx=15): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CardScaleOf_0013 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0014
     * @tc.name      ComponentCollection_CardScaleOf_0014
     * @tc.desc      cardScaleOf(sx=20) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardScaleOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardScaleOf_0014 begin`);
      const actual: number = cardScaleOf(20);
      logInfo(`cardScaleOf(sx=20): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CardScaleOf_0014 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0015
     * @tc.name      ComponentCollection_CardScaleOf_0015
     * @tc.desc      cardScaleOf(sx=25) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardScaleOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardScaleOf_0015 begin`);
      const actual: number = cardScaleOf(25);
      logInfo(`cardScaleOf(sx=25): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CardScaleOf_0015 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0016
     * @tc.name      ComponentCollection_CardScaleOf_0016
     * @tc.desc      cardScaleOf(sx=30) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardScaleOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardScaleOf_0016 begin`);
      const actual: number = cardScaleOf(30);
      logInfo(`cardScaleOf(sx=30): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CardScaleOf_0016 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0017
     * @tc.name      ComponentCollection_CardScaleOf_0017
     * @tc.desc      cardScaleOf(sx=35) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardScaleOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardScaleOf_0017 begin`);
      const actual: number = cardScaleOf(35);
      logInfo(`cardScaleOf(sx=35): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CardScaleOf_0017 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0018
     * @tc.name      ComponentCollection_CardScaleOf_0018
     * @tc.desc      cardScaleOf(sx=40) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardScaleOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardScaleOf_0018 begin`);
      const actual: number = cardScaleOf(40);
      logInfo(`cardScaleOf(sx=40): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CardScaleOf_0018 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0019
     * @tc.name      ComponentCollection_CardScaleOf_0019
     * @tc.desc      cardScaleOf(sx=45) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardScaleOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardScaleOf_0019 begin`);
      const actual: number = cardScaleOf(45);
      logInfo(`cardScaleOf(sx=45): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CardScaleOf_0019 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0020
     * @tc.name      ComponentCollection_CardScaleOf_0020
     * @tc.desc      cardScaleOf(sx=50) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardScaleOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardScaleOf_0020 begin`);
      const actual: number = cardScaleOf(50);
      logInfo(`cardScaleOf(sx=50): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CardScaleOf_0020 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0021
     * @tc.name      ComponentCollection_CardScaleOf_0021
     * @tc.desc      cardScaleOf(sx=55) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardScaleOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardScaleOf_0021 begin`);
      const actual: number = cardScaleOf(55);
      logInfo(`cardScaleOf(sx=55): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CardScaleOf_0021 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0022
     * @tc.name      ComponentCollection_CardScaleOf_0022
     * @tc.desc      cardScaleOf(sx=60) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardScaleOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardScaleOf_0022 begin`);
      const actual: number = cardScaleOf(60);
      logInfo(`cardScaleOf(sx=60): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CardScaleOf_0022 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0023
     * @tc.name      ComponentCollection_CardScaleOf_0023
     * @tc.desc      cardScaleOf(sx=65) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardScaleOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardScaleOf_0023 begin`);
      const actual: number = cardScaleOf(65);
      logInfo(`cardScaleOf(sx=65): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CardScaleOf_0023 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0024
     * @tc.name      ComponentCollection_CardScaleOf_0024
     * @tc.desc      cardScaleOf(sx=70) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardScaleOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardScaleOf_0024 begin`);
      const actual: number = cardScaleOf(70);
      logInfo(`cardScaleOf(sx=70): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CardScaleOf_0024 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0025
     * @tc.name      ComponentCollection_CardScaleOf_0025
     * @tc.desc      cardScaleOf(sx=75) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardScaleOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardScaleOf_0025 begin`);
      const actual: number = cardScaleOf(75);
      logInfo(`cardScaleOf(sx=75): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CardScaleOf_0025 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0026
     * @tc.name      ComponentCollection_CardScaleOf_0026
     * @tc.desc      cardScaleOf(sx=80) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardScaleOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardScaleOf_0026 begin`);
      const actual: number = cardScaleOf(80);
      logInfo(`cardScaleOf(sx=80): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CardScaleOf_0026 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0027
     * @tc.name      ComponentCollection_CardScaleOf_0027
     * @tc.desc      cardScaleOf(sx=85) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardScaleOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardScaleOf_0027 begin`);
      const actual: number = cardScaleOf(85);
      logInfo(`cardScaleOf(sx=85): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CardScaleOf_0027 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0028
     * @tc.name      ComponentCollection_CardScaleOf_0028
     * @tc.desc      cardScaleOf(sx=90) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardScaleOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardScaleOf_0028 begin`);
      const actual: number = cardScaleOf(90);
      logInfo(`cardScaleOf(sx=90): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CardScaleOf_0028 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0029
     * @tc.name      ComponentCollection_CardScaleOf_0029
     * @tc.desc      cardScaleOf(sx=95) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardScaleOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardScaleOf_0029 begin`);
      const actual: number = cardScaleOf(95);
      logInfo(`cardScaleOf(sx=95): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CardScaleOf_0029 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0030
     * @tc.name      ComponentCollection_CardScaleOf_0030
     * @tc.desc      cardScaleOf(sx=105) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardScaleOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardScaleOf_0030 begin`);
      const actual: number = cardScaleOf(105);
      logInfo(`cardScaleOf(sx=105): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CardScaleOf_0030 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0031
     * @tc.name      ComponentCollection_CardScaleOf_0031
     * @tc.desc      cardScaleOf(sx=110) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardScaleOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardScaleOf_0031 begin`);
      const actual: number = cardScaleOf(110);
      logInfo(`cardScaleOf(sx=110): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CardScaleOf_0031 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0032
     * @tc.name      ComponentCollection_CardScaleOf_0032
     * @tc.desc      cardScaleOf(sx=115) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardScaleOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardScaleOf_0032 begin`);
      const actual: number = cardScaleOf(115);
      logInfo(`cardScaleOf(sx=115): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CardScaleOf_0032 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0033
     * @tc.name      ComponentCollection_CardScaleOf_0033
     * @tc.desc      cardScaleOf(sx=120) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardScaleOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardScaleOf_0033 begin`);
      const actual: number = cardScaleOf(120);
      logInfo(`cardScaleOf(sx=120): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CardScaleOf_0033 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0034
     * @tc.name      ComponentCollection_CardScaleOf_0034
     * @tc.desc      cardScaleOf(sx=125) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardScaleOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardScaleOf_0034 begin`);
      const actual: number = cardScaleOf(125);
      logInfo(`cardScaleOf(sx=125): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CardScaleOf_0034 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0035
     * @tc.name      ComponentCollection_CardScaleOf_0035
     * @tc.desc      cardScaleOf(sx=130) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardScaleOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardScaleOf_0035 begin`);
      const actual: number = cardScaleOf(130);
      logInfo(`cardScaleOf(sx=130): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CardScaleOf_0035 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0036
     * @tc.name      ComponentCollection_CardScaleOf_0036
     * @tc.desc      cardScaleOf(sx=135) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardScaleOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardScaleOf_0036 begin`);
      const actual: number = cardScaleOf(135);
      logInfo(`cardScaleOf(sx=135): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CardScaleOf_0036 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0037
     * @tc.name      ComponentCollection_CardScaleOf_0037
     * @tc.desc      cardScaleOf(sx=140) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardScaleOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardScaleOf_0037 begin`);
      const actual: number = cardScaleOf(140);
      logInfo(`cardScaleOf(sx=140): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CardScaleOf_0037 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0038
     * @tc.name      ComponentCollection_CardScaleOf_0038
     * @tc.desc      cardScaleOf(sx=145) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardScaleOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardScaleOf_0038 begin`);
      const actual: number = cardScaleOf(145);
      logInfo(`cardScaleOf(sx=145): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CardScaleOf_0038 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0039
     * @tc.name      ComponentCollection_CardScaleOf_0039
     * @tc.desc      cardScaleOf(sx=150) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardScaleOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardScaleOf_0039 begin`);
      const actual: number = cardScaleOf(150);
      logInfo(`cardScaleOf(sx=150): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CardScaleOf_0039 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0040
     * @tc.name      ComponentCollection_CardScaleOf_0040
     * @tc.desc      cardScaleOf(sx=155) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardScaleOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardScaleOf_0040 begin`);
      const actual: number = cardScaleOf(155);
      logInfo(`cardScaleOf(sx=155): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CardScaleOf_0040 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0041
     * @tc.name      ComponentCollection_CardScaleOf_0041
     * @tc.desc      cardScaleOf(sx=160) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardScaleOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardScaleOf_0041 begin`);
      const actual: number = cardScaleOf(160);
      logInfo(`cardScaleOf(sx=160): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CardScaleOf_0041 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0042
     * @tc.name      ComponentCollection_CardScaleOf_0042
     * @tc.desc      cardScaleOf(sx=165) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardScaleOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardScaleOf_0042 begin`);
      const actual: number = cardScaleOf(165);
      logInfo(`cardScaleOf(sx=165): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CardScaleOf_0042 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0043
     * @tc.name      ComponentCollection_CardScaleOf_0043
     * @tc.desc      cardScaleOf(sx=170) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardScaleOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardScaleOf_0043 begin`);
      const actual: number = cardScaleOf(170);
      logInfo(`cardScaleOf(sx=170): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CardScaleOf_0043 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0044
     * @tc.name      ComponentCollection_CardScaleOf_0044
     * @tc.desc      cardScaleOf(sx=175) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardScaleOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardScaleOf_0044 begin`);
      const actual: number = cardScaleOf(175);
      logInfo(`cardScaleOf(sx=175): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CardScaleOf_0044 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0045
     * @tc.name      ComponentCollection_CardScaleOf_0045
     * @tc.desc      cardScaleOf(sx=180) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardScaleOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardScaleOf_0045 begin`);
      const actual: number = cardScaleOf(180);
      logInfo(`cardScaleOf(sx=180): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CardScaleOf_0045 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0046
     * @tc.name      ComponentCollection_CardScaleOf_0046
     * @tc.desc      cardScaleOf(sx=185) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardScaleOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardScaleOf_0046 begin`);
      const actual: number = cardScaleOf(185);
      logInfo(`cardScaleOf(sx=185): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CardScaleOf_0046 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0047
     * @tc.name      ComponentCollection_CardScaleOf_0047
     * @tc.desc      cardScaleOf(sx=190) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardScaleOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardScaleOf_0047 begin`);
      const actual: number = cardScaleOf(190);
      logInfo(`cardScaleOf(sx=190): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CardScaleOf_0047 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0048
     * @tc.name      ComponentCollection_CardScaleOf_0048
     * @tc.desc      cardScaleOf(sx=195) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardScaleOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardScaleOf_0048 begin`);
      const actual: number = cardScaleOf(195);
      logInfo(`cardScaleOf(sx=195): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CardScaleOf_0048 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0049
     * @tc.name      ComponentCollection_CardScaleOf_0049
     * @tc.desc      cardScaleOf(sx=200) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_CardScaleOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CardScaleOf_0049 begin`);
      const actual: number = cardScaleOf(200);
      logInfo(`cardScaleOf(sx=200): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CardScaleOf_0049 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_SCALE_OF_0050
     * @tc.name      ComponentCollection_CardScaleOf_0050
     * @tc.desc      cardScaleOf(sx=-95) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_CardScaleOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CardScaleOf_0050 begin`);
      const actual: number = cardScaleOf(-95);
      logInfo(`cardScaleOf(sx=-95): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CardScaleOf_0050 end`);
    });
  });
}
