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

export default function eraserTraceMatrix5Test(): void {
  describe('EraserTraceMatrix5Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    ERASER_TRACE_0309
     * @tc.name      eraserTrace0309
     * @tc.desc      360x640 画布上 48 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0309 begin');
      const points: number = 48;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(47);
      expect(length).assertEqual(376);
      expect(inside).assertEqual(360);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0309 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0310
     * @tc.name      eraserTrace0310
     * @tc.desc      720x1280 画布上 48 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0310 begin');
      const points: number = 48;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(47);
      expect(length).assertEqual(376);
      expect(inside).assertEqual(376);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0310 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0311
     * @tc.name      eraserTrace0311
     * @tc.desc      1080x1920 画布上 48 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0311 begin');
      const points: number = 48;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(47);
      expect(length).assertEqual(376);
      expect(inside).assertEqual(376);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0311 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0312
     * @tc.name      eraserTrace0312
     * @tc.desc      512x512 画布上 48 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0312 begin');
      const points: number = 48;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(47);
      expect(length).assertEqual(376);
      expect(inside).assertEqual(376);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0312 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0313
     * @tc.name      eraserTrace0313
     * @tc.desc      360x640 画布上 48 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0313 begin');
      const points: number = 48;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(47);
      expect(length).assertEqual(564);
      expect(inside).assertEqual(360);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0313 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0314
     * @tc.name      eraserTrace0314
     * @tc.desc      720x1280 画布上 48 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0314 begin');
      const points: number = 48;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(47);
      expect(length).assertEqual(564);
      expect(inside).assertEqual(564);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0314 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0315
     * @tc.name      eraserTrace0315
     * @tc.desc      1080x1920 画布上 48 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0315 begin');
      const points: number = 48;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(47);
      expect(length).assertEqual(564);
      expect(inside).assertEqual(564);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0315 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0316
     * @tc.name      eraserTrace0316
     * @tc.desc      512x512 画布上 48 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0316 begin');
      const points: number = 48;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(47);
      expect(length).assertEqual(564);
      expect(inside).assertEqual(512);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0316 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0317
     * @tc.name      eraserTrace0317
     * @tc.desc      360x640 画布上 48 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0317 begin');
      const points: number = 48;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(47);
      expect(length).assertEqual(752);
      expect(inside).assertEqual(360);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0317 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0318
     * @tc.name      eraserTrace0318
     * @tc.desc      720x1280 画布上 48 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0318 begin');
      const points: number = 48;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(47);
      expect(length).assertEqual(752);
      expect(inside).assertEqual(720);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0318 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0319
     * @tc.name      eraserTrace0319
     * @tc.desc      1080x1920 画布上 48 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0319 begin');
      const points: number = 48;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(47);
      expect(length).assertEqual(752);
      expect(inside).assertEqual(752);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0319 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0320
     * @tc.name      eraserTrace0320
     * @tc.desc      512x512 画布上 48 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0320 begin');
      const points: number = 48;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(47);
      expect(length).assertEqual(752);
      expect(inside).assertEqual(512);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0320 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0321
     * @tc.name      eraserTrace0321
     * @tc.desc      360x640 画布上 56 个采样点间距 1 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0321 begin');
      const points: number = 56;
      const gap: number = 1;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(55);
      expect(length).assertEqual(55);
      expect(inside).assertEqual(55);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0321 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0322
     * @tc.name      eraserTrace0322
     * @tc.desc      720x1280 画布上 56 个采样点间距 1 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0322 begin');
      const points: number = 56;
      const gap: number = 1;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(55);
      expect(length).assertEqual(55);
      expect(inside).assertEqual(55);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0322 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0323
     * @tc.name      eraserTrace0323
     * @tc.desc      1080x1920 画布上 56 个采样点间距 1 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0323 begin');
      const points: number = 56;
      const gap: number = 1;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(55);
      expect(length).assertEqual(55);
      expect(inside).assertEqual(55);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0323 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0324
     * @tc.name      eraserTrace0324
     * @tc.desc      512x512 画布上 56 个采样点间距 1 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0324 begin');
      const points: number = 56;
      const gap: number = 1;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(55);
      expect(length).assertEqual(55);
      expect(inside).assertEqual(55);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0324 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0325
     * @tc.name      eraserTrace0325
     * @tc.desc      360x640 画布上 56 个采样点间距 2 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0325 begin');
      const points: number = 56;
      const gap: number = 2;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(55);
      expect(length).assertEqual(110);
      expect(inside).assertEqual(110);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0325 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0326
     * @tc.name      eraserTrace0326
     * @tc.desc      720x1280 画布上 56 个采样点间距 2 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0326 begin');
      const points: number = 56;
      const gap: number = 2;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(55);
      expect(length).assertEqual(110);
      expect(inside).assertEqual(110);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0326 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0327
     * @tc.name      eraserTrace0327
     * @tc.desc      1080x1920 画布上 56 个采样点间距 2 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0327 begin');
      const points: number = 56;
      const gap: number = 2;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(55);
      expect(length).assertEqual(110);
      expect(inside).assertEqual(110);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0327 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0328
     * @tc.name      eraserTrace0328
     * @tc.desc      512x512 画布上 56 个采样点间距 2 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0328 begin');
      const points: number = 56;
      const gap: number = 2;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(55);
      expect(length).assertEqual(110);
      expect(inside).assertEqual(110);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0328 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0329
     * @tc.name      eraserTrace0329
     * @tc.desc      360x640 画布上 56 个采样点间距 3 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0329 begin');
      const points: number = 56;
      const gap: number = 3;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(55);
      expect(length).assertEqual(165);
      expect(inside).assertEqual(165);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0329 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0330
     * @tc.name      eraserTrace0330
     * @tc.desc      720x1280 画布上 56 个采样点间距 3 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0330 begin');
      const points: number = 56;
      const gap: number = 3;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(55);
      expect(length).assertEqual(165);
      expect(inside).assertEqual(165);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0330 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0331
     * @tc.name      eraserTrace0331
     * @tc.desc      1080x1920 画布上 56 个采样点间距 3 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0331 begin');
      const points: number = 56;
      const gap: number = 3;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(55);
      expect(length).assertEqual(165);
      expect(inside).assertEqual(165);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0331 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0332
     * @tc.name      eraserTrace0332
     * @tc.desc      512x512 画布上 56 个采样点间距 3 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0332 begin');
      const points: number = 56;
      const gap: number = 3;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(55);
      expect(length).assertEqual(165);
      expect(inside).assertEqual(165);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0332 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0333
     * @tc.name      eraserTrace0333
     * @tc.desc      360x640 画布上 56 个采样点间距 4 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0333 begin');
      const points: number = 56;
      const gap: number = 4;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(55);
      expect(length).assertEqual(220);
      expect(inside).assertEqual(220);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0333 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0334
     * @tc.name      eraserTrace0334
     * @tc.desc      720x1280 画布上 56 个采样点间距 4 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0334 begin');
      const points: number = 56;
      const gap: number = 4;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(55);
      expect(length).assertEqual(220);
      expect(inside).assertEqual(220);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0334 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0335
     * @tc.name      eraserTrace0335
     * @tc.desc      1080x1920 画布上 56 个采样点间距 4 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0335 begin');
      const points: number = 56;
      const gap: number = 4;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(55);
      expect(length).assertEqual(220);
      expect(inside).assertEqual(220);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0335 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0336
     * @tc.name      eraserTrace0336
     * @tc.desc      512x512 画布上 56 个采样点间距 4 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0336 begin');
      const points: number = 56;
      const gap: number = 4;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(55);
      expect(length).assertEqual(220);
      expect(inside).assertEqual(220);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0336 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0337
     * @tc.name      eraserTrace0337
     * @tc.desc      360x640 画布上 56 个采样点间距 6 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0337 begin');
      const points: number = 56;
      const gap: number = 6;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(55);
      expect(length).assertEqual(330);
      expect(inside).assertEqual(330);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0337 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0338
     * @tc.name      eraserTrace0338
     * @tc.desc      720x1280 画布上 56 个采样点间距 6 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0338 begin');
      const points: number = 56;
      const gap: number = 6;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(55);
      expect(length).assertEqual(330);
      expect(inside).assertEqual(330);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0338 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0339
     * @tc.name      eraserTrace0339
     * @tc.desc      1080x1920 画布上 56 个采样点间距 6 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0339 begin');
      const points: number = 56;
      const gap: number = 6;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(55);
      expect(length).assertEqual(330);
      expect(inside).assertEqual(330);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0339 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0340
     * @tc.name      eraserTrace0340
     * @tc.desc      512x512 画布上 56 个采样点间距 6 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0340 begin');
      const points: number = 56;
      const gap: number = 6;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(55);
      expect(length).assertEqual(330);
      expect(inside).assertEqual(330);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0340 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0341
     * @tc.name      eraserTrace0341
     * @tc.desc      360x640 画布上 56 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0341', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0341 begin');
      const points: number = 56;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(55);
      expect(length).assertEqual(440);
      expect(inside).assertEqual(360);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0341 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0342
     * @tc.name      eraserTrace0342
     * @tc.desc      720x1280 画布上 56 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0342', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0342 begin');
      const points: number = 56;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(55);
      expect(length).assertEqual(440);
      expect(inside).assertEqual(440);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0342 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0343
     * @tc.name      eraserTrace0343
     * @tc.desc      1080x1920 画布上 56 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0343', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0343 begin');
      const points: number = 56;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(55);
      expect(length).assertEqual(440);
      expect(inside).assertEqual(440);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0343 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0344
     * @tc.name      eraserTrace0344
     * @tc.desc      512x512 画布上 56 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0344', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0344 begin');
      const points: number = 56;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(55);
      expect(length).assertEqual(440);
      expect(inside).assertEqual(440);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0344 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0345
     * @tc.name      eraserTrace0345
     * @tc.desc      360x640 画布上 56 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0345', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0345 begin');
      const points: number = 56;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(55);
      expect(length).assertEqual(660);
      expect(inside).assertEqual(360);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0345 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0346
     * @tc.name      eraserTrace0346
     * @tc.desc      720x1280 画布上 56 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0346', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0346 begin');
      const points: number = 56;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(55);
      expect(length).assertEqual(660);
      expect(inside).assertEqual(660);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0346 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0347
     * @tc.name      eraserTrace0347
     * @tc.desc      1080x1920 画布上 56 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0347', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0347 begin');
      const points: number = 56;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(55);
      expect(length).assertEqual(660);
      expect(inside).assertEqual(660);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0347 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0348
     * @tc.name      eraserTrace0348
     * @tc.desc      512x512 画布上 56 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0348', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0348 begin');
      const points: number = 56;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(55);
      expect(length).assertEqual(660);
      expect(inside).assertEqual(512);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0348 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0349
     * @tc.name      eraserTrace0349
     * @tc.desc      360x640 画布上 56 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0349', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0349 begin');
      const points: number = 56;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(55);
      expect(length).assertEqual(880);
      expect(inside).assertEqual(360);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0349 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0350
     * @tc.name      eraserTrace0350
     * @tc.desc      720x1280 画布上 56 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0350', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0350 begin');
      const points: number = 56;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(55);
      expect(length).assertEqual(880);
      expect(inside).assertEqual(720);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0350 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0351
     * @tc.name      eraserTrace0351
     * @tc.desc      1080x1920 画布上 56 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0351', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0351 begin');
      const points: number = 56;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(55);
      expect(length).assertEqual(880);
      expect(inside).assertEqual(880);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0351 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0352
     * @tc.name      eraserTrace0352
     * @tc.desc      512x512 画布上 56 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0352', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0352 begin');
      const points: number = 56;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(55);
      expect(length).assertEqual(880);
      expect(inside).assertEqual(512);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0352 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0353
     * @tc.name      eraserTrace0353
     * @tc.desc      360x640 画布上 64 个采样点间距 1 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0353', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0353 begin');
      const points: number = 64;
      const gap: number = 1;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(63);
      expect(length).assertEqual(63);
      expect(inside).assertEqual(63);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0353 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0354
     * @tc.name      eraserTrace0354
     * @tc.desc      720x1280 画布上 64 个采样点间距 1 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0354', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0354 begin');
      const points: number = 64;
      const gap: number = 1;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(63);
      expect(length).assertEqual(63);
      expect(inside).assertEqual(63);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0354 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0355
     * @tc.name      eraserTrace0355
     * @tc.desc      1080x1920 画布上 64 个采样点间距 1 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0355', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0355 begin');
      const points: number = 64;
      const gap: number = 1;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(63);
      expect(length).assertEqual(63);
      expect(inside).assertEqual(63);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0355 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0356
     * @tc.name      eraserTrace0356
     * @tc.desc      512x512 画布上 64 个采样点间距 1 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0356', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0356 begin');
      const points: number = 64;
      const gap: number = 1;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(63);
      expect(length).assertEqual(63);
      expect(inside).assertEqual(63);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0356 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0357
     * @tc.name      eraserTrace0357
     * @tc.desc      360x640 画布上 64 个采样点间距 2 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0357', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0357 begin');
      const points: number = 64;
      const gap: number = 2;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(63);
      expect(length).assertEqual(126);
      expect(inside).assertEqual(126);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0357 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0358
     * @tc.name      eraserTrace0358
     * @tc.desc      720x1280 画布上 64 个采样点间距 2 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0358', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0358 begin');
      const points: number = 64;
      const gap: number = 2;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(63);
      expect(length).assertEqual(126);
      expect(inside).assertEqual(126);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0358 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0359
     * @tc.name      eraserTrace0359
     * @tc.desc      1080x1920 画布上 64 个采样点间距 2 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0359', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0359 begin');
      const points: number = 64;
      const gap: number = 2;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(63);
      expect(length).assertEqual(126);
      expect(inside).assertEqual(126);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0359 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0360
     * @tc.name      eraserTrace0360
     * @tc.desc      512x512 画布上 64 个采样点间距 2 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0360', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0360 begin');
      const points: number = 64;
      const gap: number = 2;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(63);
      expect(length).assertEqual(126);
      expect(inside).assertEqual(126);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0360 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0361
     * @tc.name      eraserTrace0361
     * @tc.desc      360x640 画布上 64 个采样点间距 3 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0361', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0361 begin');
      const points: number = 64;
      const gap: number = 3;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(63);
      expect(length).assertEqual(189);
      expect(inside).assertEqual(189);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0361 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0362
     * @tc.name      eraserTrace0362
     * @tc.desc      720x1280 画布上 64 个采样点间距 3 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0362', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0362 begin');
      const points: number = 64;
      const gap: number = 3;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(63);
      expect(length).assertEqual(189);
      expect(inside).assertEqual(189);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0362 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0363
     * @tc.name      eraserTrace0363
     * @tc.desc      1080x1920 画布上 64 个采样点间距 3 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0363', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0363 begin');
      const points: number = 64;
      const gap: number = 3;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(63);
      expect(length).assertEqual(189);
      expect(inside).assertEqual(189);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0363 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0364
     * @tc.name      eraserTrace0364
     * @tc.desc      512x512 画布上 64 个采样点间距 3 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0364', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0364 begin');
      const points: number = 64;
      const gap: number = 3;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(63);
      expect(length).assertEqual(189);
      expect(inside).assertEqual(189);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0364 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0365
     * @tc.name      eraserTrace0365
     * @tc.desc      360x640 画布上 64 个采样点间距 4 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0365', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0365 begin');
      const points: number = 64;
      const gap: number = 4;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(63);
      expect(length).assertEqual(252);
      expect(inside).assertEqual(252);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0365 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0366
     * @tc.name      eraserTrace0366
     * @tc.desc      720x1280 画布上 64 个采样点间距 4 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0366', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0366 begin');
      const points: number = 64;
      const gap: number = 4;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(63);
      expect(length).assertEqual(252);
      expect(inside).assertEqual(252);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0366 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0367
     * @tc.name      eraserTrace0367
     * @tc.desc      1080x1920 画布上 64 个采样点间距 4 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0367', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0367 begin');
      const points: number = 64;
      const gap: number = 4;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(63);
      expect(length).assertEqual(252);
      expect(inside).assertEqual(252);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0367 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0368
     * @tc.name      eraserTrace0368
     * @tc.desc      512x512 画布上 64 个采样点间距 4 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0368', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0368 begin');
      const points: number = 64;
      const gap: number = 4;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(63);
      expect(length).assertEqual(252);
      expect(inside).assertEqual(252);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0368 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0369
     * @tc.name      eraserTrace0369
     * @tc.desc      360x640 画布上 64 个采样点间距 6 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0369', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0369 begin');
      const points: number = 64;
      const gap: number = 6;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(63);
      expect(length).assertEqual(378);
      expect(inside).assertEqual(360);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0369 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0370
     * @tc.name      eraserTrace0370
     * @tc.desc      720x1280 画布上 64 个采样点间距 6 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0370', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0370 begin');
      const points: number = 64;
      const gap: number = 6;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(63);
      expect(length).assertEqual(378);
      expect(inside).assertEqual(378);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0370 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0371
     * @tc.name      eraserTrace0371
     * @tc.desc      1080x1920 画布上 64 个采样点间距 6 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0371', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0371 begin');
      const points: number = 64;
      const gap: number = 6;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(63);
      expect(length).assertEqual(378);
      expect(inside).assertEqual(378);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0371 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0372
     * @tc.name      eraserTrace0372
     * @tc.desc      512x512 画布上 64 个采样点间距 6 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0372', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0372 begin');
      const points: number = 64;
      const gap: number = 6;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(63);
      expect(length).assertEqual(378);
      expect(inside).assertEqual(378);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0372 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0373
     * @tc.name      eraserTrace0373
     * @tc.desc      360x640 画布上 64 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0373', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0373 begin');
      const points: number = 64;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(63);
      expect(length).assertEqual(504);
      expect(inside).assertEqual(360);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0373 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0374
     * @tc.name      eraserTrace0374
     * @tc.desc      720x1280 画布上 64 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0374', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0374 begin');
      const points: number = 64;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(63);
      expect(length).assertEqual(504);
      expect(inside).assertEqual(504);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0374 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0375
     * @tc.name      eraserTrace0375
     * @tc.desc      1080x1920 画布上 64 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0375', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0375 begin');
      const points: number = 64;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(63);
      expect(length).assertEqual(504);
      expect(inside).assertEqual(504);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0375 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0376
     * @tc.name      eraserTrace0376
     * @tc.desc      512x512 画布上 64 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0376', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0376 begin');
      const points: number = 64;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(63);
      expect(length).assertEqual(504);
      expect(inside).assertEqual(504);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0376 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0377
     * @tc.name      eraserTrace0377
     * @tc.desc      360x640 画布上 64 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0377', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0377 begin');
      const points: number = 64;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(63);
      expect(length).assertEqual(756);
      expect(inside).assertEqual(360);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0377 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0378
     * @tc.name      eraserTrace0378
     * @tc.desc      720x1280 画布上 64 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0378', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0378 begin');
      const points: number = 64;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(63);
      expect(length).assertEqual(756);
      expect(inside).assertEqual(720);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0378 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0379
     * @tc.name      eraserTrace0379
     * @tc.desc      1080x1920 画布上 64 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0379', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0379 begin');
      const points: number = 64;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(63);
      expect(length).assertEqual(756);
      expect(inside).assertEqual(756);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0379 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0380
     * @tc.name      eraserTrace0380
     * @tc.desc      512x512 画布上 64 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0380', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0380 begin');
      const points: number = 64;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(63);
      expect(length).assertEqual(756);
      expect(inside).assertEqual(512);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0380 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0381
     * @tc.name      eraserTrace0381
     * @tc.desc      360x640 画布上 64 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0381', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0381 begin');
      const points: number = 64;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(63);
      expect(length).assertEqual(1008);
      expect(inside).assertEqual(360);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0381 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0382
     * @tc.name      eraserTrace0382
     * @tc.desc      720x1280 画布上 64 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0382', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0382 begin');
      const points: number = 64;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(63);
      expect(length).assertEqual(1008);
      expect(inside).assertEqual(720);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0382 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0383
     * @tc.name      eraserTrace0383
     * @tc.desc      1080x1920 画布上 64 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0383', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0383 begin');
      const points: number = 64;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(63);
      expect(length).assertEqual(1008);
      expect(inside).assertEqual(1008);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0383 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0384
     * @tc.name      eraserTrace0384
     * @tc.desc      512x512 画布上 64 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0384', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0384 begin');
      const points: number = 64;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(63);
      expect(length).assertEqual(1008);
      expect(inside).assertEqual(512);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0384 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0385
     * @tc.name      eraserTrace0385
     * @tc.desc      360x640 画布上 80 个采样点间距 1 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0385', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0385 begin');
      const points: number = 80;
      const gap: number = 1;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(79);
      expect(length).assertEqual(79);
      expect(inside).assertEqual(79);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0385 end');
    })
  })
}
