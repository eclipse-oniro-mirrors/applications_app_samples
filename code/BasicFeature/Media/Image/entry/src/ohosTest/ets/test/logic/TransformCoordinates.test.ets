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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../YieldToEventLoop';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Point, transformCoordinates } from '../../../../main/ets/bridge/PhotomodifyBridge';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Image]';
const BUNDLE: string = 'Image_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for transformCoordinates (85 cases). */
export default function transformCoordinatesTest(): void {
  describe('TransformCoordinatesTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0001
     * @tc.name      Image_TransformCoordinates_0001
     * @tc.desc      transformCoordinates(point=Point(-100, -100), scale=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Image_TransformCoordinates_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0001 begin`);
      const actual: Point = transformCoordinates(new Point(-100, -100), 0);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(0);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(0);
      logInfo(`${BUNDLE}TransformCoordinates_0001 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0002
     * @tc.name      Image_TransformCoordinates_0002
     * @tc.desc      transformCoordinates(point=Point(-100, -100), scale=0.25) returns -25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Image_TransformCoordinates_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0002 begin`);
      const actual: Point = transformCoordinates(new Point(-100, -100), 0.25);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-25);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-25);
      logInfo(`${BUNDLE}TransformCoordinates_0002 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0003
     * @tc.name      Image_TransformCoordinates_0003
     * @tc.desc      transformCoordinates(point=Point(-100, -100), scale=0.5) returns -50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0003 begin`);
      const actual: Point = transformCoordinates(new Point(-100, -100), 0.5);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-50);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-50);
      logInfo(`${BUNDLE}TransformCoordinates_0003 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0004
     * @tc.name      Image_TransformCoordinates_0004
     * @tc.desc      transformCoordinates(point=Point(-100, -100), scale=1) returns -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0004 begin`);
      const actual: Point = transformCoordinates(new Point(-100, -100), 1);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-100);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-100);
      logInfo(`${BUNDLE}TransformCoordinates_0004 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0005
     * @tc.name      Image_TransformCoordinates_0005
     * @tc.desc      transformCoordinates(point=Point(-100, -100), scale=1.5) returns -150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0005 begin`);
      const actual: Point = transformCoordinates(new Point(-100, -100), 1.5);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-150);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-150);
      logInfo(`${BUNDLE}TransformCoordinates_0005 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0006
     * @tc.name      Image_TransformCoordinates_0006
     * @tc.desc      transformCoordinates(point=Point(-100, -100), scale=2) returns -200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0006 begin`);
      const actual: Point = transformCoordinates(new Point(-100, -100), 2);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-200);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-200);
      logInfo(`${BUNDLE}TransformCoordinates_0006 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0007
     * @tc.name      Image_TransformCoordinates_0007
     * @tc.desc      transformCoordinates(point=Point(-100, -100), scale=-1) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_TransformCoordinates_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0007 begin`);
      const actual: Point = transformCoordinates(new Point(-100, -100), -1);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(100);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(100);
      logInfo(`${BUNDLE}TransformCoordinates_0007 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0008
     * @tc.name      Image_TransformCoordinates_0008
     * @tc.desc      transformCoordinates(point=Point(-100, -100), scale=3) returns -300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0008 begin`);
      const actual: Point = transformCoordinates(new Point(-100, -100), 3);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-300);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-300);
      logInfo(`${BUNDLE}TransformCoordinates_0008 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0009
     * @tc.name      Image_TransformCoordinates_0009
     * @tc.desc      transformCoordinates(point=Point(-100, -100), scale=10) returns -1000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0009 begin`);
      const actual: Point = transformCoordinates(new Point(-100, -100), 10);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-1000);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-1000);
      logInfo(`${BUNDLE}TransformCoordinates_0009 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0010
     * @tc.name      Image_TransformCoordinates_0010
     * @tc.desc      transformCoordinates(point=Point(-100, -100), scale=100) returns -10000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0010 begin`);
      const actual: Point = transformCoordinates(new Point(-100, -100), 100);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-10000);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-10000);
      logInfo(`${BUNDLE}TransformCoordinates_0010 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0011
     * @tc.name      Image_TransformCoordinates_0011
     * @tc.desc      transformCoordinates(point=Point(-100, -100), scale=5) returns -500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0011 begin`);
      const actual: Point = transformCoordinates(new Point(-100, -100), 5);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-500);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-500);
      logInfo(`${BUNDLE}TransformCoordinates_0011 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0012
     * @tc.name      Image_TransformCoordinates_0012
     * @tc.desc      transformCoordinates(point=Point(-100, -100), scale=15) returns -1500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0012 begin`);
      const actual: Point = transformCoordinates(new Point(-100, -100), 15);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-1500);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-1500);
      logInfo(`${BUNDLE}TransformCoordinates_0012 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0013
     * @tc.name      Image_TransformCoordinates_0013
     * @tc.desc      transformCoordinates(point=Point(-100, -100), scale=20) returns -2000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0013 begin`);
      const actual: Point = transformCoordinates(new Point(-100, -100), 20);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-2000);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-2000);
      logInfo(`${BUNDLE}TransformCoordinates_0013 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0014
     * @tc.name      Image_TransformCoordinates_0014
     * @tc.desc      transformCoordinates(point=Point(-100, -100), scale=25) returns -2500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0014 begin`);
      const actual: Point = transformCoordinates(new Point(-100, -100), 25);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-2500);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-2500);
      logInfo(`${BUNDLE}TransformCoordinates_0014 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0015
     * @tc.name      Image_TransformCoordinates_0015
     * @tc.desc      transformCoordinates(point=Point(-100, -100), scale=30) returns -3000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0015 begin`);
      const actual: Point = transformCoordinates(new Point(-100, -100), 30);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-3000);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-3000);
      logInfo(`${BUNDLE}TransformCoordinates_0015 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0016
     * @tc.name      Image_TransformCoordinates_0016
     * @tc.desc      transformCoordinates(point=Point(-100, -100), scale=35) returns -3500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0016 begin`);
      const actual: Point = transformCoordinates(new Point(-100, -100), 35);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-3500);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-3500);
      logInfo(`${BUNDLE}TransformCoordinates_0016 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0017
     * @tc.name      Image_TransformCoordinates_0017
     * @tc.desc      transformCoordinates(point=Point(-100, -100), scale=40) returns -4000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0017 begin`);
      const actual: Point = transformCoordinates(new Point(-100, -100), 40);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-4000);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-4000);
      logInfo(`${BUNDLE}TransformCoordinates_0017 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0018
     * @tc.name      Image_TransformCoordinates_0018
     * @tc.desc      transformCoordinates(point=Point(-100, -100), scale=45) returns -4500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0018 begin`);
      const actual: Point = transformCoordinates(new Point(-100, -100), 45);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-4500);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-4500);
      logInfo(`${BUNDLE}TransformCoordinates_0018 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0019
     * @tc.name      Image_TransformCoordinates_0019
     * @tc.desc      transformCoordinates(point=Point(-100, -100), scale=50) returns -5000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0019 begin`);
      const actual: Point = transformCoordinates(new Point(-100, -100), 50);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-5000);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-5000);
      logInfo(`${BUNDLE}TransformCoordinates_0019 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0020
     * @tc.name      Image_TransformCoordinates_0020
     * @tc.desc      transformCoordinates(point=Point(-100, -100), scale=55) returns -5500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0020 begin`);
      const actual: Point = transformCoordinates(new Point(-100, -100), 55);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-5500);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-5500);
      logInfo(`${BUNDLE}TransformCoordinates_0020 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0021
     * @tc.name      Image_TransformCoordinates_0021
     * @tc.desc      transformCoordinates(point=Point(-100, -100), scale=60) returns -6000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0021 begin`);
      const actual: Point = transformCoordinates(new Point(-100, -100), 60);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-6000);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-6000);
      logInfo(`${BUNDLE}TransformCoordinates_0021 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0022
     * @tc.name      Image_TransformCoordinates_0022
     * @tc.desc      transformCoordinates(point=Point(-100, -100), scale=65) returns -6500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0022 begin`);
      const actual: Point = transformCoordinates(new Point(-100, -100), 65);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-6500);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-6500);
      logInfo(`${BUNDLE}TransformCoordinates_0022 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0023
     * @tc.name      Image_TransformCoordinates_0023
     * @tc.desc      transformCoordinates(point=Point(-100, -100), scale=70) returns -7000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0023 begin`);
      const actual: Point = transformCoordinates(new Point(-100, -100), 70);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-7000);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-7000);
      logInfo(`${BUNDLE}TransformCoordinates_0023 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0024
     * @tc.name      Image_TransformCoordinates_0024
     * @tc.desc      transformCoordinates(point=Point(-100, -100), scale=75) returns -7500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0024 begin`);
      const actual: Point = transformCoordinates(new Point(-100, -100), 75);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-7500);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-7500);
      logInfo(`${BUNDLE}TransformCoordinates_0024 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0025
     * @tc.name      Image_TransformCoordinates_0025
     * @tc.desc      transformCoordinates(point=Point(-100, -100), scale=80) returns -8000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0025 begin`);
      const actual: Point = transformCoordinates(new Point(-100, -100), 80);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-8000);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-8000);
      logInfo(`${BUNDLE}TransformCoordinates_0025 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0026
     * @tc.name      Image_TransformCoordinates_0026
     * @tc.desc      transformCoordinates(point=Point(-100, -100), scale=85) returns -8500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0026 begin`);
      const actual: Point = transformCoordinates(new Point(-100, -100), 85);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-8500);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-8500);
      logInfo(`${BUNDLE}TransformCoordinates_0026 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0027
     * @tc.name      Image_TransformCoordinates_0027
     * @tc.desc      transformCoordinates(point=Point(-100, -100), scale=90) returns -9000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0027 begin`);
      const actual: Point = transformCoordinates(new Point(-100, -100), 90);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-9000);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-9000);
      logInfo(`${BUNDLE}TransformCoordinates_0027 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0028
     * @tc.name      Image_TransformCoordinates_0028
     * @tc.desc      transformCoordinates(point=Point(-100, -100), scale=95) returns -9500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0028 begin`);
      const actual: Point = transformCoordinates(new Point(-100, -100), 95);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-9500);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-9500);
      logInfo(`${BUNDLE}TransformCoordinates_0028 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0029
     * @tc.name      Image_TransformCoordinates_0029
     * @tc.desc      transformCoordinates(point=Point(-100, -100), scale=99) returns -9900
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0029 begin`);
      const actual: Point = transformCoordinates(new Point(-100, -100), 99);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-9900);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-9900);
      logInfo(`${BUNDLE}TransformCoordinates_0029 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0030
     * @tc.name      Image_TransformCoordinates_0030
     * @tc.desc      transformCoordinates(point=Point(-100, -100), scale=127) returns -12700
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0030 begin`);
      const actual: Point = transformCoordinates(new Point(-100, -100), 127);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-12700);
      logInfo(`transformCoordinates(point=Point(-100, -1...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-12700);
      logInfo(`${BUNDLE}TransformCoordinates_0030 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0031
     * @tc.name      Image_TransformCoordinates_0031
     * @tc.desc      transformCoordinates(point=Point(-1, -100), scale=0.25) returns -25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0031 begin`);
      const actual: Point = transformCoordinates(new Point(-1, -100), 0.25);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.x=${actual.x}`);
      expect(actual.x).assertClose(-0.25, PRECISION);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-25);
      logInfo(`${BUNDLE}TransformCoordinates_0031 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0032
     * @tc.name      Image_TransformCoordinates_0032
     * @tc.desc      transformCoordinates(point=Point(-1, -100), scale=0.5) returns -50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0032 begin`);
      const actual: Point = transformCoordinates(new Point(-1, -100), 0.5);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.x=${actual.x}`);
      expect(actual.x).assertClose(-0.5, PRECISION);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-50);
      logInfo(`${BUNDLE}TransformCoordinates_0032 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0033
     * @tc.name      Image_TransformCoordinates_0033
     * @tc.desc      transformCoordinates(point=Point(-1, -100), scale=1) returns -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0033 begin`);
      const actual: Point = transformCoordinates(new Point(-1, -100), 1);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-1);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-100);
      logInfo(`${BUNDLE}TransformCoordinates_0033 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0034
     * @tc.name      Image_TransformCoordinates_0034
     * @tc.desc      transformCoordinates(point=Point(-1, -100), scale=1.5) returns -150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0034 begin`);
      const actual: Point = transformCoordinates(new Point(-1, -100), 1.5);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.x=${actual.x}`);
      expect(actual.x).assertClose(-1.5, PRECISION);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-150);
      logInfo(`${BUNDLE}TransformCoordinates_0034 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0035
     * @tc.name      Image_TransformCoordinates_0035
     * @tc.desc      transformCoordinates(point=Point(-1, -100), scale=2) returns -200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0035 begin`);
      const actual: Point = transformCoordinates(new Point(-1, -100), 2);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-2);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-200);
      logInfo(`${BUNDLE}TransformCoordinates_0035 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0036
     * @tc.name      Image_TransformCoordinates_0036
     * @tc.desc      transformCoordinates(point=Point(-1, -100), scale=-1) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_TransformCoordinates_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0036 begin`);
      const actual: Point = transformCoordinates(new Point(-1, -100), -1);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(1);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(100);
      logInfo(`${BUNDLE}TransformCoordinates_0036 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0037
     * @tc.name      Image_TransformCoordinates_0037
     * @tc.desc      transformCoordinates(point=Point(-1, -100), scale=3) returns -300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0037 begin`);
      const actual: Point = transformCoordinates(new Point(-1, -100), 3);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-3);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-300);
      logInfo(`${BUNDLE}TransformCoordinates_0037 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0038
     * @tc.name      Image_TransformCoordinates_0038
     * @tc.desc      transformCoordinates(point=Point(-1, -100), scale=10) returns -1000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0038 begin`);
      const actual: Point = transformCoordinates(new Point(-1, -100), 10);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-10);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-1000);
      logInfo(`${BUNDLE}TransformCoordinates_0038 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0039
     * @tc.name      Image_TransformCoordinates_0039
     * @tc.desc      transformCoordinates(point=Point(-1, -100), scale=100) returns -10000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0039 begin`);
      const actual: Point = transformCoordinates(new Point(-1, -100), 100);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-100);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-10000);
      logInfo(`${BUNDLE}TransformCoordinates_0039 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0040
     * @tc.name      Image_TransformCoordinates_0040
     * @tc.desc      transformCoordinates(point=Point(-1, -100), scale=5) returns -500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0040 begin`);
      const actual: Point = transformCoordinates(new Point(-1, -100), 5);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-5);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-500);
      logInfo(`${BUNDLE}TransformCoordinates_0040 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0041
     * @tc.name      Image_TransformCoordinates_0041
     * @tc.desc      transformCoordinates(point=Point(-1, -100), scale=15) returns -1500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0041 begin`);
      const actual: Point = transformCoordinates(new Point(-1, -100), 15);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-15);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-1500);
      logInfo(`${BUNDLE}TransformCoordinates_0041 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0042
     * @tc.name      Image_TransformCoordinates_0042
     * @tc.desc      transformCoordinates(point=Point(-1, -100), scale=20) returns -2000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0042 begin`);
      const actual: Point = transformCoordinates(new Point(-1, -100), 20);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-20);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-2000);
      logInfo(`${BUNDLE}TransformCoordinates_0042 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0043
     * @tc.name      Image_TransformCoordinates_0043
     * @tc.desc      transformCoordinates(point=Point(-1, -100), scale=25) returns -2500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0043 begin`);
      const actual: Point = transformCoordinates(new Point(-1, -100), 25);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-25);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-2500);
      logInfo(`${BUNDLE}TransformCoordinates_0043 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0044
     * @tc.name      Image_TransformCoordinates_0044
     * @tc.desc      transformCoordinates(point=Point(-1, -100), scale=30) returns -3000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0044 begin`);
      const actual: Point = transformCoordinates(new Point(-1, -100), 30);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-30);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-3000);
      logInfo(`${BUNDLE}TransformCoordinates_0044 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0045
     * @tc.name      Image_TransformCoordinates_0045
     * @tc.desc      transformCoordinates(point=Point(-1, -100), scale=35) returns -3500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0045 begin`);
      const actual: Point = transformCoordinates(new Point(-1, -100), 35);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-35);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-3500);
      logInfo(`${BUNDLE}TransformCoordinates_0045 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0046
     * @tc.name      Image_TransformCoordinates_0046
     * @tc.desc      transformCoordinates(point=Point(-1, -100), scale=40) returns -4000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0046 begin`);
      const actual: Point = transformCoordinates(new Point(-1, -100), 40);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-40);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-4000);
      logInfo(`${BUNDLE}TransformCoordinates_0046 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0047
     * @tc.name      Image_TransformCoordinates_0047
     * @tc.desc      transformCoordinates(point=Point(-1, -100), scale=45) returns -4500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0047 begin`);
      const actual: Point = transformCoordinates(new Point(-1, -100), 45);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-45);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-4500);
      logInfo(`${BUNDLE}TransformCoordinates_0047 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0048
     * @tc.name      Image_TransformCoordinates_0048
     * @tc.desc      transformCoordinates(point=Point(-1, -100), scale=50) returns -5000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0048 begin`);
      const actual: Point = transformCoordinates(new Point(-1, -100), 50);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-50);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-5000);
      logInfo(`${BUNDLE}TransformCoordinates_0048 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0049
     * @tc.name      Image_TransformCoordinates_0049
     * @tc.desc      transformCoordinates(point=Point(-1, -100), scale=55) returns -5500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0049 begin`);
      const actual: Point = transformCoordinates(new Point(-1, -100), 55);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-55);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-5500);
      logInfo(`${BUNDLE}TransformCoordinates_0049 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0050
     * @tc.name      Image_TransformCoordinates_0050
     * @tc.desc      transformCoordinates(point=Point(-1, -100), scale=60) returns -6000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0050 begin`);
      const actual: Point = transformCoordinates(new Point(-1, -100), 60);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-60);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-6000);
      logInfo(`${BUNDLE}TransformCoordinates_0050 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0051
     * @tc.name      Image_TransformCoordinates_0051
     * @tc.desc      transformCoordinates(point=Point(-1, -100), scale=65) returns -6500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0051 begin`);
      const actual: Point = transformCoordinates(new Point(-1, -100), 65);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-65);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-6500);
      logInfo(`${BUNDLE}TransformCoordinates_0051 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0052
     * @tc.name      Image_TransformCoordinates_0052
     * @tc.desc      transformCoordinates(point=Point(-1, -100), scale=70) returns -7000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0052 begin`);
      const actual: Point = transformCoordinates(new Point(-1, -100), 70);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-70);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-7000);
      logInfo(`${BUNDLE}TransformCoordinates_0052 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0053
     * @tc.name      Image_TransformCoordinates_0053
     * @tc.desc      transformCoordinates(point=Point(-1, -100), scale=75) returns -7500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0053 begin`);
      const actual: Point = transformCoordinates(new Point(-1, -100), 75);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-75);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-7500);
      logInfo(`${BUNDLE}TransformCoordinates_0053 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0054
     * @tc.name      Image_TransformCoordinates_0054
     * @tc.desc      transformCoordinates(point=Point(-1, -100), scale=80) returns -8000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0054 begin`);
      const actual: Point = transformCoordinates(new Point(-1, -100), 80);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-80);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-8000);
      logInfo(`${BUNDLE}TransformCoordinates_0054 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0055
     * @tc.name      Image_TransformCoordinates_0055
     * @tc.desc      transformCoordinates(point=Point(-1, -100), scale=85) returns -8500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0055 begin`);
      const actual: Point = transformCoordinates(new Point(-1, -100), 85);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-85);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-8500);
      logInfo(`${BUNDLE}TransformCoordinates_0055 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0056
     * @tc.name      Image_TransformCoordinates_0056
     * @tc.desc      transformCoordinates(point=Point(-1, -100), scale=90) returns -9000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0056 begin`);
      const actual: Point = transformCoordinates(new Point(-1, -100), 90);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-90);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-9000);
      logInfo(`${BUNDLE}TransformCoordinates_0056 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0057
     * @tc.name      Image_TransformCoordinates_0057
     * @tc.desc      transformCoordinates(point=Point(-1, -100), scale=95) returns -9500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0057 begin`);
      const actual: Point = transformCoordinates(new Point(-1, -100), 95);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-95);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-9500);
      logInfo(`${BUNDLE}TransformCoordinates_0057 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0058
     * @tc.name      Image_TransformCoordinates_0058
     * @tc.desc      transformCoordinates(point=Point(-1, -100), scale=99) returns -9900
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0058 begin`);
      const actual: Point = transformCoordinates(new Point(-1, -100), 99);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-99);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-9900);
      logInfo(`${BUNDLE}TransformCoordinates_0058 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0059
     * @tc.name      Image_TransformCoordinates_0059
     * @tc.desc      transformCoordinates(point=Point(-1, -100), scale=127) returns -12700
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0059 begin`);
      const actual: Point = transformCoordinates(new Point(-1, -100), 127);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-127);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-12700);
      logInfo(`${BUNDLE}TransformCoordinates_0059 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0060
     * @tc.name      Image_TransformCoordinates_0060
     * @tc.desc      transformCoordinates(point=Point(0, -100), scale=0.25) returns -25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0060 begin`);
      const actual: Point = transformCoordinates(new Point(0, -100), 0.25);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(0);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-25);
      logInfo(`${BUNDLE}TransformCoordinates_0060 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0061
     * @tc.name      Image_TransformCoordinates_0061
     * @tc.desc      transformCoordinates(point=Point(0, -100), scale=0.5) returns -50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0061 begin`);
      const actual: Point = transformCoordinates(new Point(0, -100), 0.5);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(0);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-50);
      logInfo(`${BUNDLE}TransformCoordinates_0061 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0062
     * @tc.name      Image_TransformCoordinates_0062
     * @tc.desc      transformCoordinates(point=Point(0, -100), scale=1) returns -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0062 begin`);
      const actual: Point = transformCoordinates(new Point(0, -100), 1);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(0);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-100);
      logInfo(`${BUNDLE}TransformCoordinates_0062 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0063
     * @tc.name      Image_TransformCoordinates_0063
     * @tc.desc      transformCoordinates(point=Point(0, -100), scale=1.5) returns -150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0063 begin`);
      const actual: Point = transformCoordinates(new Point(0, -100), 1.5);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(0);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-150);
      logInfo(`${BUNDLE}TransformCoordinates_0063 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0064
     * @tc.name      Image_TransformCoordinates_0064
     * @tc.desc      transformCoordinates(point=Point(0, -100), scale=2) returns -200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0064 begin`);
      const actual: Point = transformCoordinates(new Point(0, -100), 2);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(0);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-200);
      logInfo(`${BUNDLE}TransformCoordinates_0064 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0065
     * @tc.name      Image_TransformCoordinates_0065
     * @tc.desc      transformCoordinates(point=Point(0, -100), scale=-1) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_TransformCoordinates_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0065 begin`);
      const actual: Point = transformCoordinates(new Point(0, -100), -1);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(0);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(100);
      logInfo(`${BUNDLE}TransformCoordinates_0065 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0066
     * @tc.name      Image_TransformCoordinates_0066
     * @tc.desc      transformCoordinates(point=Point(0, -100), scale=3) returns -300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0066 begin`);
      const actual: Point = transformCoordinates(new Point(0, -100), 3);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(0);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-300);
      logInfo(`${BUNDLE}TransformCoordinates_0066 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0067
     * @tc.name      Image_TransformCoordinates_0067
     * @tc.desc      transformCoordinates(point=Point(0, -100), scale=10) returns -1000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0067 begin`);
      const actual: Point = transformCoordinates(new Point(0, -100), 10);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(0);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-1000);
      logInfo(`${BUNDLE}TransformCoordinates_0067 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0068
     * @tc.name      Image_TransformCoordinates_0068
     * @tc.desc      transformCoordinates(point=Point(0, -100), scale=100) returns -10000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0068 begin`);
      const actual: Point = transformCoordinates(new Point(0, -100), 100);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(0);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-10000);
      logInfo(`${BUNDLE}TransformCoordinates_0068 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0069
     * @tc.name      Image_TransformCoordinates_0069
     * @tc.desc      transformCoordinates(point=Point(0, -100), scale=5) returns -500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0069 begin`);
      const actual: Point = transformCoordinates(new Point(0, -100), 5);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(0);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-500);
      logInfo(`${BUNDLE}TransformCoordinates_0069 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0070
     * @tc.name      Image_TransformCoordinates_0070
     * @tc.desc      transformCoordinates(point=Point(0, -100), scale=15) returns -1500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0070 begin`);
      const actual: Point = transformCoordinates(new Point(0, -100), 15);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(0);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-1500);
      logInfo(`${BUNDLE}TransformCoordinates_0070 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0071
     * @tc.name      Image_TransformCoordinates_0071
     * @tc.desc      transformCoordinates(point=Point(0, -100), scale=20) returns -2000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0071 begin`);
      const actual: Point = transformCoordinates(new Point(0, -100), 20);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(0);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-2000);
      logInfo(`${BUNDLE}TransformCoordinates_0071 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0072
     * @tc.name      Image_TransformCoordinates_0072
     * @tc.desc      transformCoordinates(point=Point(0, -100), scale=25) returns -2500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0072 begin`);
      const actual: Point = transformCoordinates(new Point(0, -100), 25);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(0);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-2500);
      logInfo(`${BUNDLE}TransformCoordinates_0072 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0073
     * @tc.name      Image_TransformCoordinates_0073
     * @tc.desc      transformCoordinates(point=Point(0, -100), scale=30) returns -3000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0073 begin`);
      const actual: Point = transformCoordinates(new Point(0, -100), 30);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(0);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-3000);
      logInfo(`${BUNDLE}TransformCoordinates_0073 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0074
     * @tc.name      Image_TransformCoordinates_0074
     * @tc.desc      transformCoordinates(point=Point(0, -100), scale=35) returns -3500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0074 begin`);
      const actual: Point = transformCoordinates(new Point(0, -100), 35);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(0);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-3500);
      logInfo(`${BUNDLE}TransformCoordinates_0074 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0075
     * @tc.name      Image_TransformCoordinates_0075
     * @tc.desc      transformCoordinates(point=Point(0, -100), scale=40) returns -4000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0075 begin`);
      const actual: Point = transformCoordinates(new Point(0, -100), 40);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(0);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-4000);
      logInfo(`${BUNDLE}TransformCoordinates_0075 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0076
     * @tc.name      Image_TransformCoordinates_0076
     * @tc.desc      transformCoordinates(point=Point(0, -100), scale=45) returns -4500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0076 begin`);
      const actual: Point = transformCoordinates(new Point(0, -100), 45);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(0);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-4500);
      logInfo(`${BUNDLE}TransformCoordinates_0076 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0077
     * @tc.name      Image_TransformCoordinates_0077
     * @tc.desc      transformCoordinates(point=Point(0, -100), scale=50) returns -5000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0077 begin`);
      const actual: Point = transformCoordinates(new Point(0, -100), 50);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(0);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-5000);
      logInfo(`${BUNDLE}TransformCoordinates_0077 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0078
     * @tc.name      Image_TransformCoordinates_0078
     * @tc.desc      transformCoordinates(point=Point(0, -100), scale=55) returns -5500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0078 begin`);
      const actual: Point = transformCoordinates(new Point(0, -100), 55);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(0);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-5500);
      logInfo(`${BUNDLE}TransformCoordinates_0078 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0079
     * @tc.name      Image_TransformCoordinates_0079
     * @tc.desc      transformCoordinates(point=Point(0, -100), scale=60) returns -6000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0079 begin`);
      const actual: Point = transformCoordinates(new Point(0, -100), 60);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(0);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-6000);
      logInfo(`${BUNDLE}TransformCoordinates_0079 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0080
     * @tc.name      Image_TransformCoordinates_0080
     * @tc.desc      transformCoordinates(point=Point(0, -100), scale=65) returns -6500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0080 begin`);
      const actual: Point = transformCoordinates(new Point(0, -100), 65);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(0);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-6500);
      logInfo(`${BUNDLE}TransformCoordinates_0080 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0081
     * @tc.name      Image_TransformCoordinates_0081
     * @tc.desc      transformCoordinates(point=Point(0, -100), scale=70) returns -7000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0081 begin`);
      const actual: Point = transformCoordinates(new Point(0, -100), 70);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(0);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-7000);
      logInfo(`${BUNDLE}TransformCoordinates_0081 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0082
     * @tc.name      Image_TransformCoordinates_0082
     * @tc.desc      transformCoordinates(point=Point(0, -100), scale=75) returns -7500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0082 begin`);
      const actual: Point = transformCoordinates(new Point(0, -100), 75);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(0);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-7500);
      logInfo(`${BUNDLE}TransformCoordinates_0082 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0083
     * @tc.name      Image_TransformCoordinates_0083
     * @tc.desc      transformCoordinates(point=Point(0, -100), scale=80) returns -8000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0083 begin`);
      const actual: Point = transformCoordinates(new Point(0, -100), 80);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(0);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-8000);
      logInfo(`${BUNDLE}TransformCoordinates_0083 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0084
     * @tc.name      Image_TransformCoordinates_0084
     * @tc.desc      transformCoordinates(point=Point(0, -100), scale=85) returns -8500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0084 begin`);
      const actual: Point = transformCoordinates(new Point(0, -100), 85);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(0);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-8500);
      logInfo(`${BUNDLE}TransformCoordinates_0084 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0085
     * @tc.name      Image_TransformCoordinates_0085
     * @tc.desc      transformCoordinates(point=Point(0, -100), scale=90) returns -9000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0085 begin`);
      const actual: Point = transformCoordinates(new Point(0, -100), 90);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(0);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-9000);
      logInfo(`${BUNDLE}TransformCoordinates_0085 end`);
    });
  });
}
