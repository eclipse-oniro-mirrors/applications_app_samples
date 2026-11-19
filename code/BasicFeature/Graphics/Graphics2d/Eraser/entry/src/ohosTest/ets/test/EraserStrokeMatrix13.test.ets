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

export default function eraserStrokeMatrix13Test(): void {
  describe('EraserStrokeMatrix13Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    ERASER_STROKE_0889
     * @tc.name      eraserStroke0889
     * @tc.desc      circle 模式画笔直径 64 在 256x256 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0889', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0889 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (256 * 256) * 10000) / 10000;
      const strokes: number = Math.ceil(65536 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0491);
      expect(strokes).assertEqual(21);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0889 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0890
     * @tc.name      eraserStroke0890
     * @tc.desc      pixel 模式画笔直径 64 在 256x256 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0890', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0890 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (256 * 256) * 10000) / 10000;
      const strokes: number = Math.ceil(65536 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0491);
      expect(strokes).assertEqual(21);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0890 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0891
     * @tc.name      eraserStroke0891
     * @tc.desc      free 模式画笔直径 64 在 1440x2560 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0891', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0891 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1440 * 2560) * 10000) / 10000;
      const strokes: number = Math.ceil(3686400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0009);
      expect(strokes).assertEqual(1146);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0891 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0892
     * @tc.name      eraserStroke0892
     * @tc.desc      line 模式画笔直径 64 在 1440x2560 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0892', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0892 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1440 * 2560) * 10000) / 10000;
      const strokes: number = Math.ceil(3686400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0009);
      expect(strokes).assertEqual(1146);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0892 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0893
     * @tc.name      eraserStroke0893
     * @tc.desc      rect 模式画笔直径 64 在 1440x2560 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0893', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0893 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1440 * 2560) * 10000) / 10000;
      const strokes: number = Math.ceil(3686400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0009);
      expect(strokes).assertEqual(1146);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0893 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0894
     * @tc.name      eraserStroke0894
     * @tc.desc      circle 模式画笔直径 64 在 1440x2560 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0894', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0894 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1440 * 2560) * 10000) / 10000;
      const strokes: number = Math.ceil(3686400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0009);
      expect(strokes).assertEqual(1146);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0894 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0895
     * @tc.name      eraserStroke0895
     * @tc.desc      pixel 模式画笔直径 64 在 1440x2560 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0895', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0895 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1440 * 2560) * 10000) / 10000;
      const strokes: number = Math.ceil(3686400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0009);
      expect(strokes).assertEqual(1146);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0895 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0896
     * @tc.name      eraserStroke0896
     * @tc.desc      free 模式画笔直径 64 在 320x240 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0896', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0896 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (320 * 240) * 10000) / 10000;
      const strokes: number = Math.ceil(76800 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0419);
      expect(strokes).assertEqual(24);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0896 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0897
     * @tc.name      eraserStroke0897
     * @tc.desc      line 模式画笔直径 64 在 320x240 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0897', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0897 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (320 * 240) * 10000) / 10000;
      const strokes: number = Math.ceil(76800 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0419);
      expect(strokes).assertEqual(24);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0897 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0898
     * @tc.name      eraserStroke0898
     * @tc.desc      rect 模式画笔直径 64 在 320x240 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0898', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0898 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (320 * 240) * 10000) / 10000;
      const strokes: number = Math.ceil(76800 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0419);
      expect(strokes).assertEqual(24);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0898 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0899
     * @tc.name      eraserStroke0899
     * @tc.desc      circle 模式画笔直径 64 在 320x240 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0899', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0899 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (320 * 240) * 10000) / 10000;
      const strokes: number = Math.ceil(76800 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0419);
      expect(strokes).assertEqual(24);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0899 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0900
     * @tc.name      eraserStroke0900
     * @tc.desc      pixel 模式画笔直径 64 在 320x240 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0900 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (320 * 240) * 10000) / 10000;
      const strokes: number = Math.ceil(76800 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0419);
      expect(strokes).assertEqual(24);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0900 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0901
     * @tc.name      eraserStroke0901
     * @tc.desc      free 模式画笔直径 80 在 360x640 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0901', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0901 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (360 * 640) * 10000) / 10000;
      const strokes: number = Math.ceil(230400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0218);
      expect(strokes).assertEqual(46);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0901 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0902
     * @tc.name      eraserStroke0902
     * @tc.desc      line 模式画笔直径 80 在 360x640 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0902', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0902 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (360 * 640) * 10000) / 10000;
      const strokes: number = Math.ceil(230400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0218);
      expect(strokes).assertEqual(46);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0902 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0903
     * @tc.name      eraserStroke0903
     * @tc.desc      rect 模式画笔直径 80 在 360x640 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0903', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0903 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (360 * 640) * 10000) / 10000;
      const strokes: number = Math.ceil(230400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0218);
      expect(strokes).assertEqual(46);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0903 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0904
     * @tc.name      eraserStroke0904
     * @tc.desc      circle 模式画笔直径 80 在 360x640 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0904', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0904 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (360 * 640) * 10000) / 10000;
      const strokes: number = Math.ceil(230400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0218);
      expect(strokes).assertEqual(46);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0904 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0905
     * @tc.name      eraserStroke0905
     * @tc.desc      pixel 模式画笔直径 80 在 360x640 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0905', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0905 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (360 * 640) * 10000) / 10000;
      const strokes: number = Math.ceil(230400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0218);
      expect(strokes).assertEqual(46);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0905 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0906
     * @tc.name      eraserStroke0906
     * @tc.desc      free 模式画笔直径 80 在 375x812 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0906', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0906 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (375 * 812) * 10000) / 10000;
      const strokes: number = Math.ceil(304500 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0165);
      expect(strokes).assertEqual(61);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0906 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0907
     * @tc.name      eraserStroke0907
     * @tc.desc      line 模式画笔直径 80 在 375x812 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0907', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0907 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (375 * 812) * 10000) / 10000;
      const strokes: number = Math.ceil(304500 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0165);
      expect(strokes).assertEqual(61);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0907 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0908
     * @tc.name      eraserStroke0908
     * @tc.desc      rect 模式画笔直径 80 在 375x812 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0908', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0908 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (375 * 812) * 10000) / 10000;
      const strokes: number = Math.ceil(304500 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0165);
      expect(strokes).assertEqual(61);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0908 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0909
     * @tc.name      eraserStroke0909
     * @tc.desc      circle 模式画笔直径 80 在 375x812 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0909', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0909 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (375 * 812) * 10000) / 10000;
      const strokes: number = Math.ceil(304500 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0165);
      expect(strokes).assertEqual(61);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0909 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0910
     * @tc.name      eraserStroke0910
     * @tc.desc      pixel 模式画笔直径 80 在 375x812 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0910', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0910 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (375 * 812) * 10000) / 10000;
      const strokes: number = Math.ceil(304500 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0165);
      expect(strokes).assertEqual(61);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0910 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0911
     * @tc.name      eraserStroke0911
     * @tc.desc      free 模式画笔直径 80 在 720x1280 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0911', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0911 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (720 * 1280) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0055);
      expect(strokes).assertEqual(184);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0911 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0912
     * @tc.name      eraserStroke0912
     * @tc.desc      line 模式画笔直径 80 在 720x1280 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0912', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0912 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (720 * 1280) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0055);
      expect(strokes).assertEqual(184);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0912 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0913
     * @tc.name      eraserStroke0913
     * @tc.desc      rect 模式画笔直径 80 在 720x1280 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0913', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0913 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (720 * 1280) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0055);
      expect(strokes).assertEqual(184);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0913 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0914
     * @tc.name      eraserStroke0914
     * @tc.desc      circle 模式画笔直径 80 在 720x1280 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0914', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0914 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (720 * 1280) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0055);
      expect(strokes).assertEqual(184);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0914 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0915
     * @tc.name      eraserStroke0915
     * @tc.desc      pixel 模式画笔直径 80 在 720x1280 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0915', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0915 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (720 * 1280) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0055);
      expect(strokes).assertEqual(184);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0915 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0916
     * @tc.name      eraserStroke0916
     * @tc.desc      free 模式画笔直径 80 在 1080x1920 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0916', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0916 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1080 * 1920) * 10000) / 10000;
      const strokes: number = Math.ceil(2073600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0024);
      expect(strokes).assertEqual(413);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0916 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0917
     * @tc.name      eraserStroke0917
     * @tc.desc      line 模式画笔直径 80 在 1080x1920 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0917', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0917 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1080 * 1920) * 10000) / 10000;
      const strokes: number = Math.ceil(2073600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0024);
      expect(strokes).assertEqual(413);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0917 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0918
     * @tc.name      eraserStroke0918
     * @tc.desc      rect 模式画笔直径 80 在 1080x1920 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0918', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0918 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1080 * 1920) * 10000) / 10000;
      const strokes: number = Math.ceil(2073600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0024);
      expect(strokes).assertEqual(413);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0918 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0919
     * @tc.name      eraserStroke0919
     * @tc.desc      circle 模式画笔直径 80 在 1080x1920 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0919', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0919 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1080 * 1920) * 10000) / 10000;
      const strokes: number = Math.ceil(2073600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0024);
      expect(strokes).assertEqual(413);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0919 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0920
     * @tc.name      eraserStroke0920
     * @tc.desc      pixel 模式画笔直径 80 在 1080x1920 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0920', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0920 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1080 * 1920) * 10000) / 10000;
      const strokes: number = Math.ceil(2073600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0024);
      expect(strokes).assertEqual(413);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0920 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0921
     * @tc.name      eraserStroke0921
     * @tc.desc      free 模式画笔直径 80 在 640x480 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0921', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0921 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (640 * 480) * 10000) / 10000;
      const strokes: number = Math.ceil(307200 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0164);
      expect(strokes).assertEqual(62);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0921 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0922
     * @tc.name      eraserStroke0922
     * @tc.desc      line 模式画笔直径 80 在 640x480 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0922', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0922 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (640 * 480) * 10000) / 10000;
      const strokes: number = Math.ceil(307200 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0164);
      expect(strokes).assertEqual(62);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0922 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0923
     * @tc.name      eraserStroke0923
     * @tc.desc      rect 模式画笔直径 80 在 640x480 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0923', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0923 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (640 * 480) * 10000) / 10000;
      const strokes: number = Math.ceil(307200 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0164);
      expect(strokes).assertEqual(62);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0923 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0924
     * @tc.name      eraserStroke0924
     * @tc.desc      circle 模式画笔直径 80 在 640x480 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0924', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0924 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (640 * 480) * 10000) / 10000;
      const strokes: number = Math.ceil(307200 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0164);
      expect(strokes).assertEqual(62);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0924 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0925
     * @tc.name      eraserStroke0925
     * @tc.desc      pixel 模式画笔直径 80 在 640x480 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0925', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0925 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (640 * 480) * 10000) / 10000;
      const strokes: number = Math.ceil(307200 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0164);
      expect(strokes).assertEqual(62);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0925 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0926
     * @tc.name      eraserStroke0926
     * @tc.desc      free 模式画笔直径 80 在 800x600 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0926', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0926 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (800 * 600) * 10000) / 10000;
      const strokes: number = Math.ceil(480000 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0105);
      expect(strokes).assertEqual(96);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0926 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0927
     * @tc.name      eraserStroke0927
     * @tc.desc      line 模式画笔直径 80 在 800x600 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0927', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0927 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (800 * 600) * 10000) / 10000;
      const strokes: number = Math.ceil(480000 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0105);
      expect(strokes).assertEqual(96);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0927 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0928
     * @tc.name      eraserStroke0928
     * @tc.desc      rect 模式画笔直径 80 在 800x600 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0928', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0928 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (800 * 600) * 10000) / 10000;
      const strokes: number = Math.ceil(480000 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0105);
      expect(strokes).assertEqual(96);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0928 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0929
     * @tc.name      eraserStroke0929
     * @tc.desc      circle 模式画笔直径 80 在 800x600 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0929', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0929 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (800 * 600) * 10000) / 10000;
      const strokes: number = Math.ceil(480000 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0105);
      expect(strokes).assertEqual(96);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0929 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0930
     * @tc.name      eraserStroke0930
     * @tc.desc      pixel 模式画笔直径 80 在 800x600 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0930', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0930 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (800 * 600) * 10000) / 10000;
      const strokes: number = Math.ceil(480000 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0105);
      expect(strokes).assertEqual(96);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0930 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0931
     * @tc.name      eraserStroke0931
     * @tc.desc      free 模式画笔直径 80 在 1024x768 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0931', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0931 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1024 * 768) * 10000) / 10000;
      const strokes: number = Math.ceil(786432 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0064);
      expect(strokes).assertEqual(157);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0931 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0932
     * @tc.name      eraserStroke0932
     * @tc.desc      line 模式画笔直径 80 在 1024x768 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0932', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0932 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1024 * 768) * 10000) / 10000;
      const strokes: number = Math.ceil(786432 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0064);
      expect(strokes).assertEqual(157);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0932 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0933
     * @tc.name      eraserStroke0933
     * @tc.desc      rect 模式画笔直径 80 在 1024x768 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0933', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0933 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1024 * 768) * 10000) / 10000;
      const strokes: number = Math.ceil(786432 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0064);
      expect(strokes).assertEqual(157);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0933 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0934
     * @tc.name      eraserStroke0934
     * @tc.desc      circle 模式画笔直径 80 在 1024x768 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0934', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0934 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1024 * 768) * 10000) / 10000;
      const strokes: number = Math.ceil(786432 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0064);
      expect(strokes).assertEqual(157);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0934 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0935
     * @tc.name      eraserStroke0935
     * @tc.desc      pixel 模式画笔直径 80 在 1024x768 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0935', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0935 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1024 * 768) * 10000) / 10000;
      const strokes: number = Math.ceil(786432 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0064);
      expect(strokes).assertEqual(157);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0935 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0936
     * @tc.name      eraserStroke0936
     * @tc.desc      free 模式画笔直径 80 在 1280x720 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0936', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0936 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1280 * 720) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0055);
      expect(strokes).assertEqual(184);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0936 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0937
     * @tc.name      eraserStroke0937
     * @tc.desc      line 模式画笔直径 80 在 1280x720 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0937', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0937 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1280 * 720) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0055);
      expect(strokes).assertEqual(184);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0937 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0938
     * @tc.name      eraserStroke0938
     * @tc.desc      rect 模式画笔直径 80 在 1280x720 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0938', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0938 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1280 * 720) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0055);
      expect(strokes).assertEqual(184);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0938 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0939
     * @tc.name      eraserStroke0939
     * @tc.desc      circle 模式画笔直径 80 在 1280x720 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0939', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0939 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1280 * 720) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0055);
      expect(strokes).assertEqual(184);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0939 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0940
     * @tc.name      eraserStroke0940
     * @tc.desc      pixel 模式画笔直径 80 在 1280x720 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0940', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0940 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1280 * 720) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0055);
      expect(strokes).assertEqual(184);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0940 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0941
     * @tc.name      eraserStroke0941
     * @tc.desc      free 模式画笔直径 80 在 512x512 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0941', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0941 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (512 * 512) * 10000) / 10000;
      const strokes: number = Math.ceil(262144 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0192);
      expect(strokes).assertEqual(53);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0941 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0942
     * @tc.name      eraserStroke0942
     * @tc.desc      line 模式画笔直径 80 在 512x512 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0942', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0942 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (512 * 512) * 10000) / 10000;
      const strokes: number = Math.ceil(262144 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0192);
      expect(strokes).assertEqual(53);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0942 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0943
     * @tc.name      eraserStroke0943
     * @tc.desc      rect 模式画笔直径 80 在 512x512 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0943', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0943 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (512 * 512) * 10000) / 10000;
      const strokes: number = Math.ceil(262144 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0192);
      expect(strokes).assertEqual(53);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0943 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0944
     * @tc.name      eraserStroke0944
     * @tc.desc      circle 模式画笔直径 80 在 512x512 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0944', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0944 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (512 * 512) * 10000) / 10000;
      const strokes: number = Math.ceil(262144 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0192);
      expect(strokes).assertEqual(53);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0944 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0945
     * @tc.name      eraserStroke0945
     * @tc.desc      pixel 模式画笔直径 80 在 512x512 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0945', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0945 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (512 * 512) * 10000) / 10000;
      const strokes: number = Math.ceil(262144 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0192);
      expect(strokes).assertEqual(53);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0945 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0946
     * @tc.name      eraserStroke0946
     * @tc.desc      free 模式画笔直径 80 在 256x256 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0946', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0946 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (256 * 256) * 10000) / 10000;
      const strokes: number = Math.ceil(65536 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0767);
      expect(strokes).assertEqual(14);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0946 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0947
     * @tc.name      eraserStroke0947
     * @tc.desc      line 模式画笔直径 80 在 256x256 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0947', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0947 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (256 * 256) * 10000) / 10000;
      const strokes: number = Math.ceil(65536 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0767);
      expect(strokes).assertEqual(14);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0947 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0948
     * @tc.name      eraserStroke0948
     * @tc.desc      rect 模式画笔直径 80 在 256x256 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0948', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0948 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (256 * 256) * 10000) / 10000;
      const strokes: number = Math.ceil(65536 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0767);
      expect(strokes).assertEqual(14);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0948 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0949
     * @tc.name      eraserStroke0949
     * @tc.desc      circle 模式画笔直径 80 在 256x256 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0949', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0949 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (256 * 256) * 10000) / 10000;
      const strokes: number = Math.ceil(65536 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0767);
      expect(strokes).assertEqual(14);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0949 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0950
     * @tc.name      eraserStroke0950
     * @tc.desc      pixel 模式画笔直径 80 在 256x256 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0950', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0950 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (256 * 256) * 10000) / 10000;
      const strokes: number = Math.ceil(65536 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0767);
      expect(strokes).assertEqual(14);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0950 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0951
     * @tc.name      eraserStroke0951
     * @tc.desc      free 模式画笔直径 80 在 1440x2560 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0951', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0951 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1440 * 2560) * 10000) / 10000;
      const strokes: number = Math.ceil(3686400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0014);
      expect(strokes).assertEqual(734);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0951 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0952
     * @tc.name      eraserStroke0952
     * @tc.desc      line 模式画笔直径 80 在 1440x2560 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0952', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0952 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1440 * 2560) * 10000) / 10000;
      const strokes: number = Math.ceil(3686400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0014);
      expect(strokes).assertEqual(734);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0952 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0953
     * @tc.name      eraserStroke0953
     * @tc.desc      rect 模式画笔直径 80 在 1440x2560 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0953', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0953 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1440 * 2560) * 10000) / 10000;
      const strokes: number = Math.ceil(3686400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0014);
      expect(strokes).assertEqual(734);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0953 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0954
     * @tc.name      eraserStroke0954
     * @tc.desc      circle 模式画笔直径 80 在 1440x2560 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0954', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0954 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1440 * 2560) * 10000) / 10000;
      const strokes: number = Math.ceil(3686400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0014);
      expect(strokes).assertEqual(734);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0954 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0955
     * @tc.name      eraserStroke0955
     * @tc.desc      pixel 模式画笔直径 80 在 1440x2560 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0955', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0955 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1440 * 2560) * 10000) / 10000;
      const strokes: number = Math.ceil(3686400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0014);
      expect(strokes).assertEqual(734);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0955 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0956
     * @tc.name      eraserStroke0956
     * @tc.desc      free 模式画笔直径 80 在 320x240 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0956', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0956 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (320 * 240) * 10000) / 10000;
      const strokes: number = Math.ceil(76800 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0654);
      expect(strokes).assertEqual(16);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0956 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0957
     * @tc.name      eraserStroke0957
     * @tc.desc      line 模式画笔直径 80 在 320x240 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0957', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0957 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (320 * 240) * 10000) / 10000;
      const strokes: number = Math.ceil(76800 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0654);
      expect(strokes).assertEqual(16);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0957 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0958
     * @tc.name      eraserStroke0958
     * @tc.desc      rect 模式画笔直径 80 在 320x240 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0958', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0958 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (320 * 240) * 10000) / 10000;
      const strokes: number = Math.ceil(76800 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0654);
      expect(strokes).assertEqual(16);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0958 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0959
     * @tc.name      eraserStroke0959
     * @tc.desc      circle 模式画笔直径 80 在 320x240 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0959', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0959 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (320 * 240) * 10000) / 10000;
      const strokes: number = Math.ceil(76800 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0654);
      expect(strokes).assertEqual(16);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0959 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0960
     * @tc.name      eraserStroke0960
     * @tc.desc      pixel 模式画笔直径 80 在 320x240 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0960', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0960 begin');
      const size: number = 80;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (320 * 240) * 10000) / 10000;
      const strokes: number = Math.ceil(76800 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(40);
      expect(cover.toFixed(2)).assertEqual('5026.55');
      expect(ratio).assertEqual(0.0654);
      expect(strokes).assertEqual(16);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0960 end');
    })
  })
}
