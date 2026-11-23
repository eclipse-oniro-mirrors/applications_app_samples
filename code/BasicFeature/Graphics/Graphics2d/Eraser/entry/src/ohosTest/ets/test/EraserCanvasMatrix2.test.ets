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

export default function eraserCanvasMatrix2Test(): void {
  describe('EraserCanvasMatrix2Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    ERASER_CANVAS_0078
     * @tc.name      eraserCanvas0078
     * @tc.desc      375x240 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0078 begin');
      const width: number = 375;
      const height: number = 240;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(47);
      expect(scaledHeight).assertEqual(30);
      expect(offsetX).assertEqual(164);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0078 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0079
     * @tc.name      eraserCanvas0079
     * @tc.desc      375x320 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0079 begin');
      const width: number = 375;
      const height: number = 320;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(375);
      expect(scaledHeight).assertEqual(320);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0079 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0080
     * @tc.name      eraserCanvas0080
     * @tc.desc      375x320 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0080 begin');
      const width: number = 375;
      const height: number = 320;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(188);
      expect(scaledHeight).assertEqual(160);
      expect(offsetX).assertEqual(94);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0080 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0081
     * @tc.name      eraserCanvas0081
     * @tc.desc      375x320 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0081 begin');
      const width: number = 375;
      const height: number = 320;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(125);
      expect(scaledHeight).assertEqual(107);
      expect(offsetX).assertEqual(125);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0081 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0082
     * @tc.name      eraserCanvas0082
     * @tc.desc      375x320 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0082 begin');
      const width: number = 375;
      const height: number = 320;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(94);
      expect(scaledHeight).assertEqual(80);
      expect(offsetX).assertEqual(141);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0082 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0083
     * @tc.name      eraserCanvas0083
     * @tc.desc      375x320 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0083 begin');
      const width: number = 375;
      const height: number = 320;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(63);
      expect(scaledHeight).assertEqual(53);
      expect(offsetX).assertEqual(156);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0083 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0084
     * @tc.name      eraserCanvas0084
     * @tc.desc      375x320 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0084 begin');
      const width: number = 375;
      const height: number = 320;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(47);
      expect(scaledHeight).assertEqual(40);
      expect(offsetX).assertEqual(164);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0084 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0085
     * @tc.name      eraserCanvas0085
     * @tc.desc      375x480 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0085 begin');
      const width: number = 375;
      const height: number = 480;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(375);
      expect(scaledHeight).assertEqual(480);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0085 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0086
     * @tc.name      eraserCanvas0086
     * @tc.desc      375x480 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0086 begin');
      const width: number = 375;
      const height: number = 480;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(188);
      expect(scaledHeight).assertEqual(240);
      expect(offsetX).assertEqual(94);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0086 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0087
     * @tc.name      eraserCanvas0087
     * @tc.desc      375x480 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0087 begin');
      const width: number = 375;
      const height: number = 480;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(125);
      expect(scaledHeight).assertEqual(160);
      expect(offsetX).assertEqual(125);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0087 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0088
     * @tc.name      eraserCanvas0088
     * @tc.desc      375x480 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0088 begin');
      const width: number = 375;
      const height: number = 480;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(94);
      expect(scaledHeight).assertEqual(120);
      expect(offsetX).assertEqual(141);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0088 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0089
     * @tc.name      eraserCanvas0089
     * @tc.desc      375x480 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0089 begin');
      const width: number = 375;
      const height: number = 480;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(63);
      expect(scaledHeight).assertEqual(80);
      expect(offsetX).assertEqual(156);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0089 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0090
     * @tc.name      eraserCanvas0090
     * @tc.desc      375x480 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0090 begin');
      const width: number = 375;
      const height: number = 480;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(47);
      expect(scaledHeight).assertEqual(60);
      expect(offsetX).assertEqual(164);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0090 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0091
     * @tc.name      eraserCanvas0091
     * @tc.desc      375x512 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0091 begin');
      const width: number = 375;
      const height: number = 512;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(375);
      expect(scaledHeight).assertEqual(512);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0091 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0092
     * @tc.name      eraserCanvas0092
     * @tc.desc      375x512 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0092 begin');
      const width: number = 375;
      const height: number = 512;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(188);
      expect(scaledHeight).assertEqual(256);
      expect(offsetX).assertEqual(94);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0092 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0093
     * @tc.name      eraserCanvas0093
     * @tc.desc      375x512 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0093 begin');
      const width: number = 375;
      const height: number = 512;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(125);
      expect(scaledHeight).assertEqual(171);
      expect(offsetX).assertEqual(125);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0093 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0094
     * @tc.name      eraserCanvas0094
     * @tc.desc      375x512 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0094 begin');
      const width: number = 375;
      const height: number = 512;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(94);
      expect(scaledHeight).assertEqual(128);
      expect(offsetX).assertEqual(141);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0094 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0095
     * @tc.name      eraserCanvas0095
     * @tc.desc      375x512 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0095 begin');
      const width: number = 375;
      const height: number = 512;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(63);
      expect(scaledHeight).assertEqual(85);
      expect(offsetX).assertEqual(156);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0095 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0096
     * @tc.name      eraserCanvas0096
     * @tc.desc      375x512 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0096 begin');
      const width: number = 375;
      const height: number = 512;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(47);
      expect(scaledHeight).assertEqual(64);
      expect(offsetX).assertEqual(164);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0096 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0097
     * @tc.name      eraserCanvas0097
     * @tc.desc      375x600 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0097 begin');
      const width: number = 375;
      const height: number = 600;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(375);
      expect(scaledHeight).assertEqual(600);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0097 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0098
     * @tc.name      eraserCanvas0098
     * @tc.desc      375x600 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0098 begin');
      const width: number = 375;
      const height: number = 600;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(188);
      expect(scaledHeight).assertEqual(300);
      expect(offsetX).assertEqual(94);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0098 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0099
     * @tc.name      eraserCanvas0099
     * @tc.desc      375x600 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0099 begin');
      const width: number = 375;
      const height: number = 600;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(125);
      expect(scaledHeight).assertEqual(200);
      expect(offsetX).assertEqual(125);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0099 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0100
     * @tc.name      eraserCanvas0100
     * @tc.desc      375x600 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0100 begin');
      const width: number = 375;
      const height: number = 600;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(94);
      expect(scaledHeight).assertEqual(150);
      expect(offsetX).assertEqual(141);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0100 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0101
     * @tc.name      eraserCanvas0101
     * @tc.desc      375x600 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0101 begin');
      const width: number = 375;
      const height: number = 600;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(63);
      expect(scaledHeight).assertEqual(100);
      expect(offsetX).assertEqual(156);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0101 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0102
     * @tc.name      eraserCanvas0102
     * @tc.desc      375x600 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0102 begin');
      const width: number = 375;
      const height: number = 600;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(47);
      expect(scaledHeight).assertEqual(75);
      expect(offsetX).assertEqual(164);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0102 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0103
     * @tc.name      eraserCanvas0103
     * @tc.desc      375x640 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0103 begin');
      const width: number = 375;
      const height: number = 640;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(375);
      expect(scaledHeight).assertEqual(640);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0103 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0104
     * @tc.name      eraserCanvas0104
     * @tc.desc      375x640 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0104 begin');
      const width: number = 375;
      const height: number = 640;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(188);
      expect(scaledHeight).assertEqual(320);
      expect(offsetX).assertEqual(94);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0104 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0105
     * @tc.name      eraserCanvas0105
     * @tc.desc      375x640 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0105 begin');
      const width: number = 375;
      const height: number = 640;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(125);
      expect(scaledHeight).assertEqual(213);
      expect(offsetX).assertEqual(125);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0105 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0106
     * @tc.name      eraserCanvas0106
     * @tc.desc      375x640 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0106 begin');
      const width: number = 375;
      const height: number = 640;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(94);
      expect(scaledHeight).assertEqual(160);
      expect(offsetX).assertEqual(141);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0106 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0107
     * @tc.name      eraserCanvas0107
     * @tc.desc      375x640 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0107 begin');
      const width: number = 375;
      const height: number = 640;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(63);
      expect(scaledHeight).assertEqual(107);
      expect(offsetX).assertEqual(156);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0107 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0108
     * @tc.name      eraserCanvas0108
     * @tc.desc      375x640 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0108 begin');
      const width: number = 375;
      const height: number = 640;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(47);
      expect(scaledHeight).assertEqual(80);
      expect(offsetX).assertEqual(164);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0108 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0109
     * @tc.name      eraserCanvas0109
     * @tc.desc      375x720 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0109 begin');
      const width: number = 375;
      const height: number = 720;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(375);
      expect(scaledHeight).assertEqual(720);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0109 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0110
     * @tc.name      eraserCanvas0110
     * @tc.desc      375x720 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0110 begin');
      const width: number = 375;
      const height: number = 720;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(188);
      expect(scaledHeight).assertEqual(360);
      expect(offsetX).assertEqual(94);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0110 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0111
     * @tc.name      eraserCanvas0111
     * @tc.desc      375x720 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0111 begin');
      const width: number = 375;
      const height: number = 720;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(125);
      expect(scaledHeight).assertEqual(240);
      expect(offsetX).assertEqual(125);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0111 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0112
     * @tc.name      eraserCanvas0112
     * @tc.desc      375x720 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0112 begin');
      const width: number = 375;
      const height: number = 720;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(94);
      expect(scaledHeight).assertEqual(180);
      expect(offsetX).assertEqual(141);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0112 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0113
     * @tc.name      eraserCanvas0113
     * @tc.desc      375x720 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0113 begin');
      const width: number = 375;
      const height: number = 720;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(63);
      expect(scaledHeight).assertEqual(120);
      expect(offsetX).assertEqual(156);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0113 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0114
     * @tc.name      eraserCanvas0114
     * @tc.desc      375x720 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0114 begin');
      const width: number = 375;
      const height: number = 720;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(47);
      expect(scaledHeight).assertEqual(90);
      expect(offsetX).assertEqual(164);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0114 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0115
     * @tc.name      eraserCanvas0115
     * @tc.desc      375x768 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0115 begin');
      const width: number = 375;
      const height: number = 768;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(375);
      expect(scaledHeight).assertEqual(768);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0115 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0116
     * @tc.name      eraserCanvas0116
     * @tc.desc      375x768 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0116 begin');
      const width: number = 375;
      const height: number = 768;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(188);
      expect(scaledHeight).assertEqual(384);
      expect(offsetX).assertEqual(94);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0116 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0117
     * @tc.name      eraserCanvas0117
     * @tc.desc      375x768 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0117 begin');
      const width: number = 375;
      const height: number = 768;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(125);
      expect(scaledHeight).assertEqual(256);
      expect(offsetX).assertEqual(125);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0117 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0118
     * @tc.name      eraserCanvas0118
     * @tc.desc      375x768 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0118 begin');
      const width: number = 375;
      const height: number = 768;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(94);
      expect(scaledHeight).assertEqual(192);
      expect(offsetX).assertEqual(141);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0118 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0119
     * @tc.name      eraserCanvas0119
     * @tc.desc      375x768 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0119 begin');
      const width: number = 375;
      const height: number = 768;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(63);
      expect(scaledHeight).assertEqual(128);
      expect(offsetX).assertEqual(156);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0119 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0120
     * @tc.name      eraserCanvas0120
     * @tc.desc      375x768 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0120 begin');
      const width: number = 375;
      const height: number = 768;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(47);
      expect(scaledHeight).assertEqual(96);
      expect(offsetX).assertEqual(164);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0120 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0121
     * @tc.name      eraserCanvas0121
     * @tc.desc      375x812 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0121 begin');
      const width: number = 375;
      const height: number = 812;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(375);
      expect(scaledHeight).assertEqual(812);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0121 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0122
     * @tc.name      eraserCanvas0122
     * @tc.desc      375x812 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0122 begin');
      const width: number = 375;
      const height: number = 812;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(188);
      expect(scaledHeight).assertEqual(406);
      expect(offsetX).assertEqual(94);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0122 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0123
     * @tc.name      eraserCanvas0123
     * @tc.desc      375x812 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0123 begin');
      const width: number = 375;
      const height: number = 812;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(125);
      expect(scaledHeight).assertEqual(271);
      expect(offsetX).assertEqual(125);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0123 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0124
     * @tc.name      eraserCanvas0124
     * @tc.desc      375x812 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0124 begin');
      const width: number = 375;
      const height: number = 812;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(94);
      expect(scaledHeight).assertEqual(203);
      expect(offsetX).assertEqual(141);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0124 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0125
     * @tc.name      eraserCanvas0125
     * @tc.desc      375x812 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0125 begin');
      const width: number = 375;
      const height: number = 812;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(63);
      expect(scaledHeight).assertEqual(135);
      expect(offsetX).assertEqual(156);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0125 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0126
     * @tc.name      eraserCanvas0126
     * @tc.desc      375x812 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0126 begin');
      const width: number = 375;
      const height: number = 812;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(47);
      expect(scaledHeight).assertEqual(102);
      expect(offsetX).assertEqual(164);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0126 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0127
     * @tc.name      eraserCanvas0127
     * @tc.desc      375x1080 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0127 begin');
      const width: number = 375;
      const height: number = 1080;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(375);
      expect(scaledHeight).assertEqual(1080);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0127 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0128
     * @tc.name      eraserCanvas0128
     * @tc.desc      375x1080 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0128 begin');
      const width: number = 375;
      const height: number = 1080;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(188);
      expect(scaledHeight).assertEqual(540);
      expect(offsetX).assertEqual(94);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0128 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0129
     * @tc.name      eraserCanvas0129
     * @tc.desc      375x1080 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0129 begin');
      const width: number = 375;
      const height: number = 1080;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(125);
      expect(scaledHeight).assertEqual(360);
      expect(offsetX).assertEqual(125);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0129 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0130
     * @tc.name      eraserCanvas0130
     * @tc.desc      375x1080 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0130 begin');
      const width: number = 375;
      const height: number = 1080;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(94);
      expect(scaledHeight).assertEqual(270);
      expect(offsetX).assertEqual(141);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0130 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0131
     * @tc.name      eraserCanvas0131
     * @tc.desc      375x1080 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0131 begin');
      const width: number = 375;
      const height: number = 1080;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(63);
      expect(scaledHeight).assertEqual(180);
      expect(offsetX).assertEqual(156);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0131 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0132
     * @tc.name      eraserCanvas0132
     * @tc.desc      375x1080 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0132 begin');
      const width: number = 375;
      const height: number = 1080;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(47);
      expect(scaledHeight).assertEqual(135);
      expect(offsetX).assertEqual(164);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0132 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0133
     * @tc.name      eraserCanvas0133
     * @tc.desc      375x1280 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0133 begin');
      const width: number = 375;
      const height: number = 1280;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(375);
      expect(scaledHeight).assertEqual(1280);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0133 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0134
     * @tc.name      eraserCanvas0134
     * @tc.desc      375x1280 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0134 begin');
      const width: number = 375;
      const height: number = 1280;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(188);
      expect(scaledHeight).assertEqual(640);
      expect(offsetX).assertEqual(94);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0134 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0135
     * @tc.name      eraserCanvas0135
     * @tc.desc      375x1280 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0135 begin');
      const width: number = 375;
      const height: number = 1280;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(125);
      expect(scaledHeight).assertEqual(427);
      expect(offsetX).assertEqual(125);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0135 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0136
     * @tc.name      eraserCanvas0136
     * @tc.desc      375x1280 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0136 begin');
      const width: number = 375;
      const height: number = 1280;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(94);
      expect(scaledHeight).assertEqual(320);
      expect(offsetX).assertEqual(141);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0136 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0137
     * @tc.name      eraserCanvas0137
     * @tc.desc      375x1280 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0137 begin');
      const width: number = 375;
      const height: number = 1280;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(63);
      expect(scaledHeight).assertEqual(213);
      expect(offsetX).assertEqual(156);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0137 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0138
     * @tc.name      eraserCanvas0138
     * @tc.desc      375x1280 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0138 begin');
      const width: number = 375;
      const height: number = 1280;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(47);
      expect(scaledHeight).assertEqual(160);
      expect(offsetX).assertEqual(164);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0138 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0139
     * @tc.name      eraserCanvas0139
     * @tc.desc      375x2560 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0139 begin');
      const width: number = 375;
      const height: number = 2560;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(375);
      expect(scaledHeight).assertEqual(2560);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0139 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0140
     * @tc.name      eraserCanvas0140
     * @tc.desc      375x2560 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0140 begin');
      const width: number = 375;
      const height: number = 2560;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(188);
      expect(scaledHeight).assertEqual(1280);
      expect(offsetX).assertEqual(94);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0140 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0141
     * @tc.name      eraserCanvas0141
     * @tc.desc      375x2560 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0141 begin');
      const width: number = 375;
      const height: number = 2560;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(125);
      expect(scaledHeight).assertEqual(853);
      expect(offsetX).assertEqual(125);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0141 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0142
     * @tc.name      eraserCanvas0142
     * @tc.desc      375x2560 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0142 begin');
      const width: number = 375;
      const height: number = 2560;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(94);
      expect(scaledHeight).assertEqual(640);
      expect(offsetX).assertEqual(141);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0142 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0143
     * @tc.name      eraserCanvas0143
     * @tc.desc      375x2560 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0143 begin');
      const width: number = 375;
      const height: number = 2560;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(63);
      expect(scaledHeight).assertEqual(427);
      expect(offsetX).assertEqual(156);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0143 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0144
     * @tc.name      eraserCanvas0144
     * @tc.desc      375x2560 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0144 begin');
      const width: number = 375;
      const height: number = 2560;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(47);
      expect(scaledHeight).assertEqual(320);
      expect(offsetX).assertEqual(164);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0144 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0145
     * @tc.name      eraserCanvas0145
     * @tc.desc      480x240 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0145 begin');
      const width: number = 480;
      const height: number = 240;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(480);
      expect(scaledHeight).assertEqual(240);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0145 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0146
     * @tc.name      eraserCanvas0146
     * @tc.desc      480x240 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0146 begin');
      const width: number = 480;
      const height: number = 240;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(240);
      expect(scaledHeight).assertEqual(120);
      expect(offsetX).assertEqual(120);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0146 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0147
     * @tc.name      eraserCanvas0147
     * @tc.desc      480x240 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0147 begin');
      const width: number = 480;
      const height: number = 240;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(160);
      expect(scaledHeight).assertEqual(80);
      expect(offsetX).assertEqual(160);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0147 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0148
     * @tc.name      eraserCanvas0148
     * @tc.desc      480x240 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0148 begin');
      const width: number = 480;
      const height: number = 240;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(120);
      expect(scaledHeight).assertEqual(60);
      expect(offsetX).assertEqual(180);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0148 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0149
     * @tc.name      eraserCanvas0149
     * @tc.desc      480x240 画布按 1/6 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0149 begin');
      const width: number = 480;
      const height: number = 240;
      const scaledWidth: number = Math.round(width / 6);
      const scaledHeight: number = Math.round(height / 6);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(80);
      expect(scaledHeight).assertEqual(40);
      expect(offsetX).assertEqual(200);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0149 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0150
     * @tc.name      eraserCanvas0150
     * @tc.desc      480x240 画布按 1/8 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0150 begin');
      const width: number = 480;
      const height: number = 240;
      const scaledWidth: number = Math.round(width / 8);
      const scaledHeight: number = Math.round(height / 8);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(60);
      expect(scaledHeight).assertEqual(30);
      expect(offsetX).assertEqual(210);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0150 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0151
     * @tc.name      eraserCanvas0151
     * @tc.desc      480x320 画布按 1/1 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0151 begin');
      const width: number = 480;
      const height: number = 320;
      const scaledWidth: number = Math.round(width / 1);
      const scaledHeight: number = Math.round(height / 1);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(480);
      expect(scaledHeight).assertEqual(320);
      expect(offsetX).assertEqual(0);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0151 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0152
     * @tc.name      eraserCanvas0152
     * @tc.desc      480x320 画布按 1/2 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0152 begin');
      const width: number = 480;
      const height: number = 320;
      const scaledWidth: number = Math.round(width / 2);
      const scaledHeight: number = Math.round(height / 2);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(240);
      expect(scaledHeight).assertEqual(160);
      expect(offsetX).assertEqual(120);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0152 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0153
     * @tc.name      eraserCanvas0153
     * @tc.desc      480x320 画布按 1/3 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0153 begin');
      const width: number = 480;
      const height: number = 320;
      const scaledWidth: number = Math.round(width / 3);
      const scaledHeight: number = Math.round(height / 3);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(160);
      expect(scaledHeight).assertEqual(107);
      expect(offsetX).assertEqual(160);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0153 end');
    })

    /**
     * @tc.number    ERASER_CANVAS_0154
     * @tc.name      eraserCanvas0154
     * @tc.desc      480x320 画布按 1/4 缩放的尺寸与居中偏移推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserCanvas0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0154 begin');
      const width: number = 480;
      const height: number = 320;
      const scaledWidth: number = Math.round(width / 4);
      const scaledHeight: number = Math.round(height / 4);
      const offsetX: number = Math.round((width - scaledWidth) / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'w=' + scaledWidth + ' h=' + scaledHeight);
      expect(scaledWidth).assertEqual(120);
      expect(scaledHeight).assertEqual(80);
      expect(offsetX).assertEqual(180);
      expect(offsetX + scaledWidth <= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserCanvas0154 end');
    })
  })
}
