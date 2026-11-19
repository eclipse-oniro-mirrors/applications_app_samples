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
import { swiperScaleOf } from '../model/ComponentSampleLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ComponentCollection]';
const BUNDLE: string = 'ComponentCollection_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for swiperScaleOf (49 cases). */
export default function swiperScaleOfTest(): void {
  describe('SwiperScaleOfTest', () => {
    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_SCALE_OF_0001
     * @tc.name      ComponentCollection_SwiperScaleOf_0001
     * @tc.desc      swiperScaleOf(position=0, index=0) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_SwiperScaleOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SwiperScaleOf_0001 begin`);
      const actual: number = swiperScaleOf(0, 0);
      logInfo(`swiperScaleOf(position=0, index=0): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwiperScaleOf_0001 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_SCALE_OF_0002
     * @tc.name      ComponentCollection_SwiperScaleOf_0002
     * @tc.desc      swiperScaleOf(position=0, index=-1) returns 0.875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_SwiperScaleOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SwiperScaleOf_0002 begin`);
      const actual: number = swiperScaleOf(0, -1);
      logInfo(`swiperScaleOf(position=0, index=-1): actual=${actual}`);
      expect(actual).assertClose(0.875, PRECISION);
      logInfo(`${BUNDLE}SwiperScaleOf_0002 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_SCALE_OF_0003
     * @tc.name      ComponentCollection_SwiperScaleOf_0003
     * @tc.desc      swiperScaleOf(position=1, index=2.85) returns 0.98125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperScaleOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperScaleOf_0003 begin`);
      const actual: number = swiperScaleOf(1, 2.85);
      logInfo(`swiperScaleOf(position=1, index=2.85): actual=${actual}`);
      expect(actual).assertClose(0.98125, PRECISION);
      logInfo(`${BUNDLE}SwiperScaleOf_0003 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_SCALE_OF_0004
     * @tc.name      ComponentCollection_SwiperScaleOf_0004
     * @tc.desc      swiperScaleOf(position=2, index=2.85) returns 0.85625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_SwiperScaleOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperScaleOf_0004 begin`);
      const actual: number = swiperScaleOf(2, 2.85);
      logInfo(`swiperScaleOf(position=2, index=2.85): actual=${actual}`);
      expect(actual).assertClose(0.85625, PRECISION);
      logInfo(`${BUNDLE}SwiperScaleOf_0004 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_SCALE_OF_0005
     * @tc.name      ComponentCollection_SwiperScaleOf_0005
     * @tc.desc      swiperScaleOf(position=0, index=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperScaleOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperScaleOf_0005 begin`);
      const actual: number = swiperScaleOf(0, 1);
      logInfo(`swiperScaleOf(position=0, index=1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwiperScaleOf_0005 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_SCALE_OF_0006
     * @tc.name      ComponentCollection_SwiperScaleOf_0006
     * @tc.desc      swiperScaleOf(position=0, index=2) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_SwiperScaleOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperScaleOf_0006 begin`);
      const actual: number = swiperScaleOf(0, 2);
      logInfo(`swiperScaleOf(position=0, index=2): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwiperScaleOf_0006 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_SCALE_OF_0007
     * @tc.name      ComponentCollection_SwiperScaleOf_0007
     * @tc.desc      swiperScaleOf(position=0, index=5) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperScaleOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperScaleOf_0007 begin`);
      const actual: number = swiperScaleOf(0, 5);
      logInfo(`swiperScaleOf(position=0, index=5): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwiperScaleOf_0007 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_SCALE_OF_0008
     * @tc.name      ComponentCollection_SwiperScaleOf_0008
     * @tc.desc      swiperScaleOf(position=0, index=10) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperScaleOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperScaleOf_0008 begin`);
      const actual: number = swiperScaleOf(0, 10);
      logInfo(`swiperScaleOf(position=0, index=10): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwiperScaleOf_0008 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_SCALE_OF_0009
     * @tc.name      ComponentCollection_SwiperScaleOf_0009
     * @tc.desc      swiperScaleOf(position=0, index=3) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperScaleOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperScaleOf_0009 begin`);
      const actual: number = swiperScaleOf(0, 3);
      logInfo(`swiperScaleOf(position=0, index=3): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwiperScaleOf_0009 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_SCALE_OF_0010
     * @tc.name      ComponentCollection_SwiperScaleOf_0010
     * @tc.desc      swiperScaleOf(position=0, index=100) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperScaleOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperScaleOf_0010 begin`);
      const actual: number = swiperScaleOf(0, 100);
      logInfo(`swiperScaleOf(position=0, index=100): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwiperScaleOf_0010 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_SCALE_OF_0011
     * @tc.name      ComponentCollection_SwiperScaleOf_0011
     * @tc.desc      swiperScaleOf(position=0, index=15) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperScaleOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperScaleOf_0011 begin`);
      const actual: number = swiperScaleOf(0, 15);
      logInfo(`swiperScaleOf(position=0, index=15): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwiperScaleOf_0011 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_SCALE_OF_0012
     * @tc.name      ComponentCollection_SwiperScaleOf_0012
     * @tc.desc      swiperScaleOf(position=0, index=20) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperScaleOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperScaleOf_0012 begin`);
      const actual: number = swiperScaleOf(0, 20);
      logInfo(`swiperScaleOf(position=0, index=20): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwiperScaleOf_0012 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_SCALE_OF_0013
     * @tc.name      ComponentCollection_SwiperScaleOf_0013
     * @tc.desc      swiperScaleOf(position=0, index=25) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperScaleOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperScaleOf_0013 begin`);
      const actual: number = swiperScaleOf(0, 25);
      logInfo(`swiperScaleOf(position=0, index=25): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwiperScaleOf_0013 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_SCALE_OF_0014
     * @tc.name      ComponentCollection_SwiperScaleOf_0014
     * @tc.desc      swiperScaleOf(position=0, index=30) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperScaleOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperScaleOf_0014 begin`);
      const actual: number = swiperScaleOf(0, 30);
      logInfo(`swiperScaleOf(position=0, index=30): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwiperScaleOf_0014 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_SCALE_OF_0015
     * @tc.name      ComponentCollection_SwiperScaleOf_0015
     * @tc.desc      swiperScaleOf(position=0, index=35) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperScaleOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperScaleOf_0015 begin`);
      const actual: number = swiperScaleOf(0, 35);
      logInfo(`swiperScaleOf(position=0, index=35): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwiperScaleOf_0015 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_SCALE_OF_0016
     * @tc.name      ComponentCollection_SwiperScaleOf_0016
     * @tc.desc      swiperScaleOf(position=0, index=40) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperScaleOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperScaleOf_0016 begin`);
      const actual: number = swiperScaleOf(0, 40);
      logInfo(`swiperScaleOf(position=0, index=40): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwiperScaleOf_0016 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_SCALE_OF_0017
     * @tc.name      ComponentCollection_SwiperScaleOf_0017
     * @tc.desc      swiperScaleOf(position=0, index=45) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperScaleOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperScaleOf_0017 begin`);
      const actual: number = swiperScaleOf(0, 45);
      logInfo(`swiperScaleOf(position=0, index=45): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwiperScaleOf_0017 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_SCALE_OF_0018
     * @tc.name      ComponentCollection_SwiperScaleOf_0018
     * @tc.desc      swiperScaleOf(position=0, index=50) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperScaleOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperScaleOf_0018 begin`);
      const actual: number = swiperScaleOf(0, 50);
      logInfo(`swiperScaleOf(position=0, index=50): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwiperScaleOf_0018 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_SCALE_OF_0019
     * @tc.name      ComponentCollection_SwiperScaleOf_0019
     * @tc.desc      swiperScaleOf(position=0, index=55) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperScaleOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperScaleOf_0019 begin`);
      const actual: number = swiperScaleOf(0, 55);
      logInfo(`swiperScaleOf(position=0, index=55): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwiperScaleOf_0019 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_SCALE_OF_0020
     * @tc.name      ComponentCollection_SwiperScaleOf_0020
     * @tc.desc      swiperScaleOf(position=0, index=60) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperScaleOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperScaleOf_0020 begin`);
      const actual: number = swiperScaleOf(0, 60);
      logInfo(`swiperScaleOf(position=0, index=60): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwiperScaleOf_0020 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_SCALE_OF_0021
     * @tc.name      ComponentCollection_SwiperScaleOf_0021
     * @tc.desc      swiperScaleOf(position=0, index=65) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperScaleOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperScaleOf_0021 begin`);
      const actual: number = swiperScaleOf(0, 65);
      logInfo(`swiperScaleOf(position=0, index=65): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwiperScaleOf_0021 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_SCALE_OF_0022
     * @tc.name      ComponentCollection_SwiperScaleOf_0022
     * @tc.desc      swiperScaleOf(position=0, index=70) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperScaleOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperScaleOf_0022 begin`);
      const actual: number = swiperScaleOf(0, 70);
      logInfo(`swiperScaleOf(position=0, index=70): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwiperScaleOf_0022 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_SCALE_OF_0023
     * @tc.name      ComponentCollection_SwiperScaleOf_0023
     * @tc.desc      swiperScaleOf(position=0, index=75) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperScaleOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperScaleOf_0023 begin`);
      const actual: number = swiperScaleOf(0, 75);
      logInfo(`swiperScaleOf(position=0, index=75): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwiperScaleOf_0023 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_SCALE_OF_0024
     * @tc.name      ComponentCollection_SwiperScaleOf_0024
     * @tc.desc      swiperScaleOf(position=0, index=80) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperScaleOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperScaleOf_0024 begin`);
      const actual: number = swiperScaleOf(0, 80);
      logInfo(`swiperScaleOf(position=0, index=80): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwiperScaleOf_0024 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_SCALE_OF_0025
     * @tc.name      ComponentCollection_SwiperScaleOf_0025
     * @tc.desc      swiperScaleOf(position=0, index=85) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperScaleOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperScaleOf_0025 begin`);
      const actual: number = swiperScaleOf(0, 85);
      logInfo(`swiperScaleOf(position=0, index=85): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwiperScaleOf_0025 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_SCALE_OF_0026
     * @tc.name      ComponentCollection_SwiperScaleOf_0026
     * @tc.desc      swiperScaleOf(position=0, index=90) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperScaleOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperScaleOf_0026 begin`);
      const actual: number = swiperScaleOf(0, 90);
      logInfo(`swiperScaleOf(position=0, index=90): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwiperScaleOf_0026 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_SCALE_OF_0027
     * @tc.name      ComponentCollection_SwiperScaleOf_0027
     * @tc.desc      swiperScaleOf(position=0, index=95) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperScaleOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperScaleOf_0027 begin`);
      const actual: number = swiperScaleOf(0, 95);
      logInfo(`swiperScaleOf(position=0, index=95): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwiperScaleOf_0027 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_SCALE_OF_0028
     * @tc.name      ComponentCollection_SwiperScaleOf_0028
     * @tc.desc      swiperScaleOf(position=0, index=105) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperScaleOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperScaleOf_0028 begin`);
      const actual: number = swiperScaleOf(0, 105);
      logInfo(`swiperScaleOf(position=0, index=105): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwiperScaleOf_0028 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_SCALE_OF_0029
     * @tc.name      ComponentCollection_SwiperScaleOf_0029
     * @tc.desc      swiperScaleOf(position=0, index=110) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperScaleOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperScaleOf_0029 begin`);
      const actual: number = swiperScaleOf(0, 110);
      logInfo(`swiperScaleOf(position=0, index=110): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwiperScaleOf_0029 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_SCALE_OF_0030
     * @tc.name      ComponentCollection_SwiperScaleOf_0030
     * @tc.desc      swiperScaleOf(position=0, index=163) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperScaleOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperScaleOf_0030 begin`);
      const actual: number = swiperScaleOf(0, 163);
      logInfo(`swiperScaleOf(position=0, index=163): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwiperScaleOf_0030 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_SCALE_OF_0031
     * @tc.name      ComponentCollection_SwiperScaleOf_0031
     * @tc.desc      swiperScaleOf(position=0, index=2.85) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperScaleOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperScaleOf_0031 begin`);
      const actual: number = swiperScaleOf(0, 2.85);
      logInfo(`swiperScaleOf(position=0, index=2.85): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwiperScaleOf_0031 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_SCALE_OF_0032
     * @tc.name      ComponentCollection_SwiperScaleOf_0032
     * @tc.desc      swiperScaleOf(position=0, index=-49) returns 0.875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_SwiperScaleOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SwiperScaleOf_0032 begin`);
      const actual: number = swiperScaleOf(0, -49);
      logInfo(`swiperScaleOf(position=0, index=-49): actual=${actual}`);
      expect(actual).assertClose(0.875, PRECISION);
      logInfo(`${BUNDLE}SwiperScaleOf_0032 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_SCALE_OF_0033
     * @tc.name      ComponentCollection_SwiperScaleOf_0033
     * @tc.desc      swiperScaleOf(position=1, index=0) returns 0.875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperScaleOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperScaleOf_0033 begin`);
      const actual: number = swiperScaleOf(1, 0);
      logInfo(`swiperScaleOf(position=1, index=0): actual=${actual}`);
      expect(actual).assertClose(0.875, PRECISION);
      logInfo(`${BUNDLE}SwiperScaleOf_0033 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_SCALE_OF_0034
     * @tc.name      ComponentCollection_SwiperScaleOf_0034
     * @tc.desc      swiperScaleOf(position=1, index=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperScaleOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperScaleOf_0034 begin`);
      const actual: number = swiperScaleOf(1, 1);
      logInfo(`swiperScaleOf(position=1, index=1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwiperScaleOf_0034 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_SCALE_OF_0035
     * @tc.name      ComponentCollection_SwiperScaleOf_0035
     * @tc.desc      swiperScaleOf(position=1, index=2) returns 0.875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_SwiperScaleOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperScaleOf_0035 begin`);
      const actual: number = swiperScaleOf(1, 2);
      logInfo(`swiperScaleOf(position=1, index=2): actual=${actual}`);
      expect(actual).assertClose(0.875, PRECISION);
      logInfo(`${BUNDLE}SwiperScaleOf_0035 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_SCALE_OF_0036
     * @tc.name      ComponentCollection_SwiperScaleOf_0036
     * @tc.desc      swiperScaleOf(position=1, index=-1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_SwiperScaleOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SwiperScaleOf_0036 begin`);
      const actual: number = swiperScaleOf(1, -1);
      logInfo(`swiperScaleOf(position=1, index=-1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwiperScaleOf_0036 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_SCALE_OF_0037
     * @tc.name      ComponentCollection_SwiperScaleOf_0037
     * @tc.desc      swiperScaleOf(position=1, index=5) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperScaleOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperScaleOf_0037 begin`);
      const actual: number = swiperScaleOf(1, 5);
      logInfo(`swiperScaleOf(position=1, index=5): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwiperScaleOf_0037 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_SCALE_OF_0038
     * @tc.name      ComponentCollection_SwiperScaleOf_0038
     * @tc.desc      swiperScaleOf(position=1, index=10) returns 0.875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperScaleOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperScaleOf_0038 begin`);
      const actual: number = swiperScaleOf(1, 10);
      logInfo(`swiperScaleOf(position=1, index=10): actual=${actual}`);
      expect(actual).assertClose(0.875, PRECISION);
      logInfo(`${BUNDLE}SwiperScaleOf_0038 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_SCALE_OF_0039
     * @tc.name      ComponentCollection_SwiperScaleOf_0039
     * @tc.desc      swiperScaleOf(position=1, index=3) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperScaleOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperScaleOf_0039 begin`);
      const actual: number = swiperScaleOf(1, 3);
      logInfo(`swiperScaleOf(position=1, index=3): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwiperScaleOf_0039 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_SCALE_OF_0040
     * @tc.name      ComponentCollection_SwiperScaleOf_0040
     * @tc.desc      swiperScaleOf(position=1, index=100) returns 0.875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperScaleOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperScaleOf_0040 begin`);
      const actual: number = swiperScaleOf(1, 100);
      logInfo(`swiperScaleOf(position=1, index=100): actual=${actual}`);
      expect(actual).assertClose(0.875, PRECISION);
      logInfo(`${BUNDLE}SwiperScaleOf_0040 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_SCALE_OF_0041
     * @tc.name      ComponentCollection_SwiperScaleOf_0041
     * @tc.desc      swiperScaleOf(position=1, index=15) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperScaleOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperScaleOf_0041 begin`);
      const actual: number = swiperScaleOf(1, 15);
      logInfo(`swiperScaleOf(position=1, index=15): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwiperScaleOf_0041 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_SCALE_OF_0042
     * @tc.name      ComponentCollection_SwiperScaleOf_0042
     * @tc.desc      swiperScaleOf(position=1, index=20) returns 0.875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperScaleOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperScaleOf_0042 begin`);
      const actual: number = swiperScaleOf(1, 20);
      logInfo(`swiperScaleOf(position=1, index=20): actual=${actual}`);
      expect(actual).assertClose(0.875, PRECISION);
      logInfo(`${BUNDLE}SwiperScaleOf_0042 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_SCALE_OF_0043
     * @tc.name      ComponentCollection_SwiperScaleOf_0043
     * @tc.desc      swiperScaleOf(position=1, index=25) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperScaleOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperScaleOf_0043 begin`);
      const actual: number = swiperScaleOf(1, 25);
      logInfo(`swiperScaleOf(position=1, index=25): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwiperScaleOf_0043 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_SCALE_OF_0044
     * @tc.name      ComponentCollection_SwiperScaleOf_0044
     * @tc.desc      swiperScaleOf(position=1, index=30) returns 0.875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperScaleOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperScaleOf_0044 begin`);
      const actual: number = swiperScaleOf(1, 30);
      logInfo(`swiperScaleOf(position=1, index=30): actual=${actual}`);
      expect(actual).assertClose(0.875, PRECISION);
      logInfo(`${BUNDLE}SwiperScaleOf_0044 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_SCALE_OF_0045
     * @tc.name      ComponentCollection_SwiperScaleOf_0045
     * @tc.desc      swiperScaleOf(position=1, index=35) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperScaleOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperScaleOf_0045 begin`);
      const actual: number = swiperScaleOf(1, 35);
      logInfo(`swiperScaleOf(position=1, index=35): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwiperScaleOf_0045 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_SCALE_OF_0046
     * @tc.name      ComponentCollection_SwiperScaleOf_0046
     * @tc.desc      swiperScaleOf(position=1, index=40) returns 0.875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperScaleOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperScaleOf_0046 begin`);
      const actual: number = swiperScaleOf(1, 40);
      logInfo(`swiperScaleOf(position=1, index=40): actual=${actual}`);
      expect(actual).assertClose(0.875, PRECISION);
      logInfo(`${BUNDLE}SwiperScaleOf_0046 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_SCALE_OF_0047
     * @tc.name      ComponentCollection_SwiperScaleOf_0047
     * @tc.desc      swiperScaleOf(position=1, index=45) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperScaleOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperScaleOf_0047 begin`);
      const actual: number = swiperScaleOf(1, 45);
      logInfo(`swiperScaleOf(position=1, index=45): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwiperScaleOf_0047 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_SCALE_OF_0048
     * @tc.name      ComponentCollection_SwiperScaleOf_0048
     * @tc.desc      swiperScaleOf(position=1, index=50) returns 0.875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperScaleOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperScaleOf_0048 begin`);
      const actual: number = swiperScaleOf(1, 50);
      logInfo(`swiperScaleOf(position=1, index=50): actual=${actual}`);
      expect(actual).assertClose(0.875, PRECISION);
      logInfo(`${BUNDLE}SwiperScaleOf_0048 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_SCALE_OF_0049
     * @tc.name      ComponentCollection_SwiperScaleOf_0049
     * @tc.desc      swiperScaleOf(position=1, index=55) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperScaleOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperScaleOf_0049 begin`);
      const actual: number = swiperScaleOf(1, 55);
      logInfo(`swiperScaleOf(position=1, index=55): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwiperScaleOf_0049 end`);
    });
  });
}
