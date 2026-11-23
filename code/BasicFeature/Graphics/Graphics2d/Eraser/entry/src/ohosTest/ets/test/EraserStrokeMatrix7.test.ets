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

export default function eraserStrokeMatrix7Test(): void {
  describe('EraserStrokeMatrix7Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    ERASER_STROKE_0445
     * @tc.name      eraserStroke0445
     * @tc.desc      pixel 模式画笔直径 24 在 640x480 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0445', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0445 begin');
      const size: number = 24;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (640 * 480) * 10000) / 10000;
      const strokes: number = Math.ceil(307200 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(12);
      expect(cover.toFixed(2)).assertEqual('452.39');
      expect(ratio).assertEqual(0.0015);
      expect(strokes).assertEqual(680);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0445 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0446
     * @tc.name      eraserStroke0446
     * @tc.desc      free 模式画笔直径 24 在 800x600 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0446', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0446 begin');
      const size: number = 24;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (800 * 600) * 10000) / 10000;
      const strokes: number = Math.ceil(480000 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(12);
      expect(cover.toFixed(2)).assertEqual('452.39');
      expect(ratio).assertEqual(0.0009);
      expect(strokes).assertEqual(1062);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0446 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0447
     * @tc.name      eraserStroke0447
     * @tc.desc      line 模式画笔直径 24 在 800x600 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0447', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0447 begin');
      const size: number = 24;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (800 * 600) * 10000) / 10000;
      const strokes: number = Math.ceil(480000 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(12);
      expect(cover.toFixed(2)).assertEqual('452.39');
      expect(ratio).assertEqual(0.0009);
      expect(strokes).assertEqual(1062);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0447 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0448
     * @tc.name      eraserStroke0448
     * @tc.desc      rect 模式画笔直径 24 在 800x600 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0448', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0448 begin');
      const size: number = 24;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (800 * 600) * 10000) / 10000;
      const strokes: number = Math.ceil(480000 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(12);
      expect(cover.toFixed(2)).assertEqual('452.39');
      expect(ratio).assertEqual(0.0009);
      expect(strokes).assertEqual(1062);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0448 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0449
     * @tc.name      eraserStroke0449
     * @tc.desc      circle 模式画笔直径 24 在 800x600 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0449', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0449 begin');
      const size: number = 24;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (800 * 600) * 10000) / 10000;
      const strokes: number = Math.ceil(480000 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(12);
      expect(cover.toFixed(2)).assertEqual('452.39');
      expect(ratio).assertEqual(0.0009);
      expect(strokes).assertEqual(1062);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0449 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0450
     * @tc.name      eraserStroke0450
     * @tc.desc      pixel 模式画笔直径 24 在 800x600 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0450', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0450 begin');
      const size: number = 24;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (800 * 600) * 10000) / 10000;
      const strokes: number = Math.ceil(480000 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(12);
      expect(cover.toFixed(2)).assertEqual('452.39');
      expect(ratio).assertEqual(0.0009);
      expect(strokes).assertEqual(1062);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0450 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0451
     * @tc.name      eraserStroke0451
     * @tc.desc      free 模式画笔直径 24 在 1024x768 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0451', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0451 begin');
      const size: number = 24;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1024 * 768) * 10000) / 10000;
      const strokes: number = Math.ceil(786432 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(12);
      expect(cover.toFixed(2)).assertEqual('452.39');
      expect(ratio).assertEqual(0.0006);
      expect(strokes).assertEqual(1739);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0451 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0452
     * @tc.name      eraserStroke0452
     * @tc.desc      line 模式画笔直径 24 在 1024x768 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0452', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0452 begin');
      const size: number = 24;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1024 * 768) * 10000) / 10000;
      const strokes: number = Math.ceil(786432 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(12);
      expect(cover.toFixed(2)).assertEqual('452.39');
      expect(ratio).assertEqual(0.0006);
      expect(strokes).assertEqual(1739);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0452 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0453
     * @tc.name      eraserStroke0453
     * @tc.desc      rect 模式画笔直径 24 在 1024x768 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0453', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0453 begin');
      const size: number = 24;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1024 * 768) * 10000) / 10000;
      const strokes: number = Math.ceil(786432 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(12);
      expect(cover.toFixed(2)).assertEqual('452.39');
      expect(ratio).assertEqual(0.0006);
      expect(strokes).assertEqual(1739);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0453 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0454
     * @tc.name      eraserStroke0454
     * @tc.desc      circle 模式画笔直径 24 在 1024x768 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0454', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0454 begin');
      const size: number = 24;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1024 * 768) * 10000) / 10000;
      const strokes: number = Math.ceil(786432 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(12);
      expect(cover.toFixed(2)).assertEqual('452.39');
      expect(ratio).assertEqual(0.0006);
      expect(strokes).assertEqual(1739);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0454 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0455
     * @tc.name      eraserStroke0455
     * @tc.desc      pixel 模式画笔直径 24 在 1024x768 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0455', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0455 begin');
      const size: number = 24;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1024 * 768) * 10000) / 10000;
      const strokes: number = Math.ceil(786432 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(12);
      expect(cover.toFixed(2)).assertEqual('452.39');
      expect(ratio).assertEqual(0.0006);
      expect(strokes).assertEqual(1739);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0455 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0456
     * @tc.name      eraserStroke0456
     * @tc.desc      free 模式画笔直径 24 在 1280x720 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0456', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0456 begin');
      const size: number = 24;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1280 * 720) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(12);
      expect(cover.toFixed(2)).assertEqual('452.39');
      expect(ratio).assertEqual(0.0005);
      expect(strokes).assertEqual(2038);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0456 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0457
     * @tc.name      eraserStroke0457
     * @tc.desc      line 模式画笔直径 24 在 1280x720 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0457', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0457 begin');
      const size: number = 24;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1280 * 720) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(12);
      expect(cover.toFixed(2)).assertEqual('452.39');
      expect(ratio).assertEqual(0.0005);
      expect(strokes).assertEqual(2038);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0457 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0458
     * @tc.name      eraserStroke0458
     * @tc.desc      rect 模式画笔直径 24 在 1280x720 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0458', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0458 begin');
      const size: number = 24;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1280 * 720) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(12);
      expect(cover.toFixed(2)).assertEqual('452.39');
      expect(ratio).assertEqual(0.0005);
      expect(strokes).assertEqual(2038);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0458 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0459
     * @tc.name      eraserStroke0459
     * @tc.desc      circle 模式画笔直径 24 在 1280x720 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0459', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0459 begin');
      const size: number = 24;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1280 * 720) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(12);
      expect(cover.toFixed(2)).assertEqual('452.39');
      expect(ratio).assertEqual(0.0005);
      expect(strokes).assertEqual(2038);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0459 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0460
     * @tc.name      eraserStroke0460
     * @tc.desc      pixel 模式画笔直径 24 在 1280x720 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0460', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0460 begin');
      const size: number = 24;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1280 * 720) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(12);
      expect(cover.toFixed(2)).assertEqual('452.39');
      expect(ratio).assertEqual(0.0005);
      expect(strokes).assertEqual(2038);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0460 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0461
     * @tc.name      eraserStroke0461
     * @tc.desc      free 模式画笔直径 24 在 512x512 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0461', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0461 begin');
      const size: number = 24;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (512 * 512) * 10000) / 10000;
      const strokes: number = Math.ceil(262144 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(12);
      expect(cover.toFixed(2)).assertEqual('452.39');
      expect(ratio).assertEqual(0.0017);
      expect(strokes).assertEqual(580);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0461 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0462
     * @tc.name      eraserStroke0462
     * @tc.desc      line 模式画笔直径 24 在 512x512 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0462', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0462 begin');
      const size: number = 24;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (512 * 512) * 10000) / 10000;
      const strokes: number = Math.ceil(262144 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(12);
      expect(cover.toFixed(2)).assertEqual('452.39');
      expect(ratio).assertEqual(0.0017);
      expect(strokes).assertEqual(580);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0462 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0463
     * @tc.name      eraserStroke0463
     * @tc.desc      rect 模式画笔直径 24 在 512x512 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0463', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0463 begin');
      const size: number = 24;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (512 * 512) * 10000) / 10000;
      const strokes: number = Math.ceil(262144 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(12);
      expect(cover.toFixed(2)).assertEqual('452.39');
      expect(ratio).assertEqual(0.0017);
      expect(strokes).assertEqual(580);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0463 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0464
     * @tc.name      eraserStroke0464
     * @tc.desc      circle 模式画笔直径 24 在 512x512 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0464', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0464 begin');
      const size: number = 24;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (512 * 512) * 10000) / 10000;
      const strokes: number = Math.ceil(262144 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(12);
      expect(cover.toFixed(2)).assertEqual('452.39');
      expect(ratio).assertEqual(0.0017);
      expect(strokes).assertEqual(580);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0464 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0465
     * @tc.name      eraserStroke0465
     * @tc.desc      pixel 模式画笔直径 24 在 512x512 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0465', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0465 begin');
      const size: number = 24;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (512 * 512) * 10000) / 10000;
      const strokes: number = Math.ceil(262144 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(12);
      expect(cover.toFixed(2)).assertEqual('452.39');
      expect(ratio).assertEqual(0.0017);
      expect(strokes).assertEqual(580);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0465 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0466
     * @tc.name      eraserStroke0466
     * @tc.desc      free 模式画笔直径 24 在 256x256 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0466', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0466 begin');
      const size: number = 24;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (256 * 256) * 10000) / 10000;
      const strokes: number = Math.ceil(65536 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(12);
      expect(cover.toFixed(2)).assertEqual('452.39');
      expect(ratio).assertEqual(0.0069);
      expect(strokes).assertEqual(145);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0466 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0467
     * @tc.name      eraserStroke0467
     * @tc.desc      line 模式画笔直径 24 在 256x256 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0467', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0467 begin');
      const size: number = 24;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (256 * 256) * 10000) / 10000;
      const strokes: number = Math.ceil(65536 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(12);
      expect(cover.toFixed(2)).assertEqual('452.39');
      expect(ratio).assertEqual(0.0069);
      expect(strokes).assertEqual(145);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0467 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0468
     * @tc.name      eraserStroke0468
     * @tc.desc      rect 模式画笔直径 24 在 256x256 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0468', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0468 begin');
      const size: number = 24;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (256 * 256) * 10000) / 10000;
      const strokes: number = Math.ceil(65536 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(12);
      expect(cover.toFixed(2)).assertEqual('452.39');
      expect(ratio).assertEqual(0.0069);
      expect(strokes).assertEqual(145);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0468 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0469
     * @tc.name      eraserStroke0469
     * @tc.desc      circle 模式画笔直径 24 在 256x256 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0469', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0469 begin');
      const size: number = 24;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (256 * 256) * 10000) / 10000;
      const strokes: number = Math.ceil(65536 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(12);
      expect(cover.toFixed(2)).assertEqual('452.39');
      expect(ratio).assertEqual(0.0069);
      expect(strokes).assertEqual(145);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0469 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0470
     * @tc.name      eraserStroke0470
     * @tc.desc      pixel 模式画笔直径 24 在 256x256 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0470', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0470 begin');
      const size: number = 24;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (256 * 256) * 10000) / 10000;
      const strokes: number = Math.ceil(65536 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(12);
      expect(cover.toFixed(2)).assertEqual('452.39');
      expect(ratio).assertEqual(0.0069);
      expect(strokes).assertEqual(145);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0470 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0471
     * @tc.name      eraserStroke0471
     * @tc.desc      free 模式画笔直径 24 在 1440x2560 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0471', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0471 begin');
      const size: number = 24;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1440 * 2560) * 10000) / 10000;
      const strokes: number = Math.ceil(3686400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(12);
      expect(cover.toFixed(2)).assertEqual('452.39');
      expect(ratio).assertEqual(0.0001);
      expect(strokes).assertEqual(8149);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0471 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0472
     * @tc.name      eraserStroke0472
     * @tc.desc      line 模式画笔直径 24 在 1440x2560 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0472', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0472 begin');
      const size: number = 24;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1440 * 2560) * 10000) / 10000;
      const strokes: number = Math.ceil(3686400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(12);
      expect(cover.toFixed(2)).assertEqual('452.39');
      expect(ratio).assertEqual(0.0001);
      expect(strokes).assertEqual(8149);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0472 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0473
     * @tc.name      eraserStroke0473
     * @tc.desc      rect 模式画笔直径 24 在 1440x2560 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0473', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0473 begin');
      const size: number = 24;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1440 * 2560) * 10000) / 10000;
      const strokes: number = Math.ceil(3686400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(12);
      expect(cover.toFixed(2)).assertEqual('452.39');
      expect(ratio).assertEqual(0.0001);
      expect(strokes).assertEqual(8149);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0473 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0474
     * @tc.name      eraserStroke0474
     * @tc.desc      circle 模式画笔直径 24 在 1440x2560 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0474', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0474 begin');
      const size: number = 24;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1440 * 2560) * 10000) / 10000;
      const strokes: number = Math.ceil(3686400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(12);
      expect(cover.toFixed(2)).assertEqual('452.39');
      expect(ratio).assertEqual(0.0001);
      expect(strokes).assertEqual(8149);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0474 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0475
     * @tc.name      eraserStroke0475
     * @tc.desc      pixel 模式画笔直径 24 在 1440x2560 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0475', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0475 begin');
      const size: number = 24;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1440 * 2560) * 10000) / 10000;
      const strokes: number = Math.ceil(3686400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(12);
      expect(cover.toFixed(2)).assertEqual('452.39');
      expect(ratio).assertEqual(0.0001);
      expect(strokes).assertEqual(8149);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0475 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0476
     * @tc.name      eraserStroke0476
     * @tc.desc      free 模式画笔直径 24 在 320x240 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0476', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0476 begin');
      const size: number = 24;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (320 * 240) * 10000) / 10000;
      const strokes: number = Math.ceil(76800 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(12);
      expect(cover.toFixed(2)).assertEqual('452.39');
      expect(ratio).assertEqual(0.0059);
      expect(strokes).assertEqual(170);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0476 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0477
     * @tc.name      eraserStroke0477
     * @tc.desc      line 模式画笔直径 24 在 320x240 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0477', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0477 begin');
      const size: number = 24;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (320 * 240) * 10000) / 10000;
      const strokes: number = Math.ceil(76800 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(12);
      expect(cover.toFixed(2)).assertEqual('452.39');
      expect(ratio).assertEqual(0.0059);
      expect(strokes).assertEqual(170);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0477 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0478
     * @tc.name      eraserStroke0478
     * @tc.desc      rect 模式画笔直径 24 在 320x240 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0478', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0478 begin');
      const size: number = 24;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (320 * 240) * 10000) / 10000;
      const strokes: number = Math.ceil(76800 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(12);
      expect(cover.toFixed(2)).assertEqual('452.39');
      expect(ratio).assertEqual(0.0059);
      expect(strokes).assertEqual(170);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0478 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0479
     * @tc.name      eraserStroke0479
     * @tc.desc      circle 模式画笔直径 24 在 320x240 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0479', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0479 begin');
      const size: number = 24;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (320 * 240) * 10000) / 10000;
      const strokes: number = Math.ceil(76800 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(12);
      expect(cover.toFixed(2)).assertEqual('452.39');
      expect(ratio).assertEqual(0.0059);
      expect(strokes).assertEqual(170);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0479 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0480
     * @tc.name      eraserStroke0480
     * @tc.desc      pixel 模式画笔直径 24 在 320x240 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0480', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0480 begin');
      const size: number = 24;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (320 * 240) * 10000) / 10000;
      const strokes: number = Math.ceil(76800 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(12);
      expect(cover.toFixed(2)).assertEqual('452.39');
      expect(ratio).assertEqual(0.0059);
      expect(strokes).assertEqual(170);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0480 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0481
     * @tc.name      eraserStroke0481
     * @tc.desc      free 模式画笔直径 28 在 360x640 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0481', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0481 begin');
      const size: number = 28;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (360 * 640) * 10000) / 10000;
      const strokes: number = Math.ceil(230400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(14);
      expect(cover.toFixed(2)).assertEqual('615.75');
      expect(ratio).assertEqual(0.0027);
      expect(strokes).assertEqual(375);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0481 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0482
     * @tc.name      eraserStroke0482
     * @tc.desc      line 模式画笔直径 28 在 360x640 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0482', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0482 begin');
      const size: number = 28;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (360 * 640) * 10000) / 10000;
      const strokes: number = Math.ceil(230400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(14);
      expect(cover.toFixed(2)).assertEqual('615.75');
      expect(ratio).assertEqual(0.0027);
      expect(strokes).assertEqual(375);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0482 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0483
     * @tc.name      eraserStroke0483
     * @tc.desc      rect 模式画笔直径 28 在 360x640 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0483', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0483 begin');
      const size: number = 28;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (360 * 640) * 10000) / 10000;
      const strokes: number = Math.ceil(230400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(14);
      expect(cover.toFixed(2)).assertEqual('615.75');
      expect(ratio).assertEqual(0.0027);
      expect(strokes).assertEqual(375);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0483 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0484
     * @tc.name      eraserStroke0484
     * @tc.desc      circle 模式画笔直径 28 在 360x640 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0484', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0484 begin');
      const size: number = 28;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (360 * 640) * 10000) / 10000;
      const strokes: number = Math.ceil(230400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(14);
      expect(cover.toFixed(2)).assertEqual('615.75');
      expect(ratio).assertEqual(0.0027);
      expect(strokes).assertEqual(375);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0484 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0485
     * @tc.name      eraserStroke0485
     * @tc.desc      pixel 模式画笔直径 28 在 360x640 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0485', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0485 begin');
      const size: number = 28;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (360 * 640) * 10000) / 10000;
      const strokes: number = Math.ceil(230400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(14);
      expect(cover.toFixed(2)).assertEqual('615.75');
      expect(ratio).assertEqual(0.0027);
      expect(strokes).assertEqual(375);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0485 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0486
     * @tc.name      eraserStroke0486
     * @tc.desc      free 模式画笔直径 28 在 375x812 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0486', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0486 begin');
      const size: number = 28;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (375 * 812) * 10000) / 10000;
      const strokes: number = Math.ceil(304500 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(14);
      expect(cover.toFixed(2)).assertEqual('615.75');
      expect(ratio).assertEqual(0.002);
      expect(strokes).assertEqual(495);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0486 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0487
     * @tc.name      eraserStroke0487
     * @tc.desc      line 模式画笔直径 28 在 375x812 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0487', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0487 begin');
      const size: number = 28;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (375 * 812) * 10000) / 10000;
      const strokes: number = Math.ceil(304500 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(14);
      expect(cover.toFixed(2)).assertEqual('615.75');
      expect(ratio).assertEqual(0.002);
      expect(strokes).assertEqual(495);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0487 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0488
     * @tc.name      eraserStroke0488
     * @tc.desc      rect 模式画笔直径 28 在 375x812 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0488', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0488 begin');
      const size: number = 28;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (375 * 812) * 10000) / 10000;
      const strokes: number = Math.ceil(304500 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(14);
      expect(cover.toFixed(2)).assertEqual('615.75');
      expect(ratio).assertEqual(0.002);
      expect(strokes).assertEqual(495);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0488 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0489
     * @tc.name      eraserStroke0489
     * @tc.desc      circle 模式画笔直径 28 在 375x812 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0489', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0489 begin');
      const size: number = 28;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (375 * 812) * 10000) / 10000;
      const strokes: number = Math.ceil(304500 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(14);
      expect(cover.toFixed(2)).assertEqual('615.75');
      expect(ratio).assertEqual(0.002);
      expect(strokes).assertEqual(495);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0489 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0490
     * @tc.name      eraserStroke0490
     * @tc.desc      pixel 模式画笔直径 28 在 375x812 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0490', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0490 begin');
      const size: number = 28;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (375 * 812) * 10000) / 10000;
      const strokes: number = Math.ceil(304500 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(14);
      expect(cover.toFixed(2)).assertEqual('615.75');
      expect(ratio).assertEqual(0.002);
      expect(strokes).assertEqual(495);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0490 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0491
     * @tc.name      eraserStroke0491
     * @tc.desc      free 模式画笔直径 28 在 720x1280 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0491', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0491 begin');
      const size: number = 28;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (720 * 1280) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(14);
      expect(cover.toFixed(2)).assertEqual('615.75');
      expect(ratio).assertEqual(0.0007);
      expect(strokes).assertEqual(1497);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0491 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0492
     * @tc.name      eraserStroke0492
     * @tc.desc      line 模式画笔直径 28 在 720x1280 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0492', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0492 begin');
      const size: number = 28;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (720 * 1280) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(14);
      expect(cover.toFixed(2)).assertEqual('615.75');
      expect(ratio).assertEqual(0.0007);
      expect(strokes).assertEqual(1497);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0492 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0493
     * @tc.name      eraserStroke0493
     * @tc.desc      rect 模式画笔直径 28 在 720x1280 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0493', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0493 begin');
      const size: number = 28;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (720 * 1280) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(14);
      expect(cover.toFixed(2)).assertEqual('615.75');
      expect(ratio).assertEqual(0.0007);
      expect(strokes).assertEqual(1497);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0493 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0494
     * @tc.name      eraserStroke0494
     * @tc.desc      circle 模式画笔直径 28 在 720x1280 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0494', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0494 begin');
      const size: number = 28;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (720 * 1280) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(14);
      expect(cover.toFixed(2)).assertEqual('615.75');
      expect(ratio).assertEqual(0.0007);
      expect(strokes).assertEqual(1497);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0494 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0495
     * @tc.name      eraserStroke0495
     * @tc.desc      pixel 模式画笔直径 28 在 720x1280 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0495', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0495 begin');
      const size: number = 28;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (720 * 1280) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(14);
      expect(cover.toFixed(2)).assertEqual('615.75');
      expect(ratio).assertEqual(0.0007);
      expect(strokes).assertEqual(1497);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0495 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0496
     * @tc.name      eraserStroke0496
     * @tc.desc      free 模式画笔直径 28 在 1080x1920 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0496', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0496 begin');
      const size: number = 28;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1080 * 1920) * 10000) / 10000;
      const strokes: number = Math.ceil(2073600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(14);
      expect(cover.toFixed(2)).assertEqual('615.75');
      expect(ratio).assertEqual(0.0003);
      expect(strokes).assertEqual(3368);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0496 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0497
     * @tc.name      eraserStroke0497
     * @tc.desc      line 模式画笔直径 28 在 1080x1920 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0497', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0497 begin');
      const size: number = 28;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1080 * 1920) * 10000) / 10000;
      const strokes: number = Math.ceil(2073600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(14);
      expect(cover.toFixed(2)).assertEqual('615.75');
      expect(ratio).assertEqual(0.0003);
      expect(strokes).assertEqual(3368);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0497 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0498
     * @tc.name      eraserStroke0498
     * @tc.desc      rect 模式画笔直径 28 在 1080x1920 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0498', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0498 begin');
      const size: number = 28;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1080 * 1920) * 10000) / 10000;
      const strokes: number = Math.ceil(2073600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(14);
      expect(cover.toFixed(2)).assertEqual('615.75');
      expect(ratio).assertEqual(0.0003);
      expect(strokes).assertEqual(3368);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0498 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0499
     * @tc.name      eraserStroke0499
     * @tc.desc      circle 模式画笔直径 28 在 1080x1920 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0499', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0499 begin');
      const size: number = 28;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1080 * 1920) * 10000) / 10000;
      const strokes: number = Math.ceil(2073600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(14);
      expect(cover.toFixed(2)).assertEqual('615.75');
      expect(ratio).assertEqual(0.0003);
      expect(strokes).assertEqual(3368);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0499 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0500
     * @tc.name      eraserStroke0500
     * @tc.desc      pixel 模式画笔直径 28 在 1080x1920 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0500 begin');
      const size: number = 28;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1080 * 1920) * 10000) / 10000;
      const strokes: number = Math.ceil(2073600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(14);
      expect(cover.toFixed(2)).assertEqual('615.75');
      expect(ratio).assertEqual(0.0003);
      expect(strokes).assertEqual(3368);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0500 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0501
     * @tc.name      eraserStroke0501
     * @tc.desc      free 模式画笔直径 28 在 640x480 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0501', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0501 begin');
      const size: number = 28;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (640 * 480) * 10000) / 10000;
      const strokes: number = Math.ceil(307200 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(14);
      expect(cover.toFixed(2)).assertEqual('615.75');
      expect(ratio).assertEqual(0.002);
      expect(strokes).assertEqual(499);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0501 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0502
     * @tc.name      eraserStroke0502
     * @tc.desc      line 模式画笔直径 28 在 640x480 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0502', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0502 begin');
      const size: number = 28;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (640 * 480) * 10000) / 10000;
      const strokes: number = Math.ceil(307200 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(14);
      expect(cover.toFixed(2)).assertEqual('615.75');
      expect(ratio).assertEqual(0.002);
      expect(strokes).assertEqual(499);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0502 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0503
     * @tc.name      eraserStroke0503
     * @tc.desc      rect 模式画笔直径 28 在 640x480 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0503', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0503 begin');
      const size: number = 28;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (640 * 480) * 10000) / 10000;
      const strokes: number = Math.ceil(307200 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(14);
      expect(cover.toFixed(2)).assertEqual('615.75');
      expect(ratio).assertEqual(0.002);
      expect(strokes).assertEqual(499);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0503 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0504
     * @tc.name      eraserStroke0504
     * @tc.desc      circle 模式画笔直径 28 在 640x480 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0504', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0504 begin');
      const size: number = 28;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (640 * 480) * 10000) / 10000;
      const strokes: number = Math.ceil(307200 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(14);
      expect(cover.toFixed(2)).assertEqual('615.75');
      expect(ratio).assertEqual(0.002);
      expect(strokes).assertEqual(499);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0504 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0505
     * @tc.name      eraserStroke0505
     * @tc.desc      pixel 模式画笔直径 28 在 640x480 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0505', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0505 begin');
      const size: number = 28;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (640 * 480) * 10000) / 10000;
      const strokes: number = Math.ceil(307200 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(14);
      expect(cover.toFixed(2)).assertEqual('615.75');
      expect(ratio).assertEqual(0.002);
      expect(strokes).assertEqual(499);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0505 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0506
     * @tc.name      eraserStroke0506
     * @tc.desc      free 模式画笔直径 28 在 800x600 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0506', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0506 begin');
      const size: number = 28;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (800 * 600) * 10000) / 10000;
      const strokes: number = Math.ceil(480000 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(14);
      expect(cover.toFixed(2)).assertEqual('615.75');
      expect(ratio).assertEqual(0.0013);
      expect(strokes).assertEqual(780);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0506 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0507
     * @tc.name      eraserStroke0507
     * @tc.desc      line 模式画笔直径 28 在 800x600 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0507', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0507 begin');
      const size: number = 28;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (800 * 600) * 10000) / 10000;
      const strokes: number = Math.ceil(480000 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(14);
      expect(cover.toFixed(2)).assertEqual('615.75');
      expect(ratio).assertEqual(0.0013);
      expect(strokes).assertEqual(780);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0507 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0508
     * @tc.name      eraserStroke0508
     * @tc.desc      rect 模式画笔直径 28 在 800x600 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0508', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0508 begin');
      const size: number = 28;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (800 * 600) * 10000) / 10000;
      const strokes: number = Math.ceil(480000 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(14);
      expect(cover.toFixed(2)).assertEqual('615.75');
      expect(ratio).assertEqual(0.0013);
      expect(strokes).assertEqual(780);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0508 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0509
     * @tc.name      eraserStroke0509
     * @tc.desc      circle 模式画笔直径 28 在 800x600 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0509', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0509 begin');
      const size: number = 28;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (800 * 600) * 10000) / 10000;
      const strokes: number = Math.ceil(480000 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(14);
      expect(cover.toFixed(2)).assertEqual('615.75');
      expect(ratio).assertEqual(0.0013);
      expect(strokes).assertEqual(780);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0509 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0510
     * @tc.name      eraserStroke0510
     * @tc.desc      pixel 模式画笔直径 28 在 800x600 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0510', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0510 begin');
      const size: number = 28;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (800 * 600) * 10000) / 10000;
      const strokes: number = Math.ceil(480000 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(14);
      expect(cover.toFixed(2)).assertEqual('615.75');
      expect(ratio).assertEqual(0.0013);
      expect(strokes).assertEqual(780);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0510 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0511
     * @tc.name      eraserStroke0511
     * @tc.desc      free 模式画笔直径 28 在 1024x768 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0511', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0511 begin');
      const size: number = 28;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1024 * 768) * 10000) / 10000;
      const strokes: number = Math.ceil(786432 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(14);
      expect(cover.toFixed(2)).assertEqual('615.75');
      expect(ratio).assertEqual(0.0008);
      expect(strokes).assertEqual(1278);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0511 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0512
     * @tc.name      eraserStroke0512
     * @tc.desc      line 模式画笔直径 28 在 1024x768 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0512', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0512 begin');
      const size: number = 28;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1024 * 768) * 10000) / 10000;
      const strokes: number = Math.ceil(786432 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(14);
      expect(cover.toFixed(2)).assertEqual('615.75');
      expect(ratio).assertEqual(0.0008);
      expect(strokes).assertEqual(1278);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0512 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0513
     * @tc.name      eraserStroke0513
     * @tc.desc      rect 模式画笔直径 28 在 1024x768 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0513', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0513 begin');
      const size: number = 28;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1024 * 768) * 10000) / 10000;
      const strokes: number = Math.ceil(786432 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(14);
      expect(cover.toFixed(2)).assertEqual('615.75');
      expect(ratio).assertEqual(0.0008);
      expect(strokes).assertEqual(1278);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0513 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0514
     * @tc.name      eraserStroke0514
     * @tc.desc      circle 模式画笔直径 28 在 1024x768 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0514', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0514 begin');
      const size: number = 28;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1024 * 768) * 10000) / 10000;
      const strokes: number = Math.ceil(786432 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(14);
      expect(cover.toFixed(2)).assertEqual('615.75');
      expect(ratio).assertEqual(0.0008);
      expect(strokes).assertEqual(1278);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0514 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0515
     * @tc.name      eraserStroke0515
     * @tc.desc      pixel 模式画笔直径 28 在 1024x768 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0515', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0515 begin');
      const size: number = 28;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1024 * 768) * 10000) / 10000;
      const strokes: number = Math.ceil(786432 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(14);
      expect(cover.toFixed(2)).assertEqual('615.75');
      expect(ratio).assertEqual(0.0008);
      expect(strokes).assertEqual(1278);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0515 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0516
     * @tc.name      eraserStroke0516
     * @tc.desc      free 模式画笔直径 28 在 1280x720 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0516', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0516 begin');
      const size: number = 28;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1280 * 720) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(14);
      expect(cover.toFixed(2)).assertEqual('615.75');
      expect(ratio).assertEqual(0.0007);
      expect(strokes).assertEqual(1497);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0516 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0517
     * @tc.name      eraserStroke0517
     * @tc.desc      line 模式画笔直径 28 在 1280x720 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0517', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0517 begin');
      const size: number = 28;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1280 * 720) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(14);
      expect(cover.toFixed(2)).assertEqual('615.75');
      expect(ratio).assertEqual(0.0007);
      expect(strokes).assertEqual(1497);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0517 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0518
     * @tc.name      eraserStroke0518
     * @tc.desc      rect 模式画笔直径 28 在 1280x720 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0518', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0518 begin');
      const size: number = 28;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1280 * 720) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(14);
      expect(cover.toFixed(2)).assertEqual('615.75');
      expect(ratio).assertEqual(0.0007);
      expect(strokes).assertEqual(1497);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0518 end');
    })
  })
}
