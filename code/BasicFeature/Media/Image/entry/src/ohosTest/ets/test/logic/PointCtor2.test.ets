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
import { Point } from '../../../../main/ets/bridge/PhotomodifyBridge';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Image]';
const BUNDLE: string = 'Image_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for new Point (44 cases). */
export default function pointCtor2Test(): void {
  describe('PointCtor2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0086
     * @tc.name      Image_PointCtor_0086
     * @tc.desc      new Point(40, 55) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0086 begin`);
      const subject: Point = new Point(40, 55);
      logInfo(`new Point(40, 55): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(40);
      logInfo(`new Point(40, 55): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(55);
      logInfo(`${BUNDLE}PointCtor_0086 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0087
     * @tc.name      Image_PointCtor_0087
     * @tc.desc      new Point(2, 60) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0087 begin`);
      const subject: Point = new Point(2, 60);
      logInfo(`new Point(2, 60): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(2);
      logInfo(`new Point(2, 60): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(60);
      logInfo(`${BUNDLE}PointCtor_0087 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0088
     * @tc.name      Image_PointCtor_0088
     * @tc.desc      new Point(80, 105) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0088 begin`);
      const subject: Point = new Point(80, 105);
      logInfo(`new Point(80, 105): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(80);
      logInfo(`new Point(80, 105): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(105);
      logInfo(`${BUNDLE}PointCtor_0088 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0089
     * @tc.name      Image_PointCtor_0089
     * @tc.desc      new Point(10, -1) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0089 begin`);
      const subject: Point = new Point(10, -1);
      logInfo(`new Point(10, -1): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(10);
      logInfo(`new Point(10, -1): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-1);
      logInfo(`${BUNDLE}PointCtor_0089 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0090
     * @tc.name      Image_PointCtor_0090
     * @tc.desc      new Point(25, 90) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0090 begin`);
      const subject: Point = new Point(25, 90);
      logInfo(`new Point(25, 90): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(25);
      logInfo(`new Point(25, 90): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(90);
      logInfo(`${BUNDLE}PointCtor_0090 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0091
     * @tc.name      Image_PointCtor_0091
     * @tc.desc      new Point(90, 15) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0091 begin`);
      const subject: Point = new Point(90, 15);
      logInfo(`new Point(90, 15): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(90);
      logInfo(`new Point(90, 15): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(15);
      logInfo(`${BUNDLE}PointCtor_0091 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0092
     * @tc.name      Image_PointCtor_0092
     * @tc.desc      new Point(30, 80) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0092 begin`);
      const subject: Point = new Point(30, 80);
      logInfo(`new Point(30, 80): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(30);
      logInfo(`new Point(30, 80): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(80);
      logInfo(`${BUNDLE}PointCtor_0092 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0093
     * @tc.name      Image_PointCtor_0093
     * @tc.desc      new Point(0, 85) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0093 begin`);
      const subject: Point = new Point(0, 85);
      logInfo(`new Point(0, 85): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(0);
      logInfo(`new Point(0, 85): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(85);
      logInfo(`${BUNDLE}PointCtor_0093 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0094
     * @tc.name      Image_PointCtor_0094
     * @tc.desc      new Point(70, 0) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0094 begin`);
      const subject: Point = new Point(70, 0);
      logInfo(`new Point(70, 0): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(70);
      logInfo(`new Point(70, 0): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(0);
      logInfo(`${BUNDLE}PointCtor_0094 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0095
     * @tc.name      Image_PointCtor_0095
     * @tc.desc      new Point(85, 2) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0095 begin`);
      const subject: Point = new Point(85, 2);
      logInfo(`new Point(85, 2): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(85);
      logInfo(`new Point(85, 2): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(2);
      logInfo(`${BUNDLE}PointCtor_0095 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0096
     * @tc.name      Image_PointCtor_0096
     * @tc.desc      new Point(1, 105) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0096 begin`);
      const subject: Point = new Point(1, 105);
      logInfo(`new Point(1, 105): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(1);
      logInfo(`new Point(1, 105): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(105);
      logInfo(`${BUNDLE}PointCtor_0096 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0097
     * @tc.name      Image_PointCtor_0097
     * @tc.desc      new Point(70, 5) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0097 begin`);
      const subject: Point = new Point(70, 5);
      logInfo(`new Point(70, 5): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(70);
      logInfo(`new Point(70, 5): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(5);
      logInfo(`${BUNDLE}PointCtor_0097 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0098
     * @tc.name      Image_PointCtor_0098
     * @tc.desc      new Point(40, 5) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0098 begin`);
      const subject: Point = new Point(40, 5);
      logInfo(`new Point(40, 5): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(40);
      logInfo(`new Point(40, 5): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(5);
      logInfo(`${BUNDLE}PointCtor_0098 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0099
     * @tc.name      Image_PointCtor_0099
     * @tc.desc      new Point(2, 127) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0099 begin`);
      const subject: Point = new Point(2, 127);
      logInfo(`new Point(2, 127): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(2);
      logInfo(`new Point(2, 127): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(127);
      logInfo(`${BUNDLE}PointCtor_0099 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0100
     * @tc.name      Image_PointCtor_0100
     * @tc.desc      new Point(3, -1) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0100 begin`);
      const subject: Point = new Point(3, -1);
      logInfo(`new Point(3, -1): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(3);
      logInfo(`new Point(3, -1): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-1);
      logInfo(`${BUNDLE}PointCtor_0100 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0101
     * @tc.name      Image_PointCtor_0101
     * @tc.desc      new Point(10, 95) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0101 begin`);
      const subject: Point = new Point(10, 95);
      logInfo(`new Point(10, 95): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(10);
      logInfo(`new Point(10, 95): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(95);
      logInfo(`${BUNDLE}PointCtor_0101 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0102
     * @tc.name      Image_PointCtor_0102
     * @tc.desc      new Point(75, 35) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0102 begin`);
      const subject: Point = new Point(75, 35);
      logInfo(`new Point(75, 35): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(75);
      logInfo(`new Point(75, 35): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(35);
      logInfo(`${BUNDLE}PointCtor_0102 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0103
     * @tc.name      Image_PointCtor_0103
     * @tc.desc      new Point(3, 86) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0103 begin`);
      const subject: Point = new Point(3, 86);
      logInfo(`new Point(3, 86): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(3);
      logInfo(`new Point(3, 86): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(86);
      logInfo(`${BUNDLE}PointCtor_0103 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0104
     * @tc.name      Image_PointCtor_0104
     * @tc.desc      new Point(65, 5) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0104 begin`);
      const subject: Point = new Point(65, 5);
      logInfo(`new Point(65, 5): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(65);
      logInfo(`new Point(65, 5): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(5);
      logInfo(`${BUNDLE}PointCtor_0104 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0105
     * @tc.name      Image_PointCtor_0105
     * @tc.desc      new Point(90, 45) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0105 begin`);
      const subject: Point = new Point(90, 45);
      logInfo(`new Point(90, 45): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(90);
      logInfo(`new Point(90, 45): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(45);
      logInfo(`${BUNDLE}PointCtor_0105 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0106
     * @tc.name      Image_PointCtor_0106
     * @tc.desc      new Point(10, 127) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0106 begin`);
      const subject: Point = new Point(10, 127);
      logInfo(`new Point(10, 127): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(10);
      logInfo(`new Point(10, 127): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(127);
      logInfo(`${BUNDLE}PointCtor_0106 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0107
     * @tc.name      Image_PointCtor_0107
     * @tc.desc      new Point(25, 80) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0107 begin`);
      const subject: Point = new Point(25, 80);
      logInfo(`new Point(25, 80): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(25);
      logInfo(`new Point(25, 80): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(80);
      logInfo(`${BUNDLE}PointCtor_0107 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0108
     * @tc.name      Image_PointCtor_0108
     * @tc.desc      new Point(35, 85) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0108 begin`);
      const subject: Point = new Point(35, 85);
      logInfo(`new Point(35, 85): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(35);
      logInfo(`new Point(35, 85): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(85);
      logInfo(`${BUNDLE}PointCtor_0108 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0109
     * @tc.name      Image_PointCtor_0109
     * @tc.desc      new Point(60, 35) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0109 begin`);
      const subject: Point = new Point(60, 35);
      logInfo(`new Point(60, 35): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(60);
      logInfo(`new Point(60, 35): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(35);
      logInfo(`${BUNDLE}PointCtor_0109 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0110
     * @tc.name      Image_PointCtor_0110
     * @tc.desc      new Point(45, 127) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0110 begin`);
      const subject: Point = new Point(45, 127);
      logInfo(`new Point(45, 127): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(45);
      logInfo(`new Point(45, 127): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(127);
      logInfo(`${BUNDLE}PointCtor_0110 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0111
     * @tc.name      Image_PointCtor_0111
     * @tc.desc      new Point(75, 0) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0111 begin`);
      const subject: Point = new Point(75, 0);
      logInfo(`new Point(75, 0): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(75);
      logInfo(`new Point(75, 0): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(0);
      logInfo(`${BUNDLE}PointCtor_0111 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0112
     * @tc.name      Image_PointCtor_0112
     * @tc.desc      new Point(20, 20) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0112 begin`);
      const subject: Point = new Point(20, 20);
      logInfo(`new Point(20, 20): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(20);
      logInfo(`new Point(20, 20): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(20);
      logInfo(`${BUNDLE}PointCtor_0112 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0113
     * @tc.name      Image_PointCtor_0113
     * @tc.desc      new Point(80, 40) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0113 begin`);
      const subject: Point = new Point(80, 40);
      logInfo(`new Point(80, 40): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(80);
      logInfo(`new Point(80, 40): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(40);
      logInfo(`${BUNDLE}PointCtor_0113 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0114
     * @tc.name      Image_PointCtor_0114
     * @tc.desc      new Point(65, 95) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0114 begin`);
      const subject: Point = new Point(65, 95);
      logInfo(`new Point(65, 95): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(65);
      logInfo(`new Point(65, 95): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(95);
      logInfo(`${BUNDLE}PointCtor_0114 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0115
     * @tc.name      Image_PointCtor_0115
     * @tc.desc      new Point(30, 65) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0115 begin`);
      const subject: Point = new Point(30, 65);
      logInfo(`new Point(30, 65): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(30);
      logInfo(`new Point(30, 65): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(65);
      logInfo(`${BUNDLE}PointCtor_0115 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0116
     * @tc.name      Image_PointCtor_0116
     * @tc.desc      new Point(80, 100) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0116 begin`);
      const subject: Point = new Point(80, 100);
      logInfo(`new Point(80, 100): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(80);
      logInfo(`new Point(80, 100): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(100);
      logInfo(`${BUNDLE}PointCtor_0116 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0117
     * @tc.name      Image_PointCtor_0117
     * @tc.desc      new Point(2, 85) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0117 begin`);
      const subject: Point = new Point(2, 85);
      logInfo(`new Point(2, 85): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(2);
      logInfo(`new Point(2, 85): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(85);
      logInfo(`${BUNDLE}PointCtor_0117 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0118
     * @tc.name      Image_PointCtor_0118
     * @tc.desc      new Point(60, 85) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0118 begin`);
      const subject: Point = new Point(60, 85);
      logInfo(`new Point(60, 85): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(60);
      logInfo(`new Point(60, 85): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(85);
      logInfo(`${BUNDLE}PointCtor_0118 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0119
     * @tc.name      Image_PointCtor_0119
     * @tc.desc      new Point(95, 90) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0119 begin`);
      const subject: Point = new Point(95, 90);
      logInfo(`new Point(95, 90): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(95);
      logInfo(`new Point(95, 90): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(90);
      logInfo(`${BUNDLE}PointCtor_0119 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0120
     * @tc.name      Image_PointCtor_0120
     * @tc.desc      new Point(85, 55) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0120 begin`);
      const subject: Point = new Point(85, 55);
      logInfo(`new Point(85, 55): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(85);
      logInfo(`new Point(85, 55): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(55);
      logInfo(`${BUNDLE}PointCtor_0120 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0121
     * @tc.name      Image_PointCtor_0121
     * @tc.desc      new Point(35, 3) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0121 begin`);
      const subject: Point = new Point(35, 3);
      logInfo(`new Point(35, 3): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(35);
      logInfo(`new Point(35, 3): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(3);
      logInfo(`${BUNDLE}PointCtor_0121 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0122
     * @tc.name      Image_PointCtor_0122
     * @tc.desc      new Point(5, 75) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0122 begin`);
      const subject: Point = new Point(5, 75);
      logInfo(`new Point(5, 75): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(5);
      logInfo(`new Point(5, 75): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(75);
      logInfo(`${BUNDLE}PointCtor_0122 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0123
     * @tc.name      Image_PointCtor_0123
     * @tc.desc      new Point(65, 55) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0123 begin`);
      const subject: Point = new Point(65, 55);
      logInfo(`new Point(65, 55): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(65);
      logInfo(`new Point(65, 55): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(55);
      logInfo(`${BUNDLE}PointCtor_0123 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0124
     * @tc.name      Image_PointCtor_0124
     * @tc.desc      new Point(10, 105) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0124 begin`);
      const subject: Point = new Point(10, 105);
      logInfo(`new Point(10, 105): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(10);
      logInfo(`new Point(10, 105): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(105);
      logInfo(`${BUNDLE}PointCtor_0124 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0125
     * @tc.name      Image_PointCtor_0125
     * @tc.desc      new Point(85, 30) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0125 begin`);
      const subject: Point = new Point(85, 30);
      logInfo(`new Point(85, 30): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(85);
      logInfo(`new Point(85, 30): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(30);
      logInfo(`${BUNDLE}PointCtor_0125 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0126
     * @tc.name      Image_PointCtor_0126
     * @tc.desc      new Point(8, 15) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0126 begin`);
      const subject: Point = new Point(8, 15);
      logInfo(`new Point(8, 15): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(8);
      logInfo(`new Point(8, 15): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(15);
      logInfo(`${BUNDLE}PointCtor_0126 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0127
     * @tc.name      Image_PointCtor_0127
     * @tc.desc      new Point(60, 86) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0127 begin`);
      const subject: Point = new Point(60, 86);
      logInfo(`new Point(60, 86): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(60);
      logInfo(`new Point(60, 86): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(86);
      logInfo(`${BUNDLE}PointCtor_0127 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0128
     * @tc.name      Image_PointCtor_0128
     * @tc.desc      new Point(1, 90) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0128 begin`);
      const subject: Point = new Point(1, 90);
      logInfo(`new Point(1, 90): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(1);
      logInfo(`new Point(1, 90): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(90);
      logInfo(`${BUNDLE}PointCtor_0128 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0129
     * @tc.name      Image_PointCtor_0129
     * @tc.desc      new Point(0, 50) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0129 begin`);
      const subject: Point = new Point(0, 50);
      logInfo(`new Point(0, 50): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(0);
      logInfo(`new Point(0, 50): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(50);
      logInfo(`${BUNDLE}PointCtor_0129 end`);
    });
  });
}
