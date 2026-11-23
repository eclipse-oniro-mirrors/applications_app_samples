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

export default function eraserCanvasMatrix5Test(): void {
  describe('EraserCanvasMatrix5Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    ERASER_CANVAS_0309
     * @tc.name      eraserCanvas0309
     * @tc.desc      720x512 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0309 begin');
      const width: number = 720;
      const height: number = 512;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(240);
      expect(scaledHeight).assertEqual(171);
      expect(offsetX).assertEqual(240);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0309 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0310
     * @tc.name      eraserCanvas0310
     * @tc.desc      720x512 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0310 begin');
      const width: number = 720;
      const height: number = 512;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(180);
      expect(scaledHeight).assertEqual(128);
      expect(offsetX).assertEqual(270);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0310 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0311
     * @tc.name      eraserCanvas0311
     * @tc.desc      720x512 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0311 begin');
      const width: number = 720;
      const height: number = 512;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(120);
      expect(scaledHeight).assertEqual(85);
      expect(offsetX).assertEqual(300);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0311 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0312
     * @tc.name      eraserCanvas0312
     * @tc.desc      720x512 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0312 begin');
      const width: number = 720;
      const height: number = 512;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(90);
      expect(scaledHeight).assertEqual(64);
      expect(offsetX).assertEqual(315);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0312 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0313
     * @tc.name      eraserCanvas0313
     * @tc.desc      720x600 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0313 begin');
      const width: number = 720;
      const height: number = 600;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(720);
      expect(scaledHeight).assertEqual(600);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0313 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0314
     * @tc.name      eraserCanvas0314
     * @tc.desc      720x600 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0314 begin');
      const width: number = 720;
      const height: number = 600;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(360);
      expect(scaledHeight).assertEqual(300);
      expect(offsetX).assertEqual(180);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0314 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0315
     * @tc.name      eraserCanvas0315
     * @tc.desc      720x600 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0315 begin');
      const width: number = 720;
      const height: number = 600;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(240);
      expect(scaledHeight).assertEqual(200);
      expect(offsetX).assertEqual(240);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0315 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0316
     * @tc.name      eraserCanvas0316
     * @tc.desc      720x600 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0316 begin');
      const width: number = 720;
      const height: number = 600;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(180);
      expect(scaledHeight).assertEqual(150);
      expect(offsetX).assertEqual(270);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0316 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0317
     * @tc.name      eraserCanvas0317
     * @tc.desc      720x600 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0317 begin');
      const width: number = 720;
      const height: number = 600;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(120);
      expect(scaledHeight).assertEqual(100);
      expect(offsetX).assertEqual(300);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0317 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0318
     * @tc.name      eraserCanvas0318
     * @tc.desc      720x600 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0318 begin');
      const width: number = 720;
      const height: number = 600;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(90);
      expect(scaledHeight).assertEqual(75);
      expect(offsetX).assertEqual(315);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0318 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0319
     * @tc.name      eraserCanvas0319
     * @tc.desc      720x640 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0319 begin');
      const width: number = 720;
      const height: number = 640;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(720);
      expect(scaledHeight).assertEqual(640);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0319 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0320
     * @tc.name      eraserCanvas0320
     * @tc.desc      720x640 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0320 begin');
      const width: number = 720;
      const height: number = 640;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(360);
      expect(scaledHeight).assertEqual(320);
      expect(offsetX).assertEqual(180);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0320 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0321
     * @tc.name      eraserCanvas0321
     * @tc.desc      720x640 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0321 begin');
      const width: number = 720;
      const height: number = 640;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(240);
      expect(scaledHeight).assertEqual(213);
      expect(offsetX).assertEqual(240);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0321 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0322
     * @tc.name      eraserCanvas0322
     * @tc.desc      720x640 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0322 begin');
      const width: number = 720;
      const height: number = 640;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(180);
      expect(scaledHeight).assertEqual(160);
      expect(offsetX).assertEqual(270);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0322 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0323
     * @tc.name      eraserCanvas0323
     * @tc.desc      720x640 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0323 begin');
      const width: number = 720;
      const height: number = 640;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(120);
      expect(scaledHeight).assertEqual(107);
      expect(offsetX).assertEqual(300);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0323 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0324
     * @tc.name      eraserCanvas0324
     * @tc.desc      720x640 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0324 begin');
      const width: number = 720;
      const height: number = 640;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(90);
      expect(scaledHeight).assertEqual(80);
      expect(offsetX).assertEqual(315);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0324 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0325
     * @tc.name      eraserCanvas0325
     * @tc.desc      720x720 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0325 begin');
      const width: number = 720;
      const height: number = 720;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(720);
      expect(scaledHeight).assertEqual(720);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0325 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0326
     * @tc.name      eraserCanvas0326
     * @tc.desc      720x720 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0326 begin');
      const width: number = 720;
      const height: number = 720;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(360);
      expect(scaledHeight).assertEqual(360);
      expect(offsetX).assertEqual(180);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0326 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0327
     * @tc.name      eraserCanvas0327
     * @tc.desc      720x720 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0327 begin');
      const width: number = 720;
      const height: number = 720;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(240);
      expect(scaledHeight).assertEqual(240);
      expect(offsetX).assertEqual(240);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0327 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0328
     * @tc.name      eraserCanvas0328
     * @tc.desc      720x720 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0328 begin');
      const width: number = 720;
      const height: number = 720;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(180);
      expect(scaledHeight).assertEqual(180);
      expect(offsetX).assertEqual(270);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0328 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0329
     * @tc.name      eraserCanvas0329
     * @tc.desc      720x720 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0329 begin');
      const width: number = 720;
      const height: number = 720;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(120);
      expect(scaledHeight).assertEqual(120);
      expect(offsetX).assertEqual(300);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0329 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0330
     * @tc.name      eraserCanvas0330
     * @tc.desc      720x720 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0330 begin');
      const width: number = 720;
      const height: number = 720;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(90);
      expect(scaledHeight).assertEqual(90);
      expect(offsetX).assertEqual(315);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0330 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0331
     * @tc.name      eraserCanvas0331
     * @tc.desc      720x768 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0331 begin');
      const width: number = 720;
      const height: number = 768;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(720);
      expect(scaledHeight).assertEqual(768);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0331 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0332
     * @tc.name      eraserCanvas0332
     * @tc.desc      720x768 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0332 begin');
      const width: number = 720;
      const height: number = 768;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(360);
      expect(scaledHeight).assertEqual(384);
      expect(offsetX).assertEqual(180);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0332 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0333
     * @tc.name      eraserCanvas0333
     * @tc.desc      720x768 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0333 begin');
      const width: number = 720;
      const height: number = 768;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(240);
      expect(scaledHeight).assertEqual(256);
      expect(offsetX).assertEqual(240);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0333 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0334
     * @tc.name      eraserCanvas0334
     * @tc.desc      720x768 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0334 begin');
      const width: number = 720;
      const height: number = 768;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(180);
      expect(scaledHeight).assertEqual(192);
      expect(offsetX).assertEqual(270);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0334 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0335
     * @tc.name      eraserCanvas0335
     * @tc.desc      720x768 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0335 begin');
      const width: number = 720;
      const height: number = 768;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(120);
      expect(scaledHeight).assertEqual(128);
      expect(offsetX).assertEqual(300);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0335 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0336
     * @tc.name      eraserCanvas0336
     * @tc.desc      720x768 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0336 begin');
      const width: number = 720;
      const height: number = 768;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(90);
      expect(scaledHeight).assertEqual(96);
      expect(offsetX).assertEqual(315);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0336 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0337
     * @tc.name      eraserCanvas0337
     * @tc.desc      720x812 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0337 begin');
      const width: number = 720;
      const height: number = 812;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(720);
      expect(scaledHeight).assertEqual(812);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0337 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0338
     * @tc.name      eraserCanvas0338
     * @tc.desc      720x812 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0338 begin');
      const width: number = 720;
      const height: number = 812;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(360);
      expect(scaledHeight).assertEqual(406);
      expect(offsetX).assertEqual(180);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0338 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0339
     * @tc.name      eraserCanvas0339
     * @tc.desc      720x812 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0339 begin');
      const width: number = 720;
      const height: number = 812;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(240);
      expect(scaledHeight).assertEqual(271);
      expect(offsetX).assertEqual(240);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0339 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0340
     * @tc.name      eraserCanvas0340
     * @tc.desc      720x812 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0340 begin');
      const width: number = 720;
      const height: number = 812;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(180);
      expect(scaledHeight).assertEqual(203);
      expect(offsetX).assertEqual(270);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0340 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0341
     * @tc.name      eraserCanvas0341
     * @tc.desc      720x812 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0341', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0341 begin');
      const width: number = 720;
      const height: number = 812;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(120);
      expect(scaledHeight).assertEqual(135);
      expect(offsetX).assertEqual(300);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0341 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0342
     * @tc.name      eraserCanvas0342
     * @tc.desc      720x812 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0342', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0342 begin');
      const width: number = 720;
      const height: number = 812;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(90);
      expect(scaledHeight).assertEqual(102);
      expect(offsetX).assertEqual(315);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0342 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0343
     * @tc.name      eraserCanvas0343
     * @tc.desc      720x1080 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0343', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0343 begin');
      const width: number = 720;
      const height: number = 1080;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(720);
      expect(scaledHeight).assertEqual(1080);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0343 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0344
     * @tc.name      eraserCanvas0344
     * @tc.desc      720x1080 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0344', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0344 begin');
      const width: number = 720;
      const height: number = 1080;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(360);
      expect(scaledHeight).assertEqual(540);
      expect(offsetX).assertEqual(180);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0344 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0345
     * @tc.name      eraserCanvas0345
     * @tc.desc      720x1080 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0345', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0345 begin');
      const width: number = 720;
      const height: number = 1080;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(240);
      expect(scaledHeight).assertEqual(360);
      expect(offsetX).assertEqual(240);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0345 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0346
     * @tc.name      eraserCanvas0346
     * @tc.desc      720x1080 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0346', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0346 begin');
      const width: number = 720;
      const height: number = 1080;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(180);
      expect(scaledHeight).assertEqual(270);
      expect(offsetX).assertEqual(270);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0346 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0347
     * @tc.name      eraserCanvas0347
     * @tc.desc      720x1080 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0347', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0347 begin');
      const width: number = 720;
      const height: number = 1080;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(120);
      expect(scaledHeight).assertEqual(180);
      expect(offsetX).assertEqual(300);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0347 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0348
     * @tc.name      eraserCanvas0348
     * @tc.desc      720x1080 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0348', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0348 begin');
      const width: number = 720;
      const height: number = 1080;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(90);
      expect(scaledHeight).assertEqual(135);
      expect(offsetX).assertEqual(315);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0348 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0349
     * @tc.name      eraserCanvas0349
     * @tc.desc      720x1280 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0349', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0349 begin');
      const width: number = 720;
      const height: number = 1280;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(720);
      expect(scaledHeight).assertEqual(1280);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0349 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0350
     * @tc.name      eraserCanvas0350
     * @tc.desc      720x1280 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0350', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0350 begin');
      const width: number = 720;
      const height: number = 1280;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(360);
      expect(scaledHeight).assertEqual(640);
      expect(offsetX).assertEqual(180);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0350 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0351
     * @tc.name      eraserCanvas0351
     * @tc.desc      720x1280 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0351', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0351 begin');
      const width: number = 720;
      const height: number = 1280;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(240);
      expect(scaledHeight).assertEqual(427);
      expect(offsetX).assertEqual(240);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0351 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0352
     * @tc.name      eraserCanvas0352
     * @tc.desc      720x1280 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0352', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0352 begin');
      const width: number = 720;
      const height: number = 1280;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(180);
      expect(scaledHeight).assertEqual(320);
      expect(offsetX).assertEqual(270);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0352 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0353
     * @tc.name      eraserCanvas0353
     * @tc.desc      720x1280 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0353', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0353 begin');
      const width: number = 720;
      const height: number = 1280;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(120);
      expect(scaledHeight).assertEqual(213);
      expect(offsetX).assertEqual(300);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0353 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0354
     * @tc.name      eraserCanvas0354
     * @tc.desc      720x1280 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0354', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0354 begin');
      const width: number = 720;
      const height: number = 1280;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(90);
      expect(scaledHeight).assertEqual(160);
      expect(offsetX).assertEqual(315);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0354 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0355
     * @tc.name      eraserCanvas0355
     * @tc.desc      720x2560 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0355', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0355 begin');
      const width: number = 720;
      const height: number = 2560;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(720);
      expect(scaledHeight).assertEqual(2560);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0355 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0356
     * @tc.name      eraserCanvas0356
     * @tc.desc      720x2560 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0356', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0356 begin');
      const width: number = 720;
      const height: number = 2560;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(360);
      expect(scaledHeight).assertEqual(1280);
      expect(offsetX).assertEqual(180);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0356 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0357
     * @tc.name      eraserCanvas0357
     * @tc.desc      720x2560 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0357', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0357 begin');
      const width: number = 720;
      const height: number = 2560;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(240);
      expect(scaledHeight).assertEqual(853);
      expect(offsetX).assertEqual(240);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0357 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0358
     * @tc.name      eraserCanvas0358
     * @tc.desc      720x2560 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0358', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0358 begin');
      const width: number = 720;
      const height: number = 2560;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(180);
      expect(scaledHeight).assertEqual(640);
      expect(offsetX).assertEqual(270);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0358 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0359
     * @tc.name      eraserCanvas0359
     * @tc.desc      720x2560 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0359', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0359 begin');
      const width: number = 720;
      const height: number = 2560;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(120);
      expect(scaledHeight).assertEqual(427);
      expect(offsetX).assertEqual(300);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0359 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0360
     * @tc.name      eraserCanvas0360
     * @tc.desc      720x2560 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0360', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0360 begin');
      const width: number = 720;
      const height: number = 2560;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(90);
      expect(scaledHeight).assertEqual(320);
      expect(offsetX).assertEqual(315);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0360 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0361
     * @tc.name      eraserCanvas0361
     * @tc.desc      800x240 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0361', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0361 begin');
      const width: number = 800;
      const height: number = 240;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(800);
      expect(scaledHeight).assertEqual(240);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0361 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0362
     * @tc.name      eraserCanvas0362
     * @tc.desc      800x240 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0362', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0362 begin');
      const width: number = 800;
      const height: number = 240;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(400);
      expect(scaledHeight).assertEqual(120);
      expect(offsetX).assertEqual(200);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0362 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0363
     * @tc.name      eraserCanvas0363
     * @tc.desc      800x240 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0363', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0363 begin');
      const width: number = 800;
      const height: number = 240;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(267);
      expect(scaledHeight).assertEqual(80);
      expect(offsetX).assertEqual(267);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0363 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0364
     * @tc.name      eraserCanvas0364
     * @tc.desc      800x240 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0364', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0364 begin');
      const width: number = 800;
      const height: number = 240;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(200);
      expect(scaledHeight).assertEqual(60);
      expect(offsetX).assertEqual(300);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0364 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0365
     * @tc.name      eraserCanvas0365
     * @tc.desc      800x240 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0365', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0365 begin');
      const width: number = 800;
      const height: number = 240;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(133);
      expect(scaledHeight).assertEqual(40);
      expect(offsetX).assertEqual(334);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0365 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0366
     * @tc.name      eraserCanvas0366
     * @tc.desc      800x240 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0366', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0366 begin');
      const width: number = 800;
      const height: number = 240;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(100);
      expect(scaledHeight).assertEqual(30);
      expect(offsetX).assertEqual(350);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0366 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0367
     * @tc.name      eraserCanvas0367
     * @tc.desc      800x320 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0367', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0367 begin');
      const width: number = 800;
      const height: number = 320;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(800);
      expect(scaledHeight).assertEqual(320);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0367 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0368
     * @tc.name      eraserCanvas0368
     * @tc.desc      800x320 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0368', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0368 begin');
      const width: number = 800;
      const height: number = 320;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(400);
      expect(scaledHeight).assertEqual(160);
      expect(offsetX).assertEqual(200);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0368 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0369
     * @tc.name      eraserCanvas0369
     * @tc.desc      800x320 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0369', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0369 begin');
      const width: number = 800;
      const height: number = 320;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(267);
      expect(scaledHeight).assertEqual(107);
      expect(offsetX).assertEqual(267);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0369 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0370
     * @tc.name      eraserCanvas0370
     * @tc.desc      800x320 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0370', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0370 begin');
      const width: number = 800;
      const height: number = 320;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(200);
      expect(scaledHeight).assertEqual(80);
      expect(offsetX).assertEqual(300);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0370 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0371
     * @tc.name      eraserCanvas0371
     * @tc.desc      800x320 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0371', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0371 begin');
      const width: number = 800;
      const height: number = 320;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(133);
      expect(scaledHeight).assertEqual(53);
      expect(offsetX).assertEqual(334);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0371 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0372
     * @tc.name      eraserCanvas0372
     * @tc.desc      800x320 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0372', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0372 begin');
      const width: number = 800;
      const height: number = 320;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(100);
      expect(scaledHeight).assertEqual(40);
      expect(offsetX).assertEqual(350);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0372 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0373
     * @tc.name      eraserCanvas0373
     * @tc.desc      800x480 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0373', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0373 begin');
      const width: number = 800;
      const height: number = 480;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(800);
      expect(scaledHeight).assertEqual(480);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0373 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0374
     * @tc.name      eraserCanvas0374
     * @tc.desc      800x480 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0374', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0374 begin');
      const width: number = 800;
      const height: number = 480;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(400);
      expect(scaledHeight).assertEqual(240);
      expect(offsetX).assertEqual(200);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0374 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0375
     * @tc.name      eraserCanvas0375
     * @tc.desc      800x480 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0375', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0375 begin');
      const width: number = 800;
      const height: number = 480;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(267);
      expect(scaledHeight).assertEqual(160);
      expect(offsetX).assertEqual(267);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0375 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0376
     * @tc.name      eraserCanvas0376
     * @tc.desc      800x480 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0376', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0376 begin');
      const width: number = 800;
      const height: number = 480;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(200);
      expect(scaledHeight).assertEqual(120);
      expect(offsetX).assertEqual(300);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0376 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0377
     * @tc.name      eraserCanvas0377
     * @tc.desc      800x480 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0377', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0377 begin');
      const width: number = 800;
      const height: number = 480;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(133);
      expect(scaledHeight).assertEqual(80);
      expect(offsetX).assertEqual(334);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0377 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0378
     * @tc.name      eraserCanvas0378
     * @tc.desc      800x480 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0378', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0378 begin');
      const width: number = 800;
      const height: number = 480;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(100);
      expect(scaledHeight).assertEqual(60);
      expect(offsetX).assertEqual(350);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0378 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0379
     * @tc.name      eraserCanvas0379
     * @tc.desc      800x512 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0379', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0379 begin');
      const width: number = 800;
      const height: number = 512;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(800);
      expect(scaledHeight).assertEqual(512);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0379 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0380
     * @tc.name      eraserCanvas0380
     * @tc.desc      800x512 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0380', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0380 begin');
      const width: number = 800;
      const height: number = 512;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(400);
      expect(scaledHeight).assertEqual(256);
      expect(offsetX).assertEqual(200);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0380 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0381
     * @tc.name      eraserCanvas0381
     * @tc.desc      800x512 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0381', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0381 begin');
      const width: number = 800;
      const height: number = 512;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(267);
      expect(scaledHeight).assertEqual(171);
      expect(offsetX).assertEqual(267);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0381 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0382
     * @tc.name      eraserCanvas0382
     * @tc.desc      800x512 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0382', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0382 begin');
      const width: number = 800;
      const height: number = 512;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(200);
      expect(scaledHeight).assertEqual(128);
      expect(offsetX).assertEqual(300);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0382 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0383
     * @tc.name      eraserCanvas0383
     * @tc.desc      800x512 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0383', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0383 begin');
      const width: number = 800;
      const height: number = 512;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(133);
      expect(scaledHeight).assertEqual(85);
      expect(offsetX).assertEqual(334);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0383 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0384
     * @tc.name      eraserCanvas0384
     * @tc.desc      800x512 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0384', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0384 begin');
      const width: number = 800;
      const height: number = 512;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(100);
      expect(scaledHeight).assertEqual(64);
      expect(offsetX).assertEqual(350);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0384 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0385
     * @tc.name      eraserCanvas0385
     * @tc.desc      800x600 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0385', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0385 begin');
      const width: number = 800;
      const height: number = 600;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(800);
      expect(scaledHeight).assertEqual(600);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0385 end');
    })
  })
}
