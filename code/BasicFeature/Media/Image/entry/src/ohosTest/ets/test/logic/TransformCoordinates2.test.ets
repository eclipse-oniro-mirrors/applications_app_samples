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

/** Logic checks for transformCoordinates (35 cases). */
export default function transformCoordinates2Test(): void {
  describe('TransformCoordinates2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0086
     * @tc.name      Image_TransformCoordinates_0086
     * @tc.desc      transformCoordinates(point=Point(0, -100), scale=95) returns -9500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0086 begin`);
      const actual: Point = transformCoordinates(new Point(0, -100), 95);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(0);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-9500);
      logInfo(`${BUNDLE}TransformCoordinates_0086 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0087
     * @tc.name      Image_TransformCoordinates_0087
     * @tc.desc      transformCoordinates(point=Point(0, -100), scale=99) returns -9900
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0087 begin`);
      const actual: Point = transformCoordinates(new Point(0, -100), 99);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(0);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-9900);
      logInfo(`${BUNDLE}TransformCoordinates_0087 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0088
     * @tc.name      Image_TransformCoordinates_0088
     * @tc.desc      transformCoordinates(point=Point(0, -100), scale=127) returns -12700
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0088 begin`);
      const actual: Point = transformCoordinates(new Point(0, -100), 127);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(0);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-12700);
      logInfo(`${BUNDLE}TransformCoordinates_0088 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0089
     * @tc.name      Image_TransformCoordinates_0089
     * @tc.desc      transformCoordinates(point=Point(1, -100), scale=0.25) returns -25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0089 begin`);
      const actual: Point = transformCoordinates(new Point(1, -100), 0.25);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertClose(0.25, PRECISION);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-25);
      logInfo(`${BUNDLE}TransformCoordinates_0089 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0090
     * @tc.name      Image_TransformCoordinates_0090
     * @tc.desc      transformCoordinates(point=Point(1, -100), scale=0.5) returns -50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0090 begin`);
      const actual: Point = transformCoordinates(new Point(1, -100), 0.5);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertClose(0.5, PRECISION);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-50);
      logInfo(`${BUNDLE}TransformCoordinates_0090 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0091
     * @tc.name      Image_TransformCoordinates_0091
     * @tc.desc      transformCoordinates(point=Point(1, -100), scale=1) returns -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0091 begin`);
      const actual: Point = transformCoordinates(new Point(1, -100), 1);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(1);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-100);
      logInfo(`${BUNDLE}TransformCoordinates_0091 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0092
     * @tc.name      Image_TransformCoordinates_0092
     * @tc.desc      transformCoordinates(point=Point(1, -100), scale=1.5) returns -150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0092 begin`);
      const actual: Point = transformCoordinates(new Point(1, -100), 1.5);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertClose(1.5, PRECISION);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-150);
      logInfo(`${BUNDLE}TransformCoordinates_0092 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0093
     * @tc.name      Image_TransformCoordinates_0093
     * @tc.desc      transformCoordinates(point=Point(1, -100), scale=2) returns -200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0093 begin`);
      const actual: Point = transformCoordinates(new Point(1, -100), 2);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(2);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-200);
      logInfo(`${BUNDLE}TransformCoordinates_0093 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0094
     * @tc.name      Image_TransformCoordinates_0094
     * @tc.desc      transformCoordinates(point=Point(1, -100), scale=-1) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_TransformCoordinates_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0094 begin`);
      const actual: Point = transformCoordinates(new Point(1, -100), -1);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(-1);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(100);
      logInfo(`${BUNDLE}TransformCoordinates_0094 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0095
     * @tc.name      Image_TransformCoordinates_0095
     * @tc.desc      transformCoordinates(point=Point(1, -100), scale=3) returns -300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0095 begin`);
      const actual: Point = transformCoordinates(new Point(1, -100), 3);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(3);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-300);
      logInfo(`${BUNDLE}TransformCoordinates_0095 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0096
     * @tc.name      Image_TransformCoordinates_0096
     * @tc.desc      transformCoordinates(point=Point(1, -100), scale=10) returns -1000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0096 begin`);
      const actual: Point = transformCoordinates(new Point(1, -100), 10);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(10);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-1000);
      logInfo(`${BUNDLE}TransformCoordinates_0096 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0097
     * @tc.name      Image_TransformCoordinates_0097
     * @tc.desc      transformCoordinates(point=Point(1, -100), scale=100) returns -10000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0097 begin`);
      const actual: Point = transformCoordinates(new Point(1, -100), 100);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(100);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-10000);
      logInfo(`${BUNDLE}TransformCoordinates_0097 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0098
     * @tc.name      Image_TransformCoordinates_0098
     * @tc.desc      transformCoordinates(point=Point(1, -100), scale=5) returns -500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0098 begin`);
      const actual: Point = transformCoordinates(new Point(1, -100), 5);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(5);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-500);
      logInfo(`${BUNDLE}TransformCoordinates_0098 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0099
     * @tc.name      Image_TransformCoordinates_0099
     * @tc.desc      transformCoordinates(point=Point(1, -100), scale=15) returns -1500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0099 begin`);
      const actual: Point = transformCoordinates(new Point(1, -100), 15);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(15);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-1500);
      logInfo(`${BUNDLE}TransformCoordinates_0099 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0100
     * @tc.name      Image_TransformCoordinates_0100
     * @tc.desc      transformCoordinates(point=Point(1, -100), scale=20) returns -2000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0100 begin`);
      const actual: Point = transformCoordinates(new Point(1, -100), 20);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(20);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-2000);
      logInfo(`${BUNDLE}TransformCoordinates_0100 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0101
     * @tc.name      Image_TransformCoordinates_0101
     * @tc.desc      transformCoordinates(point=Point(1, -100), scale=25) returns -2500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0101 begin`);
      const actual: Point = transformCoordinates(new Point(1, -100), 25);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(25);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-2500);
      logInfo(`${BUNDLE}TransformCoordinates_0101 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0102
     * @tc.name      Image_TransformCoordinates_0102
     * @tc.desc      transformCoordinates(point=Point(1, -100), scale=30) returns -3000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0102 begin`);
      const actual: Point = transformCoordinates(new Point(1, -100), 30);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(30);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-3000);
      logInfo(`${BUNDLE}TransformCoordinates_0102 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0103
     * @tc.name      Image_TransformCoordinates_0103
     * @tc.desc      transformCoordinates(point=Point(1, -100), scale=35) returns -3500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0103 begin`);
      const actual: Point = transformCoordinates(new Point(1, -100), 35);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(35);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-3500);
      logInfo(`${BUNDLE}TransformCoordinates_0103 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0104
     * @tc.name      Image_TransformCoordinates_0104
     * @tc.desc      transformCoordinates(point=Point(1, -100), scale=40) returns -4000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0104 begin`);
      const actual: Point = transformCoordinates(new Point(1, -100), 40);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(40);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-4000);
      logInfo(`${BUNDLE}TransformCoordinates_0104 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0105
     * @tc.name      Image_TransformCoordinates_0105
     * @tc.desc      transformCoordinates(point=Point(1, -100), scale=45) returns -4500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0105 begin`);
      const actual: Point = transformCoordinates(new Point(1, -100), 45);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(45);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-4500);
      logInfo(`${BUNDLE}TransformCoordinates_0105 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0106
     * @tc.name      Image_TransformCoordinates_0106
     * @tc.desc      transformCoordinates(point=Point(1, -100), scale=50) returns -5000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0106 begin`);
      const actual: Point = transformCoordinates(new Point(1, -100), 50);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(50);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-5000);
      logInfo(`${BUNDLE}TransformCoordinates_0106 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0107
     * @tc.name      Image_TransformCoordinates_0107
     * @tc.desc      transformCoordinates(point=Point(1, -100), scale=55) returns -5500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0107 begin`);
      const actual: Point = transformCoordinates(new Point(1, -100), 55);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(55);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-5500);
      logInfo(`${BUNDLE}TransformCoordinates_0107 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0108
     * @tc.name      Image_TransformCoordinates_0108
     * @tc.desc      transformCoordinates(point=Point(1, -100), scale=60) returns -6000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0108 begin`);
      const actual: Point = transformCoordinates(new Point(1, -100), 60);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(60);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-6000);
      logInfo(`${BUNDLE}TransformCoordinates_0108 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0109
     * @tc.name      Image_TransformCoordinates_0109
     * @tc.desc      transformCoordinates(point=Point(1, -100), scale=65) returns -6500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0109 begin`);
      const actual: Point = transformCoordinates(new Point(1, -100), 65);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(65);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-6500);
      logInfo(`${BUNDLE}TransformCoordinates_0109 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0110
     * @tc.name      Image_TransformCoordinates_0110
     * @tc.desc      transformCoordinates(point=Point(1, -100), scale=70) returns -7000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0110 begin`);
      const actual: Point = transformCoordinates(new Point(1, -100), 70);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(70);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-7000);
      logInfo(`${BUNDLE}TransformCoordinates_0110 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0111
     * @tc.name      Image_TransformCoordinates_0111
     * @tc.desc      transformCoordinates(point=Point(1, -100), scale=75) returns -7500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0111 begin`);
      const actual: Point = transformCoordinates(new Point(1, -100), 75);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(75);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-7500);
      logInfo(`${BUNDLE}TransformCoordinates_0111 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0112
     * @tc.name      Image_TransformCoordinates_0112
     * @tc.desc      transformCoordinates(point=Point(1, -100), scale=80) returns -8000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0112 begin`);
      const actual: Point = transformCoordinates(new Point(1, -100), 80);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(80);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-8000);
      logInfo(`${BUNDLE}TransformCoordinates_0112 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0113
     * @tc.name      Image_TransformCoordinates_0113
     * @tc.desc      transformCoordinates(point=Point(1, -100), scale=85) returns -8500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0113 begin`);
      const actual: Point = transformCoordinates(new Point(1, -100), 85);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(85);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-8500);
      logInfo(`${BUNDLE}TransformCoordinates_0113 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0114
     * @tc.name      Image_TransformCoordinates_0114
     * @tc.desc      transformCoordinates(point=Point(1, -100), scale=90) returns -9000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0114 begin`);
      const actual: Point = transformCoordinates(new Point(1, -100), 90);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(90);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-9000);
      logInfo(`${BUNDLE}TransformCoordinates_0114 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0115
     * @tc.name      Image_TransformCoordinates_0115
     * @tc.desc      transformCoordinates(point=Point(1, -100), scale=95) returns -9500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0115 begin`);
      const actual: Point = transformCoordinates(new Point(1, -100), 95);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(95);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-9500);
      logInfo(`${BUNDLE}TransformCoordinates_0115 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0116
     * @tc.name      Image_TransformCoordinates_0116
     * @tc.desc      transformCoordinates(point=Point(1, -100), scale=99) returns -9900
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0116 begin`);
      const actual: Point = transformCoordinates(new Point(1, -100), 99);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(99);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-9900);
      logInfo(`${BUNDLE}TransformCoordinates_0116 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0117
     * @tc.name      Image_TransformCoordinates_0117
     * @tc.desc      transformCoordinates(point=Point(1, -100), scale=127) returns -12700
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0117 begin`);
      const actual: Point = transformCoordinates(new Point(1, -100), 127);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(127);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(-12700);
      logInfo(`${BUNDLE}TransformCoordinates_0117 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0118
     * @tc.name      Image_TransformCoordinates_0118
     * @tc.desc      transformCoordinates(point=Point(-1, -100), scale=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0118 begin`);
      const actual: Point = transformCoordinates(new Point(-1, -100), 0);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(0);
      logInfo(`transformCoordinates(point=Point(-1, -100...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(0);
      logInfo(`${BUNDLE}TransformCoordinates_0118 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0119
     * @tc.name      Image_TransformCoordinates_0119
     * @tc.desc      transformCoordinates(point=Point(0, -100), scale=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0119 begin`);
      const actual: Point = transformCoordinates(new Point(0, -100), 0);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(0);
      logInfo(`transformCoordinates(point=Point(0, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(0);
      logInfo(`${BUNDLE}TransformCoordinates_0119 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TRANSFORM_COORDINATES_0120
     * @tc.name      Image_TransformCoordinates_0120
     * @tc.desc      transformCoordinates(point=Point(1, -100), scale=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TransformCoordinates_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TransformCoordinates_0120 begin`);
      const actual: Point = transformCoordinates(new Point(1, -100), 0);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.x=${actual.x}`);
      expect(actual.x).assertEqual(0);
      logInfo(`transformCoordinates(point=Point(1, -100)...: actual.y=${actual.y}`);
      expect(actual.y).assertEqual(0);
      logInfo(`${BUNDLE}TransformCoordinates_0120 end`);
    });
  });
}
