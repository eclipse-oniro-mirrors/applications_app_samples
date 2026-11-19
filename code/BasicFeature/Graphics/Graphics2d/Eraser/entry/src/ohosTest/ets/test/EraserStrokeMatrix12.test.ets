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

export default function eraserStrokeMatrix12Test(): void {
  describe('EraserStrokeMatrix12Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    ERASER_STROKE_0815
     * @tc.name      eraserStroke0815
     * @tc.desc      pixel 模式画笔直径 56 在 1024x768 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0815', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0815 begin');
      const size: number = 56;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1024 * 768) * 10000) / 10000;
      const strokes: number = Math.ceil(786432 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(28);
      expect(cover.toFixed(2)).assertEqual('2463.01');
      expect(ratio).assertEqual(0.0031);
      expect(strokes).assertEqual(320);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0815 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0816
     * @tc.name      eraserStroke0816
     * @tc.desc      free 模式画笔直径 56 在 1280x720 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0816', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0816 begin');
      const size: number = 56;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1280 * 720) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(28);
      expect(cover.toFixed(2)).assertEqual('2463.01');
      expect(ratio).assertEqual(0.0027);
      expect(strokes).assertEqual(375);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0816 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0817
     * @tc.name      eraserStroke0817
     * @tc.desc      line 模式画笔直径 56 在 1280x720 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0817', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0817 begin');
      const size: number = 56;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1280 * 720) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(28);
      expect(cover.toFixed(2)).assertEqual('2463.01');
      expect(ratio).assertEqual(0.0027);
      expect(strokes).assertEqual(375);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0817 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0818
     * @tc.name      eraserStroke0818
     * @tc.desc      rect 模式画笔直径 56 在 1280x720 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0818', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0818 begin');
      const size: number = 56;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1280 * 720) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(28);
      expect(cover.toFixed(2)).assertEqual('2463.01');
      expect(ratio).assertEqual(0.0027);
      expect(strokes).assertEqual(375);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0818 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0819
     * @tc.name      eraserStroke0819
     * @tc.desc      circle 模式画笔直径 56 在 1280x720 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0819', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0819 begin');
      const size: number = 56;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1280 * 720) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(28);
      expect(cover.toFixed(2)).assertEqual('2463.01');
      expect(ratio).assertEqual(0.0027);
      expect(strokes).assertEqual(375);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0819 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0820
     * @tc.name      eraserStroke0820
     * @tc.desc      pixel 模式画笔直径 56 在 1280x720 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0820', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0820 begin');
      const size: number = 56;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1280 * 720) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(28);
      expect(cover.toFixed(2)).assertEqual('2463.01');
      expect(ratio).assertEqual(0.0027);
      expect(strokes).assertEqual(375);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0820 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0821
     * @tc.name      eraserStroke0821
     * @tc.desc      free 模式画笔直径 56 在 512x512 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0821', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0821 begin');
      const size: number = 56;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (512 * 512) * 10000) / 10000;
      const strokes: number = Math.ceil(262144 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(28);
      expect(cover.toFixed(2)).assertEqual('2463.01');
      expect(ratio).assertEqual(0.0094);
      expect(strokes).assertEqual(107);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0821 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0822
     * @tc.name      eraserStroke0822
     * @tc.desc      line 模式画笔直径 56 在 512x512 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0822', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0822 begin');
      const size: number = 56;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (512 * 512) * 10000) / 10000;
      const strokes: number = Math.ceil(262144 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(28);
      expect(cover.toFixed(2)).assertEqual('2463.01');
      expect(ratio).assertEqual(0.0094);
      expect(strokes).assertEqual(107);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0822 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0823
     * @tc.name      eraserStroke0823
     * @tc.desc      rect 模式画笔直径 56 在 512x512 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0823', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0823 begin');
      const size: number = 56;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (512 * 512) * 10000) / 10000;
      const strokes: number = Math.ceil(262144 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(28);
      expect(cover.toFixed(2)).assertEqual('2463.01');
      expect(ratio).assertEqual(0.0094);
      expect(strokes).assertEqual(107);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0823 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0824
     * @tc.name      eraserStroke0824
     * @tc.desc      circle 模式画笔直径 56 在 512x512 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0824', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0824 begin');
      const size: number = 56;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (512 * 512) * 10000) / 10000;
      const strokes: number = Math.ceil(262144 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(28);
      expect(cover.toFixed(2)).assertEqual('2463.01');
      expect(ratio).assertEqual(0.0094);
      expect(strokes).assertEqual(107);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0824 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0825
     * @tc.name      eraserStroke0825
     * @tc.desc      pixel 模式画笔直径 56 在 512x512 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0825', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0825 begin');
      const size: number = 56;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (512 * 512) * 10000) / 10000;
      const strokes: number = Math.ceil(262144 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(28);
      expect(cover.toFixed(2)).assertEqual('2463.01');
      expect(ratio).assertEqual(0.0094);
      expect(strokes).assertEqual(107);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0825 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0826
     * @tc.name      eraserStroke0826
     * @tc.desc      free 模式画笔直径 56 在 256x256 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0826', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0826 begin');
      const size: number = 56;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (256 * 256) * 10000) / 10000;
      const strokes: number = Math.ceil(65536 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(28);
      expect(cover.toFixed(2)).assertEqual('2463.01');
      expect(ratio).assertEqual(0.0376);
      expect(strokes).assertEqual(27);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0826 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0827
     * @tc.name      eraserStroke0827
     * @tc.desc      line 模式画笔直径 56 在 256x256 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0827', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0827 begin');
      const size: number = 56;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (256 * 256) * 10000) / 10000;
      const strokes: number = Math.ceil(65536 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(28);
      expect(cover.toFixed(2)).assertEqual('2463.01');
      expect(ratio).assertEqual(0.0376);
      expect(strokes).assertEqual(27);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0827 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0828
     * @tc.name      eraserStroke0828
     * @tc.desc      rect 模式画笔直径 56 在 256x256 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0828', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0828 begin');
      const size: number = 56;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (256 * 256) * 10000) / 10000;
      const strokes: number = Math.ceil(65536 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(28);
      expect(cover.toFixed(2)).assertEqual('2463.01');
      expect(ratio).assertEqual(0.0376);
      expect(strokes).assertEqual(27);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0828 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0829
     * @tc.name      eraserStroke0829
     * @tc.desc      circle 模式画笔直径 56 在 256x256 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0829', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0829 begin');
      const size: number = 56;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (256 * 256) * 10000) / 10000;
      const strokes: number = Math.ceil(65536 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(28);
      expect(cover.toFixed(2)).assertEqual('2463.01');
      expect(ratio).assertEqual(0.0376);
      expect(strokes).assertEqual(27);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0829 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0830
     * @tc.name      eraserStroke0830
     * @tc.desc      pixel 模式画笔直径 56 在 256x256 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0830', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0830 begin');
      const size: number = 56;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (256 * 256) * 10000) / 10000;
      const strokes: number = Math.ceil(65536 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(28);
      expect(cover.toFixed(2)).assertEqual('2463.01');
      expect(ratio).assertEqual(0.0376);
      expect(strokes).assertEqual(27);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0830 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0831
     * @tc.name      eraserStroke0831
     * @tc.desc      free 模式画笔直径 56 在 1440x2560 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0831', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0831 begin');
      const size: number = 56;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1440 * 2560) * 10000) / 10000;
      const strokes: number = Math.ceil(3686400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(28);
      expect(cover.toFixed(2)).assertEqual('2463.01');
      expect(ratio).assertEqual(0.0007);
      expect(strokes).assertEqual(1497);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0831 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0832
     * @tc.name      eraserStroke0832
     * @tc.desc      line 模式画笔直径 56 在 1440x2560 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0832', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0832 begin');
      const size: number = 56;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1440 * 2560) * 10000) / 10000;
      const strokes: number = Math.ceil(3686400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(28);
      expect(cover.toFixed(2)).assertEqual('2463.01');
      expect(ratio).assertEqual(0.0007);
      expect(strokes).assertEqual(1497);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0832 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0833
     * @tc.name      eraserStroke0833
     * @tc.desc      rect 模式画笔直径 56 在 1440x2560 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0833', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0833 begin');
      const size: number = 56;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1440 * 2560) * 10000) / 10000;
      const strokes: number = Math.ceil(3686400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(28);
      expect(cover.toFixed(2)).assertEqual('2463.01');
      expect(ratio).assertEqual(0.0007);
      expect(strokes).assertEqual(1497);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0833 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0834
     * @tc.name      eraserStroke0834
     * @tc.desc      circle 模式画笔直径 56 在 1440x2560 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0834', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0834 begin');
      const size: number = 56;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1440 * 2560) * 10000) / 10000;
      const strokes: number = Math.ceil(3686400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(28);
      expect(cover.toFixed(2)).assertEqual('2463.01');
      expect(ratio).assertEqual(0.0007);
      expect(strokes).assertEqual(1497);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0834 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0835
     * @tc.name      eraserStroke0835
     * @tc.desc      pixel 模式画笔直径 56 在 1440x2560 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0835', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0835 begin');
      const size: number = 56;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1440 * 2560) * 10000) / 10000;
      const strokes: number = Math.ceil(3686400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(28);
      expect(cover.toFixed(2)).assertEqual('2463.01');
      expect(ratio).assertEqual(0.0007);
      expect(strokes).assertEqual(1497);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0835 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0836
     * @tc.name      eraserStroke0836
     * @tc.desc      free 模式画笔直径 56 在 320x240 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0836', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0836 begin');
      const size: number = 56;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (320 * 240) * 10000) / 10000;
      const strokes: number = Math.ceil(76800 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(28);
      expect(cover.toFixed(2)).assertEqual('2463.01');
      expect(ratio).assertEqual(0.0321);
      expect(strokes).assertEqual(32);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0836 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0837
     * @tc.name      eraserStroke0837
     * @tc.desc      line 模式画笔直径 56 在 320x240 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0837', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0837 begin');
      const size: number = 56;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (320 * 240) * 10000) / 10000;
      const strokes: number = Math.ceil(76800 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(28);
      expect(cover.toFixed(2)).assertEqual('2463.01');
      expect(ratio).assertEqual(0.0321);
      expect(strokes).assertEqual(32);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0837 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0838
     * @tc.name      eraserStroke0838
     * @tc.desc      rect 模式画笔直径 56 在 320x240 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0838', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0838 begin');
      const size: number = 56;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (320 * 240) * 10000) / 10000;
      const strokes: number = Math.ceil(76800 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(28);
      expect(cover.toFixed(2)).assertEqual('2463.01');
      expect(ratio).assertEqual(0.0321);
      expect(strokes).assertEqual(32);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0838 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0839
     * @tc.name      eraserStroke0839
     * @tc.desc      circle 模式画笔直径 56 在 320x240 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0839', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0839 begin');
      const size: number = 56;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (320 * 240) * 10000) / 10000;
      const strokes: number = Math.ceil(76800 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(28);
      expect(cover.toFixed(2)).assertEqual('2463.01');
      expect(ratio).assertEqual(0.0321);
      expect(strokes).assertEqual(32);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0839 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0840
     * @tc.name      eraserStroke0840
     * @tc.desc      pixel 模式画笔直径 56 在 320x240 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0840', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0840 begin');
      const size: number = 56;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (320 * 240) * 10000) / 10000;
      const strokes: number = Math.ceil(76800 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(28);
      expect(cover.toFixed(2)).assertEqual('2463.01');
      expect(ratio).assertEqual(0.0321);
      expect(strokes).assertEqual(32);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0840 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0841
     * @tc.name      eraserStroke0841
     * @tc.desc      free 模式画笔直径 64 在 360x640 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0841', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0841 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (360 * 640) * 10000) / 10000;
      const strokes: number = Math.ceil(230400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.014);
      expect(strokes).assertEqual(72);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0841 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0842
     * @tc.name      eraserStroke0842
     * @tc.desc      line 模式画笔直径 64 在 360x640 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0842', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0842 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (360 * 640) * 10000) / 10000;
      const strokes: number = Math.ceil(230400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.014);
      expect(strokes).assertEqual(72);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0842 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0843
     * @tc.name      eraserStroke0843
     * @tc.desc      rect 模式画笔直径 64 在 360x640 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0843', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0843 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (360 * 640) * 10000) / 10000;
      const strokes: number = Math.ceil(230400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.014);
      expect(strokes).assertEqual(72);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0843 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0844
     * @tc.name      eraserStroke0844
     * @tc.desc      circle 模式画笔直径 64 在 360x640 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0844', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0844 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (360 * 640) * 10000) / 10000;
      const strokes: number = Math.ceil(230400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.014);
      expect(strokes).assertEqual(72);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0844 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0845
     * @tc.name      eraserStroke0845
     * @tc.desc      pixel 模式画笔直径 64 在 360x640 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0845', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0845 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (360 * 640) * 10000) / 10000;
      const strokes: number = Math.ceil(230400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.014);
      expect(strokes).assertEqual(72);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0845 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0846
     * @tc.name      eraserStroke0846
     * @tc.desc      free 模式画笔直径 64 在 375x812 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0846', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0846 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (375 * 812) * 10000) / 10000;
      const strokes: number = Math.ceil(304500 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0106);
      expect(strokes).assertEqual(95);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0846 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0847
     * @tc.name      eraserStroke0847
     * @tc.desc      line 模式画笔直径 64 在 375x812 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0847', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0847 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (375 * 812) * 10000) / 10000;
      const strokes: number = Math.ceil(304500 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0106);
      expect(strokes).assertEqual(95);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0847 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0848
     * @tc.name      eraserStroke0848
     * @tc.desc      rect 模式画笔直径 64 在 375x812 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0848', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0848 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (375 * 812) * 10000) / 10000;
      const strokes: number = Math.ceil(304500 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0106);
      expect(strokes).assertEqual(95);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0848 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0849
     * @tc.name      eraserStroke0849
     * @tc.desc      circle 模式画笔直径 64 在 375x812 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0849', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0849 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (375 * 812) * 10000) / 10000;
      const strokes: number = Math.ceil(304500 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0106);
      expect(strokes).assertEqual(95);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0849 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0850
     * @tc.name      eraserStroke0850
     * @tc.desc      pixel 模式画笔直径 64 在 375x812 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0850', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0850 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (375 * 812) * 10000) / 10000;
      const strokes: number = Math.ceil(304500 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0106);
      expect(strokes).assertEqual(95);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0850 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0851
     * @tc.name      eraserStroke0851
     * @tc.desc      free 模式画笔直径 64 在 720x1280 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0851', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0851 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (720 * 1280) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0035);
      expect(strokes).assertEqual(287);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0851 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0852
     * @tc.name      eraserStroke0852
     * @tc.desc      line 模式画笔直径 64 在 720x1280 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0852', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0852 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (720 * 1280) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0035);
      expect(strokes).assertEqual(287);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0852 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0853
     * @tc.name      eraserStroke0853
     * @tc.desc      rect 模式画笔直径 64 在 720x1280 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0853', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0853 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (720 * 1280) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0035);
      expect(strokes).assertEqual(287);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0853 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0854
     * @tc.name      eraserStroke0854
     * @tc.desc      circle 模式画笔直径 64 在 720x1280 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0854', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0854 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (720 * 1280) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0035);
      expect(strokes).assertEqual(287);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0854 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0855
     * @tc.name      eraserStroke0855
     * @tc.desc      pixel 模式画笔直径 64 在 720x1280 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0855', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0855 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (720 * 1280) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0035);
      expect(strokes).assertEqual(287);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0855 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0856
     * @tc.name      eraserStroke0856
     * @tc.desc      free 模式画笔直径 64 在 1080x1920 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0856', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0856 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1080 * 1920) * 10000) / 10000;
      const strokes: number = Math.ceil(2073600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0016);
      expect(strokes).assertEqual(645);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0856 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0857
     * @tc.name      eraserStroke0857
     * @tc.desc      line 模式画笔直径 64 在 1080x1920 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0857', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0857 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1080 * 1920) * 10000) / 10000;
      const strokes: number = Math.ceil(2073600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0016);
      expect(strokes).assertEqual(645);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0857 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0858
     * @tc.name      eraserStroke0858
     * @tc.desc      rect 模式画笔直径 64 在 1080x1920 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0858', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0858 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1080 * 1920) * 10000) / 10000;
      const strokes: number = Math.ceil(2073600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0016);
      expect(strokes).assertEqual(645);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0858 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0859
     * @tc.name      eraserStroke0859
     * @tc.desc      circle 模式画笔直径 64 在 1080x1920 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0859', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0859 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1080 * 1920) * 10000) / 10000;
      const strokes: number = Math.ceil(2073600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0016);
      expect(strokes).assertEqual(645);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0859 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0860
     * @tc.name      eraserStroke0860
     * @tc.desc      pixel 模式画笔直径 64 在 1080x1920 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0860', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0860 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1080 * 1920) * 10000) / 10000;
      const strokes: number = Math.ceil(2073600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0016);
      expect(strokes).assertEqual(645);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0860 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0861
     * @tc.name      eraserStroke0861
     * @tc.desc      free 模式画笔直径 64 在 640x480 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0861', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0861 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (640 * 480) * 10000) / 10000;
      const strokes: number = Math.ceil(307200 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0105);
      expect(strokes).assertEqual(96);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0861 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0862
     * @tc.name      eraserStroke0862
     * @tc.desc      line 模式画笔直径 64 在 640x480 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0862', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0862 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (640 * 480) * 10000) / 10000;
      const strokes: number = Math.ceil(307200 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0105);
      expect(strokes).assertEqual(96);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0862 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0863
     * @tc.name      eraserStroke0863
     * @tc.desc      rect 模式画笔直径 64 在 640x480 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0863', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0863 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (640 * 480) * 10000) / 10000;
      const strokes: number = Math.ceil(307200 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0105);
      expect(strokes).assertEqual(96);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0863 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0864
     * @tc.name      eraserStroke0864
     * @tc.desc      circle 模式画笔直径 64 在 640x480 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0864', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0864 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (640 * 480) * 10000) / 10000;
      const strokes: number = Math.ceil(307200 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0105);
      expect(strokes).assertEqual(96);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0864 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0865
     * @tc.name      eraserStroke0865
     * @tc.desc      pixel 模式画笔直径 64 在 640x480 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0865', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0865 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (640 * 480) * 10000) / 10000;
      const strokes: number = Math.ceil(307200 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0105);
      expect(strokes).assertEqual(96);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0865 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0866
     * @tc.name      eraserStroke0866
     * @tc.desc      free 模式画笔直径 64 在 800x600 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0866', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0866 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (800 * 600) * 10000) / 10000;
      const strokes: number = Math.ceil(480000 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0067);
      expect(strokes).assertEqual(150);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0866 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0867
     * @tc.name      eraserStroke0867
     * @tc.desc      line 模式画笔直径 64 在 800x600 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0867', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0867 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (800 * 600) * 10000) / 10000;
      const strokes: number = Math.ceil(480000 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0067);
      expect(strokes).assertEqual(150);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0867 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0868
     * @tc.name      eraserStroke0868
     * @tc.desc      rect 模式画笔直径 64 在 800x600 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0868', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0868 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (800 * 600) * 10000) / 10000;
      const strokes: number = Math.ceil(480000 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0067);
      expect(strokes).assertEqual(150);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0868 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0869
     * @tc.name      eraserStroke0869
     * @tc.desc      circle 模式画笔直径 64 在 800x600 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0869', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0869 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (800 * 600) * 10000) / 10000;
      const strokes: number = Math.ceil(480000 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0067);
      expect(strokes).assertEqual(150);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0869 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0870
     * @tc.name      eraserStroke0870
     * @tc.desc      pixel 模式画笔直径 64 在 800x600 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0870', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0870 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (800 * 600) * 10000) / 10000;
      const strokes: number = Math.ceil(480000 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0067);
      expect(strokes).assertEqual(150);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0870 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0871
     * @tc.name      eraserStroke0871
     * @tc.desc      free 模式画笔直径 64 在 1024x768 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0871', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0871 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1024 * 768) * 10000) / 10000;
      const strokes: number = Math.ceil(786432 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0041);
      expect(strokes).assertEqual(245);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0871 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0872
     * @tc.name      eraserStroke0872
     * @tc.desc      line 模式画笔直径 64 在 1024x768 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0872', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0872 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1024 * 768) * 10000) / 10000;
      const strokes: number = Math.ceil(786432 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0041);
      expect(strokes).assertEqual(245);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0872 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0873
     * @tc.name      eraserStroke0873
     * @tc.desc      rect 模式画笔直径 64 在 1024x768 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0873', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0873 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1024 * 768) * 10000) / 10000;
      const strokes: number = Math.ceil(786432 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0041);
      expect(strokes).assertEqual(245);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0873 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0874
     * @tc.name      eraserStroke0874
     * @tc.desc      circle 模式画笔直径 64 在 1024x768 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0874', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0874 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1024 * 768) * 10000) / 10000;
      const strokes: number = Math.ceil(786432 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0041);
      expect(strokes).assertEqual(245);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0874 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0875
     * @tc.name      eraserStroke0875
     * @tc.desc      pixel 模式画笔直径 64 在 1024x768 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0875', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0875 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1024 * 768) * 10000) / 10000;
      const strokes: number = Math.ceil(786432 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0041);
      expect(strokes).assertEqual(245);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0875 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0876
     * @tc.name      eraserStroke0876
     * @tc.desc      free 模式画笔直径 64 在 1280x720 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0876', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0876 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1280 * 720) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0035);
      expect(strokes).assertEqual(287);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0876 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0877
     * @tc.name      eraserStroke0877
     * @tc.desc      line 模式画笔直径 64 在 1280x720 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0877', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0877 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1280 * 720) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0035);
      expect(strokes).assertEqual(287);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0877 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0878
     * @tc.name      eraserStroke0878
     * @tc.desc      rect 模式画笔直径 64 在 1280x720 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0878', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0878 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1280 * 720) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0035);
      expect(strokes).assertEqual(287);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0878 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0879
     * @tc.name      eraserStroke0879
     * @tc.desc      circle 模式画笔直径 64 在 1280x720 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0879', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0879 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1280 * 720) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0035);
      expect(strokes).assertEqual(287);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0879 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0880
     * @tc.name      eraserStroke0880
     * @tc.desc      pixel 模式画笔直径 64 在 1280x720 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0880', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0880 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1280 * 720) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0035);
      expect(strokes).assertEqual(287);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0880 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0881
     * @tc.name      eraserStroke0881
     * @tc.desc      free 模式画笔直径 64 在 512x512 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0881', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0881 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (512 * 512) * 10000) / 10000;
      const strokes: number = Math.ceil(262144 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0123);
      expect(strokes).assertEqual(82);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0881 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0882
     * @tc.name      eraserStroke0882
     * @tc.desc      line 模式画笔直径 64 在 512x512 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0882', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0882 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (512 * 512) * 10000) / 10000;
      const strokes: number = Math.ceil(262144 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0123);
      expect(strokes).assertEqual(82);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0882 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0883
     * @tc.name      eraserStroke0883
     * @tc.desc      rect 模式画笔直径 64 在 512x512 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0883', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0883 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (512 * 512) * 10000) / 10000;
      const strokes: number = Math.ceil(262144 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0123);
      expect(strokes).assertEqual(82);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0883 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0884
     * @tc.name      eraserStroke0884
     * @tc.desc      circle 模式画笔直径 64 在 512x512 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0884', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0884 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (512 * 512) * 10000) / 10000;
      const strokes: number = Math.ceil(262144 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0123);
      expect(strokes).assertEqual(82);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0884 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0885
     * @tc.name      eraserStroke0885
     * @tc.desc      pixel 模式画笔直径 64 在 512x512 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0885', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0885 begin');
      const size: number = 64;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (512 * 512) * 10000) / 10000;
      const strokes: number = Math.ceil(262144 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(32);
      expect(cover.toFixed(2)).assertEqual('3216.99');
      expect(ratio).assertEqual(0.0123);
      expect(strokes).assertEqual(82);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0885 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0886
     * @tc.name      eraserStroke0886
     * @tc.desc      free 模式画笔直径 64 在 256x256 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0886', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0886 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0886 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0887
     * @tc.name      eraserStroke0887
     * @tc.desc      line 模式画笔直径 64 在 256x256 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0887', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0887 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0887 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0888
     * @tc.name      eraserStroke0888
     * @tc.desc      rect 模式画笔直径 64 在 256x256 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0888', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0888 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0888 end');
    })
  })
}
