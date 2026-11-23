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

export default function eraserCanvasMatrix8Test(): void {
  describe('EraserCanvasMatrix8Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    ERASER_CANVAS_0540
     * @tc.name      eraserCanvas0540
     * @tc.desc      1024x640 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0540', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0540 begin');
      const width: number = 1024;
      const height: number = 640;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(128);
      expect(scaledHeight).assertEqual(80);
      expect(offsetX).assertEqual(448);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0540 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0541
     * @tc.name      eraserCanvas0541
     * @tc.desc      1024x720 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0541', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0541 begin');
      const width: number = 1024;
      const height: number = 720;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(1024);
      expect(scaledHeight).assertEqual(720);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0541 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0542
     * @tc.name      eraserCanvas0542
     * @tc.desc      1024x720 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0542', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0542 begin');
      const width: number = 1024;
      const height: number = 720;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(512);
      expect(scaledHeight).assertEqual(360);
      expect(offsetX).assertEqual(256);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0542 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0543
     * @tc.name      eraserCanvas0543
     * @tc.desc      1024x720 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0543', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0543 begin');
      const width: number = 1024;
      const height: number = 720;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(341);
      expect(scaledHeight).assertEqual(240);
      expect(offsetX).assertEqual(342);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0543 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0544
     * @tc.name      eraserCanvas0544
     * @tc.desc      1024x720 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0544', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0544 begin');
      const width: number = 1024;
      const height: number = 720;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(256);
      expect(scaledHeight).assertEqual(180);
      expect(offsetX).assertEqual(384);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0544 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0545
     * @tc.name      eraserCanvas0545
     * @tc.desc      1024x720 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0545', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0545 begin');
      const width: number = 1024;
      const height: number = 720;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(171);
      expect(scaledHeight).assertEqual(120);
      expect(offsetX).assertEqual(427);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0545 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0546
     * @tc.name      eraserCanvas0546
     * @tc.desc      1024x720 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0546', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0546 begin');
      const width: number = 1024;
      const height: number = 720;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(128);
      expect(scaledHeight).assertEqual(90);
      expect(offsetX).assertEqual(448);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0546 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0547
     * @tc.name      eraserCanvas0547
     * @tc.desc      1024x768 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0547', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0547 begin');
      const width: number = 1024;
      const height: number = 768;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(1024);
      expect(scaledHeight).assertEqual(768);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0547 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0548
     * @tc.name      eraserCanvas0548
     * @tc.desc      1024x768 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0548', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0548 begin');
      const width: number = 1024;
      const height: number = 768;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(512);
      expect(scaledHeight).assertEqual(384);
      expect(offsetX).assertEqual(256);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0548 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0549
     * @tc.name      eraserCanvas0549
     * @tc.desc      1024x768 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0549', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0549 begin');
      const width: number = 1024;
      const height: number = 768;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(341);
      expect(scaledHeight).assertEqual(256);
      expect(offsetX).assertEqual(342);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0549 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0550
     * @tc.name      eraserCanvas0550
     * @tc.desc      1024x768 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0550', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0550 begin');
      const width: number = 1024;
      const height: number = 768;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(256);
      expect(scaledHeight).assertEqual(192);
      expect(offsetX).assertEqual(384);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0550 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0551
     * @tc.name      eraserCanvas0551
     * @tc.desc      1024x768 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0551', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0551 begin');
      const width: number = 1024;
      const height: number = 768;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(171);
      expect(scaledHeight).assertEqual(128);
      expect(offsetX).assertEqual(427);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0551 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0552
     * @tc.name      eraserCanvas0552
     * @tc.desc      1024x768 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0552', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0552 begin');
      const width: number = 1024;
      const height: number = 768;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(128);
      expect(scaledHeight).assertEqual(96);
      expect(offsetX).assertEqual(448);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0552 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0553
     * @tc.name      eraserCanvas0553
     * @tc.desc      1024x812 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0553', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0553 begin');
      const width: number = 1024;
      const height: number = 812;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(1024);
      expect(scaledHeight).assertEqual(812);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0553 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0554
     * @tc.name      eraserCanvas0554
     * @tc.desc      1024x812 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0554', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0554 begin');
      const width: number = 1024;
      const height: number = 812;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(512);
      expect(scaledHeight).assertEqual(406);
      expect(offsetX).assertEqual(256);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0554 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0555
     * @tc.name      eraserCanvas0555
     * @tc.desc      1024x812 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0555', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0555 begin');
      const width: number = 1024;
      const height: number = 812;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(341);
      expect(scaledHeight).assertEqual(271);
      expect(offsetX).assertEqual(342);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0555 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0556
     * @tc.name      eraserCanvas0556
     * @tc.desc      1024x812 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0556', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0556 begin');
      const width: number = 1024;
      const height: number = 812;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(256);
      expect(scaledHeight).assertEqual(203);
      expect(offsetX).assertEqual(384);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0556 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0557
     * @tc.name      eraserCanvas0557
     * @tc.desc      1024x812 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0557', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0557 begin');
      const width: number = 1024;
      const height: number = 812;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(171);
      expect(scaledHeight).assertEqual(135);
      expect(offsetX).assertEqual(427);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0557 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0558
     * @tc.name      eraserCanvas0558
     * @tc.desc      1024x812 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0558', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0558 begin');
      const width: number = 1024;
      const height: number = 812;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(128);
      expect(scaledHeight).assertEqual(102);
      expect(offsetX).assertEqual(448);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0558 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0559
     * @tc.name      eraserCanvas0559
     * @tc.desc      1024x1080 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0559', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0559 begin');
      const width: number = 1024;
      const height: number = 1080;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(1024);
      expect(scaledHeight).assertEqual(1080);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0559 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0560
     * @tc.name      eraserCanvas0560
     * @tc.desc      1024x1080 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0560', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0560 begin');
      const width: number = 1024;
      const height: number = 1080;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(512);
      expect(scaledHeight).assertEqual(540);
      expect(offsetX).assertEqual(256);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0560 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0561
     * @tc.name      eraserCanvas0561
     * @tc.desc      1024x1080 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0561', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0561 begin');
      const width: number = 1024;
      const height: number = 1080;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(341);
      expect(scaledHeight).assertEqual(360);
      expect(offsetX).assertEqual(342);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0561 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0562
     * @tc.name      eraserCanvas0562
     * @tc.desc      1024x1080 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0562', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0562 begin');
      const width: number = 1024;
      const height: number = 1080;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(256);
      expect(scaledHeight).assertEqual(270);
      expect(offsetX).assertEqual(384);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0562 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0563
     * @tc.name      eraserCanvas0563
     * @tc.desc      1024x1080 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0563', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0563 begin');
      const width: number = 1024;
      const height: number = 1080;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(171);
      expect(scaledHeight).assertEqual(180);
      expect(offsetX).assertEqual(427);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0563 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0564
     * @tc.name      eraserCanvas0564
     * @tc.desc      1024x1080 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0564', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0564 begin');
      const width: number = 1024;
      const height: number = 1080;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(128);
      expect(scaledHeight).assertEqual(135);
      expect(offsetX).assertEqual(448);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0564 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0565
     * @tc.name      eraserCanvas0565
     * @tc.desc      1024x1280 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0565', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0565 begin');
      const width: number = 1024;
      const height: number = 1280;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(1024);
      expect(scaledHeight).assertEqual(1280);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0565 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0566
     * @tc.name      eraserCanvas0566
     * @tc.desc      1024x1280 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0566', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0566 begin');
      const width: number = 1024;
      const height: number = 1280;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(512);
      expect(scaledHeight).assertEqual(640);
      expect(offsetX).assertEqual(256);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0566 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0567
     * @tc.name      eraserCanvas0567
     * @tc.desc      1024x1280 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0567', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0567 begin');
      const width: number = 1024;
      const height: number = 1280;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(341);
      expect(scaledHeight).assertEqual(427);
      expect(offsetX).assertEqual(342);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0567 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0568
     * @tc.name      eraserCanvas0568
     * @tc.desc      1024x1280 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0568', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0568 begin');
      const width: number = 1024;
      const height: number = 1280;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(256);
      expect(scaledHeight).assertEqual(320);
      expect(offsetX).assertEqual(384);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0568 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0569
     * @tc.name      eraserCanvas0569
     * @tc.desc      1024x1280 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0569', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0569 begin');
      const width: number = 1024;
      const height: number = 1280;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(171);
      expect(scaledHeight).assertEqual(213);
      expect(offsetX).assertEqual(427);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0569 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0570
     * @tc.name      eraserCanvas0570
     * @tc.desc      1024x1280 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0570', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0570 begin');
      const width: number = 1024;
      const height: number = 1280;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(128);
      expect(scaledHeight).assertEqual(160);
      expect(offsetX).assertEqual(448);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0570 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0571
     * @tc.name      eraserCanvas0571
     * @tc.desc      1024x2560 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0571', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0571 begin');
      const width: number = 1024;
      const height: number = 2560;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(1024);
      expect(scaledHeight).assertEqual(2560);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0571 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0572
     * @tc.name      eraserCanvas0572
     * @tc.desc      1024x2560 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0572', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0572 begin');
      const width: number = 1024;
      const height: number = 2560;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(512);
      expect(scaledHeight).assertEqual(1280);
      expect(offsetX).assertEqual(256);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0572 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0573
     * @tc.name      eraserCanvas0573
     * @tc.desc      1024x2560 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0573', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0573 begin');
      const width: number = 1024;
      const height: number = 2560;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(341);
      expect(scaledHeight).assertEqual(853);
      expect(offsetX).assertEqual(342);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0573 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0574
     * @tc.name      eraserCanvas0574
     * @tc.desc      1024x2560 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0574', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0574 begin');
      const width: number = 1024;
      const height: number = 2560;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(256);
      expect(scaledHeight).assertEqual(640);
      expect(offsetX).assertEqual(384);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0574 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0575
     * @tc.name      eraserCanvas0575
     * @tc.desc      1024x2560 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0575', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0575 begin');
      const width: number = 1024;
      const height: number = 2560;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(171);
      expect(scaledHeight).assertEqual(427);
      expect(offsetX).assertEqual(427);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0575 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0576
     * @tc.name      eraserCanvas0576
     * @tc.desc      1024x2560 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0576', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0576 begin');
      const width: number = 1024;
      const height: number = 2560;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(128);
      expect(scaledHeight).assertEqual(320);
      expect(offsetX).assertEqual(448);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0576 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0577
     * @tc.name      eraserCanvas0577
     * @tc.desc      1080x240 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0577', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0577 begin');
      const width: number = 1080;
      const height: number = 240;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(1080);
      expect(scaledHeight).assertEqual(240);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0577 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0578
     * @tc.name      eraserCanvas0578
     * @tc.desc      1080x240 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0578', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0578 begin');
      const width: number = 1080;
      const height: number = 240;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(540);
      expect(scaledHeight).assertEqual(120);
      expect(offsetX).assertEqual(270);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0578 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0579
     * @tc.name      eraserCanvas0579
     * @tc.desc      1080x240 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0579', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0579 begin');
      const width: number = 1080;
      const height: number = 240;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(360);
      expect(scaledHeight).assertEqual(80);
      expect(offsetX).assertEqual(360);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0579 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0580
     * @tc.name      eraserCanvas0580
     * @tc.desc      1080x240 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0580', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0580 begin');
      const width: number = 1080;
      const height: number = 240;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(270);
      expect(scaledHeight).assertEqual(60);
      expect(offsetX).assertEqual(405);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0580 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0581
     * @tc.name      eraserCanvas0581
     * @tc.desc      1080x240 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0581', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0581 begin');
      const width: number = 1080;
      const height: number = 240;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(180);
      expect(scaledHeight).assertEqual(40);
      expect(offsetX).assertEqual(450);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0581 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0582
     * @tc.name      eraserCanvas0582
     * @tc.desc      1080x240 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0582', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0582 begin');
      const width: number = 1080;
      const height: number = 240;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(135);
      expect(scaledHeight).assertEqual(30);
      expect(offsetX).assertEqual(473);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0582 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0583
     * @tc.name      eraserCanvas0583
     * @tc.desc      1080x320 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0583', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0583 begin');
      const width: number = 1080;
      const height: number = 320;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(1080);
      expect(scaledHeight).assertEqual(320);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0583 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0584
     * @tc.name      eraserCanvas0584
     * @tc.desc      1080x320 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0584', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0584 begin');
      const width: number = 1080;
      const height: number = 320;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(540);
      expect(scaledHeight).assertEqual(160);
      expect(offsetX).assertEqual(270);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0584 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0585
     * @tc.name      eraserCanvas0585
     * @tc.desc      1080x320 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0585', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0585 begin');
      const width: number = 1080;
      const height: number = 320;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(360);
      expect(scaledHeight).assertEqual(107);
      expect(offsetX).assertEqual(360);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0585 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0586
     * @tc.name      eraserCanvas0586
     * @tc.desc      1080x320 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0586', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0586 begin');
      const width: number = 1080;
      const height: number = 320;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(270);
      expect(scaledHeight).assertEqual(80);
      expect(offsetX).assertEqual(405);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0586 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0587
     * @tc.name      eraserCanvas0587
     * @tc.desc      1080x320 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0587', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0587 begin');
      const width: number = 1080;
      const height: number = 320;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(180);
      expect(scaledHeight).assertEqual(53);
      expect(offsetX).assertEqual(450);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0587 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0588
     * @tc.name      eraserCanvas0588
     * @tc.desc      1080x320 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0588', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0588 begin');
      const width: number = 1080;
      const height: number = 320;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(135);
      expect(scaledHeight).assertEqual(40);
      expect(offsetX).assertEqual(473);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0588 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0589
     * @tc.name      eraserCanvas0589
     * @tc.desc      1080x480 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0589', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0589 begin');
      const width: number = 1080;
      const height: number = 480;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(1080);
      expect(scaledHeight).assertEqual(480);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0589 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0590
     * @tc.name      eraserCanvas0590
     * @tc.desc      1080x480 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0590', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0590 begin');
      const width: number = 1080;
      const height: number = 480;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(540);
      expect(scaledHeight).assertEqual(240);
      expect(offsetX).assertEqual(270);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0590 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0591
     * @tc.name      eraserCanvas0591
     * @tc.desc      1080x480 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0591', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0591 begin');
      const width: number = 1080;
      const height: number = 480;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(360);
      expect(scaledHeight).assertEqual(160);
      expect(offsetX).assertEqual(360);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0591 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0592
     * @tc.name      eraserCanvas0592
     * @tc.desc      1080x480 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0592', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0592 begin');
      const width: number = 1080;
      const height: number = 480;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(270);
      expect(scaledHeight).assertEqual(120);
      expect(offsetX).assertEqual(405);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0592 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0593
     * @tc.name      eraserCanvas0593
     * @tc.desc      1080x480 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0593', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0593 begin');
      const width: number = 1080;
      const height: number = 480;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(180);
      expect(scaledHeight).assertEqual(80);
      expect(offsetX).assertEqual(450);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0593 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0594
     * @tc.name      eraserCanvas0594
     * @tc.desc      1080x480 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0594', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0594 begin');
      const width: number = 1080;
      const height: number = 480;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(135);
      expect(scaledHeight).assertEqual(60);
      expect(offsetX).assertEqual(473);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0594 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0595
     * @tc.name      eraserCanvas0595
     * @tc.desc      1080x512 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0595', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0595 begin');
      const width: number = 1080;
      const height: number = 512;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(1080);
      expect(scaledHeight).assertEqual(512);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0595 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0596
     * @tc.name      eraserCanvas0596
     * @tc.desc      1080x512 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0596', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0596 begin');
      const width: number = 1080;
      const height: number = 512;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(540);
      expect(scaledHeight).assertEqual(256);
      expect(offsetX).assertEqual(270);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0596 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0597
     * @tc.name      eraserCanvas0597
     * @tc.desc      1080x512 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0597', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0597 begin');
      const width: number = 1080;
      const height: number = 512;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(360);
      expect(scaledHeight).assertEqual(171);
      expect(offsetX).assertEqual(360);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0597 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0598
     * @tc.name      eraserCanvas0598
     * @tc.desc      1080x512 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0598', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0598 begin');
      const width: number = 1080;
      const height: number = 512;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(270);
      expect(scaledHeight).assertEqual(128);
      expect(offsetX).assertEqual(405);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0598 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0599
     * @tc.name      eraserCanvas0599
     * @tc.desc      1080x512 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0599', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0599 begin');
      const width: number = 1080;
      const height: number = 512;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(180);
      expect(scaledHeight).assertEqual(85);
      expect(offsetX).assertEqual(450);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0599 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0600
     * @tc.name      eraserCanvas0600
     * @tc.desc      1080x512 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0600 begin');
      const width: number = 1080;
      const height: number = 512;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(135);
      expect(scaledHeight).assertEqual(64);
      expect(offsetX).assertEqual(473);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0600 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0601
     * @tc.name      eraserCanvas0601
     * @tc.desc      1080x600 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0601', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0601 begin');
      const width: number = 1080;
      const height: number = 600;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(1080);
      expect(scaledHeight).assertEqual(600);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0601 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0602
     * @tc.name      eraserCanvas0602
     * @tc.desc      1080x600 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0602', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0602 begin');
      const width: number = 1080;
      const height: number = 600;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(540);
      expect(scaledHeight).assertEqual(300);
      expect(offsetX).assertEqual(270);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0602 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0603
     * @tc.name      eraserCanvas0603
     * @tc.desc      1080x600 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0603', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0603 begin');
      const width: number = 1080;
      const height: number = 600;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(360);
      expect(scaledHeight).assertEqual(200);
      expect(offsetX).assertEqual(360);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0603 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0604
     * @tc.name      eraserCanvas0604
     * @tc.desc      1080x600 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0604', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0604 begin');
      const width: number = 1080;
      const height: number = 600;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(270);
      expect(scaledHeight).assertEqual(150);
      expect(offsetX).assertEqual(405);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0604 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0605
     * @tc.name      eraserCanvas0605
     * @tc.desc      1080x600 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0605', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0605 begin');
      const width: number = 1080;
      const height: number = 600;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(180);
      expect(scaledHeight).assertEqual(100);
      expect(offsetX).assertEqual(450);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0605 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0606
     * @tc.name      eraserCanvas0606
     * @tc.desc      1080x600 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0606', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0606 begin');
      const width: number = 1080;
      const height: number = 600;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(135);
      expect(scaledHeight).assertEqual(75);
      expect(offsetX).assertEqual(473);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0606 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0607
     * @tc.name      eraserCanvas0607
     * @tc.desc      1080x640 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0607', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0607 begin');
      const width: number = 1080;
      const height: number = 640;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(1080);
      expect(scaledHeight).assertEqual(640);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0607 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0608
     * @tc.name      eraserCanvas0608
     * @tc.desc      1080x640 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0608', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0608 begin');
      const width: number = 1080;
      const height: number = 640;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(540);
      expect(scaledHeight).assertEqual(320);
      expect(offsetX).assertEqual(270);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0608 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0609
     * @tc.name      eraserCanvas0609
     * @tc.desc      1080x640 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0609', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0609 begin');
      const width: number = 1080;
      const height: number = 640;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(360);
      expect(scaledHeight).assertEqual(213);
      expect(offsetX).assertEqual(360);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0609 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0610
     * @tc.name      eraserCanvas0610
     * @tc.desc      1080x640 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0610', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0610 begin');
      const width: number = 1080;
      const height: number = 640;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(270);
      expect(scaledHeight).assertEqual(160);
      expect(offsetX).assertEqual(405);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0610 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0611
     * @tc.name      eraserCanvas0611
     * @tc.desc      1080x640 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0611', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0611 begin');
      const width: number = 1080;
      const height: number = 640;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(180);
      expect(scaledHeight).assertEqual(107);
      expect(offsetX).assertEqual(450);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0611 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0612
     * @tc.name      eraserCanvas0612
     * @tc.desc      1080x640 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0612', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0612 begin');
      const width: number = 1080;
      const height: number = 640;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(135);
      expect(scaledHeight).assertEqual(80);
      expect(offsetX).assertEqual(473);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0612 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0613
     * @tc.name      eraserCanvas0613
     * @tc.desc      1080x720 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0613', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0613 begin');
      const width: number = 1080;
      const height: number = 720;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(1080);
      expect(scaledHeight).assertEqual(720);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0613 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0614
     * @tc.name      eraserCanvas0614
     * @tc.desc      1080x720 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0614', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0614 begin');
      const width: number = 1080;
      const height: number = 720;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(540);
      expect(scaledHeight).assertEqual(360);
      expect(offsetX).assertEqual(270);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0614 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0615
     * @tc.name      eraserCanvas0615
     * @tc.desc      1080x720 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0615', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0615 begin');
      const width: number = 1080;
      const height: number = 720;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(360);
      expect(scaledHeight).assertEqual(240);
      expect(offsetX).assertEqual(360);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0615 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0616
     * @tc.name      eraserCanvas0616
     * @tc.desc      1080x720 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0616', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0616 begin');
      const width: number = 1080;
      const height: number = 720;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(270);
      expect(scaledHeight).assertEqual(180);
      expect(offsetX).assertEqual(405);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0616 end');
    })
  })
}
