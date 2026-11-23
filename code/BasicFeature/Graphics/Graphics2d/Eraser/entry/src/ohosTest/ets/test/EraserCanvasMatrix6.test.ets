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

export default function eraserCanvasMatrix6Test(): void {
  describe('EraserCanvasMatrix6Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    ERASER_CANVAS_0386
     * @tc.name      eraserCanvas0386
     * @tc.desc      800x600 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0386', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0386 begin');
      const width: number = 800;
      const height: number = 600;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(400);
      expect(scaledHeight).assertEqual(300);
      expect(offsetX).assertEqual(200);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0386 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0387
     * @tc.name      eraserCanvas0387
     * @tc.desc      800x600 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0387', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0387 begin');
      const width: number = 800;
      const height: number = 600;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(267);
      expect(scaledHeight).assertEqual(200);
      expect(offsetX).assertEqual(267);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0387 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0388
     * @tc.name      eraserCanvas0388
     * @tc.desc      800x600 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0388', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0388 begin');
      const width: number = 800;
      const height: number = 600;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(200);
      expect(scaledHeight).assertEqual(150);
      expect(offsetX).assertEqual(300);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0388 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0389
     * @tc.name      eraserCanvas0389
     * @tc.desc      800x600 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0389', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0389 begin');
      const width: number = 800;
      const height: number = 600;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(133);
      expect(scaledHeight).assertEqual(100);
      expect(offsetX).assertEqual(334);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0389 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0390
     * @tc.name      eraserCanvas0390
     * @tc.desc      800x600 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0390', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0390 begin');
      const width: number = 800;
      const height: number = 600;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(100);
      expect(scaledHeight).assertEqual(75);
      expect(offsetX).assertEqual(350);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0390 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0391
     * @tc.name      eraserCanvas0391
     * @tc.desc      800x640 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0391', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0391 begin');
      const width: number = 800;
      const height: number = 640;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(800);
      expect(scaledHeight).assertEqual(640);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0391 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0392
     * @tc.name      eraserCanvas0392
     * @tc.desc      800x640 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0392', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0392 begin');
      const width: number = 800;
      const height: number = 640;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(400);
      expect(scaledHeight).assertEqual(320);
      expect(offsetX).assertEqual(200);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0392 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0393
     * @tc.name      eraserCanvas0393
     * @tc.desc      800x640 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0393', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0393 begin');
      const width: number = 800;
      const height: number = 640;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(267);
      expect(scaledHeight).assertEqual(213);
      expect(offsetX).assertEqual(267);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0393 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0394
     * @tc.name      eraserCanvas0394
     * @tc.desc      800x640 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0394', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0394 begin');
      const width: number = 800;
      const height: number = 640;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(200);
      expect(scaledHeight).assertEqual(160);
      expect(offsetX).assertEqual(300);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0394 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0395
     * @tc.name      eraserCanvas0395
     * @tc.desc      800x640 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0395', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0395 begin');
      const width: number = 800;
      const height: number = 640;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(133);
      expect(scaledHeight).assertEqual(107);
      expect(offsetX).assertEqual(334);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0395 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0396
     * @tc.name      eraserCanvas0396
     * @tc.desc      800x640 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0396', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0396 begin');
      const width: number = 800;
      const height: number = 640;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(100);
      expect(scaledHeight).assertEqual(80);
      expect(offsetX).assertEqual(350);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0396 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0397
     * @tc.name      eraserCanvas0397
     * @tc.desc      800x720 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0397', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0397 begin');
      const width: number = 800;
      const height: number = 720;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(800);
      expect(scaledHeight).assertEqual(720);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0397 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0398
     * @tc.name      eraserCanvas0398
     * @tc.desc      800x720 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0398', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0398 begin');
      const width: number = 800;
      const height: number = 720;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(400);
      expect(scaledHeight).assertEqual(360);
      expect(offsetX).assertEqual(200);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0398 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0399
     * @tc.name      eraserCanvas0399
     * @tc.desc      800x720 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0399', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0399 begin');
      const width: number = 800;
      const height: number = 720;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(267);
      expect(scaledHeight).assertEqual(240);
      expect(offsetX).assertEqual(267);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0399 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0400
     * @tc.name      eraserCanvas0400
     * @tc.desc      800x720 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0400 begin');
      const width: number = 800;
      const height: number = 720;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(200);
      expect(scaledHeight).assertEqual(180);
      expect(offsetX).assertEqual(300);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0400 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0401
     * @tc.name      eraserCanvas0401
     * @tc.desc      800x720 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0401 begin');
      const width: number = 800;
      const height: number = 720;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(133);
      expect(scaledHeight).assertEqual(120);
      expect(offsetX).assertEqual(334);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0401 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0402
     * @tc.name      eraserCanvas0402
     * @tc.desc      800x720 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0402 begin');
      const width: number = 800;
      const height: number = 720;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(100);
      expect(scaledHeight).assertEqual(90);
      expect(offsetX).assertEqual(350);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0402 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0403
     * @tc.name      eraserCanvas0403
     * @tc.desc      800x768 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0403 begin');
      const width: number = 800;
      const height: number = 768;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(800);
      expect(scaledHeight).assertEqual(768);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0403 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0404
     * @tc.name      eraserCanvas0404
     * @tc.desc      800x768 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0404 begin');
      const width: number = 800;
      const height: number = 768;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(400);
      expect(scaledHeight).assertEqual(384);
      expect(offsetX).assertEqual(200);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0404 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0405
     * @tc.name      eraserCanvas0405
     * @tc.desc      800x768 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0405 begin');
      const width: number = 800;
      const height: number = 768;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(267);
      expect(scaledHeight).assertEqual(256);
      expect(offsetX).assertEqual(267);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0405 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0406
     * @tc.name      eraserCanvas0406
     * @tc.desc      800x768 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0406 begin');
      const width: number = 800;
      const height: number = 768;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(200);
      expect(scaledHeight).assertEqual(192);
      expect(offsetX).assertEqual(300);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0406 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0407
     * @tc.name      eraserCanvas0407
     * @tc.desc      800x768 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0407', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0407 begin');
      const width: number = 800;
      const height: number = 768;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(133);
      expect(scaledHeight).assertEqual(128);
      expect(offsetX).assertEqual(334);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0407 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0408
     * @tc.name      eraserCanvas0408
     * @tc.desc      800x768 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0408', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0408 begin');
      const width: number = 800;
      const height: number = 768;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(100);
      expect(scaledHeight).assertEqual(96);
      expect(offsetX).assertEqual(350);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0408 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0409
     * @tc.name      eraserCanvas0409
     * @tc.desc      800x812 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0409', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0409 begin');
      const width: number = 800;
      const height: number = 812;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(800);
      expect(scaledHeight).assertEqual(812);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0409 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0410
     * @tc.name      eraserCanvas0410
     * @tc.desc      800x812 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0410 begin');
      const width: number = 800;
      const height: number = 812;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(400);
      expect(scaledHeight).assertEqual(406);
      expect(offsetX).assertEqual(200);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0410 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0411
     * @tc.name      eraserCanvas0411
     * @tc.desc      800x812 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0411', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0411 begin');
      const width: number = 800;
      const height: number = 812;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(267);
      expect(scaledHeight).assertEqual(271);
      expect(offsetX).assertEqual(267);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0411 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0412
     * @tc.name      eraserCanvas0412
     * @tc.desc      800x812 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0412', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0412 begin');
      const width: number = 800;
      const height: number = 812;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(200);
      expect(scaledHeight).assertEqual(203);
      expect(offsetX).assertEqual(300);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0412 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0413
     * @tc.name      eraserCanvas0413
     * @tc.desc      800x812 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0413', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0413 begin');
      const width: number = 800;
      const height: number = 812;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(133);
      expect(scaledHeight).assertEqual(135);
      expect(offsetX).assertEqual(334);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0413 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0414
     * @tc.name      eraserCanvas0414
     * @tc.desc      800x812 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0414', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0414 begin');
      const width: number = 800;
      const height: number = 812;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(100);
      expect(scaledHeight).assertEqual(102);
      expect(offsetX).assertEqual(350);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0414 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0415
     * @tc.name      eraserCanvas0415
     * @tc.desc      800x1080 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0415', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0415 begin');
      const width: number = 800;
      const height: number = 1080;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(800);
      expect(scaledHeight).assertEqual(1080);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0415 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0416
     * @tc.name      eraserCanvas0416
     * @tc.desc      800x1080 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0416', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0416 begin');
      const width: number = 800;
      const height: number = 1080;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(400);
      expect(scaledHeight).assertEqual(540);
      expect(offsetX).assertEqual(200);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0416 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0417
     * @tc.name      eraserCanvas0417
     * @tc.desc      800x1080 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0417', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0417 begin');
      const width: number = 800;
      const height: number = 1080;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(267);
      expect(scaledHeight).assertEqual(360);
      expect(offsetX).assertEqual(267);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0417 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0418
     * @tc.name      eraserCanvas0418
     * @tc.desc      800x1080 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0418', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0418 begin');
      const width: number = 800;
      const height: number = 1080;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(200);
      expect(scaledHeight).assertEqual(270);
      expect(offsetX).assertEqual(300);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0418 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0419
     * @tc.name      eraserCanvas0419
     * @tc.desc      800x1080 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0419', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0419 begin');
      const width: number = 800;
      const height: number = 1080;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(133);
      expect(scaledHeight).assertEqual(180);
      expect(offsetX).assertEqual(334);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0419 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0420
     * @tc.name      eraserCanvas0420
     * @tc.desc      800x1080 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0420', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0420 begin');
      const width: number = 800;
      const height: number = 1080;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(100);
      expect(scaledHeight).assertEqual(135);
      expect(offsetX).assertEqual(350);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0420 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0421
     * @tc.name      eraserCanvas0421
     * @tc.desc      800x1280 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0421', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0421 begin');
      const width: number = 800;
      const height: number = 1280;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(800);
      expect(scaledHeight).assertEqual(1280);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0421 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0422
     * @tc.name      eraserCanvas0422
     * @tc.desc      800x1280 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0422', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0422 begin');
      const width: number = 800;
      const height: number = 1280;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(400);
      expect(scaledHeight).assertEqual(640);
      expect(offsetX).assertEqual(200);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0422 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0423
     * @tc.name      eraserCanvas0423
     * @tc.desc      800x1280 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0423', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0423 begin');
      const width: number = 800;
      const height: number = 1280;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(267);
      expect(scaledHeight).assertEqual(427);
      expect(offsetX).assertEqual(267);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0423 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0424
     * @tc.name      eraserCanvas0424
     * @tc.desc      800x1280 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0424', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0424 begin');
      const width: number = 800;
      const height: number = 1280;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(200);
      expect(scaledHeight).assertEqual(320);
      expect(offsetX).assertEqual(300);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0424 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0425
     * @tc.name      eraserCanvas0425
     * @tc.desc      800x1280 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0425', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0425 begin');
      const width: number = 800;
      const height: number = 1280;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(133);
      expect(scaledHeight).assertEqual(213);
      expect(offsetX).assertEqual(334);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0425 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0426
     * @tc.name      eraserCanvas0426
     * @tc.desc      800x1280 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0426', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0426 begin');
      const width: number = 800;
      const height: number = 1280;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(100);
      expect(scaledHeight).assertEqual(160);
      expect(offsetX).assertEqual(350);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0426 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0427
     * @tc.name      eraserCanvas0427
     * @tc.desc      800x2560 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0427', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0427 begin');
      const width: number = 800;
      const height: number = 2560;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(800);
      expect(scaledHeight).assertEqual(2560);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0427 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0428
     * @tc.name      eraserCanvas0428
     * @tc.desc      800x2560 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0428', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0428 begin');
      const width: number = 800;
      const height: number = 2560;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(400);
      expect(scaledHeight).assertEqual(1280);
      expect(offsetX).assertEqual(200);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0428 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0429
     * @tc.name      eraserCanvas0429
     * @tc.desc      800x2560 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0429', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0429 begin');
      const width: number = 800;
      const height: number = 2560;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(267);
      expect(scaledHeight).assertEqual(853);
      expect(offsetX).assertEqual(267);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0429 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0430
     * @tc.name      eraserCanvas0430
     * @tc.desc      800x2560 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0430', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0430 begin');
      const width: number = 800;
      const height: number = 2560;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(200);
      expect(scaledHeight).assertEqual(640);
      expect(offsetX).assertEqual(300);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0430 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0431
     * @tc.name      eraserCanvas0431
     * @tc.desc      800x2560 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0431', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0431 begin');
      const width: number = 800;
      const height: number = 2560;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(133);
      expect(scaledHeight).assertEqual(427);
      expect(offsetX).assertEqual(334);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0431 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0432
     * @tc.name      eraserCanvas0432
     * @tc.desc      800x2560 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0432', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0432 begin');
      const width: number = 800;
      const height: number = 2560;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(100);
      expect(scaledHeight).assertEqual(320);
      expect(offsetX).assertEqual(350);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0432 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0433
     * @tc.name      eraserCanvas0433
     * @tc.desc      960x240 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0433', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0433 begin');
      const width: number = 960;
      const height: number = 240;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(960);
      expect(scaledHeight).assertEqual(240);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0433 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0434
     * @tc.name      eraserCanvas0434
     * @tc.desc      960x240 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0434', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0434 begin');
      const width: number = 960;
      const height: number = 240;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(480);
      expect(scaledHeight).assertEqual(120);
      expect(offsetX).assertEqual(240);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0434 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0435
     * @tc.name      eraserCanvas0435
     * @tc.desc      960x240 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0435', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0435 begin');
      const width: number = 960;
      const height: number = 240;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(320);
      expect(scaledHeight).assertEqual(80);
      expect(offsetX).assertEqual(320);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0435 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0436
     * @tc.name      eraserCanvas0436
     * @tc.desc      960x240 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0436', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0436 begin');
      const width: number = 960;
      const height: number = 240;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(240);
      expect(scaledHeight).assertEqual(60);
      expect(offsetX).assertEqual(360);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0436 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0437
     * @tc.name      eraserCanvas0437
     * @tc.desc      960x240 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0437', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0437 begin');
      const width: number = 960;
      const height: number = 240;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(160);
      expect(scaledHeight).assertEqual(40);
      expect(offsetX).assertEqual(400);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0437 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0438
     * @tc.name      eraserCanvas0438
     * @tc.desc      960x240 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0438', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0438 begin');
      const width: number = 960;
      const height: number = 240;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(120);
      expect(scaledHeight).assertEqual(30);
      expect(offsetX).assertEqual(420);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0438 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0439
     * @tc.name      eraserCanvas0439
     * @tc.desc      960x320 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0439', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0439 begin');
      const width: number = 960;
      const height: number = 320;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(960);
      expect(scaledHeight).assertEqual(320);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0439 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0440
     * @tc.name      eraserCanvas0440
     * @tc.desc      960x320 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0440', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0440 begin');
      const width: number = 960;
      const height: number = 320;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(480);
      expect(scaledHeight).assertEqual(160);
      expect(offsetX).assertEqual(240);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0440 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0441
     * @tc.name      eraserCanvas0441
     * @tc.desc      960x320 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0441', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0441 begin');
      const width: number = 960;
      const height: number = 320;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(320);
      expect(scaledHeight).assertEqual(107);
      expect(offsetX).assertEqual(320);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0441 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0442
     * @tc.name      eraserCanvas0442
     * @tc.desc      960x320 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0442', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0442 begin');
      const width: number = 960;
      const height: number = 320;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(240);
      expect(scaledHeight).assertEqual(80);
      expect(offsetX).assertEqual(360);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0442 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0443
     * @tc.name      eraserCanvas0443
     * @tc.desc      960x320 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0443', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0443 begin');
      const width: number = 960;
      const height: number = 320;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(160);
      expect(scaledHeight).assertEqual(53);
      expect(offsetX).assertEqual(400);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0443 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0444
     * @tc.name      eraserCanvas0444
     * @tc.desc      960x320 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0444', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0444 begin');
      const width: number = 960;
      const height: number = 320;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(120);
      expect(scaledHeight).assertEqual(40);
      expect(offsetX).assertEqual(420);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0444 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0445
     * @tc.name      eraserCanvas0445
     * @tc.desc      960x480 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0445', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0445 begin');
      const width: number = 960;
      const height: number = 480;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(960);
      expect(scaledHeight).assertEqual(480);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0445 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0446
     * @tc.name      eraserCanvas0446
     * @tc.desc      960x480 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0446', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0446 begin');
      const width: number = 960;
      const height: number = 480;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(480);
      expect(scaledHeight).assertEqual(240);
      expect(offsetX).assertEqual(240);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0446 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0447
     * @tc.name      eraserCanvas0447
     * @tc.desc      960x480 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0447', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0447 begin');
      const width: number = 960;
      const height: number = 480;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(320);
      expect(scaledHeight).assertEqual(160);
      expect(offsetX).assertEqual(320);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0447 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0448
     * @tc.name      eraserCanvas0448
     * @tc.desc      960x480 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0448', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0448 begin');
      const width: number = 960;
      const height: number = 480;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(240);
      expect(scaledHeight).assertEqual(120);
      expect(offsetX).assertEqual(360);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0448 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0449
     * @tc.name      eraserCanvas0449
     * @tc.desc      960x480 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0449', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0449 begin');
      const width: number = 960;
      const height: number = 480;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(160);
      expect(scaledHeight).assertEqual(80);
      expect(offsetX).assertEqual(400);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0449 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0450
     * @tc.name      eraserCanvas0450
     * @tc.desc      960x480 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0450', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0450 begin');
      const width: number = 960;
      const height: number = 480;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(120);
      expect(scaledHeight).assertEqual(60);
      expect(offsetX).assertEqual(420);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0450 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0451
     * @tc.name      eraserCanvas0451
     * @tc.desc      960x512 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0451', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0451 begin');
      const width: number = 960;
      const height: number = 512;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(960);
      expect(scaledHeight).assertEqual(512);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0451 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0452
     * @tc.name      eraserCanvas0452
     * @tc.desc      960x512 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0452', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0452 begin');
      const width: number = 960;
      const height: number = 512;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(480);
      expect(scaledHeight).assertEqual(256);
      expect(offsetX).assertEqual(240);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0452 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0453
     * @tc.name      eraserCanvas0453
     * @tc.desc      960x512 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0453', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0453 begin');
      const width: number = 960;
      const height: number = 512;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(320);
      expect(scaledHeight).assertEqual(171);
      expect(offsetX).assertEqual(320);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0453 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0454
     * @tc.name      eraserCanvas0454
     * @tc.desc      960x512 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0454', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0454 begin');
      const width: number = 960;
      const height: number = 512;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(240);
      expect(scaledHeight).assertEqual(128);
      expect(offsetX).assertEqual(360);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0454 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0455
     * @tc.name      eraserCanvas0455
     * @tc.desc      960x512 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0455', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0455 begin');
      const width: number = 960;
      const height: number = 512;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(160);
      expect(scaledHeight).assertEqual(85);
      expect(offsetX).assertEqual(400);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0455 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0456
     * @tc.name      eraserCanvas0456
     * @tc.desc      960x512 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0456', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0456 begin');
      const width: number = 960;
      const height: number = 512;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(120);
      expect(scaledHeight).assertEqual(64);
      expect(offsetX).assertEqual(420);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0456 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0457
     * @tc.name      eraserCanvas0457
     * @tc.desc      960x600 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0457', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0457 begin');
      const width: number = 960;
      const height: number = 600;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(960);
      expect(scaledHeight).assertEqual(600);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0457 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0458
     * @tc.name      eraserCanvas0458
     * @tc.desc      960x600 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0458', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0458 begin');
      const width: number = 960;
      const height: number = 600;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(480);
      expect(scaledHeight).assertEqual(300);
      expect(offsetX).assertEqual(240);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0458 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0459
     * @tc.name      eraserCanvas0459
     * @tc.desc      960x600 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0459', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0459 begin');
      const width: number = 960;
      const height: number = 600;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(320);
      expect(scaledHeight).assertEqual(200);
      expect(offsetX).assertEqual(320);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0459 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0460
     * @tc.name      eraserCanvas0460
     * @tc.desc      960x600 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0460', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0460 begin');
      const width: number = 960;
      const height: number = 600;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(240);
      expect(scaledHeight).assertEqual(150);
      expect(offsetX).assertEqual(360);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0460 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0461
     * @tc.name      eraserCanvas0461
     * @tc.desc      960x600 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0461', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0461 begin');
      const width: number = 960;
      const height: number = 600;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(160);
      expect(scaledHeight).assertEqual(100);
      expect(offsetX).assertEqual(400);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0461 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0462
     * @tc.name      eraserCanvas0462
     * @tc.desc      960x600 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0462', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0462 begin');
      const width: number = 960;
      const height: number = 600;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(120);
      expect(scaledHeight).assertEqual(75);
      expect(offsetX).assertEqual(420);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0462 end');
    })
  })
}
