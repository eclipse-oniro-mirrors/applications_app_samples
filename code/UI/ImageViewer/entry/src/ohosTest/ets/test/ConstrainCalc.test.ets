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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { image } from '@kit.ImageKit';
import { ConstrainOffsetAndAnimationType, ImageFitType,
  constrainOffsetAndAnimation, getMaxAllowedOffset, getImgSize } from '../../../main/ets/utils/Constrain';
import { OffsetModel } from '../../../main/ets/model/OffsetModel';

const DOMAIN: number = 0xF814;
const TAG: string = 'ConstrainCalcTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function buildInfo(dimension: ImageFitType, offsetX: number, offsetY: number, scale: number,
  rotate: number, listOffset: number): ConstrainOffsetAndAnimationType {
  const defaultSize: image.Size = { width: 800, height: 600 };
  const info: ConstrainOffsetAndAnimationType = {
    dimensionWH: dimension,
    imageDefaultSize: defaultSize,
    imageOffsetInfo: new OffsetModel(offsetX, offsetY),
    scaleValue: scale,
    rotate: rotate,
    togglePercent: 0.2,
    imageListOffset: listOffset
  };
  return info;
}

export default function constrainCalcTest(): void {
  describe('ConstrainCalcTest', () => {
    /**
     * @tc.number    SUB_IMAGEVIEWER_CONSTRAIN_0501
     * @tc.name      testConstrain0501
     * @tc.desc      Checks max offset for a scaled-down image inside the window.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstrain0501', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstrain0501 begin');
      const actual: number = getMaxAllowedOffset(100, 50, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=25`);
      expect(actual).assertEqual(25);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual >= 0=${actual >= 0}`);
      expect(actual >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testConstrain0501 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_CONSTRAIN_0502
     * @tc.name      testConstrain0502
     * @tc.desc      Checks max offset is zero when scaled image fills the window.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstrain0502', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstrain0502 begin');
      const actual: number = getMaxAllowedOffset(100, 50, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=0`);
      expect(actual).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual >= 0=${actual >= 0}`);
      expect(actual >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testConstrain0502 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_CONSTRAIN_0503
     * @tc.name      testConstrain0503
     * @tc.desc      Checks max offset for an image overflowing the window.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstrain0503', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstrain0503 begin');
      const actual: number = getMaxAllowedOffset(100, 50, 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=25`);
      expect(actual).assertEqual(25);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${actual}, expected=0`);
      expect(actual).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testConstrain0503 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_CONSTRAIN_0504
     * @tc.name      testConstrain0504
     * @tc.desc      Checks zero scale leaves half of the window as max offset.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstrain0504', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstrain0504 begin');
      const actual: number = getMaxAllowedOffset(100, 50, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=50`);
      expect(actual).assertEqual(50);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${actual}, expected=0`);
      expect(actual).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testConstrain0504 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_CONSTRAIN_0505
     * @tc.name      testConstrain0505
     * @tc.desc      Checks an exact-fit image has no allowed offset.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstrain0505', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstrain0505 begin');
      const actual: number = getMaxAllowedOffset(100, 100, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=0`);
      expect(actual).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual === 0=${actual === 0}`);
      expect(actual === 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testConstrain0505 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_CONSTRAIN_0506
     * @tc.name      testConstrain0506
     * @tc.desc      Checks doubling an exact-fit image allows half overflow.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstrain0506', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstrain0506 begin');
      const actual: number = getMaxAllowedOffset(100, 100, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=50`);
      expect(actual).assertEqual(50);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${actual}, expected=0`);
      expect(actual).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testConstrain0506 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_CONSTRAIN_0507
     * @tc.name      testConstrain0507
     * @tc.desc      Checks a fractional scale can keep the image exact-fit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstrain0507', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstrain0507 begin');
      const actual: number = getMaxAllowedOffset(100, 200, 0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=0`);
      expect(actual).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual >= 0=${actual >= 0}`);
      expect(actual >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testConstrain0507 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_CONSTRAIN_0508
     * @tc.name      testConstrain0508
     * @tc.desc      Checks max offset for a 1280px image in a 720px window.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstrain0508', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstrain0508 begin');
      const actual: number = getMaxAllowedOffset(720, 1280, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=280`);
      expect(actual).assertEqual(280);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${actual}, expected=0`);
      expect(actual).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testConstrain0508 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_CONSTRAIN_0509
     * @tc.name      testConstrain0509
     * @tc.desc      Checks max offset for a 1920px image in a 1080px window.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstrain0509', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstrain0509 begin');
      const actual: number = getMaxAllowedOffset(1080, 1920, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=420`);
      expect(actual).assertEqual(420);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${actual}, expected=0`);
      expect(actual).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testConstrain0509 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_CONSTRAIN_0510
     * @tc.name      testConstrain0510
     * @tc.desc      Checks max offset grows linearly with a 1.5x zoom.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstrain0510', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstrain0510 begin');
      const actual: number = getMaxAllowedOffset(720, 1280, 1.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=600`);
      expect(actual).assertEqual(600);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${actual}, expected=280`);
      expect(actual).assertLarger(280);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testConstrain0510 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_CONSTRAIN_0511
     * @tc.name      testConstrain0511
     * @tc.desc      Checks a zero window size yields half of the image size.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstrain0511', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstrain0511 begin');
      const actual: number = getMaxAllowedOffset(0, 100, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=50`);
      expect(actual).assertEqual(50);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${actual}, expected=0`);
      expect(actual).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testConstrain0511 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_CONSTRAIN_0512
     * @tc.name      testConstrain0512
     * @tc.desc      Checks a zero image size yields half of the window size.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstrain0512', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstrain0512 begin');
      const actual: number = getMaxAllowedOffset(100, 0, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=50`);
      expect(actual).assertEqual(50);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${actual}, expected=0`);
      expect(actual).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testConstrain0512 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_CONSTRAIN_0513
     * @tc.name      testConstrain0513
     * @tc.desc      Checks fractional window and image sizes are preserved.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstrain0513', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstrain0513 begin');
      const actual: number = getMaxAllowedOffset(100.5, 50.25, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=25.125`);
      expect(actual).assertEqual(25.125);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${actual}, expected=0`);
      expect(actual).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testConstrain0513 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_CONSTRAIN_0514
     * @tc.name      testConstrain0514
     * @tc.desc      Checks zero window and image sizes produce zero offset.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstrain0514', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstrain0514 begin');
      const actual: number = getMaxAllowedOffset(0, 0, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=0`);
      expect(actual).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual === 0=${actual === 0}`);
      expect(actual === 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testConstrain0514 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_CONSTRAIN_0515
     * @tc.name      testConstrain0515
     * @tc.desc      Checks a 1.1x zoom on a small image gives a tight bound.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstrain0515', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstrain0515 begin');
      const actual: number = getMaxAllowedOffset(100, 50, 1.1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertClose actual=${actual}, expected=22.5`);
      expect(actual).assertClose(22.5, 0.000001);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${actual}, expected=0`);
      expect(actual).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess actual=${actual}, expected=25`);
      expect(actual).assertLess(25);
      log('testConstrain0515 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_CONSTRAIN_0516
     * @tc.name      testConstrain0516
     * @tc.desc      Checks a 0.9x zoom keeps the window the larger side.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstrain0516', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstrain0516 begin');
      const actual: number = getMaxAllowedOffset(100, 50, 0.9);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=27.5`);
      expect(actual).assertEqual(27.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${actual}, expected=0`);
      expect(actual).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testConstrain0516 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_CONSTRAIN_0517
     * @tc.name      testConstrain0517
     * @tc.desc      Checks an image much larger than the window scales the bound.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstrain0517', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstrain0517 begin');
      const actual: number = getMaxAllowedOffset(100, 300, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=100`);
      expect(actual).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=(300 - 100) / 2`);
      expect(actual).assertEqual((300 - 100) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testConstrain0517 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_CONSTRAIN_0518
     * @tc.name      testConstrain0518
     * @tc.desc      Checks a 3x zoom below the window size still bounds offset.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstrain0518', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstrain0518 begin');
      const actual: number = getMaxAllowedOffset(600, 120, 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=120`);
      expect(actual).assertEqual(120);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${actual}, expected=0`);
      expect(actual).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testConstrain0518 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_CONSTRAIN_0519
     * @tc.name      testConstrain0519
     * @tc.desc      Checks a 2x zoom on an exact-half image fills the window.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstrain0519', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstrain0519 begin');
      const actual: number = getMaxAllowedOffset(500, 250, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=0`);
      expect(actual).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual === 0=${actual === 0}`);
      expect(actual === 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testConstrain0519 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_CONSTRAIN_0520
     * @tc.name      testConstrain0520
     * @tc.desc      Checks a slightly overflowing 2.1x zoom gives a small bound.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstrain0520', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstrain0520 begin');
      const actual: number = getMaxAllowedOffset(500, 250, 2.1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=12.5`);
      expect(actual).assertEqual(12.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${actual}, expected=0`);
      expect(actual).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess actual=${actual}, expected=50`);
      expect(actual).assertLess(50);
      log('testConstrain0520 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_CONSTRAIN_0521
     * @tc.name      testConstrain0521
     * @tc.desc      Checks the width is returned for a zero-degree rotation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstrain0521', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstrain0521 begin');
      const actual: number = getImgSize({ width: 800, height: 600 }, 0, ImageFitType.TYPE_WIDTH);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=800`);
      expect(actual).assertEqual(800);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${actual}, expected=0`);
      expect(actual).assertLarger(0);
      log('testConstrain0521 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_CONSTRAIN_0522
     * @tc.name      testConstrain0522
     * @tc.desc      Checks the height is returned for a zero-degree rotation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstrain0522', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstrain0522 begin');
      const actual: number = getImgSize({ width: 800, height: 600 }, 0, ImageFitType.TYPE_HEIGHT);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=600`);
      expect(actual).assertEqual(600);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${actual}, expected=0`);
      expect(actual).assertLarger(0);
      log('testConstrain0522 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_CONSTRAIN_0523
     * @tc.name      testConstrain0523
     * @tc.desc      Checks a 90-degree rotation swaps width for height.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstrain0523', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstrain0523 begin');
      const actual: number = getImgSize({ width: 800, height: 600 }, 90, ImageFitType.TYPE_WIDTH);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=600`);
      expect(actual).assertEqual(600);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess actual=${actual}, expected=800`);
      expect(actual).assertLess(800);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testConstrain0523 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_CONSTRAIN_0524
     * @tc.name      testConstrain0524
     * @tc.desc      Checks a 90-degree rotation swaps height for width.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstrain0524', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstrain0524 begin');
      const actual: number = getImgSize({ width: 800, height: 600 }, 90, ImageFitType.TYPE_HEIGHT);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=800`);
      expect(actual).assertEqual(800);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${actual}, expected=600`);
      expect(actual).assertLarger(600);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testConstrain0524 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_CONSTRAIN_0525
     * @tc.name      testConstrain0525
     * @tc.desc      Checks a 270-degree rotation swaps width for height.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstrain0525', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstrain0525 begin');
      const actual: number = getImgSize({ width: 800, height: 600 }, 270, ImageFitType.TYPE_WIDTH);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=600`);
      expect(actual).assertEqual(600);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess actual=${actual}, expected=800`);
      expect(actual).assertLess(800);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testConstrain0525 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_CONSTRAIN_0526
     * @tc.name      testConstrain0526
     * @tc.desc      Checks a 270-degree rotation swaps height for width.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstrain0526', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstrain0526 begin');
      const actual: number = getImgSize({ width: 800, height: 600 }, 270, ImageFitType.TYPE_HEIGHT);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=800`);
      expect(actual).assertEqual(800);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${actual}, expected=600`);
      expect(actual).assertLarger(600);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testConstrain0526 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_CONSTRAIN_0527
     * @tc.name      testConstrain0527
     * @tc.desc      Checks a -90-degree rotation swaps width for height.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstrain0527', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstrain0527 begin');
      const actual: number = getImgSize({ width: 800, height: 600 }, -90, ImageFitType.TYPE_WIDTH);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=600`);
      expect(actual).assertEqual(600);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess actual=${actual}, expected=800`);
      expect(actual).assertLess(800);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testConstrain0527 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_CONSTRAIN_0528
     * @tc.name      testConstrain0528
     * @tc.desc      Checks a -270-degree rotation swaps height for width.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstrain0528', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstrain0528 begin');
      const actual: number = getImgSize({ width: 800, height: 600 }, -270, ImageFitType.TYPE_HEIGHT);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=800`);
      expect(actual).assertEqual(800);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${actual}, expected=600`);
      expect(actual).assertLarger(600);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testConstrain0528 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_CONSTRAIN_0529
     * @tc.name      testConstrain0529
     * @tc.desc      Checks a full 360-degree turn keeps the original axis size.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstrain0529', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstrain0529 begin');
      const actual: number = getImgSize({ width: 800, height: 600 }, 360, ImageFitType.TYPE_WIDTH);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=800`);
      expect(actual).assertEqual(800);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${actual}, expected=600`);
      expect(actual).assertLarger(600);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testConstrain0529 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_CONSTRAIN_0530
     * @tc.name      testConstrain0530
     * @tc.desc      Checks a 450-degree rotation behaves like 90 degrees.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstrain0530', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstrain0530 begin');
      const actual: number = getImgSize({ width: 800, height: 600 }, 450, ImageFitType.TYPE_WIDTH);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=600`);
      expect(actual).assertEqual(600);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess actual=${actual}, expected=800`);
      expect(actual).assertLess(800);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testConstrain0530 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_CONSTRAIN_0531
     * @tc.name      testConstrain0531
     * @tc.desc      Checks a 45-degree rotation is not treated as a swap.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstrain0531', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstrain0531 begin');
      const actual: number = getImgSize({ width: 800, height: 600 }, 45, ImageFitType.TYPE_WIDTH);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=800`);
      expect(actual).assertEqual(800);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${actual}, expected=600`);
      expect(actual).assertLarger(600);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testConstrain0531 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_CONSTRAIN_0532
     * @tc.name      testConstrain0532
     * @tc.desc      Checks a 180-degree rotation keeps the height axis.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstrain0532', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstrain0532 begin');
      const actual: number = getImgSize({ width: 800, height: 600 }, 180, ImageFitType.TYPE_HEIGHT);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=600`);
      expect(actual).assertEqual(600);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess actual=${actual}, expected=800`);
      expect(actual).assertLess(800);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testConstrain0532 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_CONSTRAIN_0533
     * @tc.name      testConstrain0533
     * @tc.desc      Checks a -180-degree rotation keeps the width axis.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstrain0533', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstrain0533 begin');
      const actual: number = getImgSize({ width: 800, height: 600 }, -180, ImageFitType.TYPE_WIDTH);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=800`);
      expect(actual).assertEqual(800);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${actual}, expected=600`);
      expect(actual).assertLarger(600);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testConstrain0533 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_CONSTRAIN_0534
     * @tc.name      testConstrain0534
     * @tc.desc      Checks a 810-degree rotation swaps the height axis to width.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstrain0534', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstrain0534 begin');
      const actual: number = getImgSize({ width: 800, height: 600 }, 810, ImageFitType.TYPE_HEIGHT);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=800`);
      expect(actual).assertEqual(800);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${actual}, expected=600`);
      expect(actual).assertLarger(600);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testConstrain0534 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_CONSTRAIN_0535
     * @tc.name      testConstrain0535
     * @tc.desc      Checks the default dimension short-circuits without movement.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstrain0535', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstrain0535 begin');
      const result: [boolean, boolean] = constrainOffsetAndAnimation(
        buildInfo(ImageFitType.TYPE_DEFAULT, 5, 7, 1, 0, 0));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse result[0]=${result[0]}`);
      expect(result[0]).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse result[1]=${result[1]}`);
      expect(result[1]).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual result.length=${result.length}, expected=2`);
      expect(result.length).assertEqual(2);
      log('testConstrain0535 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_CONSTRAIN_0536
     * @tc.name      testConstrain0536
     * @tc.desc      Checks negative default-dimension offsets stay ignored.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstrain0536', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstrain0536 begin');
      const result: [boolean, boolean] = constrainOffsetAndAnimation(
        buildInfo(ImageFitType.TYPE_DEFAULT, -5, -7, 1, 0, 0));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse result[0]=${result[0]}`);
      expect(result[0]).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse result[1]=${result[1]}`);
      expect(result[1]).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof result[0]=${typeof result[0]}, expected='boolean'`);
      expect(typeof result[0]).assertEqual('boolean');
      log('testConstrain0536 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_CONSTRAIN_0537
     * @tc.name      testConstrain0537
     * @tc.desc      Checks default dimension ignores zoom and rotation state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstrain0537', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstrain0537 begin');
      const result: [boolean, boolean] = constrainOffsetAndAnimation(
        buildInfo(ImageFitType.TYPE_DEFAULT, 0, 0, 2.5, 90, 0));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse result[0]=${result[0]}`);
      expect(result[0]).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse result[1]=${result[1]}`);
      expect(result[1]).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual result.length=${result.length}, expected=2`);
      expect(result.length).assertEqual(2);
      log('testConstrain0537 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_CONSTRAIN_0538
     * @tc.name      testConstrain0538
     * @tc.desc      Checks a zero width offset needs no correction.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstrain0538', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstrain0538 begin');
      const result: [boolean, boolean] = constrainOffsetAndAnimation(
        buildInfo(ImageFitType.TYPE_WIDTH, 0, 0, 1, 0, 0));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse result[0]=${result[0]}`);
      expect(result[0]).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse result[1]=${result[1]}`);
      expect(result[1]).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof result[1]=${typeof result[1]}, expected='boolean'`);
      expect(typeof result[1]).assertEqual('boolean');
      log('testConstrain0538 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_CONSTRAIN_0539
     * @tc.name      testConstrain0539
     * @tc.desc      Checks a zero height offset needs no correction.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstrain0539', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstrain0539 begin');
      const result: [boolean, boolean] = constrainOffsetAndAnimation(
        buildInfo(ImageFitType.TYPE_HEIGHT, 0, 0, 1, 0, 0));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse result[0]=${result[0]}`);
      expect(result[0]).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse result[1]=${result[1]}`);
      expect(result[1]).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual result.length=${result.length}, expected=2`);
      expect(result.length).assertEqual(2);
      log('testConstrain0539 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_CONSTRAIN_0540
     * @tc.name      testConstrain0540
     * @tc.desc      Checks a centered zoomed image needs no width correction.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstrain0540', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstrain0540 begin');
      const result: [boolean, boolean] = constrainOffsetAndAnimation(
        buildInfo(ImageFitType.TYPE_WIDTH, 0, 0, 1.5, 0, 0));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse result[0]=${result[0]}`);
      expect(result[0]).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse result[1]=${result[1]}`);
      expect(result[1]).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof result[0]=${typeof result[0]}, expected='boolean'`);
      expect(typeof result[0]).assertEqual('boolean');
      log('testConstrain0540 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_CONSTRAIN_0541
     * @tc.name      testConstrain0541
     * @tc.desc      Checks a centered rotated image needs no height correction.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstrain0541', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstrain0541 begin');
      const result: [boolean, boolean] = constrainOffsetAndAnimation(
        buildInfo(ImageFitType.TYPE_HEIGHT, 0, 0, 1, 90, 0));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse result[0]=${result[0]}`);
      expect(result[0]).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse result[1]=${result[1]}`);
      expect(result[1]).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual result.length=${result.length}, expected=2`);
      expect(result.length).assertEqual(2);
      log('testConstrain0541 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_CONSTRAIN_0542
     * @tc.name      testConstrain0542
     * @tc.desc      Checks huge default-dimension offsets stay short-circuited.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstrain0542', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstrain0542 begin');
      const result: [boolean, boolean] = constrainOffsetAndAnimation(
        buildInfo(ImageFitType.TYPE_DEFAULT, 1000, -1000, 3, 270, 0));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse result[0]=${result[0]}`);
      expect(result[0]).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse result[1]=${result[1]}`);
      expect(result[1]).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof result[0]=${typeof result[0]}, expected='boolean'`);
      expect(typeof result[0]).assertEqual('boolean');
      log('testConstrain0542 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_CONSTRAIN_0543
     * @tc.name      testConstrain0543
     * @tc.desc      Checks list offset cancels the stored offset to zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstrain0543', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstrain0543 begin');
      const info: ConstrainOffsetAndAnimationType = buildInfo(
        ImageFitType.TYPE_WIDTH, 0, 0, 1, 0, 0);
      info.imageOffsetInfo.lastX = 5;
      info.imageListOffset = -5;
      const result: [boolean, boolean] = constrainOffsetAndAnimation(info);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse result[0]=${result[0]}`);
      expect(result[0]).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse result[1]=${result[1]}`);
      expect(result[1]).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual result.length=${result.length}, expected=2`);
      expect(result.length).assertEqual(2);
      log('testConstrain0543 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_CONSTRAIN_0544
     * @tc.name      testConstrain0544
     * @tc.desc      Checks a default-dimension result keeps two flag slots.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstrain0544', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstrain0544 begin');
      const result: [boolean, boolean] = constrainOffsetAndAnimation(
        buildInfo(ImageFitType.TYPE_DEFAULT, 1, 1, 1, 0, 0));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual result.length=${result.length}, expected=2`);
      expect(result.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${result[0] === true && result[1] === true}`);
      expect(result[0] === true && result[1] === true).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof result[1]=${typeof result[1]}, expected='boolean'`);
      expect(typeof result[1]).assertEqual('boolean');
      log('testConstrain0544 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_CONSTRAIN_0545
     * @tc.name      testConstrain0545
     * @tc.desc      Checks a full toggle threshold keeps a centered image still.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstrain0545', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstrain0545 begin');
      const info: ConstrainOffsetAndAnimationType = buildInfo(
        ImageFitType.TYPE_HEIGHT, 0, 0, 1, 0, 0);
      info.togglePercent = 1;
      const result: [boolean, boolean] = constrainOffsetAndAnimation(info);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse result[0]=${result[0]}`);
      expect(result[0]).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse result[1]=${result[1]}`);
      expect(result[1]).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual info.togglePercent=${info.togglePercent}, expected=1`);
      expect(info.togglePercent).assertEqual(1);
      log('testConstrain0545 end');
    })
  })
}
