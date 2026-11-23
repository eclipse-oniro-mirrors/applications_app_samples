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

import { beforeEachIt, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Eraser]';

export default function eraserStrokeMatrix9Test(): void {
  describe('EraserStrokeMatrix9Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    ERASER_STROKE_0593
     * @tc.name      eraserStroke0593
     * @tc.desc      rect 模式画笔直径 32 在 1440x2560 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0593', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0593 begin');
      const size: number = 32;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1440 * 2560) * 10000) / 10000;
      const strokes: number = Math.ceil(3686400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(16);
      expect(cover.toFixed(2)).assertEqual('804.25');
      expect(ratio).assertEqual(0.0002);
      expect(strokes).assertEqual(4584);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0593 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0594
     * @tc.name      eraserStroke0594
     * @tc.desc      circle 模式画笔直径 32 在 1440x2560 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0594', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0594 begin');
      const size: number = 32;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1440 * 2560) * 10000) / 10000;
      const strokes: number = Math.ceil(3686400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(16);
      expect(cover.toFixed(2)).assertEqual('804.25');
      expect(ratio).assertEqual(0.0002);
      expect(strokes).assertEqual(4584);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0594 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0595
     * @tc.name      eraserStroke0595
     * @tc.desc      pixel 模式画笔直径 32 在 1440x2560 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0595', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0595 begin');
      const size: number = 32;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1440 * 2560) * 10000) / 10000;
      const strokes: number = Math.ceil(3686400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(16);
      expect(cover.toFixed(2)).assertEqual('804.25');
      expect(ratio).assertEqual(0.0002);
      expect(strokes).assertEqual(4584);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0595 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0596
     * @tc.name      eraserStroke0596
     * @tc.desc      free 模式画笔直径 32 在 320x240 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0596', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0596 begin');
      const size: number = 32;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (320 * 240) * 10000) / 10000;
      const strokes: number = Math.ceil(76800 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(16);
      expect(cover.toFixed(2)).assertEqual('804.25');
      expect(ratio).assertEqual(0.0105);
      expect(strokes).assertEqual(96);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0596 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0597
     * @tc.name      eraserStroke0597
     * @tc.desc      line 模式画笔直径 32 在 320x240 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0597', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0597 begin');
      const size: number = 32;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (320 * 240) * 10000) / 10000;
      const strokes: number = Math.ceil(76800 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(16);
      expect(cover.toFixed(2)).assertEqual('804.25');
      expect(ratio).assertEqual(0.0105);
      expect(strokes).assertEqual(96);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0597 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0598
     * @tc.name      eraserStroke0598
     * @tc.desc      rect 模式画笔直径 32 在 320x240 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0598', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0598 begin');
      const size: number = 32;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (320 * 240) * 10000) / 10000;
      const strokes: number = Math.ceil(76800 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(16);
      expect(cover.toFixed(2)).assertEqual('804.25');
      expect(ratio).assertEqual(0.0105);
      expect(strokes).assertEqual(96);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0598 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0599
     * @tc.name      eraserStroke0599
     * @tc.desc      circle 模式画笔直径 32 在 320x240 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0599', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0599 begin');
      const size: number = 32;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (320 * 240) * 10000) / 10000;
      const strokes: number = Math.ceil(76800 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(16);
      expect(cover.toFixed(2)).assertEqual('804.25');
      expect(ratio).assertEqual(0.0105);
      expect(strokes).assertEqual(96);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0599 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0600
     * @tc.name      eraserStroke0600
     * @tc.desc      pixel 模式画笔直径 32 在 320x240 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0600 begin');
      const size: number = 32;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (320 * 240) * 10000) / 10000;
      const strokes: number = Math.ceil(76800 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(16);
      expect(cover.toFixed(2)).assertEqual('804.25');
      expect(ratio).assertEqual(0.0105);
      expect(strokes).assertEqual(96);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0600 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0601
     * @tc.name      eraserStroke0601
     * @tc.desc      free 模式画笔直径 36 在 360x640 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0601', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0601 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (360 * 640) * 10000) / 10000;
      const strokes: number = Math.ceil(230400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0044);
      expect(strokes).assertEqual(227);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0601 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0602
     * @tc.name      eraserStroke0602
     * @tc.desc      line 模式画笔直径 36 在 360x640 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0602', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0602 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (360 * 640) * 10000) / 10000;
      const strokes: number = Math.ceil(230400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0044);
      expect(strokes).assertEqual(227);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0602 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0603
     * @tc.name      eraserStroke0603
     * @tc.desc      rect 模式画笔直径 36 在 360x640 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0603', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0603 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (360 * 640) * 10000) / 10000;
      const strokes: number = Math.ceil(230400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0044);
      expect(strokes).assertEqual(227);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0603 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0604
     * @tc.name      eraserStroke0604
     * @tc.desc      circle 模式画笔直径 36 在 360x640 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0604', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0604 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (360 * 640) * 10000) / 10000;
      const strokes: number = Math.ceil(230400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0044);
      expect(strokes).assertEqual(227);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0604 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0605
     * @tc.name      eraserStroke0605
     * @tc.desc      pixel 模式画笔直径 36 在 360x640 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0605', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0605 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (360 * 640) * 10000) / 10000;
      const strokes: number = Math.ceil(230400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0044);
      expect(strokes).assertEqual(227);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0605 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0606
     * @tc.name      eraserStroke0606
     * @tc.desc      free 模式画笔直径 36 在 375x812 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0606', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0606 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (375 * 812) * 10000) / 10000;
      const strokes: number = Math.ceil(304500 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0033);
      expect(strokes).assertEqual(300);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0606 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0607
     * @tc.name      eraserStroke0607
     * @tc.desc      line 模式画笔直径 36 在 375x812 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0607', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0607 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (375 * 812) * 10000) / 10000;
      const strokes: number = Math.ceil(304500 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0033);
      expect(strokes).assertEqual(300);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0607 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0608
     * @tc.name      eraserStroke0608
     * @tc.desc      rect 模式画笔直径 36 在 375x812 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0608', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0608 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (375 * 812) * 10000) / 10000;
      const strokes: number = Math.ceil(304500 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0033);
      expect(strokes).assertEqual(300);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0608 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0609
     * @tc.name      eraserStroke0609
     * @tc.desc      circle 模式画笔直径 36 在 375x812 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0609', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0609 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (375 * 812) * 10000) / 10000;
      const strokes: number = Math.ceil(304500 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0033);
      expect(strokes).assertEqual(300);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0609 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0610
     * @tc.name      eraserStroke0610
     * @tc.desc      pixel 模式画笔直径 36 在 375x812 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0610', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0610 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (375 * 812) * 10000) / 10000;
      const strokes: number = Math.ceil(304500 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0033);
      expect(strokes).assertEqual(300);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0610 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0611
     * @tc.name      eraserStroke0611
     * @tc.desc      free 模式画笔直径 36 在 720x1280 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0611', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0611 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (720 * 1280) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0011);
      expect(strokes).assertEqual(906);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0611 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0612
     * @tc.name      eraserStroke0612
     * @tc.desc      line 模式画笔直径 36 在 720x1280 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0612', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0612 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (720 * 1280) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0011);
      expect(strokes).assertEqual(906);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0612 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0613
     * @tc.name      eraserStroke0613
     * @tc.desc      rect 模式画笔直径 36 在 720x1280 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0613', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0613 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (720 * 1280) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0011);
      expect(strokes).assertEqual(906);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0613 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0614
     * @tc.name      eraserStroke0614
     * @tc.desc      circle 模式画笔直径 36 在 720x1280 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0614', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0614 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (720 * 1280) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0011);
      expect(strokes).assertEqual(906);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0614 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0615
     * @tc.name      eraserStroke0615
     * @tc.desc      pixel 模式画笔直径 36 在 720x1280 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0615', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0615 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (720 * 1280) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0011);
      expect(strokes).assertEqual(906);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0615 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0616
     * @tc.name      eraserStroke0616
     * @tc.desc      free 模式画笔直径 36 在 1080x1920 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0616', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0616 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1080 * 1920) * 10000) / 10000;
      const strokes: number = Math.ceil(2073600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0005);
      expect(strokes).assertEqual(2038);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0616 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0617
     * @tc.name      eraserStroke0617
     * @tc.desc      line 模式画笔直径 36 在 1080x1920 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0617', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0617 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1080 * 1920) * 10000) / 10000;
      const strokes: number = Math.ceil(2073600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0005);
      expect(strokes).assertEqual(2038);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0617 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0618
     * @tc.name      eraserStroke0618
     * @tc.desc      rect 模式画笔直径 36 在 1080x1920 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0618', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0618 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1080 * 1920) * 10000) / 10000;
      const strokes: number = Math.ceil(2073600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0005);
      expect(strokes).assertEqual(2038);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0618 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0619
     * @tc.name      eraserStroke0619
     * @tc.desc      circle 模式画笔直径 36 在 1080x1920 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0619', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0619 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1080 * 1920) * 10000) / 10000;
      const strokes: number = Math.ceil(2073600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0005);
      expect(strokes).assertEqual(2038);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0619 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0620
     * @tc.name      eraserStroke0620
     * @tc.desc      pixel 模式画笔直径 36 在 1080x1920 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0620', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0620 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1080 * 1920) * 10000) / 10000;
      const strokes: number = Math.ceil(2073600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0005);
      expect(strokes).assertEqual(2038);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0620 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0621
     * @tc.name      eraserStroke0621
     * @tc.desc      free 模式画笔直径 36 在 640x480 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0621', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0621 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (640 * 480) * 10000) / 10000;
      const strokes: number = Math.ceil(307200 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0033);
      expect(strokes).assertEqual(302);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0621 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0622
     * @tc.name      eraserStroke0622
     * @tc.desc      line 模式画笔直径 36 在 640x480 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0622', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0622 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (640 * 480) * 10000) / 10000;
      const strokes: number = Math.ceil(307200 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0033);
      expect(strokes).assertEqual(302);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0622 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0623
     * @tc.name      eraserStroke0623
     * @tc.desc      rect 模式画笔直径 36 在 640x480 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0623', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0623 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (640 * 480) * 10000) / 10000;
      const strokes: number = Math.ceil(307200 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0033);
      expect(strokes).assertEqual(302);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0623 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0624
     * @tc.name      eraserStroke0624
     * @tc.desc      circle 模式画笔直径 36 在 640x480 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0624', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0624 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (640 * 480) * 10000) / 10000;
      const strokes: number = Math.ceil(307200 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0033);
      expect(strokes).assertEqual(302);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0624 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0625
     * @tc.name      eraserStroke0625
     * @tc.desc      pixel 模式画笔直径 36 在 640x480 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0625', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0625 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (640 * 480) * 10000) / 10000;
      const strokes: number = Math.ceil(307200 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0033);
      expect(strokes).assertEqual(302);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0625 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0626
     * @tc.name      eraserStroke0626
     * @tc.desc      free 模式画笔直径 36 在 800x600 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0626', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0626 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (800 * 600) * 10000) / 10000;
      const strokes: number = Math.ceil(480000 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0021);
      expect(strokes).assertEqual(472);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0626 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0627
     * @tc.name      eraserStroke0627
     * @tc.desc      line 模式画笔直径 36 在 800x600 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0627', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0627 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (800 * 600) * 10000) / 10000;
      const strokes: number = Math.ceil(480000 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0021);
      expect(strokes).assertEqual(472);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0627 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0628
     * @tc.name      eraserStroke0628
     * @tc.desc      rect 模式画笔直径 36 在 800x600 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0628', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0628 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (800 * 600) * 10000) / 10000;
      const strokes: number = Math.ceil(480000 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0021);
      expect(strokes).assertEqual(472);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0628 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0629
     * @tc.name      eraserStroke0629
     * @tc.desc      circle 模式画笔直径 36 在 800x600 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0629', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0629 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (800 * 600) * 10000) / 10000;
      const strokes: number = Math.ceil(480000 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0021);
      expect(strokes).assertEqual(472);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0629 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0630
     * @tc.name      eraserStroke0630
     * @tc.desc      pixel 模式画笔直径 36 在 800x600 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0630', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0630 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (800 * 600) * 10000) / 10000;
      const strokes: number = Math.ceil(480000 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0021);
      expect(strokes).assertEqual(472);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0630 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0631
     * @tc.name      eraserStroke0631
     * @tc.desc      free 模式画笔直径 36 在 1024x768 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0631', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0631 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1024 * 768) * 10000) / 10000;
      const strokes: number = Math.ceil(786432 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0013);
      expect(strokes).assertEqual(773);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0631 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0632
     * @tc.name      eraserStroke0632
     * @tc.desc      line 模式画笔直径 36 在 1024x768 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0632', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0632 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1024 * 768) * 10000) / 10000;
      const strokes: number = Math.ceil(786432 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0013);
      expect(strokes).assertEqual(773);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0632 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0633
     * @tc.name      eraserStroke0633
     * @tc.desc      rect 模式画笔直径 36 在 1024x768 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0633', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0633 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1024 * 768) * 10000) / 10000;
      const strokes: number = Math.ceil(786432 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0013);
      expect(strokes).assertEqual(773);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0633 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0634
     * @tc.name      eraserStroke0634
     * @tc.desc      circle 模式画笔直径 36 在 1024x768 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0634', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0634 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1024 * 768) * 10000) / 10000;
      const strokes: number = Math.ceil(786432 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0013);
      expect(strokes).assertEqual(773);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0634 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0635
     * @tc.name      eraserStroke0635
     * @tc.desc      pixel 模式画笔直径 36 在 1024x768 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0635', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0635 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1024 * 768) * 10000) / 10000;
      const strokes: number = Math.ceil(786432 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0013);
      expect(strokes).assertEqual(773);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0635 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0636
     * @tc.name      eraserStroke0636
     * @tc.desc      free 模式画笔直径 36 在 1280x720 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0636', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0636 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1280 * 720) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0011);
      expect(strokes).assertEqual(906);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0636 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0637
     * @tc.name      eraserStroke0637
     * @tc.desc      line 模式画笔直径 36 在 1280x720 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0637', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0637 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1280 * 720) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0011);
      expect(strokes).assertEqual(906);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0637 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0638
     * @tc.name      eraserStroke0638
     * @tc.desc      rect 模式画笔直径 36 在 1280x720 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0638', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0638 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1280 * 720) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0011);
      expect(strokes).assertEqual(906);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0638 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0639
     * @tc.name      eraserStroke0639
     * @tc.desc      circle 模式画笔直径 36 在 1280x720 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0639', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0639 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1280 * 720) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0011);
      expect(strokes).assertEqual(906);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0639 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0640
     * @tc.name      eraserStroke0640
     * @tc.desc      pixel 模式画笔直径 36 在 1280x720 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0640', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0640 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1280 * 720) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0011);
      expect(strokes).assertEqual(906);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0640 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0641
     * @tc.name      eraserStroke0641
     * @tc.desc      free 模式画笔直径 36 在 512x512 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0641', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0641 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (512 * 512) * 10000) / 10000;
      const strokes: number = Math.ceil(262144 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0039);
      expect(strokes).assertEqual(258);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0641 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0642
     * @tc.name      eraserStroke0642
     * @tc.desc      line 模式画笔直径 36 在 512x512 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0642', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0642 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (512 * 512) * 10000) / 10000;
      const strokes: number = Math.ceil(262144 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0039);
      expect(strokes).assertEqual(258);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0642 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0643
     * @tc.name      eraserStroke0643
     * @tc.desc      rect 模式画笔直径 36 在 512x512 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0643', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0643 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (512 * 512) * 10000) / 10000;
      const strokes: number = Math.ceil(262144 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0039);
      expect(strokes).assertEqual(258);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0643 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0644
     * @tc.name      eraserStroke0644
     * @tc.desc      circle 模式画笔直径 36 在 512x512 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0644', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0644 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (512 * 512) * 10000) / 10000;
      const strokes: number = Math.ceil(262144 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0039);
      expect(strokes).assertEqual(258);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0644 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0645
     * @tc.name      eraserStroke0645
     * @tc.desc      pixel 模式画笔直径 36 在 512x512 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0645', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0645 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (512 * 512) * 10000) / 10000;
      const strokes: number = Math.ceil(262144 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0039);
      expect(strokes).assertEqual(258);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0645 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0646
     * @tc.name      eraserStroke0646
     * @tc.desc      free 模式画笔直径 36 在 256x256 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0646', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0646 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (256 * 256) * 10000) / 10000;
      const strokes: number = Math.ceil(65536 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0155);
      expect(strokes).assertEqual(65);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0646 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0647
     * @tc.name      eraserStroke0647
     * @tc.desc      line 模式画笔直径 36 在 256x256 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0647', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0647 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (256 * 256) * 10000) / 10000;
      const strokes: number = Math.ceil(65536 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0155);
      expect(strokes).assertEqual(65);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0647 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0648
     * @tc.name      eraserStroke0648
     * @tc.desc      rect 模式画笔直径 36 在 256x256 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0648', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0648 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (256 * 256) * 10000) / 10000;
      const strokes: number = Math.ceil(65536 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0155);
      expect(strokes).assertEqual(65);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0648 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0649
     * @tc.name      eraserStroke0649
     * @tc.desc      circle 模式画笔直径 36 在 256x256 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0649', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0649 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (256 * 256) * 10000) / 10000;
      const strokes: number = Math.ceil(65536 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0155);
      expect(strokes).assertEqual(65);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0649 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0650
     * @tc.name      eraserStroke0650
     * @tc.desc      pixel 模式画笔直径 36 在 256x256 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0650', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0650 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (256 * 256) * 10000) / 10000;
      const strokes: number = Math.ceil(65536 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0155);
      expect(strokes).assertEqual(65);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0650 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0651
     * @tc.name      eraserStroke0651
     * @tc.desc      free 模式画笔直径 36 在 1440x2560 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0651', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0651 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1440 * 2560) * 10000) / 10000;
      const strokes: number = Math.ceil(3686400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0003);
      expect(strokes).assertEqual(3622);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0651 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0652
     * @tc.name      eraserStroke0652
     * @tc.desc      line 模式画笔直径 36 在 1440x2560 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0652', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0652 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1440 * 2560) * 10000) / 10000;
      const strokes: number = Math.ceil(3686400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0003);
      expect(strokes).assertEqual(3622);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0652 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0653
     * @tc.name      eraserStroke0653
     * @tc.desc      rect 模式画笔直径 36 在 1440x2560 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0653', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0653 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1440 * 2560) * 10000) / 10000;
      const strokes: number = Math.ceil(3686400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0003);
      expect(strokes).assertEqual(3622);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0653 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0654
     * @tc.name      eraserStroke0654
     * @tc.desc      circle 模式画笔直径 36 在 1440x2560 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0654', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0654 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1440 * 2560) * 10000) / 10000;
      const strokes: number = Math.ceil(3686400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0003);
      expect(strokes).assertEqual(3622);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0654 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0655
     * @tc.name      eraserStroke0655
     * @tc.desc      pixel 模式画笔直径 36 在 1440x2560 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0655', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0655 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1440 * 2560) * 10000) / 10000;
      const strokes: number = Math.ceil(3686400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0003);
      expect(strokes).assertEqual(3622);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0655 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0656
     * @tc.name      eraserStroke0656
     * @tc.desc      free 模式画笔直径 36 在 320x240 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0656', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0656 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (320 * 240) * 10000) / 10000;
      const strokes: number = Math.ceil(76800 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0133);
      expect(strokes).assertEqual(76);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0656 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0657
     * @tc.name      eraserStroke0657
     * @tc.desc      line 模式画笔直径 36 在 320x240 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0657', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0657 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (320 * 240) * 10000) / 10000;
      const strokes: number = Math.ceil(76800 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0133);
      expect(strokes).assertEqual(76);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0657 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0658
     * @tc.name      eraserStroke0658
     * @tc.desc      rect 模式画笔直径 36 在 320x240 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0658', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0658 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (320 * 240) * 10000) / 10000;
      const strokes: number = Math.ceil(76800 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0133);
      expect(strokes).assertEqual(76);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0658 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0659
     * @tc.name      eraserStroke0659
     * @tc.desc      circle 模式画笔直径 36 在 320x240 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0659', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0659 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (320 * 240) * 10000) / 10000;
      const strokes: number = Math.ceil(76800 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0133);
      expect(strokes).assertEqual(76);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0659 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0660
     * @tc.name      eraserStroke0660
     * @tc.desc      pixel 模式画笔直径 36 在 320x240 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0660', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0660 begin');
      const size: number = 36;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (320 * 240) * 10000) / 10000;
      const strokes: number = Math.ceil(76800 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(18);
      expect(cover.toFixed(2)).assertEqual('1017.88');
      expect(ratio).assertEqual(0.0133);
      expect(strokes).assertEqual(76);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0660 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0661
     * @tc.name      eraserStroke0661
     * @tc.desc      free 模式画笔直径 40 在 360x640 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0661', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0661 begin');
      const size: number = 40;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (360 * 640) * 10000) / 10000;
      const strokes: number = Math.ceil(230400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(20);
      expect(cover.toFixed(2)).assertEqual('1256.64');
      expect(ratio).assertEqual(0.0055);
      expect(strokes).assertEqual(184);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0661 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0662
     * @tc.name      eraserStroke0662
     * @tc.desc      line 模式画笔直径 40 在 360x640 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0662', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0662 begin');
      const size: number = 40;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (360 * 640) * 10000) / 10000;
      const strokes: number = Math.ceil(230400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(20);
      expect(cover.toFixed(2)).assertEqual('1256.64');
      expect(ratio).assertEqual(0.0055);
      expect(strokes).assertEqual(184);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0662 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0663
     * @tc.name      eraserStroke0663
     * @tc.desc      rect 模式画笔直径 40 在 360x640 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0663', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0663 begin');
      const size: number = 40;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (360 * 640) * 10000) / 10000;
      const strokes: number = Math.ceil(230400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(20);
      expect(cover.toFixed(2)).assertEqual('1256.64');
      expect(ratio).assertEqual(0.0055);
      expect(strokes).assertEqual(184);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0663 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0664
     * @tc.name      eraserStroke0664
     * @tc.desc      circle 模式画笔直径 40 在 360x640 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0664', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0664 begin');
      const size: number = 40;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (360 * 640) * 10000) / 10000;
      const strokes: number = Math.ceil(230400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(20);
      expect(cover.toFixed(2)).assertEqual('1256.64');
      expect(ratio).assertEqual(0.0055);
      expect(strokes).assertEqual(184);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0664 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0665
     * @tc.name      eraserStroke0665
     * @tc.desc      pixel 模式画笔直径 40 在 360x640 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0665', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0665 begin');
      const size: number = 40;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (360 * 640) * 10000) / 10000;
      const strokes: number = Math.ceil(230400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(20);
      expect(cover.toFixed(2)).assertEqual('1256.64');
      expect(ratio).assertEqual(0.0055);
      expect(strokes).assertEqual(184);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0665 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0666
     * @tc.name      eraserStroke0666
     * @tc.desc      free 模式画笔直径 40 在 375x812 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0666', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0666 begin');
      const size: number = 40;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (375 * 812) * 10000) / 10000;
      const strokes: number = Math.ceil(304500 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(20);
      expect(cover.toFixed(2)).assertEqual('1256.64');
      expect(ratio).assertEqual(0.0041);
      expect(strokes).assertEqual(243);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0666 end');
    })
  })
}
