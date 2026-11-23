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
import { yieldToEventLoop } from './YieldToEventLoop';
import hilog from '@ohos.hilog';
import {
  transformCoordinates, offsetOrigin, Point, getContainSize, Size as ContainSize
} from '../../../main/ets/bridge/PhotomodifyBridge';

const DOMAIN: number = 0xF814;
const TAG: string = 'ImageParamsComputeCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function approx(actual: number, expected: number): boolean {
  return Math.abs(actual - expected) < 1e-6;
}

export default function imageParamsComputeCoreTest(): void {
  describe('ImageParamsComputeCoreTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMAGE_PARAMCOMPUTE_0001
     * @tc.name      testImageParamsCompute0001
     * @tc.desc      Verify contain size for square component and square image keeps 2x scale.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImageParamsCompute0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImageParamsCompute0001 begin');
      const size: ContainSize = getContainSize(100, 100, 50, 50);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size.width=${size.width}, expected=100`);
      expect(size.width).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size.height=${size.height}, expected=100`);
      expect(size.height).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue approx(size.scale, 2)=${approx(size.scale, 2)}`);
      expect(approx(size.scale, 2)).assertTrue();
      log('testImageParamsCompute0001 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PARAMCOMPUTE_0002
     * @tc.name      testImageParamsCompute0002
     * @tc.desc      Verify contain size when component and image share the same ratio.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImageParamsCompute0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImageParamsCompute0002 begin');
      const size: ContainSize = getContainSize(200, 100, 100, 50);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size.width=${size.width}, expected=200`);
      expect(size.width).assertEqual(200);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size.height=${size.height}, expected=100`);
      expect(size.height).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue approx(size.scale, 2)=${approx(size.scale, 2)}`);
      expect(approx(size.scale, 2)).assertTrue();
      log('testImageParamsCompute0002 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PARAMCOMPUTE_0003
     * @tc.name      testImageParamsCompute0003
     * @tc.desc      Verify contain size when component is taller than image ratio.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImageParamsCompute0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImageParamsCompute0003 begin');
      const size: ContainSize = getContainSize(100, 200, 100, 50);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size.width=${size.width}, expected=100`);
      expect(size.width).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size.height=${size.height}, expected=50`);
      expect(size.height).assertEqual(50);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size.scale=${size.scale}, expected=1`);
      expect(size.scale).assertEqual(1);
      log('testImageParamsCompute0003 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PARAMCOMPUTE_0004
     * @tc.name      testImageParamsCompute0004
     * @tc.desc      Verify contain size for wide image inside square component.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImageParamsCompute0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImageParamsCompute0004 begin');
      const size: ContainSize = getContainSize(100, 100, 200, 50);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size.width=${size.width}, expected=100`);
      expect(size.width).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size.height=${size.height}, expected=25`);
      expect(size.height).assertEqual(25);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size.scale=${size.scale}, expected=0.5`);
      expect(size.scale).assertEqual(0.5);
      log('testImageParamsCompute0004 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PARAMCOMPUTE_0005
     * @tc.name      testImageParamsCompute0005
     * @tc.desc      Verify contain size for tall image inside wide component.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImageParamsCompute0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImageParamsCompute0005 begin');
      const size: ContainSize = getContainSize(200, 100, 50, 100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size.width=${size.width}, expected=50`);
      expect(size.width).assertEqual(50);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size.height=${size.height}, expected=100`);
      expect(size.height).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size.scale=${size.scale}, expected=1`);
      expect(size.scale).assertEqual(1);
      log('testImageParamsCompute0005 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PARAMCOMPUTE_0006
     * @tc.name      testImageParamsCompute0006
     * @tc.desc      Verify contain size doubles square image inside 2x1 component.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImageParamsCompute0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImageParamsCompute0006 begin');
      const size: ContainSize = getContainSize(400, 200, 100, 100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size.width=${size.width}, expected=200`);
      expect(size.width).assertEqual(200);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size.height=${size.height}, expected=200`);
      expect(size.height).assertEqual(200);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue approx(size.scale, 2)=${approx(size.scale, 2)}`);
      expect(approx(size.scale, 2)).assertTrue();
      log('testImageParamsCompute0006 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PARAMCOMPUTE_0007
     * @tc.name      testImageParamsCompute0007
     * @tc.desc      Verify contain size for 3:1 image inside 3:2 component.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImageParamsCompute0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImageParamsCompute0007 begin');
      const size: ContainSize = getContainSize(90, 60, 30, 10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size.width=${size.width}, expected=90`);
      expect(size.width).assertEqual(90);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size.height=${size.height}, expected=30`);
      expect(size.height).assertEqual(30);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size.scale=${size.scale}, expected=3`);
      expect(size.scale).assertEqual(3);
      log('testImageParamsCompute0007 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PARAMCOMPUTE_0008
     * @tc.name      testImageParamsCompute0008
     * @tc.desc      Verify contain size for 1:3 image inside 3:2 component.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImageParamsCompute0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImageParamsCompute0008 begin');
      const size: ContainSize = getContainSize(90, 60, 10, 30);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size.width=${size.width}, expected=20`);
      expect(size.width).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size.height=${size.height}, expected=60`);
      expect(size.height).assertEqual(60);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size.scale=${size.scale}, expected=2`);
      expect(size.scale).assertEqual(2);
      log('testImageParamsCompute0008 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PARAMCOMPUTE_0009
     * @tc.name      testImageParamsCompute0009
     * @tc.desc      Verify contain size keeps 1:1 input unchanged at minimum size.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImageParamsCompute0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImageParamsCompute0009 begin');
      const size: ContainSize = getContainSize(1, 1, 1, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size.width=${size.width}, expected=1`);
      expect(size.width).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size.height=${size.height}, expected=1`);
      expect(size.height).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size.scale=${size.scale}, expected=1`);
      expect(size.scale).assertEqual(1);
      log('testImageParamsCompute0009 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PARAMCOMPUTE_0010
     * @tc.name      testImageParamsCompute0010
     * @tc.desc      Verify contain size for portrait image inside landscape component.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImageParamsCompute0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImageParamsCompute0010 begin');
      const size: ContainSize = getContainSize(1000, 500, 500, 1000);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size.width=${size.width}, expected=250`);
      expect(size.width).assertEqual(250);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size.height=${size.height}, expected=500`);
      expect(size.height).assertEqual(500);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size.scale=${size.scale}, expected=0.5`);
      expect(size.scale).assertEqual(0.5);
      log('testImageParamsCompute0010 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PARAMCOMPUTE_0011
     * @tc.name      testImageParamsCompute0011
     * @tc.desc      Verify contain size uses width bound with tolerance for 2:3 image.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImageParamsCompute0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImageParamsCompute0011 begin');
      const size: ContainSize = getContainSize(300, 150, 450, 150);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size.width=${size.width}, expected=300`);
      expect(size.width).assertEqual(300);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue approx(size.height, 100)=${approx(size.height, 100)}`);
      expect(approx(size.height, 100)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue approx(size.scale, 2 / 3)=${approx(size.scale, 2 / 3)}`);
      expect(approx(size.scale, 2 / 3)).assertTrue();
      log('testImageParamsCompute0011 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PARAMCOMPUTE_0012
     * @tc.name      testImageParamsCompute0012
     * @tc.desc      Verify contain size handles very large values without overflow.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImageParamsCompute0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImageParamsCompute0012 begin');
      const size: ContainSize = getContainSize(1e7, 1e7, 5e6, 5e6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size.width=${size.width}, expected=1e7`);
      expect(size.width).assertEqual(1e7);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size.height=${size.height}, expected=1e7`);
      expect(size.height).assertEqual(1e7);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size.scale=${size.scale}, expected=2`);
      expect(size.scale).assertEqual(2);
      log('testImageParamsCompute0012 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PARAMCOMPUTE_0013
     * @tc.name      testImageParamsCompute0013
     * @tc.desc      Verify contain size supports fractional component sizes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImageParamsCompute0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImageParamsCompute0013 begin');
      const size: ContainSize = getContainSize(0.5, 0.5, 0.25, 0.25);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size.width=${size.width}, expected=0.5`);
      expect(size.width).assertEqual(0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size.height=${size.height}, expected=0.5`);
      expect(size.height).assertEqual(0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue approx(size.scale, 2)=${approx(size.scale, 2)}`);
      expect(approx(size.scale, 2)).assertTrue();
      log('testImageParamsCompute0013 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PARAMCOMPUTE_0014
     * @tc.name      testImageParamsCompute0014
     * @tc.desc      Verify contain size for 4:3 component with 4:3 image.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImageParamsCompute0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImageParamsCompute0014 begin');
      const size: ContainSize = getContainSize(640, 480, 320, 240);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size.width=${size.width}, expected=640`);
      expect(size.width).assertEqual(640);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size.height=${size.height}, expected=480`);
      expect(size.height).assertEqual(480);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size.scale=${size.scale}, expected=2`);
      expect(size.scale).assertEqual(2);
      log('testImageParamsCompute0014 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PARAMCOMPUTE_0015
     * @tc.name      testImageParamsCompute0015
     * @tc.desc      Verify contain size stretches square component to wide image ratio.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImageParamsCompute0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImageParamsCompute0015 begin');
      const size: ContainSize = getContainSize(200, 200, 100, 50);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size.width=${size.width}, expected=200`);
      expect(size.width).assertEqual(200);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size.height=${size.height}, expected=100`);
      expect(size.height).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue approx(size.scale, 2)=${approx(size.scale, 2)}`);
      expect(approx(size.scale, 2)).assertTrue();
      log('testImageParamsCompute0015 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PARAMCOMPUTE_0016
     * @tc.name      testImageParamsCompute0016
     * @tc.desc      Verify contain size for 2:1 image inside 1:2 component.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImageParamsCompute0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImageParamsCompute0016 begin');
      const size: ContainSize = getContainSize(150, 300, 100, 50);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size.width=${size.width}, expected=150`);
      expect(size.width).assertEqual(150);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size.height=${size.height}, expected=75`);
      expect(size.height).assertEqual(75);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size.scale=${size.scale}, expected=1.5`);
      expect(size.scale).assertEqual(1.5);
      log('testImageParamsCompute0016 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PARAMCOMPUTE_0017
     * @tc.name      testImageParamsCompute0017
     * @tc.desc      Verify contain size for 4:3 component with 4:3 image at small size.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImageParamsCompute0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImageParamsCompute0017 begin');
      const size: ContainSize = getContainSize(80, 60, 40, 30);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size.width=${size.width}, expected=80`);
      expect(size.width).assertEqual(80);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size.height=${size.height}, expected=60`);
      expect(size.height).assertEqual(60);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size.scale=${size.scale}, expected=2`);
      expect(size.scale).assertEqual(2);
      log('testImageParamsCompute0017 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PARAMCOMPUTE_0018
     * @tc.name      testImageParamsCompute0018
     * @tc.desc      Verify contain size with zero-width component degrades to zero result.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImageParamsCompute0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImageParamsCompute0018 begin');
      const size: ContainSize = getContainSize(0, 100, 100, 100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size.width=${size.width}, expected=0`);
      expect(size.width).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size.height=${size.height}, expected=0`);
      expect(size.height).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size.scale=${size.scale}, expected=0`);
      expect(size.scale).assertEqual(0);
      log('testImageParamsCompute0018 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PARAMCOMPUTE_0019
     * @tc.name      testImageParamsCompute0019
     * @tc.desc      Verify returned Size object exposes number typed fields.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImageParamsCompute0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImageParamsCompute0019 begin');
      const size: ContainSize = getContainSize(100, 100, 50, 50);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof size.width=${typeof size.width}, expected='number'`);
      expect(typeof size.width).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof size.height=${typeof size.height}, expected='number'`);
      expect(typeof size.height).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof size.scale=${typeof size.scale}, expected='number'`);
      expect(typeof size.scale).assertEqual('number');
      log('testImageParamsCompute0019 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PARAMCOMPUTE_0020
     * @tc.name      testImageParamsCompute0020
     * @tc.desc      Verify repeated contain size calls return independent results.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImageParamsCompute0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImageParamsCompute0020 begin');
      const first: ContainSize = getContainSize(100, 100, 50, 50);
      const second: ContainSize = getContainSize(200, 100, 100, 50);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse first === second=${first === second}`);
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.width=${first.width}, expected=100`);
      expect(first.width).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.width=${second.width}, expected=200`);
      expect(second.width).assertEqual(200);
      log('testImageParamsCompute0020 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PARAMCOMPUTE_0021
     * @tc.name      testImageParamsCompute0021
     * @tc.desc      Verify transformCoordinates scales positive point by positive factor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImageParamsCompute0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImageParamsCompute0021 begin');
      const got: Point = transformCoordinates(new Point(2, 3), 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.x=${got.x}, expected=4`);
      expect(got.x).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.y=${got.y}, expected=6`);
      expect(got.y).assertEqual(6);
      log('testImageParamsCompute0021 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PARAMCOMPUTE_0022
     * @tc.name      testImageParamsCompute0022
     * @tc.desc      Verify transformCoordinates keeps origin point at origin.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImageParamsCompute0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImageParamsCompute0022 begin');
      const got: Point = transformCoordinates(new Point(0, 0), 5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.x=${got.x}, expected=0`);
      expect(got.x).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.y=${got.y}, expected=0`);
      expect(got.y).assertEqual(0);
      log('testImageParamsCompute0022 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PARAMCOMPUTE_0023
     * @tc.name      testImageParamsCompute0023
     * @tc.desc      Verify transformCoordinates handles negative coordinates.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImageParamsCompute0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImageParamsCompute0023 begin');
      const got: Point = transformCoordinates(new Point(-2, -3), 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.x=${got.x}, expected=-4`);
      expect(got.x).assertEqual(-4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.y=${got.y}, expected=-6`);
      expect(got.y).assertEqual(-6);
      log('testImageParamsCompute0023 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PARAMCOMPUTE_0024
     * @tc.name      testImageParamsCompute0024
     * @tc.desc      Verify transformCoordinates with zero scale collapses point to origin.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImageParamsCompute0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImageParamsCompute0024 begin');
      const got: Point = transformCoordinates(new Point(2, 3), 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.x=${got.x}, expected=0`);
      expect(got.x).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.y=${got.y}, expected=0`);
      expect(got.y).assertEqual(0);
      log('testImageParamsCompute0024 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PARAMCOMPUTE_0025
     * @tc.name      testImageParamsCompute0025
     * @tc.desc      Verify transformCoordinates supports fractional scale factors.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImageParamsCompute0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImageParamsCompute0025 begin');
      const got: Point = transformCoordinates(new Point(2, 3), 0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.x=${got.x}, expected=1`);
      expect(got.x).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.y=${got.y}, expected=1.5`);
      expect(got.y).assertEqual(1.5);
      log('testImageParamsCompute0025 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PARAMCOMPUTE_0026
     * @tc.name      testImageParamsCompute0026
     * @tc.desc      Verify transformCoordinates keeps precision for large coordinates.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImageParamsCompute0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImageParamsCompute0026 begin');
      const got: Point = transformCoordinates(new Point(1e6, 2e6), 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.x=${got.x}, expected=3e6`);
      expect(got.x).assertEqual(3e6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.y=${got.y}, expected=6e6`);
      expect(got.y).assertEqual(6e6);
      log('testImageParamsCompute0026 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PARAMCOMPUTE_0027
     * @tc.name      testImageParamsCompute0027
     * @tc.desc      Verify transformCoordinates with negative scale flips coordinates.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImageParamsCompute0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImageParamsCompute0027 begin');
      const got: Point = transformCoordinates(new Point(1, 1), -1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.x=${got.x}, expected=-1`);
      expect(got.x).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.y=${got.y}, expected=-1`);
      expect(got.y).assertEqual(-1);
      log('testImageParamsCompute0027 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PARAMCOMPUTE_0028
     * @tc.name      testImageParamsCompute0028
     * @tc.desc      Verify transformCoordinates returns a new Point instance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImageParamsCompute0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImageParamsCompute0028 begin');
      const input: Point = new Point(2, 3);
      const got: Point = transformCoordinates(input, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse got === input=${got === input}`);
      expect(got === input).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.x=${got.x}, expected=4`);
      expect(got.x).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.y=${got.y}, expected=6`);
      expect(got.y).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual input.x=${input.x}, expected=2`);
      expect(input.x).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual input.y=${input.y}, expected=3`);
      expect(input.y).assertEqual(3);
      log('testImageParamsCompute0028 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PARAMCOMPUTE_0029
     * @tc.name      testImageParamsCompute0029
     * @tc.desc      Verify chained scale by 2 then 0.5 restores original coordinates.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImageParamsCompute0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImageParamsCompute0029 begin');
      const scaled: Point = transformCoordinates(new Point(2, 3), 2);
      const restored: Point = transformCoordinates(scaled, 0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual restored.x=${restored.x}, expected=2`);
      expect(restored.x).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual restored.y=${restored.y}, expected=3`);
      expect(restored.y).assertEqual(3);
      log('testImageParamsCompute0029 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PARAMCOMPUTE_0030
     * @tc.name      testImageParamsCompute0030
     * @tc.desc      Verify transformCoordinates multiplies by large scale factor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImageParamsCompute0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImageParamsCompute0030 begin');
      const got: Point = transformCoordinates(new Point(2, 3), 1000);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.x=${got.x}, expected=2000`);
      expect(got.x).assertEqual(2000);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.y=${got.y}, expected=3000`);
      expect(got.y).assertEqual(3000);
      log('testImageParamsCompute0030 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PARAMCOMPUTE_0031
     * @tc.name      testImageParamsCompute0031
     * @tc.desc      Verify transformCoordinates result is a Point with number fields.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImageParamsCompute0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImageParamsCompute0031 begin');
      const got: Point = transformCoordinates(new Point(2, 3), 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue got instanceof Point=${got instanceof Point}`);
      expect(got instanceof Point).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof got.x=${typeof got.x}, expected='number'`);
      expect(typeof got.x).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof got.y=${typeof got.y}, expected='number'`);
      expect(typeof got.y).assertEqual('number');
      log('testImageParamsCompute0031 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PARAMCOMPUTE_0032
     * @tc.name      testImageParamsCompute0032
     * @tc.desc      Verify transformCoordinates applies scale to each axis independently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImageParamsCompute0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImageParamsCompute0032 begin');
      const got: Point = transformCoordinates(new Point(4, 5), 0.25);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.x=${got.x}, expected=1`);
      expect(got.x).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.y=${got.y}, expected=1.25`);
      expect(got.y).assertEqual(1.25);
      log('testImageParamsCompute0032 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PARAMCOMPUTE_0033
     * @tc.name      testImageParamsCompute0033
     * @tc.desc      Verify offsetOrigin subtracts both offsets from a point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImageParamsCompute0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImageParamsCompute0033 begin');
      const got: Point = offsetOrigin(new Point(5, 8), 2, 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.x=${got.x}, expected=3`);
      expect(got.x).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.y=${got.y}, expected=5`);
      expect(got.y).assertEqual(5);
      log('testImageParamsCompute0033 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PARAMCOMPUTE_0034
     * @tc.name      testImageParamsCompute0034
     * @tc.desc      Verify offsetOrigin with zero offsets keeps the point unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImageParamsCompute0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImageParamsCompute0034 begin');
      const got: Point = offsetOrigin(new Point(4, 7), 0, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.x=${got.x}, expected=4`);
      expect(got.x).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.y=${got.y}, expected=7`);
      expect(got.y).assertEqual(7);
      log('testImageParamsCompute0034 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PARAMCOMPUTE_0035
     * @tc.name      testImageParamsCompute0035
     * @tc.desc      Verify offsetOrigin with negative offsets moves point forward.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImageParamsCompute0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImageParamsCompute0035 begin');
      const got: Point = offsetOrigin(new Point(3, 5), -2, -3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.x=${got.x}, expected=5`);
      expect(got.x).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.y=${got.y}, expected=8`);
      expect(got.y).assertEqual(8);
      log('testImageParamsCompute0035 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PARAMCOMPUTE_0036
     * @tc.name      testImageParamsCompute0036
     * @tc.desc      Verify offsetOrigin supports fractional coordinates.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImageParamsCompute0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImageParamsCompute0036 begin');
      const got: Point = offsetOrigin(new Point(1.5, 2.5), 0.5, 1.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.x=${got.x}, expected=1`);
      expect(got.x).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.y=${got.y}, expected=1`);
      expect(got.y).assertEqual(1);
      log('testImageParamsCompute0036 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PARAMCOMPUTE_0037
     * @tc.name      testImageParamsCompute0037
     * @tc.desc      Verify offsetOrigin can produce negative results.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImageParamsCompute0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImageParamsCompute0037 begin');
      const got: Point = offsetOrigin(new Point(1, 1), 5, 5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.x=${got.x}, expected=-4`);
      expect(got.x).assertEqual(-4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.y=${got.y}, expected=-4`);
      expect(got.y).assertEqual(-4);
      log('testImageParamsCompute0037 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PARAMCOMPUTE_0038
     * @tc.name      testImageParamsCompute0038
     * @tc.desc      Verify offsetOrigin returns a new Point instance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImageParamsCompute0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImageParamsCompute0038 begin');
      const input: Point = new Point(5, 8);
      const got: Point = offsetOrigin(input, 2, 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse got === input=${got === input}`);
      expect(got === input).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual input.x=${input.x}, expected=5`);
      expect(input.x).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual input.y=${input.y}, expected=8`);
      expect(input.y).assertEqual(8);
      log('testImageParamsCompute0038 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PARAMCOMPUTE_0039
     * @tc.name      testImageParamsCompute0039
     * @tc.desc      Verify offsetOrigin reverses a scaled transform back to origin values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImageParamsCompute0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImageParamsCompute0039 begin');
      const scaled: Point = transformCoordinates(new Point(5, 8), 2);
      const got: Point = offsetOrigin(scaled, 5, 8);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.x=${got.x}, expected=5`);
      expect(got.x).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.y=${got.y}, expected=8`);
      expect(got.y).assertEqual(8);
      log('testImageParamsCompute0039 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PARAMCOMPUTE_0040
     * @tc.name      testImageParamsCompute0040
     * @tc.desc      Verify applying offsetOrigin twice accumulates both offsets.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImageParamsCompute0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImageParamsCompute0040 begin');
      const once: Point = offsetOrigin(new Point(3, 3), 1, 1);
      const twice: Point = offsetOrigin(once, 1, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual twice.x=${twice.x}, expected=1`);
      expect(twice.x).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual twice.y=${twice.y}, expected=1`);
      expect(twice.y).assertEqual(1);
      log('testImageParamsCompute0040 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PARAMCOMPUTE_0041
     * @tc.name      testImageParamsCompute0041
     * @tc.desc      Verify offsetOrigin keeps precision for large coordinates.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImageParamsCompute0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImageParamsCompute0041 begin');
      const got: Point = offsetOrigin(new Point(1e6, 1e6), 1, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.x=${got.x}, expected=999999`);
      expect(got.x).assertEqual(999999);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.y=${got.y}, expected=999999`);
      expect(got.y).assertEqual(999999);
      log('testImageParamsCompute0041 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PARAMCOMPUTE_0042
     * @tc.name      testImageParamsCompute0042
     * @tc.desc      Verify offsetOrigin result is a Point with number fields.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImageParamsCompute0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImageParamsCompute0042 begin');
      const got: Point = offsetOrigin(new Point(5, 8), 2, 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue got instanceof Point=${got instanceof Point}`);
      expect(got instanceof Point).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof got.x=${typeof got.x}, expected='number'`);
      expect(typeof got.x).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof got.y=${typeof got.y}, expected='number'`);
      expect(typeof got.y).assertEqual('number');
      log('testImageParamsCompute0042 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PARAMCOMPUTE_0043
     * @tc.name      testImageParamsCompute0043
     * @tc.desc      Verify Point constructor stores x and y as given.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImageParamsCompute0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImageParamsCompute0043 begin');
      const point: Point = new Point(7, 9);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual point.x=${point.x}, expected=7`);
      expect(point.x).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual point.y=${point.y}, expected=9`);
      expect(point.y).assertEqual(9);
      log('testImageParamsCompute0043 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PARAMCOMPUTE_0044
     * @tc.name      testImageParamsCompute0044
     * @tc.desc      Verify Point fields stay writable after construction.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImageParamsCompute0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImageParamsCompute0044 begin');
      const point: Point = new Point(1, 1);
      point.x = 10;
      point.y = 20;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual point.x=${point.x}, expected=10`);
      expect(point.x).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual point.y=${point.y}, expected=20`);
      expect(point.y).assertEqual(20);
      log('testImageParamsCompute0044 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PARAMCOMPUTE_0045
     * @tc.name      testImageParamsCompute0045
     * @tc.desc      Verify two Point instances keep independent field values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImageParamsCompute0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImageParamsCompute0045 begin');
      const first: Point = new Point(1, 2);
      const second: Point = new Point(3, 4);
      first.x = 100;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.x=${first.x}, expected=100`);
      expect(first.x).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.x=${second.x}, expected=3`);
      expect(second.x).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.y=${second.y}, expected=4`);
      expect(second.y).assertEqual(4);
      log('testImageParamsCompute0045 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PARAMCOMPUTE_0046
     * @tc.name      testImageParamsCompute0046
     * @tc.desc      Verify Point supports fractional and negative coordinates.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImageParamsCompute0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testImageParamsCompute0046 begin');
      const point: Point = new Point(-1.25, 3.75);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual point.x=${point.x}, expected=-1.25`);
      expect(point.x).assertEqual(-1.25);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual point.y=${point.y}, expected=3.75`);
      expect(point.y).assertEqual(3.75);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue point instanceof Point=${point instanceof Point}`);
      expect(point instanceof Point).assertTrue();
      log('testImageParamsCompute0046 end');
    })
  })
}
