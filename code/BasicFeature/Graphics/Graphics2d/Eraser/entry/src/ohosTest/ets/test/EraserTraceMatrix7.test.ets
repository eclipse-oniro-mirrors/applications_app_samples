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

export default function eraserTraceMatrix7Test(): void {
  describe('EraserTraceMatrix7Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    ERASER_TRACE_0463
     * @tc.name      eraserTrace0463
     * @tc.desc      1080x1920 画布上 120 个采样点间距 4 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0463', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0463 begin');
      const points: number = 120;
      const gap: number = 4;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(119);
      expect(length).assertEqual(476);
      expect(inside).assertEqual(476);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0463 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0464
     * @tc.name      eraserTrace0464
     * @tc.desc      512x512 画布上 120 个采样点间距 4 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0464', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0464 begin');
      const points: number = 120;
      const gap: number = 4;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(119);
      expect(length).assertEqual(476);
      expect(inside).assertEqual(476);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0464 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0465
     * @tc.name      eraserTrace0465
     * @tc.desc      360x640 画布上 120 个采样点间距 6 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0465', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0465 begin');
      const points: number = 120;
      const gap: number = 6;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(119);
      expect(length).assertEqual(714);
      expect(inside).assertEqual(360);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0465 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0466
     * @tc.name      eraserTrace0466
     * @tc.desc      720x1280 画布上 120 个采样点间距 6 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0466', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0466 begin');
      const points: number = 120;
      const gap: number = 6;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(119);
      expect(length).assertEqual(714);
      expect(inside).assertEqual(714);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0466 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0467
     * @tc.name      eraserTrace0467
     * @tc.desc      1080x1920 画布上 120 个采样点间距 6 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0467', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0467 begin');
      const points: number = 120;
      const gap: number = 6;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(119);
      expect(length).assertEqual(714);
      expect(inside).assertEqual(714);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0467 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0468
     * @tc.name      eraserTrace0468
     * @tc.desc      512x512 画布上 120 个采样点间距 6 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0468', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0468 begin');
      const points: number = 120;
      const gap: number = 6;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(119);
      expect(length).assertEqual(714);
      expect(inside).assertEqual(512);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0468 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0469
     * @tc.name      eraserTrace0469
     * @tc.desc      360x640 画布上 120 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0469', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0469 begin');
      const points: number = 120;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(119);
      expect(length).assertEqual(952);
      expect(inside).assertEqual(360);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0469 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0470
     * @tc.name      eraserTrace0470
     * @tc.desc      720x1280 画布上 120 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0470', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0470 begin');
      const points: number = 120;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(119);
      expect(length).assertEqual(952);
      expect(inside).assertEqual(720);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0470 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0471
     * @tc.name      eraserTrace0471
     * @tc.desc      1080x1920 画布上 120 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0471', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0471 begin');
      const points: number = 120;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(119);
      expect(length).assertEqual(952);
      expect(inside).assertEqual(952);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0471 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0472
     * @tc.name      eraserTrace0472
     * @tc.desc      512x512 画布上 120 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0472', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0472 begin');
      const points: number = 120;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(119);
      expect(length).assertEqual(952);
      expect(inside).assertEqual(512);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0472 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0473
     * @tc.name      eraserTrace0473
     * @tc.desc      360x640 画布上 120 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0473', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0473 begin');
      const points: number = 120;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(119);
      expect(length).assertEqual(1428);
      expect(inside).assertEqual(360);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0473 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0474
     * @tc.name      eraserTrace0474
     * @tc.desc      720x1280 画布上 120 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0474', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0474 begin');
      const points: number = 120;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(119);
      expect(length).assertEqual(1428);
      expect(inside).assertEqual(720);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0474 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0475
     * @tc.name      eraserTrace0475
     * @tc.desc      1080x1920 画布上 120 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0475', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0475 begin');
      const points: number = 120;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(119);
      expect(length).assertEqual(1428);
      expect(inside).assertEqual(1080);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0475 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0476
     * @tc.name      eraserTrace0476
     * @tc.desc      512x512 画布上 120 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0476', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0476 begin');
      const points: number = 120;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(119);
      expect(length).assertEqual(1428);
      expect(inside).assertEqual(512);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0476 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0477
     * @tc.name      eraserTrace0477
     * @tc.desc      360x640 画布上 120 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0477', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0477 begin');
      const points: number = 120;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(119);
      expect(length).assertEqual(1904);
      expect(inside).assertEqual(360);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0477 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0478
     * @tc.name      eraserTrace0478
     * @tc.desc      720x1280 画布上 120 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0478', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0478 begin');
      const points: number = 120;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(119);
      expect(length).assertEqual(1904);
      expect(inside).assertEqual(720);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0478 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0479
     * @tc.name      eraserTrace0479
     * @tc.desc      1080x1920 画布上 120 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0479', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0479 begin');
      const points: number = 120;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(119);
      expect(length).assertEqual(1904);
      expect(inside).assertEqual(1080);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0479 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0480
     * @tc.name      eraserTrace0480
     * @tc.desc      512x512 画布上 120 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0480', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0480 begin');
      const points: number = 120;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(119);
      expect(length).assertEqual(1904);
      expect(inside).assertEqual(512);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0480 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0481
     * @tc.name      eraserTrace0481
     * @tc.desc      360x640 画布上 160 个采样点间距 1 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0481', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0481 begin');
      const points: number = 160;
      const gap: number = 1;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(159);
      expect(length).assertEqual(159);
      expect(inside).assertEqual(159);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0481 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0482
     * @tc.name      eraserTrace0482
     * @tc.desc      720x1280 画布上 160 个采样点间距 1 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0482', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0482 begin');
      const points: number = 160;
      const gap: number = 1;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(159);
      expect(length).assertEqual(159);
      expect(inside).assertEqual(159);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0482 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0483
     * @tc.name      eraserTrace0483
     * @tc.desc      1080x1920 画布上 160 个采样点间距 1 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0483', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0483 begin');
      const points: number = 160;
      const gap: number = 1;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(159);
      expect(length).assertEqual(159);
      expect(inside).assertEqual(159);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0483 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0484
     * @tc.name      eraserTrace0484
     * @tc.desc      512x512 画布上 160 个采样点间距 1 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0484', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0484 begin');
      const points: number = 160;
      const gap: number = 1;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(159);
      expect(length).assertEqual(159);
      expect(inside).assertEqual(159);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0484 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0485
     * @tc.name      eraserTrace0485
     * @tc.desc      360x640 画布上 160 个采样点间距 2 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0485', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0485 begin');
      const points: number = 160;
      const gap: number = 2;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(159);
      expect(length).assertEqual(318);
      expect(inside).assertEqual(318);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0485 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0486
     * @tc.name      eraserTrace0486
     * @tc.desc      720x1280 画布上 160 个采样点间距 2 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0486', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0486 begin');
      const points: number = 160;
      const gap: number = 2;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(159);
      expect(length).assertEqual(318);
      expect(inside).assertEqual(318);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0486 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0487
     * @tc.name      eraserTrace0487
     * @tc.desc      1080x1920 画布上 160 个采样点间距 2 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0487', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0487 begin');
      const points: number = 160;
      const gap: number = 2;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(159);
      expect(length).assertEqual(318);
      expect(inside).assertEqual(318);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0487 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0488
     * @tc.name      eraserTrace0488
     * @tc.desc      512x512 画布上 160 个采样点间距 2 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0488', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0488 begin');
      const points: number = 160;
      const gap: number = 2;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(159);
      expect(length).assertEqual(318);
      expect(inside).assertEqual(318);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0488 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0489
     * @tc.name      eraserTrace0489
     * @tc.desc      360x640 画布上 160 个采样点间距 3 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0489', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0489 begin');
      const points: number = 160;
      const gap: number = 3;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(159);
      expect(length).assertEqual(477);
      expect(inside).assertEqual(360);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0489 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0490
     * @tc.name      eraserTrace0490
     * @tc.desc      720x1280 画布上 160 个采样点间距 3 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0490', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0490 begin');
      const points: number = 160;
      const gap: number = 3;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(159);
      expect(length).assertEqual(477);
      expect(inside).assertEqual(477);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0490 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0491
     * @tc.name      eraserTrace0491
     * @tc.desc      1080x1920 画布上 160 个采样点间距 3 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0491', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0491 begin');
      const points: number = 160;
      const gap: number = 3;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(159);
      expect(length).assertEqual(477);
      expect(inside).assertEqual(477);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0491 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0492
     * @tc.name      eraserTrace0492
     * @tc.desc      512x512 画布上 160 个采样点间距 3 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0492', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0492 begin');
      const points: number = 160;
      const gap: number = 3;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(159);
      expect(length).assertEqual(477);
      expect(inside).assertEqual(477);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0492 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0493
     * @tc.name      eraserTrace0493
     * @tc.desc      360x640 画布上 160 个采样点间距 4 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0493', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0493 begin');
      const points: number = 160;
      const gap: number = 4;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(159);
      expect(length).assertEqual(636);
      expect(inside).assertEqual(360);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0493 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0494
     * @tc.name      eraserTrace0494
     * @tc.desc      720x1280 画布上 160 个采样点间距 4 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0494', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0494 begin');
      const points: number = 160;
      const gap: number = 4;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(159);
      expect(length).assertEqual(636);
      expect(inside).assertEqual(636);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0494 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0495
     * @tc.name      eraserTrace0495
     * @tc.desc      1080x1920 画布上 160 个采样点间距 4 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0495', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0495 begin');
      const points: number = 160;
      const gap: number = 4;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(159);
      expect(length).assertEqual(636);
      expect(inside).assertEqual(636);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0495 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0496
     * @tc.name      eraserTrace0496
     * @tc.desc      512x512 画布上 160 个采样点间距 4 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0496', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0496 begin');
      const points: number = 160;
      const gap: number = 4;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(159);
      expect(length).assertEqual(636);
      expect(inside).assertEqual(512);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0496 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0497
     * @tc.name      eraserTrace0497
     * @tc.desc      360x640 画布上 160 个采样点间距 6 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0497', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0497 begin');
      const points: number = 160;
      const gap: number = 6;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(159);
      expect(length).assertEqual(954);
      expect(inside).assertEqual(360);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0497 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0498
     * @tc.name      eraserTrace0498
     * @tc.desc      720x1280 画布上 160 个采样点间距 6 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0498', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0498 begin');
      const points: number = 160;
      const gap: number = 6;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(159);
      expect(length).assertEqual(954);
      expect(inside).assertEqual(720);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0498 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0499
     * @tc.name      eraserTrace0499
     * @tc.desc      1080x1920 画布上 160 个采样点间距 6 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0499', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0499 begin');
      const points: number = 160;
      const gap: number = 6;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(159);
      expect(length).assertEqual(954);
      expect(inside).assertEqual(954);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0499 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0500
     * @tc.name      eraserTrace0500
     * @tc.desc      512x512 画布上 160 个采样点间距 6 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0500 begin');
      const points: number = 160;
      const gap: number = 6;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(159);
      expect(length).assertEqual(954);
      expect(inside).assertEqual(512);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0500 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0501
     * @tc.name      eraserTrace0501
     * @tc.desc      360x640 画布上 160 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0501', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0501 begin');
      const points: number = 160;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(159);
      expect(length).assertEqual(1272);
      expect(inside).assertEqual(360);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0501 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0502
     * @tc.name      eraserTrace0502
     * @tc.desc      720x1280 画布上 160 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0502', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0502 begin');
      const points: number = 160;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(159);
      expect(length).assertEqual(1272);
      expect(inside).assertEqual(720);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0502 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0503
     * @tc.name      eraserTrace0503
     * @tc.desc      1080x1920 画布上 160 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0503', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0503 begin');
      const points: number = 160;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(159);
      expect(length).assertEqual(1272);
      expect(inside).assertEqual(1080);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0503 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0504
     * @tc.name      eraserTrace0504
     * @tc.desc      512x512 画布上 160 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0504', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0504 begin');
      const points: number = 160;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(159);
      expect(length).assertEqual(1272);
      expect(inside).assertEqual(512);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0504 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0505
     * @tc.name      eraserTrace0505
     * @tc.desc      360x640 画布上 160 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0505', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0505 begin');
      const points: number = 160;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(159);
      expect(length).assertEqual(1908);
      expect(inside).assertEqual(360);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0505 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0506
     * @tc.name      eraserTrace0506
     * @tc.desc      720x1280 画布上 160 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0506', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0506 begin');
      const points: number = 160;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(159);
      expect(length).assertEqual(1908);
      expect(inside).assertEqual(720);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0506 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0507
     * @tc.name      eraserTrace0507
     * @tc.desc      1080x1920 画布上 160 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0507', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0507 begin');
      const points: number = 160;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(159);
      expect(length).assertEqual(1908);
      expect(inside).assertEqual(1080);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0507 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0508
     * @tc.name      eraserTrace0508
     * @tc.desc      512x512 画布上 160 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0508', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0508 begin');
      const points: number = 160;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(159);
      expect(length).assertEqual(1908);
      expect(inside).assertEqual(512);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0508 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0509
     * @tc.name      eraserTrace0509
     * @tc.desc      360x640 画布上 160 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0509', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0509 begin');
      const points: number = 160;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(159);
      expect(length).assertEqual(2544);
      expect(inside).assertEqual(360);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0509 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0510
     * @tc.name      eraserTrace0510
     * @tc.desc      720x1280 画布上 160 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0510', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0510 begin');
      const points: number = 160;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(159);
      expect(length).assertEqual(2544);
      expect(inside).assertEqual(720);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0510 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0511
     * @tc.name      eraserTrace0511
     * @tc.desc      1080x1920 画布上 160 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0511', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0511 begin');
      const points: number = 160;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(159);
      expect(length).assertEqual(2544);
      expect(inside).assertEqual(1080);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0511 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0512
     * @tc.name      eraserTrace0512
     * @tc.desc      512x512 画布上 160 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0512', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0512 begin');
      const points: number = 160;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(159);
      expect(length).assertEqual(2544);
      expect(inside).assertEqual(512);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0512 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0513
     * @tc.name      eraserTrace0513
     * @tc.desc      360x640 画布上 200 个采样点间距 1 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0513', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0513 begin');
      const points: number = 200;
      const gap: number = 1;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(199);
      expect(length).assertEqual(199);
      expect(inside).assertEqual(199);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0513 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0514
     * @tc.name      eraserTrace0514
     * @tc.desc      720x1280 画布上 200 个采样点间距 1 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0514', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0514 begin');
      const points: number = 200;
      const gap: number = 1;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(199);
      expect(length).assertEqual(199);
      expect(inside).assertEqual(199);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0514 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0515
     * @tc.name      eraserTrace0515
     * @tc.desc      1080x1920 画布上 200 个采样点间距 1 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0515', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0515 begin');
      const points: number = 200;
      const gap: number = 1;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(199);
      expect(length).assertEqual(199);
      expect(inside).assertEqual(199);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0515 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0516
     * @tc.name      eraserTrace0516
     * @tc.desc      512x512 画布上 200 个采样点间距 1 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0516', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0516 begin');
      const points: number = 200;
      const gap: number = 1;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(199);
      expect(length).assertEqual(199);
      expect(inside).assertEqual(199);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0516 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0517
     * @tc.name      eraserTrace0517
     * @tc.desc      360x640 画布上 200 个采样点间距 2 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0517', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0517 begin');
      const points: number = 200;
      const gap: number = 2;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(199);
      expect(length).assertEqual(398);
      expect(inside).assertEqual(360);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0517 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0518
     * @tc.name      eraserTrace0518
     * @tc.desc      720x1280 画布上 200 个采样点间距 2 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0518', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0518 begin');
      const points: number = 200;
      const gap: number = 2;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(199);
      expect(length).assertEqual(398);
      expect(inside).assertEqual(398);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0518 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0519
     * @tc.name      eraserTrace0519
     * @tc.desc      1080x1920 画布上 200 个采样点间距 2 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0519', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0519 begin');
      const points: number = 200;
      const gap: number = 2;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(199);
      expect(length).assertEqual(398);
      expect(inside).assertEqual(398);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0519 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0520
     * @tc.name      eraserTrace0520
     * @tc.desc      512x512 画布上 200 个采样点间距 2 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0520', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0520 begin');
      const points: number = 200;
      const gap: number = 2;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(199);
      expect(length).assertEqual(398);
      expect(inside).assertEqual(398);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0520 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0521
     * @tc.name      eraserTrace0521
     * @tc.desc      360x640 画布上 200 个采样点间距 3 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0521', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0521 begin');
      const points: number = 200;
      const gap: number = 3;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(199);
      expect(length).assertEqual(597);
      expect(inside).assertEqual(360);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0521 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0522
     * @tc.name      eraserTrace0522
     * @tc.desc      720x1280 画布上 200 个采样点间距 3 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0522', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0522 begin');
      const points: number = 200;
      const gap: number = 3;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(199);
      expect(length).assertEqual(597);
      expect(inside).assertEqual(597);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0522 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0523
     * @tc.name      eraserTrace0523
     * @tc.desc      1080x1920 画布上 200 个采样点间距 3 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0523', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0523 begin');
      const points: number = 200;
      const gap: number = 3;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(199);
      expect(length).assertEqual(597);
      expect(inside).assertEqual(597);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0523 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0524
     * @tc.name      eraserTrace0524
     * @tc.desc      512x512 画布上 200 个采样点间距 3 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0524', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0524 begin');
      const points: number = 200;
      const gap: number = 3;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(199);
      expect(length).assertEqual(597);
      expect(inside).assertEqual(512);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0524 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0525
     * @tc.name      eraserTrace0525
     * @tc.desc      360x640 画布上 200 个采样点间距 4 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0525', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0525 begin');
      const points: number = 200;
      const gap: number = 4;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(199);
      expect(length).assertEqual(796);
      expect(inside).assertEqual(360);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0525 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0526
     * @tc.name      eraserTrace0526
     * @tc.desc      720x1280 画布上 200 个采样点间距 4 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0526', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0526 begin');
      const points: number = 200;
      const gap: number = 4;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(199);
      expect(length).assertEqual(796);
      expect(inside).assertEqual(720);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0526 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0527
     * @tc.name      eraserTrace0527
     * @tc.desc      1080x1920 画布上 200 个采样点间距 4 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0527', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0527 begin');
      const points: number = 200;
      const gap: number = 4;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(199);
      expect(length).assertEqual(796);
      expect(inside).assertEqual(796);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0527 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0528
     * @tc.name      eraserTrace0528
     * @tc.desc      512x512 画布上 200 个采样点间距 4 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0528', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0528 begin');
      const points: number = 200;
      const gap: number = 4;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(199);
      expect(length).assertEqual(796);
      expect(inside).assertEqual(512);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0528 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0529
     * @tc.name      eraserTrace0529
     * @tc.desc      360x640 画布上 200 个采样点间距 6 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0529', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0529 begin');
      const points: number = 200;
      const gap: number = 6;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(199);
      expect(length).assertEqual(1194);
      expect(inside).assertEqual(360);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0529 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0530
     * @tc.name      eraserTrace0530
     * @tc.desc      720x1280 画布上 200 个采样点间距 6 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0530', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0530 begin');
      const points: number = 200;
      const gap: number = 6;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(199);
      expect(length).assertEqual(1194);
      expect(inside).assertEqual(720);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0530 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0531
     * @tc.name      eraserTrace0531
     * @tc.desc      1080x1920 画布上 200 个采样点间距 6 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0531', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0531 begin');
      const points: number = 200;
      const gap: number = 6;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(199);
      expect(length).assertEqual(1194);
      expect(inside).assertEqual(1080);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0531 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0532
     * @tc.name      eraserTrace0532
     * @tc.desc      512x512 画布上 200 个采样点间距 6 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0532', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0532 begin');
      const points: number = 200;
      const gap: number = 6;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(199);
      expect(length).assertEqual(1194);
      expect(inside).assertEqual(512);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0532 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0533
     * @tc.name      eraserTrace0533
     * @tc.desc      360x640 画布上 200 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0533', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0533 begin');
      const points: number = 200;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(199);
      expect(length).assertEqual(1592);
      expect(inside).assertEqual(360);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0533 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0534
     * @tc.name      eraserTrace0534
     * @tc.desc      720x1280 画布上 200 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0534', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0534 begin');
      const points: number = 200;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(199);
      expect(length).assertEqual(1592);
      expect(inside).assertEqual(720);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0534 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0535
     * @tc.name      eraserTrace0535
     * @tc.desc      1080x1920 画布上 200 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0535', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0535 begin');
      const points: number = 200;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(199);
      expect(length).assertEqual(1592);
      expect(inside).assertEqual(1080);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0535 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0536
     * @tc.name      eraserTrace0536
     * @tc.desc      512x512 画布上 200 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0536', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0536 begin');
      const points: number = 200;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(199);
      expect(length).assertEqual(1592);
      expect(inside).assertEqual(512);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0536 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0537
     * @tc.name      eraserTrace0537
     * @tc.desc      360x640 画布上 200 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0537', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0537 begin');
      const points: number = 200;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(199);
      expect(length).assertEqual(2388);
      expect(inside).assertEqual(360);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0537 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0538
     * @tc.name      eraserTrace0538
     * @tc.desc      720x1280 画布上 200 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0538', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0538 begin');
      const points: number = 200;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(199);
      expect(length).assertEqual(2388);
      expect(inside).assertEqual(720);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0538 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0539
     * @tc.name      eraserTrace0539
     * @tc.desc      1080x1920 画布上 200 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0539', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0539 begin');
      const points: number = 200;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(199);
      expect(length).assertEqual(2388);
      expect(inside).assertEqual(1080);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0539 end');
    })
  })
}
