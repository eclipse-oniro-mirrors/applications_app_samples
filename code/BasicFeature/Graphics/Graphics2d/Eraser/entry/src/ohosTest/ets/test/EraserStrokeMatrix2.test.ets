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

export default function eraserStrokeMatrix2Test(): void {
  describe('EraserStrokeMatrix2Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    ERASER_STROKE_0075
     * @tc.name      eraserStroke0075
     * @tc.desc      pixel 模式画笔直径 6 在 720x1280 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0075 begin');
      const size: number = 6;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (720 * 1280) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(3);
      expect(cover.toFixed(2)).assertEqual('28.27');
      expect(ratio).assertEqual(0);
      expect(strokes).assertEqual(32595);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0075 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0076
     * @tc.name      eraserStroke0076
     * @tc.desc      free 模式画笔直径 6 在 1080x1920 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0076 begin');
      const size: number = 6;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1080 * 1920) * 10000) / 10000;
      const strokes: number = Math.ceil(2073600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(3);
      expect(cover.toFixed(2)).assertEqual('28.27');
      expect(ratio).assertEqual(0);
      expect(strokes).assertEqual(73339);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0076 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0077
     * @tc.name      eraserStroke0077
     * @tc.desc      line 模式画笔直径 6 在 1080x1920 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0077 begin');
      const size: number = 6;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1080 * 1920) * 10000) / 10000;
      const strokes: number = Math.ceil(2073600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(3);
      expect(cover.toFixed(2)).assertEqual('28.27');
      expect(ratio).assertEqual(0);
      expect(strokes).assertEqual(73339);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0077 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0078
     * @tc.name      eraserStroke0078
     * @tc.desc      rect 模式画笔直径 6 在 1080x1920 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0078 begin');
      const size: number = 6;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1080 * 1920) * 10000) / 10000;
      const strokes: number = Math.ceil(2073600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(3);
      expect(cover.toFixed(2)).assertEqual('28.27');
      expect(ratio).assertEqual(0);
      expect(strokes).assertEqual(73339);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0078 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0079
     * @tc.name      eraserStroke0079
     * @tc.desc      circle 模式画笔直径 6 在 1080x1920 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0079 begin');
      const size: number = 6;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1080 * 1920) * 10000) / 10000;
      const strokes: number = Math.ceil(2073600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(3);
      expect(cover.toFixed(2)).assertEqual('28.27');
      expect(ratio).assertEqual(0);
      expect(strokes).assertEqual(73339);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0079 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0080
     * @tc.name      eraserStroke0080
     * @tc.desc      pixel 模式画笔直径 6 在 1080x1920 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0080 begin');
      const size: number = 6;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1080 * 1920) * 10000) / 10000;
      const strokes: number = Math.ceil(2073600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(3);
      expect(cover.toFixed(2)).assertEqual('28.27');
      expect(ratio).assertEqual(0);
      expect(strokes).assertEqual(73339);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0080 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0081
     * @tc.name      eraserStroke0081
     * @tc.desc      free 模式画笔直径 6 在 640x480 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0081 begin');
      const size: number = 6;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (640 * 480) * 10000) / 10000;
      const strokes: number = Math.ceil(307200 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(3);
      expect(cover.toFixed(2)).assertEqual('28.27');
      expect(ratio).assertEqual(0.0001);
      expect(strokes).assertEqual(10865);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0081 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0082
     * @tc.name      eraserStroke0082
     * @tc.desc      line 模式画笔直径 6 在 640x480 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0082 begin');
      const size: number = 6;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (640 * 480) * 10000) / 10000;
      const strokes: number = Math.ceil(307200 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(3);
      expect(cover.toFixed(2)).assertEqual('28.27');
      expect(ratio).assertEqual(0.0001);
      expect(strokes).assertEqual(10865);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0082 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0083
     * @tc.name      eraserStroke0083
     * @tc.desc      rect 模式画笔直径 6 在 640x480 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0083 begin');
      const size: number = 6;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (640 * 480) * 10000) / 10000;
      const strokes: number = Math.ceil(307200 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(3);
      expect(cover.toFixed(2)).assertEqual('28.27');
      expect(ratio).assertEqual(0.0001);
      expect(strokes).assertEqual(10865);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0083 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0084
     * @tc.name      eraserStroke0084
     * @tc.desc      circle 模式画笔直径 6 在 640x480 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0084 begin');
      const size: number = 6;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (640 * 480) * 10000) / 10000;
      const strokes: number = Math.ceil(307200 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(3);
      expect(cover.toFixed(2)).assertEqual('28.27');
      expect(ratio).assertEqual(0.0001);
      expect(strokes).assertEqual(10865);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0084 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0085
     * @tc.name      eraserStroke0085
     * @tc.desc      pixel 模式画笔直径 6 在 640x480 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0085 begin');
      const size: number = 6;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (640 * 480) * 10000) / 10000;
      const strokes: number = Math.ceil(307200 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(3);
      expect(cover.toFixed(2)).assertEqual('28.27');
      expect(ratio).assertEqual(0.0001);
      expect(strokes).assertEqual(10865);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0085 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0086
     * @tc.name      eraserStroke0086
     * @tc.desc      free 模式画笔直径 6 在 800x600 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0086 begin');
      const size: number = 6;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (800 * 600) * 10000) / 10000;
      const strokes: number = Math.ceil(480000 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(3);
      expect(cover.toFixed(2)).assertEqual('28.27');
      expect(ratio).assertEqual(0.0001);
      expect(strokes).assertEqual(16977);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0086 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0087
     * @tc.name      eraserStroke0087
     * @tc.desc      line 模式画笔直径 6 在 800x600 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0087 begin');
      const size: number = 6;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (800 * 600) * 10000) / 10000;
      const strokes: number = Math.ceil(480000 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(3);
      expect(cover.toFixed(2)).assertEqual('28.27');
      expect(ratio).assertEqual(0.0001);
      expect(strokes).assertEqual(16977);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0087 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0088
     * @tc.name      eraserStroke0088
     * @tc.desc      rect 模式画笔直径 6 在 800x600 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0088 begin');
      const size: number = 6;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (800 * 600) * 10000) / 10000;
      const strokes: number = Math.ceil(480000 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(3);
      expect(cover.toFixed(2)).assertEqual('28.27');
      expect(ratio).assertEqual(0.0001);
      expect(strokes).assertEqual(16977);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0088 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0089
     * @tc.name      eraserStroke0089
     * @tc.desc      circle 模式画笔直径 6 在 800x600 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0089 begin');
      const size: number = 6;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (800 * 600) * 10000) / 10000;
      const strokes: number = Math.ceil(480000 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(3);
      expect(cover.toFixed(2)).assertEqual('28.27');
      expect(ratio).assertEqual(0.0001);
      expect(strokes).assertEqual(16977);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0089 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0090
     * @tc.name      eraserStroke0090
     * @tc.desc      pixel 模式画笔直径 6 在 800x600 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0090 begin');
      const size: number = 6;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (800 * 600) * 10000) / 10000;
      const strokes: number = Math.ceil(480000 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(3);
      expect(cover.toFixed(2)).assertEqual('28.27');
      expect(ratio).assertEqual(0.0001);
      expect(strokes).assertEqual(16977);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0090 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0091
     * @tc.name      eraserStroke0091
     * @tc.desc      free 模式画笔直径 6 在 1024x768 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0091 begin');
      const size: number = 6;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1024 * 768) * 10000) / 10000;
      const strokes: number = Math.ceil(786432 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(3);
      expect(cover.toFixed(2)).assertEqual('28.27');
      expect(ratio).assertEqual(0);
      expect(strokes).assertEqual(27815);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0091 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0092
     * @tc.name      eraserStroke0092
     * @tc.desc      line 模式画笔直径 6 在 1024x768 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0092 begin');
      const size: number = 6;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1024 * 768) * 10000) / 10000;
      const strokes: number = Math.ceil(786432 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(3);
      expect(cover.toFixed(2)).assertEqual('28.27');
      expect(ratio).assertEqual(0);
      expect(strokes).assertEqual(27815);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0092 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0093
     * @tc.name      eraserStroke0093
     * @tc.desc      rect 模式画笔直径 6 在 1024x768 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0093 begin');
      const size: number = 6;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1024 * 768) * 10000) / 10000;
      const strokes: number = Math.ceil(786432 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(3);
      expect(cover.toFixed(2)).assertEqual('28.27');
      expect(ratio).assertEqual(0);
      expect(strokes).assertEqual(27815);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0093 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0094
     * @tc.name      eraserStroke0094
     * @tc.desc      circle 模式画笔直径 6 在 1024x768 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0094 begin');
      const size: number = 6;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1024 * 768) * 10000) / 10000;
      const strokes: number = Math.ceil(786432 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(3);
      expect(cover.toFixed(2)).assertEqual('28.27');
      expect(ratio).assertEqual(0);
      expect(strokes).assertEqual(27815);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0094 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0095
     * @tc.name      eraserStroke0095
     * @tc.desc      pixel 模式画笔直径 6 在 1024x768 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0095 begin');
      const size: number = 6;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1024 * 768) * 10000) / 10000;
      const strokes: number = Math.ceil(786432 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(3);
      expect(cover.toFixed(2)).assertEqual('28.27');
      expect(ratio).assertEqual(0);
      expect(strokes).assertEqual(27815);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0095 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0096
     * @tc.name      eraserStroke0096
     * @tc.desc      free 模式画笔直径 6 在 1280x720 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0096 begin');
      const size: number = 6;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1280 * 720) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(3);
      expect(cover.toFixed(2)).assertEqual('28.27');
      expect(ratio).assertEqual(0);
      expect(strokes).assertEqual(32595);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0096 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0097
     * @tc.name      eraserStroke0097
     * @tc.desc      line 模式画笔直径 6 在 1280x720 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0097 begin');
      const size: number = 6;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1280 * 720) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(3);
      expect(cover.toFixed(2)).assertEqual('28.27');
      expect(ratio).assertEqual(0);
      expect(strokes).assertEqual(32595);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0097 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0098
     * @tc.name      eraserStroke0098
     * @tc.desc      rect 模式画笔直径 6 在 1280x720 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0098 begin');
      const size: number = 6;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1280 * 720) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(3);
      expect(cover.toFixed(2)).assertEqual('28.27');
      expect(ratio).assertEqual(0);
      expect(strokes).assertEqual(32595);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0098 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0099
     * @tc.name      eraserStroke0099
     * @tc.desc      circle 模式画笔直径 6 在 1280x720 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0099 begin');
      const size: number = 6;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1280 * 720) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(3);
      expect(cover.toFixed(2)).assertEqual('28.27');
      expect(ratio).assertEqual(0);
      expect(strokes).assertEqual(32595);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0099 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0100
     * @tc.name      eraserStroke0100
     * @tc.desc      pixel 模式画笔直径 6 在 1280x720 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0100 begin');
      const size: number = 6;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1280 * 720) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(3);
      expect(cover.toFixed(2)).assertEqual('28.27');
      expect(ratio).assertEqual(0);
      expect(strokes).assertEqual(32595);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0100 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0101
     * @tc.name      eraserStroke0101
     * @tc.desc      free 模式画笔直径 6 在 512x512 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0101 begin');
      const size: number = 6;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (512 * 512) * 10000) / 10000;
      const strokes: number = Math.ceil(262144 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(3);
      expect(cover.toFixed(2)).assertEqual('28.27');
      expect(ratio).assertEqual(0.0001);
      expect(strokes).assertEqual(9272);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0101 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0102
     * @tc.name      eraserStroke0102
     * @tc.desc      line 模式画笔直径 6 在 512x512 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0102 begin');
      const size: number = 6;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (512 * 512) * 10000) / 10000;
      const strokes: number = Math.ceil(262144 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(3);
      expect(cover.toFixed(2)).assertEqual('28.27');
      expect(ratio).assertEqual(0.0001);
      expect(strokes).assertEqual(9272);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0102 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0103
     * @tc.name      eraserStroke0103
     * @tc.desc      rect 模式画笔直径 6 在 512x512 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0103 begin');
      const size: number = 6;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (512 * 512) * 10000) / 10000;
      const strokes: number = Math.ceil(262144 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(3);
      expect(cover.toFixed(2)).assertEqual('28.27');
      expect(ratio).assertEqual(0.0001);
      expect(strokes).assertEqual(9272);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0103 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0104
     * @tc.name      eraserStroke0104
     * @tc.desc      circle 模式画笔直径 6 在 512x512 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0104 begin');
      const size: number = 6;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (512 * 512) * 10000) / 10000;
      const strokes: number = Math.ceil(262144 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(3);
      expect(cover.toFixed(2)).assertEqual('28.27');
      expect(ratio).assertEqual(0.0001);
      expect(strokes).assertEqual(9272);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0104 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0105
     * @tc.name      eraserStroke0105
     * @tc.desc      pixel 模式画笔直径 6 在 512x512 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0105 begin');
      const size: number = 6;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (512 * 512) * 10000) / 10000;
      const strokes: number = Math.ceil(262144 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(3);
      expect(cover.toFixed(2)).assertEqual('28.27');
      expect(ratio).assertEqual(0.0001);
      expect(strokes).assertEqual(9272);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0105 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0106
     * @tc.name      eraserStroke0106
     * @tc.desc      free 模式画笔直径 6 在 256x256 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0106 begin');
      const size: number = 6;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (256 * 256) * 10000) / 10000;
      const strokes: number = Math.ceil(65536 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(3);
      expect(cover.toFixed(2)).assertEqual('28.27');
      expect(ratio).assertEqual(0.0004);
      expect(strokes).assertEqual(2318);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0106 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0107
     * @tc.name      eraserStroke0107
     * @tc.desc      line 模式画笔直径 6 在 256x256 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0107 begin');
      const size: number = 6;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (256 * 256) * 10000) / 10000;
      const strokes: number = Math.ceil(65536 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(3);
      expect(cover.toFixed(2)).assertEqual('28.27');
      expect(ratio).assertEqual(0.0004);
      expect(strokes).assertEqual(2318);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0107 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0108
     * @tc.name      eraserStroke0108
     * @tc.desc      rect 模式画笔直径 6 在 256x256 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0108 begin');
      const size: number = 6;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (256 * 256) * 10000) / 10000;
      const strokes: number = Math.ceil(65536 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(3);
      expect(cover.toFixed(2)).assertEqual('28.27');
      expect(ratio).assertEqual(0.0004);
      expect(strokes).assertEqual(2318);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0108 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0109
     * @tc.name      eraserStroke0109
     * @tc.desc      circle 模式画笔直径 6 在 256x256 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0109 begin');
      const size: number = 6;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (256 * 256) * 10000) / 10000;
      const strokes: number = Math.ceil(65536 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(3);
      expect(cover.toFixed(2)).assertEqual('28.27');
      expect(ratio).assertEqual(0.0004);
      expect(strokes).assertEqual(2318);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0109 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0110
     * @tc.name      eraserStroke0110
     * @tc.desc      pixel 模式画笔直径 6 在 256x256 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0110 begin');
      const size: number = 6;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (256 * 256) * 10000) / 10000;
      const strokes: number = Math.ceil(65536 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(3);
      expect(cover.toFixed(2)).assertEqual('28.27');
      expect(ratio).assertEqual(0.0004);
      expect(strokes).assertEqual(2318);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0110 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0111
     * @tc.name      eraserStroke0111
     * @tc.desc      free 模式画笔直径 6 在 1440x2560 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0111 begin');
      const size: number = 6;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1440 * 2560) * 10000) / 10000;
      const strokes: number = Math.ceil(3686400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(3);
      expect(cover.toFixed(2)).assertEqual('28.27');
      expect(ratio).assertEqual(0);
      expect(strokes).assertEqual(130380);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0111 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0112
     * @tc.name      eraserStroke0112
     * @tc.desc      line 模式画笔直径 6 在 1440x2560 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0112 begin');
      const size: number = 6;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1440 * 2560) * 10000) / 10000;
      const strokes: number = Math.ceil(3686400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(3);
      expect(cover.toFixed(2)).assertEqual('28.27');
      expect(ratio).assertEqual(0);
      expect(strokes).assertEqual(130380);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0112 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0113
     * @tc.name      eraserStroke0113
     * @tc.desc      rect 模式画笔直径 6 在 1440x2560 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0113 begin');
      const size: number = 6;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1440 * 2560) * 10000) / 10000;
      const strokes: number = Math.ceil(3686400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(3);
      expect(cover.toFixed(2)).assertEqual('28.27');
      expect(ratio).assertEqual(0);
      expect(strokes).assertEqual(130380);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0113 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0114
     * @tc.name      eraserStroke0114
     * @tc.desc      circle 模式画笔直径 6 在 1440x2560 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0114 begin');
      const size: number = 6;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1440 * 2560) * 10000) / 10000;
      const strokes: number = Math.ceil(3686400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(3);
      expect(cover.toFixed(2)).assertEqual('28.27');
      expect(ratio).assertEqual(0);
      expect(strokes).assertEqual(130380);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0114 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0115
     * @tc.name      eraserStroke0115
     * @tc.desc      pixel 模式画笔直径 6 在 1440x2560 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0115 begin');
      const size: number = 6;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1440 * 2560) * 10000) / 10000;
      const strokes: number = Math.ceil(3686400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(3);
      expect(cover.toFixed(2)).assertEqual('28.27');
      expect(ratio).assertEqual(0);
      expect(strokes).assertEqual(130380);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0115 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0116
     * @tc.name      eraserStroke0116
     * @tc.desc      free 模式画笔直径 6 在 320x240 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0116 begin');
      const size: number = 6;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (320 * 240) * 10000) / 10000;
      const strokes: number = Math.ceil(76800 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(3);
      expect(cover.toFixed(2)).assertEqual('28.27');
      expect(ratio).assertEqual(0.0004);
      expect(strokes).assertEqual(2717);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0116 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0117
     * @tc.name      eraserStroke0117
     * @tc.desc      line 模式画笔直径 6 在 320x240 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0117 begin');
      const size: number = 6;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (320 * 240) * 10000) / 10000;
      const strokes: number = Math.ceil(76800 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(3);
      expect(cover.toFixed(2)).assertEqual('28.27');
      expect(ratio).assertEqual(0.0004);
      expect(strokes).assertEqual(2717);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0117 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0118
     * @tc.name      eraserStroke0118
     * @tc.desc      rect 模式画笔直径 6 在 320x240 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0118 begin');
      const size: number = 6;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (320 * 240) * 10000) / 10000;
      const strokes: number = Math.ceil(76800 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(3);
      expect(cover.toFixed(2)).assertEqual('28.27');
      expect(ratio).assertEqual(0.0004);
      expect(strokes).assertEqual(2717);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0118 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0119
     * @tc.name      eraserStroke0119
     * @tc.desc      circle 模式画笔直径 6 在 320x240 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0119 begin');
      const size: number = 6;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (320 * 240) * 10000) / 10000;
      const strokes: number = Math.ceil(76800 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(3);
      expect(cover.toFixed(2)).assertEqual('28.27');
      expect(ratio).assertEqual(0.0004);
      expect(strokes).assertEqual(2717);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0119 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0120
     * @tc.name      eraserStroke0120
     * @tc.desc      pixel 模式画笔直径 6 在 320x240 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0120 begin');
      const size: number = 6;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (320 * 240) * 10000) / 10000;
      const strokes: number = Math.ceil(76800 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(3);
      expect(cover.toFixed(2)).assertEqual('28.27');
      expect(ratio).assertEqual(0.0004);
      expect(strokes).assertEqual(2717);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0120 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0121
     * @tc.name      eraserStroke0121
     * @tc.desc      free 模式画笔直径 8 在 360x640 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0121 begin');
      const size: number = 8;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (360 * 640) * 10000) / 10000;
      const strokes: number = Math.ceil(230400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(4);
      expect(cover.toFixed(2)).assertEqual('50.27');
      expect(ratio).assertEqual(0.0002);
      expect(strokes).assertEqual(4584);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0121 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0122
     * @tc.name      eraserStroke0122
     * @tc.desc      line 模式画笔直径 8 在 360x640 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0122 begin');
      const size: number = 8;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (360 * 640) * 10000) / 10000;
      const strokes: number = Math.ceil(230400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(4);
      expect(cover.toFixed(2)).assertEqual('50.27');
      expect(ratio).assertEqual(0.0002);
      expect(strokes).assertEqual(4584);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0122 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0123
     * @tc.name      eraserStroke0123
     * @tc.desc      rect 模式画笔直径 8 在 360x640 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0123 begin');
      const size: number = 8;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (360 * 640) * 10000) / 10000;
      const strokes: number = Math.ceil(230400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(4);
      expect(cover.toFixed(2)).assertEqual('50.27');
      expect(ratio).assertEqual(0.0002);
      expect(strokes).assertEqual(4584);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0123 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0124
     * @tc.name      eraserStroke0124
     * @tc.desc      circle 模式画笔直径 8 在 360x640 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0124 begin');
      const size: number = 8;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (360 * 640) * 10000) / 10000;
      const strokes: number = Math.ceil(230400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(4);
      expect(cover.toFixed(2)).assertEqual('50.27');
      expect(ratio).assertEqual(0.0002);
      expect(strokes).assertEqual(4584);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0124 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0125
     * @tc.name      eraserStroke0125
     * @tc.desc      pixel 模式画笔直径 8 在 360x640 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0125 begin');
      const size: number = 8;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (360 * 640) * 10000) / 10000;
      const strokes: number = Math.ceil(230400 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(4);
      expect(cover.toFixed(2)).assertEqual('50.27');
      expect(ratio).assertEqual(0.0002);
      expect(strokes).assertEqual(4584);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0125 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0126
     * @tc.name      eraserStroke0126
     * @tc.desc      free 模式画笔直径 8 在 375x812 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0126 begin');
      const size: number = 8;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (375 * 812) * 10000) / 10000;
      const strokes: number = Math.ceil(304500 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(4);
      expect(cover.toFixed(2)).assertEqual('50.27');
      expect(ratio).assertEqual(0.0002);
      expect(strokes).assertEqual(6058);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0126 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0127
     * @tc.name      eraserStroke0127
     * @tc.desc      line 模式画笔直径 8 在 375x812 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0127 begin');
      const size: number = 8;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (375 * 812) * 10000) / 10000;
      const strokes: number = Math.ceil(304500 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(4);
      expect(cover.toFixed(2)).assertEqual('50.27');
      expect(ratio).assertEqual(0.0002);
      expect(strokes).assertEqual(6058);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0127 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0128
     * @tc.name      eraserStroke0128
     * @tc.desc      rect 模式画笔直径 8 在 375x812 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0128 begin');
      const size: number = 8;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (375 * 812) * 10000) / 10000;
      const strokes: number = Math.ceil(304500 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(4);
      expect(cover.toFixed(2)).assertEqual('50.27');
      expect(ratio).assertEqual(0.0002);
      expect(strokes).assertEqual(6058);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0128 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0129
     * @tc.name      eraserStroke0129
     * @tc.desc      circle 模式画笔直径 8 在 375x812 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0129 begin');
      const size: number = 8;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (375 * 812) * 10000) / 10000;
      const strokes: number = Math.ceil(304500 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(4);
      expect(cover.toFixed(2)).assertEqual('50.27');
      expect(ratio).assertEqual(0.0002);
      expect(strokes).assertEqual(6058);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0129 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0130
     * @tc.name      eraserStroke0130
     * @tc.desc      pixel 模式画笔直径 8 在 375x812 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0130 begin');
      const size: number = 8;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (375 * 812) * 10000) / 10000;
      const strokes: number = Math.ceil(304500 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(4);
      expect(cover.toFixed(2)).assertEqual('50.27');
      expect(ratio).assertEqual(0.0002);
      expect(strokes).assertEqual(6058);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0130 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0131
     * @tc.name      eraserStroke0131
     * @tc.desc      free 模式画笔直径 8 在 720x1280 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0131 begin');
      const size: number = 8;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (720 * 1280) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(4);
      expect(cover.toFixed(2)).assertEqual('50.27');
      expect(ratio).assertEqual(0.0001);
      expect(strokes).assertEqual(18335);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0131 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0132
     * @tc.name      eraserStroke0132
     * @tc.desc      line 模式画笔直径 8 在 720x1280 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0132 begin');
      const size: number = 8;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (720 * 1280) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(4);
      expect(cover.toFixed(2)).assertEqual('50.27');
      expect(ratio).assertEqual(0.0001);
      expect(strokes).assertEqual(18335);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0132 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0133
     * @tc.name      eraserStroke0133
     * @tc.desc      rect 模式画笔直径 8 在 720x1280 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0133 begin');
      const size: number = 8;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (720 * 1280) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(4);
      expect(cover.toFixed(2)).assertEqual('50.27');
      expect(ratio).assertEqual(0.0001);
      expect(strokes).assertEqual(18335);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0133 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0134
     * @tc.name      eraserStroke0134
     * @tc.desc      circle 模式画笔直径 8 在 720x1280 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0134 begin');
      const size: number = 8;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (720 * 1280) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(4);
      expect(cover.toFixed(2)).assertEqual('50.27');
      expect(ratio).assertEqual(0.0001);
      expect(strokes).assertEqual(18335);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0134 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0135
     * @tc.name      eraserStroke0135
     * @tc.desc      pixel 模式画笔直径 8 在 720x1280 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0135 begin');
      const size: number = 8;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (720 * 1280) * 10000) / 10000;
      const strokes: number = Math.ceil(921600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(4);
      expect(cover.toFixed(2)).assertEqual('50.27');
      expect(ratio).assertEqual(0.0001);
      expect(strokes).assertEqual(18335);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0135 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0136
     * @tc.name      eraserStroke0136
     * @tc.desc      free 模式画笔直径 8 在 1080x1920 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0136 begin');
      const size: number = 8;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1080 * 1920) * 10000) / 10000;
      const strokes: number = Math.ceil(2073600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(4);
      expect(cover.toFixed(2)).assertEqual('50.27');
      expect(ratio).assertEqual(0);
      expect(strokes).assertEqual(41253);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0136 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0137
     * @tc.name      eraserStroke0137
     * @tc.desc      line 模式画笔直径 8 在 1080x1920 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0137 begin');
      const size: number = 8;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1080 * 1920) * 10000) / 10000;
      const strokes: number = Math.ceil(2073600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(4);
      expect(cover.toFixed(2)).assertEqual('50.27');
      expect(ratio).assertEqual(0);
      expect(strokes).assertEqual(41253);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0137 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0138
     * @tc.name      eraserStroke0138
     * @tc.desc      rect 模式画笔直径 8 在 1080x1920 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0138 begin');
      const size: number = 8;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1080 * 1920) * 10000) / 10000;
      const strokes: number = Math.ceil(2073600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(4);
      expect(cover.toFixed(2)).assertEqual('50.27');
      expect(ratio).assertEqual(0);
      expect(strokes).assertEqual(41253);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0138 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0139
     * @tc.name      eraserStroke0139
     * @tc.desc      circle 模式画笔直径 8 在 1080x1920 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0139 begin');
      const size: number = 8;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1080 * 1920) * 10000) / 10000;
      const strokes: number = Math.ceil(2073600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(4);
      expect(cover.toFixed(2)).assertEqual('50.27');
      expect(ratio).assertEqual(0);
      expect(strokes).assertEqual(41253);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0139 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0140
     * @tc.name      eraserStroke0140
     * @tc.desc      pixel 模式画笔直径 8 在 1080x1920 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0140 begin');
      const size: number = 8;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (1080 * 1920) * 10000) / 10000;
      const strokes: number = Math.ceil(2073600 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(4);
      expect(cover.toFixed(2)).assertEqual('50.27');
      expect(ratio).assertEqual(0);
      expect(strokes).assertEqual(41253);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0140 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0141
     * @tc.name      eraserStroke0141
     * @tc.desc      free 模式画笔直径 8 在 640x480 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0141 begin');
      const size: number = 8;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (640 * 480) * 10000) / 10000;
      const strokes: number = Math.ceil(307200 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(4);
      expect(cover.toFixed(2)).assertEqual('50.27');
      expect(ratio).assertEqual(0.0002);
      expect(strokes).assertEqual(6112);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0141 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0142
     * @tc.name      eraserStroke0142
     * @tc.desc      line 模式画笔直径 8 在 640x480 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0142 begin');
      const size: number = 8;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (640 * 480) * 10000) / 10000;
      const strokes: number = Math.ceil(307200 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(4);
      expect(cover.toFixed(2)).assertEqual('50.27');
      expect(ratio).assertEqual(0.0002);
      expect(strokes).assertEqual(6112);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0142 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0143
     * @tc.name      eraserStroke0143
     * @tc.desc      rect 模式画笔直径 8 在 640x480 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0143 begin');
      const size: number = 8;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (640 * 480) * 10000) / 10000;
      const strokes: number = Math.ceil(307200 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(4);
      expect(cover.toFixed(2)).assertEqual('50.27');
      expect(ratio).assertEqual(0.0002);
      expect(strokes).assertEqual(6112);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0143 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0144
     * @tc.name      eraserStroke0144
     * @tc.desc      circle 模式画笔直径 8 在 640x480 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0144 begin');
      const size: number = 8;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (640 * 480) * 10000) / 10000;
      const strokes: number = Math.ceil(307200 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(4);
      expect(cover.toFixed(2)).assertEqual('50.27');
      expect(ratio).assertEqual(0.0002);
      expect(strokes).assertEqual(6112);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0144 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0145
     * @tc.name      eraserStroke0145
     * @tc.desc      pixel 模式画笔直径 8 在 640x480 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0145 begin');
      const size: number = 8;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (640 * 480) * 10000) / 10000;
      const strokes: number = Math.ceil(307200 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(4);
      expect(cover.toFixed(2)).assertEqual('50.27');
      expect(ratio).assertEqual(0.0002);
      expect(strokes).assertEqual(6112);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0145 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0146
     * @tc.name      eraserStroke0146
     * @tc.desc      free 模式画笔直径 8 在 800x600 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0146 begin');
      const size: number = 8;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (800 * 600) * 10000) / 10000;
      const strokes: number = Math.ceil(480000 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(4);
      expect(cover.toFixed(2)).assertEqual('50.27');
      expect(ratio).assertEqual(0.0001);
      expect(strokes).assertEqual(9550);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0146 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0147
     * @tc.name      eraserStroke0147
     * @tc.desc      line 模式画笔直径 8 在 800x600 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0147 begin');
      const size: number = 8;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (800 * 600) * 10000) / 10000;
      const strokes: number = Math.ceil(480000 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(4);
      expect(cover.toFixed(2)).assertEqual('50.27');
      expect(ratio).assertEqual(0.0001);
      expect(strokes).assertEqual(9550);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0147 end');
    })

    /**
     * @tc.number    ERASER_STROKE_0148
     * @tc.name      eraserStroke0148
     * @tc.desc      rect 模式画笔直径 8 在 800x600 画布的覆盖率推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserStroke0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0148 begin');
      const size: number = 8;
      const radius: number = size / 2;
      const cover: number = Math.PI * radius * radius;
      const ratio: number = Math.round(cover / (800 * 600) * 10000) / 10000;
      const strokes: number = Math.ceil(480000 / cover);
      hilog.info(DOMAIN, TAG, '%{public}s', 'cover=' + cover.toFixed(2) + ' strokes=' + strokes);
      expect(radius).assertEqual(4);
      expect(cover.toFixed(2)).assertEqual('50.27');
      expect(ratio).assertEqual(0.0001);
      expect(strokes).assertEqual(9550);
      expect(strokes >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserStroke0148 end');
    })
  })
}
