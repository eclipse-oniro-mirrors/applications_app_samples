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

export default function eraserCanvasMatrix11Test(): void {
  describe('EraserCanvasMatrix11Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    ERASER_CANVAS_0771
     * @tc.name      eraserCanvas0771
     * @tc.desc      1440x812 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0771', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0771 begin');
      const width: number = 1440;
      const height: number = 812;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(480);
      expect(scaledHeight).assertEqual(271);
      expect(offsetX).assertEqual(480);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0771 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0772
     * @tc.name      eraserCanvas0772
     * @tc.desc      1440x812 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0772', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0772 begin');
      const width: number = 1440;
      const height: number = 812;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(360);
      expect(scaledHeight).assertEqual(203);
      expect(offsetX).assertEqual(540);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0772 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0773
     * @tc.name      eraserCanvas0773
     * @tc.desc      1440x812 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0773', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0773 begin');
      const width: number = 1440;
      const height: number = 812;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(240);
      expect(scaledHeight).assertEqual(135);
      expect(offsetX).assertEqual(600);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0773 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0774
     * @tc.name      eraserCanvas0774
     * @tc.desc      1440x812 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0774', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0774 begin');
      const width: number = 1440;
      const height: number = 812;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(180);
      expect(scaledHeight).assertEqual(102);
      expect(offsetX).assertEqual(630);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0774 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0775
     * @tc.name      eraserCanvas0775
     * @tc.desc      1440x1080 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0775', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0775 begin');
      const width: number = 1440;
      const height: number = 1080;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(1440);
      expect(scaledHeight).assertEqual(1080);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0775 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0776
     * @tc.name      eraserCanvas0776
     * @tc.desc      1440x1080 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0776', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0776 begin');
      const width: number = 1440;
      const height: number = 1080;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(720);
      expect(scaledHeight).assertEqual(540);
      expect(offsetX).assertEqual(360);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0776 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0777
     * @tc.name      eraserCanvas0777
     * @tc.desc      1440x1080 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0777', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0777 begin');
      const width: number = 1440;
      const height: number = 1080;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(480);
      expect(scaledHeight).assertEqual(360);
      expect(offsetX).assertEqual(480);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0777 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0778
     * @tc.name      eraserCanvas0778
     * @tc.desc      1440x1080 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0778', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0778 begin');
      const width: number = 1440;
      const height: number = 1080;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(360);
      expect(scaledHeight).assertEqual(270);
      expect(offsetX).assertEqual(540);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0778 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0779
     * @tc.name      eraserCanvas0779
     * @tc.desc      1440x1080 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0779', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0779 begin');
      const width: number = 1440;
      const height: number = 1080;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(240);
      expect(scaledHeight).assertEqual(180);
      expect(offsetX).assertEqual(600);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0779 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0780
     * @tc.name      eraserCanvas0780
     * @tc.desc      1440x1080 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0780', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0780 begin');
      const width: number = 1440;
      const height: number = 1080;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(180);
      expect(scaledHeight).assertEqual(135);
      expect(offsetX).assertEqual(630);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0780 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0781
     * @tc.name      eraserCanvas0781
     * @tc.desc      1440x1280 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0781', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0781 begin');
      const width: number = 1440;
      const height: number = 1280;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(1440);
      expect(scaledHeight).assertEqual(1280);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0781 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0782
     * @tc.name      eraserCanvas0782
     * @tc.desc      1440x1280 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0782', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0782 begin');
      const width: number = 1440;
      const height: number = 1280;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(720);
      expect(scaledHeight).assertEqual(640);
      expect(offsetX).assertEqual(360);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0782 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0783
     * @tc.name      eraserCanvas0783
     * @tc.desc      1440x1280 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0783', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0783 begin');
      const width: number = 1440;
      const height: number = 1280;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(480);
      expect(scaledHeight).assertEqual(427);
      expect(offsetX).assertEqual(480);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0783 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0784
     * @tc.name      eraserCanvas0784
     * @tc.desc      1440x1280 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0784', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0784 begin');
      const width: number = 1440;
      const height: number = 1280;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(360);
      expect(scaledHeight).assertEqual(320);
      expect(offsetX).assertEqual(540);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0784 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0785
     * @tc.name      eraserCanvas0785
     * @tc.desc      1440x1280 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0785', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0785 begin');
      const width: number = 1440;
      const height: number = 1280;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(240);
      expect(scaledHeight).assertEqual(213);
      expect(offsetX).assertEqual(600);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0785 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0786
     * @tc.name      eraserCanvas0786
     * @tc.desc      1440x1280 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0786', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0786 begin');
      const width: number = 1440;
      const height: number = 1280;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(180);
      expect(scaledHeight).assertEqual(160);
      expect(offsetX).assertEqual(630);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0786 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0787
     * @tc.name      eraserCanvas0787
     * @tc.desc      1440x2560 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0787', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0787 begin');
      const width: number = 1440;
      const height: number = 2560;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(1440);
      expect(scaledHeight).assertEqual(2560);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0787 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0788
     * @tc.name      eraserCanvas0788
     * @tc.desc      1440x2560 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0788', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0788 begin');
      const width: number = 1440;
      const height: number = 2560;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(720);
      expect(scaledHeight).assertEqual(1280);
      expect(offsetX).assertEqual(360);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0788 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0789
     * @tc.name      eraserCanvas0789
     * @tc.desc      1440x2560 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0789', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0789 begin');
      const width: number = 1440;
      const height: number = 2560;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(480);
      expect(scaledHeight).assertEqual(853);
      expect(offsetX).assertEqual(480);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0789 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0790
     * @tc.name      eraserCanvas0790
     * @tc.desc      1440x2560 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0790', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0790 begin');
      const width: number = 1440;
      const height: number = 2560;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(360);
      expect(scaledHeight).assertEqual(640);
      expect(offsetX).assertEqual(540);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0790 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0791
     * @tc.name      eraserCanvas0791
     * @tc.desc      1440x2560 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0791', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0791 begin');
      const width: number = 1440;
      const height: number = 2560;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(240);
      expect(scaledHeight).assertEqual(427);
      expect(offsetX).assertEqual(600);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0791 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0792
     * @tc.name      eraserCanvas0792
     * @tc.desc      1440x2560 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0792', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0792 begin');
      const width: number = 1440;
      const height: number = 2560;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(180);
      expect(scaledHeight).assertEqual(320);
      expect(offsetX).assertEqual(630);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0792 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0793
     * @tc.name      eraserCanvas0793
     * @tc.desc      1920x240 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0793', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0793 begin');
      const width: number = 1920;
      const height: number = 240;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(1920);
      expect(scaledHeight).assertEqual(240);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0793 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0794
     * @tc.name      eraserCanvas0794
     * @tc.desc      1920x240 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0794', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0794 begin');
      const width: number = 1920;
      const height: number = 240;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(960);
      expect(scaledHeight).assertEqual(120);
      expect(offsetX).assertEqual(480);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0794 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0795
     * @tc.name      eraserCanvas0795
     * @tc.desc      1920x240 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0795', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0795 begin');
      const width: number = 1920;
      const height: number = 240;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(640);
      expect(scaledHeight).assertEqual(80);
      expect(offsetX).assertEqual(640);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0795 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0796
     * @tc.name      eraserCanvas0796
     * @tc.desc      1920x240 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0796', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0796 begin');
      const width: number = 1920;
      const height: number = 240;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(480);
      expect(scaledHeight).assertEqual(60);
      expect(offsetX).assertEqual(720);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0796 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0797
     * @tc.name      eraserCanvas0797
     * @tc.desc      1920x240 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0797', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0797 begin');
      const width: number = 1920;
      const height: number = 240;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(320);
      expect(scaledHeight).assertEqual(40);
      expect(offsetX).assertEqual(800);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0797 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0798
     * @tc.name      eraserCanvas0798
     * @tc.desc      1920x240 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0798', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0798 begin');
      const width: number = 1920;
      const height: number = 240;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(240);
      expect(scaledHeight).assertEqual(30);
      expect(offsetX).assertEqual(840);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0798 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0799
     * @tc.name      eraserCanvas0799
     * @tc.desc      1920x320 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0799', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0799 begin');
      const width: number = 1920;
      const height: number = 320;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(1920);
      expect(scaledHeight).assertEqual(320);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0799 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0800
     * @tc.name      eraserCanvas0800
     * @tc.desc      1920x320 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0800 begin');
      const width: number = 1920;
      const height: number = 320;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(960);
      expect(scaledHeight).assertEqual(160);
      expect(offsetX).assertEqual(480);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0800 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0801
     * @tc.name      eraserCanvas0801
     * @tc.desc      1920x320 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0801', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0801 begin');
      const width: number = 1920;
      const height: number = 320;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(640);
      expect(scaledHeight).assertEqual(107);
      expect(offsetX).assertEqual(640);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0801 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0802
     * @tc.name      eraserCanvas0802
     * @tc.desc      1920x320 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0802', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0802 begin');
      const width: number = 1920;
      const height: number = 320;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(480);
      expect(scaledHeight).assertEqual(80);
      expect(offsetX).assertEqual(720);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0802 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0803
     * @tc.name      eraserCanvas0803
     * @tc.desc      1920x320 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0803', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0803 begin');
      const width: number = 1920;
      const height: number = 320;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(320);
      expect(scaledHeight).assertEqual(53);
      expect(offsetX).assertEqual(800);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0803 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0804
     * @tc.name      eraserCanvas0804
     * @tc.desc      1920x320 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0804', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0804 begin');
      const width: number = 1920;
      const height: number = 320;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(240);
      expect(scaledHeight).assertEqual(40);
      expect(offsetX).assertEqual(840);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0804 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0805
     * @tc.name      eraserCanvas0805
     * @tc.desc      1920x480 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0805', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0805 begin');
      const width: number = 1920;
      const height: number = 480;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(1920);
      expect(scaledHeight).assertEqual(480);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0805 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0806
     * @tc.name      eraserCanvas0806
     * @tc.desc      1920x480 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0806', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0806 begin');
      const width: number = 1920;
      const height: number = 480;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(960);
      expect(scaledHeight).assertEqual(240);
      expect(offsetX).assertEqual(480);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0806 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0807
     * @tc.name      eraserCanvas0807
     * @tc.desc      1920x480 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0807', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0807 begin');
      const width: number = 1920;
      const height: number = 480;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(640);
      expect(scaledHeight).assertEqual(160);
      expect(offsetX).assertEqual(640);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0807 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0808
     * @tc.name      eraserCanvas0808
     * @tc.desc      1920x480 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0808', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0808 begin');
      const width: number = 1920;
      const height: number = 480;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(480);
      expect(scaledHeight).assertEqual(120);
      expect(offsetX).assertEqual(720);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0808 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0809
     * @tc.name      eraserCanvas0809
     * @tc.desc      1920x480 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0809', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0809 begin');
      const width: number = 1920;
      const height: number = 480;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(320);
      expect(scaledHeight).assertEqual(80);
      expect(offsetX).assertEqual(800);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0809 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0810
     * @tc.name      eraserCanvas0810
     * @tc.desc      1920x480 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0810', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0810 begin');
      const width: number = 1920;
      const height: number = 480;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(240);
      expect(scaledHeight).assertEqual(60);
      expect(offsetX).assertEqual(840);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0810 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0811
     * @tc.name      eraserCanvas0811
     * @tc.desc      1920x512 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0811', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0811 begin');
      const width: number = 1920;
      const height: number = 512;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(1920);
      expect(scaledHeight).assertEqual(512);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0811 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0812
     * @tc.name      eraserCanvas0812
     * @tc.desc      1920x512 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0812', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0812 begin');
      const width: number = 1920;
      const height: number = 512;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(960);
      expect(scaledHeight).assertEqual(256);
      expect(offsetX).assertEqual(480);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0812 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0813
     * @tc.name      eraserCanvas0813
     * @tc.desc      1920x512 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0813', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0813 begin');
      const width: number = 1920;
      const height: number = 512;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(640);
      expect(scaledHeight).assertEqual(171);
      expect(offsetX).assertEqual(640);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0813 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0814
     * @tc.name      eraserCanvas0814
     * @tc.desc      1920x512 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0814', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0814 begin');
      const width: number = 1920;
      const height: number = 512;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(480);
      expect(scaledHeight).assertEqual(128);
      expect(offsetX).assertEqual(720);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0814 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0815
     * @tc.name      eraserCanvas0815
     * @tc.desc      1920x512 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0815', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0815 begin');
      const width: number = 1920;
      const height: number = 512;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(320);
      expect(scaledHeight).assertEqual(85);
      expect(offsetX).assertEqual(800);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0815 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0816
     * @tc.name      eraserCanvas0816
     * @tc.desc      1920x512 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0816', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0816 begin');
      const width: number = 1920;
      const height: number = 512;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(240);
      expect(scaledHeight).assertEqual(64);
      expect(offsetX).assertEqual(840);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0816 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0817
     * @tc.name      eraserCanvas0817
     * @tc.desc      1920x600 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0817', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0817 begin');
      const width: number = 1920;
      const height: number = 600;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(1920);
      expect(scaledHeight).assertEqual(600);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0817 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0818
     * @tc.name      eraserCanvas0818
     * @tc.desc      1920x600 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0818', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0818 begin');
      const width: number = 1920;
      const height: number = 600;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(960);
      expect(scaledHeight).assertEqual(300);
      expect(offsetX).assertEqual(480);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0818 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0819
     * @tc.name      eraserCanvas0819
     * @tc.desc      1920x600 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0819', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0819 begin');
      const width: number = 1920;
      const height: number = 600;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(640);
      expect(scaledHeight).assertEqual(200);
      expect(offsetX).assertEqual(640);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0819 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0820
     * @tc.name      eraserCanvas0820
     * @tc.desc      1920x600 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0820', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0820 begin');
      const width: number = 1920;
      const height: number = 600;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(480);
      expect(scaledHeight).assertEqual(150);
      expect(offsetX).assertEqual(720);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0820 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0821
     * @tc.name      eraserCanvas0821
     * @tc.desc      1920x600 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0821', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0821 begin');
      const width: number = 1920;
      const height: number = 600;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(320);
      expect(scaledHeight).assertEqual(100);
      expect(offsetX).assertEqual(800);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0821 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0822
     * @tc.name      eraserCanvas0822
     * @tc.desc      1920x600 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0822', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0822 begin');
      const width: number = 1920;
      const height: number = 600;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(240);
      expect(scaledHeight).assertEqual(75);
      expect(offsetX).assertEqual(840);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0822 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0823
     * @tc.name      eraserCanvas0823
     * @tc.desc      1920x640 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0823', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0823 begin');
      const width: number = 1920;
      const height: number = 640;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(1920);
      expect(scaledHeight).assertEqual(640);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0823 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0824
     * @tc.name      eraserCanvas0824
     * @tc.desc      1920x640 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0824', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0824 begin');
      const width: number = 1920;
      const height: number = 640;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(960);
      expect(scaledHeight).assertEqual(320);
      expect(offsetX).assertEqual(480);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0824 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0825
     * @tc.name      eraserCanvas0825
     * @tc.desc      1920x640 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0825', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0825 begin');
      const width: number = 1920;
      const height: number = 640;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(640);
      expect(scaledHeight).assertEqual(213);
      expect(offsetX).assertEqual(640);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0825 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0826
     * @tc.name      eraserCanvas0826
     * @tc.desc      1920x640 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0826', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0826 begin');
      const width: number = 1920;
      const height: number = 640;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(480);
      expect(scaledHeight).assertEqual(160);
      expect(offsetX).assertEqual(720);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0826 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0827
     * @tc.name      eraserCanvas0827
     * @tc.desc      1920x640 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0827', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0827 begin');
      const width: number = 1920;
      const height: number = 640;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(320);
      expect(scaledHeight).assertEqual(107);
      expect(offsetX).assertEqual(800);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0827 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0828
     * @tc.name      eraserCanvas0828
     * @tc.desc      1920x640 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0828', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0828 begin');
      const width: number = 1920;
      const height: number = 640;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(240);
      expect(scaledHeight).assertEqual(80);
      expect(offsetX).assertEqual(840);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0828 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0829
     * @tc.name      eraserCanvas0829
     * @tc.desc      1920x720 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0829', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0829 begin');
      const width: number = 1920;
      const height: number = 720;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(1920);
      expect(scaledHeight).assertEqual(720);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0829 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0830
     * @tc.name      eraserCanvas0830
     * @tc.desc      1920x720 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0830', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0830 begin');
      const width: number = 1920;
      const height: number = 720;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(960);
      expect(scaledHeight).assertEqual(360);
      expect(offsetX).assertEqual(480);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0830 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0831
     * @tc.name      eraserCanvas0831
     * @tc.desc      1920x720 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0831', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0831 begin');
      const width: number = 1920;
      const height: number = 720;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(640);
      expect(scaledHeight).assertEqual(240);
      expect(offsetX).assertEqual(640);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0831 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0832
     * @tc.name      eraserCanvas0832
     * @tc.desc      1920x720 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0832', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0832 begin');
      const width: number = 1920;
      const height: number = 720;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(480);
      expect(scaledHeight).assertEqual(180);
      expect(offsetX).assertEqual(720);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0832 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0833
     * @tc.name      eraserCanvas0833
     * @tc.desc      1920x720 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0833', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0833 begin');
      const width: number = 1920;
      const height: number = 720;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(320);
      expect(scaledHeight).assertEqual(120);
      expect(offsetX).assertEqual(800);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0833 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0834
     * @tc.name      eraserCanvas0834
     * @tc.desc      1920x720 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0834', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0834 begin');
      const width: number = 1920;
      const height: number = 720;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(240);
      expect(scaledHeight).assertEqual(90);
      expect(offsetX).assertEqual(840);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0834 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0835
     * @tc.name      eraserCanvas0835
     * @tc.desc      1920x768 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0835', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0835 begin');
      const width: number = 1920;
      const height: number = 768;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(1920);
      expect(scaledHeight).assertEqual(768);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0835 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0836
     * @tc.name      eraserCanvas0836
     * @tc.desc      1920x768 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0836', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0836 begin');
      const width: number = 1920;
      const height: number = 768;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(960);
      expect(scaledHeight).assertEqual(384);
      expect(offsetX).assertEqual(480);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0836 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0837
     * @tc.name      eraserCanvas0837
     * @tc.desc      1920x768 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0837', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0837 begin');
      const width: number = 1920;
      const height: number = 768;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(640);
      expect(scaledHeight).assertEqual(256);
      expect(offsetX).assertEqual(640);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0837 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0838
     * @tc.name      eraserCanvas0838
     * @tc.desc      1920x768 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0838', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0838 begin');
      const width: number = 1920;
      const height: number = 768;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(480);
      expect(scaledHeight).assertEqual(192);
      expect(offsetX).assertEqual(720);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0838 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0839
     * @tc.name      eraserCanvas0839
     * @tc.desc      1920x768 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0839', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0839 begin');
      const width: number = 1920;
      const height: number = 768;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(320);
      expect(scaledHeight).assertEqual(128);
      expect(offsetX).assertEqual(800);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0839 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0840
     * @tc.name      eraserCanvas0840
     * @tc.desc      1920x768 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0840', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0840 begin');
      const width: number = 1920;
      const height: number = 768;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(240);
      expect(scaledHeight).assertEqual(96);
      expect(offsetX).assertEqual(840);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0840 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0841
     * @tc.name      eraserCanvas0841
     * @tc.desc      1920x812 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0841', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0841 begin');
      const width: number = 1920;
      const height: number = 812;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(1920);
      expect(scaledHeight).assertEqual(812);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0841 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0842
     * @tc.name      eraserCanvas0842
     * @tc.desc      1920x812 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0842', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0842 begin');
      const width: number = 1920;
      const height: number = 812;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(960);
      expect(scaledHeight).assertEqual(406);
      expect(offsetX).assertEqual(480);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0842 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0843
     * @tc.name      eraserCanvas0843
     * @tc.desc      1920x812 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0843', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0843 begin');
      const width: number = 1920;
      const height: number = 812;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(640);
      expect(scaledHeight).assertEqual(271);
      expect(offsetX).assertEqual(640);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0843 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0844
     * @tc.name      eraserCanvas0844
     * @tc.desc      1920x812 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0844', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0844 begin');
      const width: number = 1920;
      const height: number = 812;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(480);
      expect(scaledHeight).assertEqual(203);
      expect(offsetX).assertEqual(720);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0844 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0845
     * @tc.name      eraserCanvas0845
     * @tc.desc      1920x812 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0845', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0845 begin');
      const width: number = 1920;
      const height: number = 812;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(320);
      expect(scaledHeight).assertEqual(135);
      expect(offsetX).assertEqual(800);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0845 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0846
     * @tc.name      eraserCanvas0846
     * @tc.desc      1920x812 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0846', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0846 begin');
      const width: number = 1920;
      const height: number = 812;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(240);
      expect(scaledHeight).assertEqual(102);
      expect(offsetX).assertEqual(840);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0846 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0847
     * @tc.name      eraserCanvas0847
     * @tc.desc      1920x1080 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0847', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0847 begin');
      const width: number = 1920;
      const height: number = 1080;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(1920);
      expect(scaledHeight).assertEqual(1080);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0847 end');
    })
  })
}
