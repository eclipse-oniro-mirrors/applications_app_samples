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

/** Logic checks for new Point (85 cases). */
export default function pointCtorTest(): void {
  describe('PointCtorTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0001
     * @tc.name      Image_PointCtor_0001
     * @tc.desc      new Point(-100, -100) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Image_PointCtor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PointCtor_0001 begin`);
      const subject: Point = new Point(-100, -100);
      logInfo(`new Point(-100, -100): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`new Point(-100, -100): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-100);
      logInfo(`${BUNDLE}PointCtor_0001 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0002
     * @tc.name      Image_PointCtor_0002
     * @tc.desc      new Point(-1, -100) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Image_PointCtor_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PointCtor_0002 begin`);
      const subject: Point = new Point(-1, -100);
      logInfo(`new Point(-1, -100): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-1);
      logInfo(`new Point(-1, -100): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-100);
      logInfo(`${BUNDLE}PointCtor_0002 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0003
     * @tc.name      Image_PointCtor_0003
     * @tc.desc      new Point(0, -100) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0003 begin`);
      const subject: Point = new Point(0, -100);
      logInfo(`new Point(0, -100): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(0);
      logInfo(`new Point(0, -100): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-100);
      logInfo(`${BUNDLE}PointCtor_0003 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0004
     * @tc.name      Image_PointCtor_0004
     * @tc.desc      new Point(1, -100) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0004 begin`);
      const subject: Point = new Point(1, -100);
      logInfo(`new Point(1, -100): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(1);
      logInfo(`new Point(1, -100): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-100);
      logInfo(`${BUNDLE}PointCtor_0004 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0005
     * @tc.name      Image_PointCtor_0005
     * @tc.desc      new Point(50, -100) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0005 begin`);
      const subject: Point = new Point(50, -100);
      logInfo(`new Point(50, -100): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(50);
      logInfo(`new Point(50, -100): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-100);
      logInfo(`${BUNDLE}PointCtor_0005 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0006
     * @tc.name      Image_PointCtor_0006
     * @tc.desc      new Point(100, -100) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0006 begin`);
      const subject: Point = new Point(100, -100);
      logInfo(`new Point(100, -100): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(100);
      logInfo(`new Point(100, -100): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-100);
      logInfo(`${BUNDLE}PointCtor_0006 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0007
     * @tc.name      Image_PointCtor_0007
     * @tc.desc      new Point(2, -100) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0007 begin`);
      const subject: Point = new Point(2, -100);
      logInfo(`new Point(2, -100): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(2);
      logInfo(`new Point(2, -100): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-100);
      logInfo(`${BUNDLE}PointCtor_0007 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0008
     * @tc.name      Image_PointCtor_0008
     * @tc.desc      new Point(3, -100) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0008 begin`);
      const subject: Point = new Point(3, -100);
      logInfo(`new Point(3, -100): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(3);
      logInfo(`new Point(3, -100): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-100);
      logInfo(`${BUNDLE}PointCtor_0008 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0009
     * @tc.name      Image_PointCtor_0009
     * @tc.desc      new Point(10, -100) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0009 begin`);
      const subject: Point = new Point(10, -100);
      logInfo(`new Point(10, -100): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(10);
      logInfo(`new Point(10, -100): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-100);
      logInfo(`${BUNDLE}PointCtor_0009 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0010
     * @tc.name      Image_PointCtor_0010
     * @tc.desc      new Point(5, -100) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0010 begin`);
      const subject: Point = new Point(5, -100);
      logInfo(`new Point(5, -100): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(5);
      logInfo(`new Point(5, -100): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-100);
      logInfo(`${BUNDLE}PointCtor_0010 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0011
     * @tc.name      Image_PointCtor_0011
     * @tc.desc      new Point(15, -100) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0011 begin`);
      const subject: Point = new Point(15, -100);
      logInfo(`new Point(15, -100): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(15);
      logInfo(`new Point(15, -100): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-100);
      logInfo(`${BUNDLE}PointCtor_0011 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0012
     * @tc.name      Image_PointCtor_0012
     * @tc.desc      new Point(20, -100) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0012 begin`);
      const subject: Point = new Point(20, -100);
      logInfo(`new Point(20, -100): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(20);
      logInfo(`new Point(20, -100): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-100);
      logInfo(`${BUNDLE}PointCtor_0012 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0013
     * @tc.name      Image_PointCtor_0013
     * @tc.desc      new Point(25, -100) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0013 begin`);
      const subject: Point = new Point(25, -100);
      logInfo(`new Point(25, -100): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(25);
      logInfo(`new Point(25, -100): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-100);
      logInfo(`${BUNDLE}PointCtor_0013 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0014
     * @tc.name      Image_PointCtor_0014
     * @tc.desc      new Point(30, -100) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0014 begin`);
      const subject: Point = new Point(30, -100);
      logInfo(`new Point(30, -100): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(30);
      logInfo(`new Point(30, -100): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-100);
      logInfo(`${BUNDLE}PointCtor_0014 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0015
     * @tc.name      Image_PointCtor_0015
     * @tc.desc      new Point(35, -100) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0015 begin`);
      const subject: Point = new Point(35, -100);
      logInfo(`new Point(35, -100): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(35);
      logInfo(`new Point(35, -100): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-100);
      logInfo(`${BUNDLE}PointCtor_0015 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0016
     * @tc.name      Image_PointCtor_0016
     * @tc.desc      new Point(40, -100) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0016 begin`);
      const subject: Point = new Point(40, -100);
      logInfo(`new Point(40, -100): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(40);
      logInfo(`new Point(40, -100): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-100);
      logInfo(`${BUNDLE}PointCtor_0016 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0017
     * @tc.name      Image_PointCtor_0017
     * @tc.desc      new Point(45, -100) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0017 begin`);
      const subject: Point = new Point(45, -100);
      logInfo(`new Point(45, -100): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(45);
      logInfo(`new Point(45, -100): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-100);
      logInfo(`${BUNDLE}PointCtor_0017 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0018
     * @tc.name      Image_PointCtor_0018
     * @tc.desc      new Point(55, -100) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0018 begin`);
      const subject: Point = new Point(55, -100);
      logInfo(`new Point(55, -100): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(55);
      logInfo(`new Point(55, -100): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-100);
      logInfo(`${BUNDLE}PointCtor_0018 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0019
     * @tc.name      Image_PointCtor_0019
     * @tc.desc      new Point(60, -100) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0019 begin`);
      const subject: Point = new Point(60, -100);
      logInfo(`new Point(60, -100): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(60);
      logInfo(`new Point(60, -100): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-100);
      logInfo(`${BUNDLE}PointCtor_0019 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0020
     * @tc.name      Image_PointCtor_0020
     * @tc.desc      new Point(65, -100) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0020 begin`);
      const subject: Point = new Point(65, -100);
      logInfo(`new Point(65, -100): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(65);
      logInfo(`new Point(65, -100): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-100);
      logInfo(`${BUNDLE}PointCtor_0020 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0021
     * @tc.name      Image_PointCtor_0021
     * @tc.desc      new Point(70, -100) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0021 begin`);
      const subject: Point = new Point(70, -100);
      logInfo(`new Point(70, -100): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(70);
      logInfo(`new Point(70, -100): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-100);
      logInfo(`${BUNDLE}PointCtor_0021 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0022
     * @tc.name      Image_PointCtor_0022
     * @tc.desc      new Point(75, -100) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0022 begin`);
      const subject: Point = new Point(75, -100);
      logInfo(`new Point(75, -100): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(75);
      logInfo(`new Point(75, -100): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-100);
      logInfo(`${BUNDLE}PointCtor_0022 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0023
     * @tc.name      Image_PointCtor_0023
     * @tc.desc      new Point(80, -100) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0023 begin`);
      const subject: Point = new Point(80, -100);
      logInfo(`new Point(80, -100): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(80);
      logInfo(`new Point(80, -100): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-100);
      logInfo(`${BUNDLE}PointCtor_0023 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0024
     * @tc.name      Image_PointCtor_0024
     * @tc.desc      new Point(85, -100) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0024 begin`);
      const subject: Point = new Point(85, -100);
      logInfo(`new Point(85, -100): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(85);
      logInfo(`new Point(85, -100): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-100);
      logInfo(`${BUNDLE}PointCtor_0024 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0025
     * @tc.name      Image_PointCtor_0025
     * @tc.desc      new Point(90, -100) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0025 begin`);
      const subject: Point = new Point(90, -100);
      logInfo(`new Point(90, -100): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(90);
      logInfo(`new Point(90, -100): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-100);
      logInfo(`${BUNDLE}PointCtor_0025 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0026
     * @tc.name      Image_PointCtor_0026
     * @tc.desc      new Point(95, -100) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0026 begin`);
      const subject: Point = new Point(95, -100);
      logInfo(`new Point(95, -100): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(95);
      logInfo(`new Point(95, -100): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-100);
      logInfo(`${BUNDLE}PointCtor_0026 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0027
     * @tc.name      Image_PointCtor_0027
     * @tc.desc      new Point(105, -100) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0027 begin`);
      const subject: Point = new Point(105, -100);
      logInfo(`new Point(105, -100): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(105);
      logInfo(`new Point(105, -100): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-100);
      logInfo(`${BUNDLE}PointCtor_0027 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0028
     * @tc.name      Image_PointCtor_0028
     * @tc.desc      new Point(8, -100) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0028 begin`);
      const subject: Point = new Point(8, -100);
      logInfo(`new Point(8, -100): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(8);
      logInfo(`new Point(8, -100): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-100);
      logInfo(`${BUNDLE}PointCtor_0028 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0029
     * @tc.name      Image_PointCtor_0029
     * @tc.desc      new Point(170, -100) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0029 begin`);
      const subject: Point = new Point(170, -100);
      logInfo(`new Point(170, -100): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(170);
      logInfo(`new Point(170, -100): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-100);
      logInfo(`${BUNDLE}PointCtor_0029 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0030
     * @tc.name      Image_PointCtor_0030
     * @tc.desc      new Point(-66, -100) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0030 begin`);
      const subject: Point = new Point(-66, -100);
      logInfo(`new Point(-66, -100): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-66);
      logInfo(`new Point(-66, -100): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-100);
      logInfo(`${BUNDLE}PointCtor_0030 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0031
     * @tc.name      Image_PointCtor_0031
     * @tc.desc      new Point(-100, -1) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0031 begin`);
      const subject: Point = new Point(-100, -1);
      logInfo(`new Point(-100, -1): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`new Point(-100, -1): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-1);
      logInfo(`${BUNDLE}PointCtor_0031 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0032
     * @tc.name      Image_PointCtor_0032
     * @tc.desc      new Point(-100, 0) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0032 begin`);
      const subject: Point = new Point(-100, 0);
      logInfo(`new Point(-100, 0): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`new Point(-100, 0): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(0);
      logInfo(`${BUNDLE}PointCtor_0032 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0033
     * @tc.name      Image_PointCtor_0033
     * @tc.desc      new Point(-100, 1) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0033 begin`);
      const subject: Point = new Point(-100, 1);
      logInfo(`new Point(-100, 1): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`new Point(-100, 1): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(1);
      logInfo(`${BUNDLE}PointCtor_0033 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0034
     * @tc.name      Image_PointCtor_0034
     * @tc.desc      new Point(-100, 50) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0034 begin`);
      const subject: Point = new Point(-100, 50);
      logInfo(`new Point(-100, 50): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`new Point(-100, 50): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(50);
      logInfo(`${BUNDLE}PointCtor_0034 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0035
     * @tc.name      Image_PointCtor_0035
     * @tc.desc      new Point(-100, 100) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0035 begin`);
      const subject: Point = new Point(-100, 100);
      logInfo(`new Point(-100, 100): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`new Point(-100, 100): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(100);
      logInfo(`${BUNDLE}PointCtor_0035 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0036
     * @tc.name      Image_PointCtor_0036
     * @tc.desc      new Point(-100, 2) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0036 begin`);
      const subject: Point = new Point(-100, 2);
      logInfo(`new Point(-100, 2): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`new Point(-100, 2): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(2);
      logInfo(`${BUNDLE}PointCtor_0036 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0037
     * @tc.name      Image_PointCtor_0037
     * @tc.desc      new Point(-100, 3) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0037 begin`);
      const subject: Point = new Point(-100, 3);
      logInfo(`new Point(-100, 3): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`new Point(-100, 3): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(3);
      logInfo(`${BUNDLE}PointCtor_0037 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0038
     * @tc.name      Image_PointCtor_0038
     * @tc.desc      new Point(-100, 10) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0038 begin`);
      const subject: Point = new Point(-100, 10);
      logInfo(`new Point(-100, 10): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`new Point(-100, 10): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(10);
      logInfo(`${BUNDLE}PointCtor_0038 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0039
     * @tc.name      Image_PointCtor_0039
     * @tc.desc      new Point(-100, 5) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0039 begin`);
      const subject: Point = new Point(-100, 5);
      logInfo(`new Point(-100, 5): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`new Point(-100, 5): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(5);
      logInfo(`${BUNDLE}PointCtor_0039 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0040
     * @tc.name      Image_PointCtor_0040
     * @tc.desc      new Point(-100, 15) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0040 begin`);
      const subject: Point = new Point(-100, 15);
      logInfo(`new Point(-100, 15): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`new Point(-100, 15): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(15);
      logInfo(`${BUNDLE}PointCtor_0040 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0041
     * @tc.name      Image_PointCtor_0041
     * @tc.desc      new Point(-100, 20) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0041 begin`);
      const subject: Point = new Point(-100, 20);
      logInfo(`new Point(-100, 20): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`new Point(-100, 20): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(20);
      logInfo(`${BUNDLE}PointCtor_0041 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0042
     * @tc.name      Image_PointCtor_0042
     * @tc.desc      new Point(-100, 25) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0042 begin`);
      const subject: Point = new Point(-100, 25);
      logInfo(`new Point(-100, 25): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`new Point(-100, 25): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(25);
      logInfo(`${BUNDLE}PointCtor_0042 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0043
     * @tc.name      Image_PointCtor_0043
     * @tc.desc      new Point(-100, 30) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0043 begin`);
      const subject: Point = new Point(-100, 30);
      logInfo(`new Point(-100, 30): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`new Point(-100, 30): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(30);
      logInfo(`${BUNDLE}PointCtor_0043 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0044
     * @tc.name      Image_PointCtor_0044
     * @tc.desc      new Point(-100, 35) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0044 begin`);
      const subject: Point = new Point(-100, 35);
      logInfo(`new Point(-100, 35): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`new Point(-100, 35): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(35);
      logInfo(`${BUNDLE}PointCtor_0044 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0045
     * @tc.name      Image_PointCtor_0045
     * @tc.desc      new Point(-100, 40) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0045 begin`);
      const subject: Point = new Point(-100, 40);
      logInfo(`new Point(-100, 40): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`new Point(-100, 40): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(40);
      logInfo(`${BUNDLE}PointCtor_0045 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0046
     * @tc.name      Image_PointCtor_0046
     * @tc.desc      new Point(-100, 45) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0046 begin`);
      const subject: Point = new Point(-100, 45);
      logInfo(`new Point(-100, 45): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`new Point(-100, 45): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(45);
      logInfo(`${BUNDLE}PointCtor_0046 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0047
     * @tc.name      Image_PointCtor_0047
     * @tc.desc      new Point(-100, 55) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0047 begin`);
      const subject: Point = new Point(-100, 55);
      logInfo(`new Point(-100, 55): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`new Point(-100, 55): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(55);
      logInfo(`${BUNDLE}PointCtor_0047 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0048
     * @tc.name      Image_PointCtor_0048
     * @tc.desc      new Point(-100, 60) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0048 begin`);
      const subject: Point = new Point(-100, 60);
      logInfo(`new Point(-100, 60): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`new Point(-100, 60): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(60);
      logInfo(`${BUNDLE}PointCtor_0048 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0049
     * @tc.name      Image_PointCtor_0049
     * @tc.desc      new Point(-100, 65) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0049 begin`);
      const subject: Point = new Point(-100, 65);
      logInfo(`new Point(-100, 65): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`new Point(-100, 65): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(65);
      logInfo(`${BUNDLE}PointCtor_0049 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0050
     * @tc.name      Image_PointCtor_0050
     * @tc.desc      new Point(-100, 70) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0050 begin`);
      const subject: Point = new Point(-100, 70);
      logInfo(`new Point(-100, 70): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`new Point(-100, 70): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(70);
      logInfo(`${BUNDLE}PointCtor_0050 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0051
     * @tc.name      Image_PointCtor_0051
     * @tc.desc      new Point(-100, 75) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0051 begin`);
      const subject: Point = new Point(-100, 75);
      logInfo(`new Point(-100, 75): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`new Point(-100, 75): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(75);
      logInfo(`${BUNDLE}PointCtor_0051 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0052
     * @tc.name      Image_PointCtor_0052
     * @tc.desc      new Point(-100, 80) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0052 begin`);
      const subject: Point = new Point(-100, 80);
      logInfo(`new Point(-100, 80): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`new Point(-100, 80): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(80);
      logInfo(`${BUNDLE}PointCtor_0052 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0053
     * @tc.name      Image_PointCtor_0053
     * @tc.desc      new Point(-100, 85) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0053 begin`);
      const subject: Point = new Point(-100, 85);
      logInfo(`new Point(-100, 85): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`new Point(-100, 85): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(85);
      logInfo(`${BUNDLE}PointCtor_0053 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0054
     * @tc.name      Image_PointCtor_0054
     * @tc.desc      new Point(-100, 90) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0054 begin`);
      const subject: Point = new Point(-100, 90);
      logInfo(`new Point(-100, 90): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`new Point(-100, 90): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(90);
      logInfo(`${BUNDLE}PointCtor_0054 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0055
     * @tc.name      Image_PointCtor_0055
     * @tc.desc      new Point(-100, 95) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0055 begin`);
      const subject: Point = new Point(-100, 95);
      logInfo(`new Point(-100, 95): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`new Point(-100, 95): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(95);
      logInfo(`${BUNDLE}PointCtor_0055 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0056
     * @tc.name      Image_PointCtor_0056
     * @tc.desc      new Point(-100, 105) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0056 begin`);
      const subject: Point = new Point(-100, 105);
      logInfo(`new Point(-100, 105): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`new Point(-100, 105): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(105);
      logInfo(`${BUNDLE}PointCtor_0056 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0057
     * @tc.name      Image_PointCtor_0057
     * @tc.desc      new Point(-100, 86) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0057 begin`);
      const subject: Point = new Point(-100, 86);
      logInfo(`new Point(-100, 86): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`new Point(-100, 86): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(86);
      logInfo(`${BUNDLE}PointCtor_0057 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0058
     * @tc.name      Image_PointCtor_0058
     * @tc.desc      new Point(-100, 127) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0058 begin`);
      const subject: Point = new Point(-100, 127);
      logInfo(`new Point(-100, 127): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`new Point(-100, 127): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(127);
      logInfo(`${BUNDLE}PointCtor_0058 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0059
     * @tc.name      Image_PointCtor_0059
     * @tc.desc      new Point(-100, 51) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0059 begin`);
      const subject: Point = new Point(-100, 51);
      logInfo(`new Point(-100, 51): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`new Point(-100, 51): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(51);
      logInfo(`${BUNDLE}PointCtor_0059 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0060
     * @tc.name      Image_PointCtor_0060
     * @tc.desc      new Point(90, 90) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0060 begin`);
      const subject: Point = new Point(90, 90);
      logInfo(`new Point(90, 90): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(90);
      logInfo(`new Point(90, 90): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(90);
      logInfo(`${BUNDLE}PointCtor_0060 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0061
     * @tc.name      Image_PointCtor_0061
     * @tc.desc      new Point(100, 85) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0061 begin`);
      const subject: Point = new Point(100, 85);
      logInfo(`new Point(100, 85): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(100);
      logInfo(`new Point(100, 85): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(85);
      logInfo(`${BUNDLE}PointCtor_0061 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0062
     * @tc.name      Image_PointCtor_0062
     * @tc.desc      new Point(15, 127) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0062 begin`);
      const subject: Point = new Point(15, 127);
      logInfo(`new Point(15, 127): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(15);
      logInfo(`new Point(15, 127): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(127);
      logInfo(`${BUNDLE}PointCtor_0062 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0063
     * @tc.name      Image_PointCtor_0063
     * @tc.desc      new Point(-1, 3) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0063 begin`);
      const subject: Point = new Point(-1, 3);
      logInfo(`new Point(-1, 3): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-1);
      logInfo(`new Point(-1, 3): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(3);
      logInfo(`${BUNDLE}PointCtor_0063 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0064
     * @tc.name      Image_PointCtor_0064
     * @tc.desc      new Point(65, 80) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0064 begin`);
      const subject: Point = new Point(65, 80);
      logInfo(`new Point(65, 80): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(65);
      logInfo(`new Point(65, 80): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(80);
      logInfo(`${BUNDLE}PointCtor_0064 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0065
     * @tc.name      Image_PointCtor_0065
     * @tc.desc      new Point(45, 105) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0065 begin`);
      const subject: Point = new Point(45, 105);
      logInfo(`new Point(45, 105): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(45);
      logInfo(`new Point(45, 105): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(105);
      logInfo(`${BUNDLE}PointCtor_0065 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0066
     * @tc.name      Image_PointCtor_0066
     * @tc.desc      new Point(10, 1) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0066 begin`);
      const subject: Point = new Point(10, 1);
      logInfo(`new Point(10, 1): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(10);
      logInfo(`new Point(10, 1): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(1);
      logInfo(`${BUNDLE}PointCtor_0066 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0067
     * @tc.name      Image_PointCtor_0067
     * @tc.desc      new Point(85, 90) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0067 begin`);
      const subject: Point = new Point(85, 90);
      logInfo(`new Point(85, 90): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(85);
      logInfo(`new Point(85, 90): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(90);
      logInfo(`${BUNDLE}PointCtor_0067 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0068
     * @tc.name      Image_PointCtor_0068
     * @tc.desc      new Point(-1, 25) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0068 begin`);
      const subject: Point = new Point(-1, 25);
      logInfo(`new Point(-1, 25): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-1);
      logInfo(`new Point(-1, 25): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(25);
      logInfo(`${BUNDLE}PointCtor_0068 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0069
     * @tc.name      Image_PointCtor_0069
     * @tc.desc      new Point(85, 95) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0069 begin`);
      const subject: Point = new Point(85, 95);
      logInfo(`new Point(85, 95): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(85);
      logInfo(`new Point(85, 95): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(95);
      logInfo(`${BUNDLE}PointCtor_0069 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0070
     * @tc.name      Image_PointCtor_0070
     * @tc.desc      new Point(-66, 60) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0070 begin`);
      const subject: Point = new Point(-66, 60);
      logInfo(`new Point(-66, 60): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-66);
      logInfo(`new Point(-66, 60): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(60);
      logInfo(`${BUNDLE}PointCtor_0070 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0071
     * @tc.name      Image_PointCtor_0071
     * @tc.desc      new Point(30, 86) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0071 begin`);
      const subject: Point = new Point(30, 86);
      logInfo(`new Point(30, 86): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(30);
      logInfo(`new Point(30, 86): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(86);
      logInfo(`${BUNDLE}PointCtor_0071 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0072
     * @tc.name      Image_PointCtor_0072
     * @tc.desc      new Point(45, 25) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0072 begin`);
      const subject: Point = new Point(45, 25);
      logInfo(`new Point(45, 25): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(45);
      logInfo(`new Point(45, 25): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(25);
      logInfo(`${BUNDLE}PointCtor_0072 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0073
     * @tc.name      Image_PointCtor_0073
     * @tc.desc      new Point(170, 10) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0073 begin`);
      const subject: Point = new Point(170, 10);
      logInfo(`new Point(170, 10): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(170);
      logInfo(`new Point(170, 10): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(10);
      logInfo(`${BUNDLE}PointCtor_0073 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0074
     * @tc.name      Image_PointCtor_0074
     * @tc.desc      new Point(-66, 1) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0074 begin`);
      const subject: Point = new Point(-66, 1);
      logInfo(`new Point(-66, 1): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-66);
      logInfo(`new Point(-66, 1): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(1);
      logInfo(`${BUNDLE}PointCtor_0074 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0075
     * @tc.name      Image_PointCtor_0075
     * @tc.desc      new Point(3, 65) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0075 begin`);
      const subject: Point = new Point(3, 65);
      logInfo(`new Point(3, 65): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(3);
      logInfo(`new Point(3, 65): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(65);
      logInfo(`${BUNDLE}PointCtor_0075 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0076
     * @tc.name      Image_PointCtor_0076
     * @tc.desc      new Point(65, 60) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0076 begin`);
      const subject: Point = new Point(65, 60);
      logInfo(`new Point(65, 60): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(65);
      logInfo(`new Point(65, 60): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(60);
      logInfo(`${BUNDLE}PointCtor_0076 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0077
     * @tc.name      Image_PointCtor_0077
     * @tc.desc      new Point(45, 70) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0077 begin`);
      const subject: Point = new Point(45, 70);
      logInfo(`new Point(45, 70): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(45);
      logInfo(`new Point(45, 70): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(70);
      logInfo(`${BUNDLE}PointCtor_0077 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0078
     * @tc.name      Image_PointCtor_0078
     * @tc.desc      new Point(95, 3) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0078 begin`);
      const subject: Point = new Point(95, 3);
      logInfo(`new Point(95, 3): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(95);
      logInfo(`new Point(95, 3): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(3);
      logInfo(`${BUNDLE}PointCtor_0078 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0079
     * @tc.name      Image_PointCtor_0079
     * @tc.desc      new Point(-1, 5) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0079 begin`);
      const subject: Point = new Point(-1, 5);
      logInfo(`new Point(-1, 5): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-1);
      logInfo(`new Point(-1, 5): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(5);
      logInfo(`${BUNDLE}PointCtor_0079 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0080
     * @tc.name      Image_PointCtor_0080
     * @tc.desc      new Point(2, 80) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0080 begin`);
      const subject: Point = new Point(2, 80);
      logInfo(`new Point(2, 80): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(2);
      logInfo(`new Point(2, 80): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(80);
      logInfo(`${BUNDLE}PointCtor_0080 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0081
     * @tc.name      Image_PointCtor_0081
     * @tc.desc      new Point(80, 5) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0081 begin`);
      const subject: Point = new Point(80, 5);
      logInfo(`new Point(80, 5): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(80);
      logInfo(`new Point(80, 5): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(5);
      logInfo(`${BUNDLE}PointCtor_0081 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0082
     * @tc.name      Image_PointCtor_0082
     * @tc.desc      new Point(0, 25) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0082 begin`);
      const subject: Point = new Point(0, 25);
      logInfo(`new Point(0, 25): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(0);
      logInfo(`new Point(0, 25): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(25);
      logInfo(`${BUNDLE}PointCtor_0082 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0083
     * @tc.name      Image_PointCtor_0083
     * @tc.desc      new Point(95, 10) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0083 begin`);
      const subject: Point = new Point(95, 10);
      logInfo(`new Point(95, 10): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(95);
      logInfo(`new Point(95, 10): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(10);
      logInfo(`${BUNDLE}PointCtor_0083 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0084
     * @tc.name      Image_PointCtor_0084
     * @tc.desc      new Point(55, 70) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0084 begin`);
      const subject: Point = new Point(55, 70);
      logInfo(`new Point(55, 70): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(55);
      logInfo(`new Point(55, 70): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(70);
      logInfo(`${BUNDLE}PointCtor_0084 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_POINT_CTOR_0085
     * @tc.name      Image_PointCtor_0085
     * @tc.desc      new Point(50, 35) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_PointCtor_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PointCtor_0085 begin`);
      const subject: Point = new Point(50, 35);
      logInfo(`new Point(50, 35): subject.x=${subject.x}`);
      expect(subject.x).assertEqual(50);
      logInfo(`new Point(50, 35): subject.y=${subject.y}`);
      expect(subject.y).assertEqual(35);
      logInfo(`${BUNDLE}PointCtor_0085 end`);
    });
  });
}
