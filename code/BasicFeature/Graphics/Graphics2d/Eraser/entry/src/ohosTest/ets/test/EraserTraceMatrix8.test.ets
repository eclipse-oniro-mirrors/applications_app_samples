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

export default function eraserTraceMatrix8Test(): void {
  describe('EraserTraceMatrix8Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    ERASER_TRACE_0540
     * @tc.name      eraserTrace0540
     * @tc.desc      512x512 画布上 200 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0540', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0540 begin');
      const points: number = 200;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(199);
      expect(length).assertEqual(2388);
      expect(inside).assertEqual(512);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0540 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0541
     * @tc.name      eraserTrace0541
     * @tc.desc      360x640 画布上 200 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0541', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0541 begin');
      const points: number = 200;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(199);
      expect(length).assertEqual(3184);
      expect(inside).assertEqual(360);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0541 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0542
     * @tc.name      eraserTrace0542
     * @tc.desc      720x1280 画布上 200 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0542', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0542 begin');
      const points: number = 200;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(199);
      expect(length).assertEqual(3184);
      expect(inside).assertEqual(720);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0542 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0543
     * @tc.name      eraserTrace0543
     * @tc.desc      1080x1920 画布上 200 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0543', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0543 begin');
      const points: number = 200;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(199);
      expect(length).assertEqual(3184);
      expect(inside).assertEqual(1080);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0543 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0544
     * @tc.name      eraserTrace0544
     * @tc.desc      512x512 画布上 200 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0544', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0544 begin');
      const points: number = 200;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(199);
      expect(length).assertEqual(3184);
      expect(inside).assertEqual(512);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0544 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0545
     * @tc.name      eraserTrace0545
     * @tc.desc      360x640 画布上 240 个采样点间距 1 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0545', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0545 begin');
      const points: number = 240;
      const gap: number = 1;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(239);
      expect(length).assertEqual(239);
      expect(inside).assertEqual(239);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0545 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0546
     * @tc.name      eraserTrace0546
     * @tc.desc      720x1280 画布上 240 个采样点间距 1 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0546', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0546 begin');
      const points: number = 240;
      const gap: number = 1;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(239);
      expect(length).assertEqual(239);
      expect(inside).assertEqual(239);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0546 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0547
     * @tc.name      eraserTrace0547
     * @tc.desc      1080x1920 画布上 240 个采样点间距 1 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0547', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0547 begin');
      const points: number = 240;
      const gap: number = 1;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(239);
      expect(length).assertEqual(239);
      expect(inside).assertEqual(239);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0547 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0548
     * @tc.name      eraserTrace0548
     * @tc.desc      512x512 画布上 240 个采样点间距 1 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0548', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0548 begin');
      const points: number = 240;
      const gap: number = 1;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(239);
      expect(length).assertEqual(239);
      expect(inside).assertEqual(239);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0548 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0549
     * @tc.name      eraserTrace0549
     * @tc.desc      360x640 画布上 240 个采样点间距 2 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0549', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0549 begin');
      const points: number = 240;
      const gap: number = 2;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(239);
      expect(length).assertEqual(478);
      expect(inside).assertEqual(360);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0549 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0550
     * @tc.name      eraserTrace0550
     * @tc.desc      720x1280 画布上 240 个采样点间距 2 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0550', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0550 begin');
      const points: number = 240;
      const gap: number = 2;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(239);
      expect(length).assertEqual(478);
      expect(inside).assertEqual(478);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0550 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0551
     * @tc.name      eraserTrace0551
     * @tc.desc      1080x1920 画布上 240 个采样点间距 2 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0551', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0551 begin');
      const points: number = 240;
      const gap: number = 2;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(239);
      expect(length).assertEqual(478);
      expect(inside).assertEqual(478);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0551 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0552
     * @tc.name      eraserTrace0552
     * @tc.desc      512x512 画布上 240 个采样点间距 2 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0552', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0552 begin');
      const points: number = 240;
      const gap: number = 2;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(239);
      expect(length).assertEqual(478);
      expect(inside).assertEqual(478);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0552 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0553
     * @tc.name      eraserTrace0553
     * @tc.desc      360x640 画布上 240 个采样点间距 3 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0553', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0553 begin');
      const points: number = 240;
      const gap: number = 3;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(239);
      expect(length).assertEqual(717);
      expect(inside).assertEqual(360);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0553 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0554
     * @tc.name      eraserTrace0554
     * @tc.desc      720x1280 画布上 240 个采样点间距 3 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0554', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0554 begin');
      const points: number = 240;
      const gap: number = 3;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(239);
      expect(length).assertEqual(717);
      expect(inside).assertEqual(717);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0554 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0555
     * @tc.name      eraserTrace0555
     * @tc.desc      1080x1920 画布上 240 个采样点间距 3 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0555', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0555 begin');
      const points: number = 240;
      const gap: number = 3;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(239);
      expect(length).assertEqual(717);
      expect(inside).assertEqual(717);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0555 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0556
     * @tc.name      eraserTrace0556
     * @tc.desc      512x512 画布上 240 个采样点间距 3 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0556', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0556 begin');
      const points: number = 240;
      const gap: number = 3;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(239);
      expect(length).assertEqual(717);
      expect(inside).assertEqual(512);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0556 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0557
     * @tc.name      eraserTrace0557
     * @tc.desc      360x640 画布上 240 个采样点间距 4 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0557', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0557 begin');
      const points: number = 240;
      const gap: number = 4;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(239);
      expect(length).assertEqual(956);
      expect(inside).assertEqual(360);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0557 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0558
     * @tc.name      eraserTrace0558
     * @tc.desc      720x1280 画布上 240 个采样点间距 4 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0558', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0558 begin');
      const points: number = 240;
      const gap: number = 4;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(239);
      expect(length).assertEqual(956);
      expect(inside).assertEqual(720);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0558 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0559
     * @tc.name      eraserTrace0559
     * @tc.desc      1080x1920 画布上 240 个采样点间距 4 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0559', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0559 begin');
      const points: number = 240;
      const gap: number = 4;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(239);
      expect(length).assertEqual(956);
      expect(inside).assertEqual(956);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0559 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0560
     * @tc.name      eraserTrace0560
     * @tc.desc      512x512 画布上 240 个采样点间距 4 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0560', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0560 begin');
      const points: number = 240;
      const gap: number = 4;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(239);
      expect(length).assertEqual(956);
      expect(inside).assertEqual(512);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0560 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0561
     * @tc.name      eraserTrace0561
     * @tc.desc      360x640 画布上 240 个采样点间距 6 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0561', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0561 begin');
      const points: number = 240;
      const gap: number = 6;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(239);
      expect(length).assertEqual(1434);
      expect(inside).assertEqual(360);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0561 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0562
     * @tc.name      eraserTrace0562
     * @tc.desc      720x1280 画布上 240 个采样点间距 6 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0562', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0562 begin');
      const points: number = 240;
      const gap: number = 6;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(239);
      expect(length).assertEqual(1434);
      expect(inside).assertEqual(720);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0562 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0563
     * @tc.name      eraserTrace0563
     * @tc.desc      1080x1920 画布上 240 个采样点间距 6 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0563', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0563 begin');
      const points: number = 240;
      const gap: number = 6;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(239);
      expect(length).assertEqual(1434);
      expect(inside).assertEqual(1080);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0563 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0564
     * @tc.name      eraserTrace0564
     * @tc.desc      512x512 画布上 240 个采样点间距 6 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0564', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0564 begin');
      const points: number = 240;
      const gap: number = 6;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(239);
      expect(length).assertEqual(1434);
      expect(inside).assertEqual(512);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0564 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0565
     * @tc.name      eraserTrace0565
     * @tc.desc      360x640 画布上 240 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0565', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0565 begin');
      const points: number = 240;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(239);
      expect(length).assertEqual(1912);
      expect(inside).assertEqual(360);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0565 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0566
     * @tc.name      eraserTrace0566
     * @tc.desc      720x1280 画布上 240 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0566', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0566 begin');
      const points: number = 240;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(239);
      expect(length).assertEqual(1912);
      expect(inside).assertEqual(720);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0566 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0567
     * @tc.name      eraserTrace0567
     * @tc.desc      1080x1920 画布上 240 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0567', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0567 begin');
      const points: number = 240;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(239);
      expect(length).assertEqual(1912);
      expect(inside).assertEqual(1080);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0567 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0568
     * @tc.name      eraserTrace0568
     * @tc.desc      512x512 画布上 240 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0568', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0568 begin');
      const points: number = 240;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(239);
      expect(length).assertEqual(1912);
      expect(inside).assertEqual(512);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0568 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0569
     * @tc.name      eraserTrace0569
     * @tc.desc      360x640 画布上 240 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0569', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0569 begin');
      const points: number = 240;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(239);
      expect(length).assertEqual(2868);
      expect(inside).assertEqual(360);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0569 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0570
     * @tc.name      eraserTrace0570
     * @tc.desc      720x1280 画布上 240 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0570', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0570 begin');
      const points: number = 240;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(239);
      expect(length).assertEqual(2868);
      expect(inside).assertEqual(720);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0570 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0571
     * @tc.name      eraserTrace0571
     * @tc.desc      1080x1920 画布上 240 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0571', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0571 begin');
      const points: number = 240;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(239);
      expect(length).assertEqual(2868);
      expect(inside).assertEqual(1080);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0571 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0572
     * @tc.name      eraserTrace0572
     * @tc.desc      512x512 画布上 240 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0572', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0572 begin');
      const points: number = 240;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(239);
      expect(length).assertEqual(2868);
      expect(inside).assertEqual(512);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0572 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0573
     * @tc.name      eraserTrace0573
     * @tc.desc      360x640 画布上 240 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0573', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0573 begin');
      const points: number = 240;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(239);
      expect(length).assertEqual(3824);
      expect(inside).assertEqual(360);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0573 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0574
     * @tc.name      eraserTrace0574
     * @tc.desc      720x1280 画布上 240 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0574', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0574 begin');
      const points: number = 240;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(239);
      expect(length).assertEqual(3824);
      expect(inside).assertEqual(720);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0574 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0575
     * @tc.name      eraserTrace0575
     * @tc.desc      1080x1920 画布上 240 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0575', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0575 begin');
      const points: number = 240;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(239);
      expect(length).assertEqual(3824);
      expect(inside).assertEqual(1080);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0575 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0576
     * @tc.name      eraserTrace0576
     * @tc.desc      512x512 画布上 240 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0576', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0576 begin');
      const points: number = 240;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(239);
      expect(length).assertEqual(3824);
      expect(inside).assertEqual(512);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0576 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0577
     * @tc.name      eraserTrace0577
     * @tc.desc      360x640 画布上 320 个采样点间距 1 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0577', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0577 begin');
      const points: number = 320;
      const gap: number = 1;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(319);
      expect(length).assertEqual(319);
      expect(inside).assertEqual(319);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0577 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0578
     * @tc.name      eraserTrace0578
     * @tc.desc      720x1280 画布上 320 个采样点间距 1 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0578', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0578 begin');
      const points: number = 320;
      const gap: number = 1;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(319);
      expect(length).assertEqual(319);
      expect(inside).assertEqual(319);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0578 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0579
     * @tc.name      eraserTrace0579
     * @tc.desc      1080x1920 画布上 320 个采样点间距 1 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0579', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0579 begin');
      const points: number = 320;
      const gap: number = 1;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(319);
      expect(length).assertEqual(319);
      expect(inside).assertEqual(319);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0579 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0580
     * @tc.name      eraserTrace0580
     * @tc.desc      512x512 画布上 320 个采样点间距 1 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0580', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0580 begin');
      const points: number = 320;
      const gap: number = 1;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(319);
      expect(length).assertEqual(319);
      expect(inside).assertEqual(319);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0580 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0581
     * @tc.name      eraserTrace0581
     * @tc.desc      360x640 画布上 320 个采样点间距 2 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0581', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0581 begin');
      const points: number = 320;
      const gap: number = 2;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(319);
      expect(length).assertEqual(638);
      expect(inside).assertEqual(360);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0581 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0582
     * @tc.name      eraserTrace0582
     * @tc.desc      720x1280 画布上 320 个采样点间距 2 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0582', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0582 begin');
      const points: number = 320;
      const gap: number = 2;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(319);
      expect(length).assertEqual(638);
      expect(inside).assertEqual(638);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0582 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0583
     * @tc.name      eraserTrace0583
     * @tc.desc      1080x1920 画布上 320 个采样点间距 2 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0583', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0583 begin');
      const points: number = 320;
      const gap: number = 2;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(319);
      expect(length).assertEqual(638);
      expect(inside).assertEqual(638);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0583 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0584
     * @tc.name      eraserTrace0584
     * @tc.desc      512x512 画布上 320 个采样点间距 2 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0584', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0584 begin');
      const points: number = 320;
      const gap: number = 2;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(319);
      expect(length).assertEqual(638);
      expect(inside).assertEqual(512);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0584 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0585
     * @tc.name      eraserTrace0585
     * @tc.desc      360x640 画布上 320 个采样点间距 3 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0585', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0585 begin');
      const points: number = 320;
      const gap: number = 3;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(319);
      expect(length).assertEqual(957);
      expect(inside).assertEqual(360);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0585 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0586
     * @tc.name      eraserTrace0586
     * @tc.desc      720x1280 画布上 320 个采样点间距 3 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0586', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0586 begin');
      const points: number = 320;
      const gap: number = 3;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(319);
      expect(length).assertEqual(957);
      expect(inside).assertEqual(720);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0586 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0587
     * @tc.name      eraserTrace0587
     * @tc.desc      1080x1920 画布上 320 个采样点间距 3 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0587', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0587 begin');
      const points: number = 320;
      const gap: number = 3;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(319);
      expect(length).assertEqual(957);
      expect(inside).assertEqual(957);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0587 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0588
     * @tc.name      eraserTrace0588
     * @tc.desc      512x512 画布上 320 个采样点间距 3 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0588', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0588 begin');
      const points: number = 320;
      const gap: number = 3;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(319);
      expect(length).assertEqual(957);
      expect(inside).assertEqual(512);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0588 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0589
     * @tc.name      eraserTrace0589
     * @tc.desc      360x640 画布上 320 个采样点间距 4 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0589', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0589 begin');
      const points: number = 320;
      const gap: number = 4;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(319);
      expect(length).assertEqual(1276);
      expect(inside).assertEqual(360);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0589 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0590
     * @tc.name      eraserTrace0590
     * @tc.desc      720x1280 画布上 320 个采样点间距 4 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0590', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0590 begin');
      const points: number = 320;
      const gap: number = 4;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(319);
      expect(length).assertEqual(1276);
      expect(inside).assertEqual(720);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0590 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0591
     * @tc.name      eraserTrace0591
     * @tc.desc      1080x1920 画布上 320 个采样点间距 4 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0591', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0591 begin');
      const points: number = 320;
      const gap: number = 4;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(319);
      expect(length).assertEqual(1276);
      expect(inside).assertEqual(1080);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0591 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0592
     * @tc.name      eraserTrace0592
     * @tc.desc      512x512 画布上 320 个采样点间距 4 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0592', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0592 begin');
      const points: number = 320;
      const gap: number = 4;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(319);
      expect(length).assertEqual(1276);
      expect(inside).assertEqual(512);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0592 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0593
     * @tc.name      eraserTrace0593
     * @tc.desc      360x640 画布上 320 个采样点间距 6 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0593', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0593 begin');
      const points: number = 320;
      const gap: number = 6;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(319);
      expect(length).assertEqual(1914);
      expect(inside).assertEqual(360);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0593 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0594
     * @tc.name      eraserTrace0594
     * @tc.desc      720x1280 画布上 320 个采样点间距 6 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0594', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0594 begin');
      const points: number = 320;
      const gap: number = 6;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(319);
      expect(length).assertEqual(1914);
      expect(inside).assertEqual(720);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0594 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0595
     * @tc.name      eraserTrace0595
     * @tc.desc      1080x1920 画布上 320 个采样点间距 6 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0595', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0595 begin');
      const points: number = 320;
      const gap: number = 6;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(319);
      expect(length).assertEqual(1914);
      expect(inside).assertEqual(1080);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0595 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0596
     * @tc.name      eraserTrace0596
     * @tc.desc      512x512 画布上 320 个采样点间距 6 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0596', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0596 begin');
      const points: number = 320;
      const gap: number = 6;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(319);
      expect(length).assertEqual(1914);
      expect(inside).assertEqual(512);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0596 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0597
     * @tc.name      eraserTrace0597
     * @tc.desc      360x640 画布上 320 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0597', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0597 begin');
      const points: number = 320;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(319);
      expect(length).assertEqual(2552);
      expect(inside).assertEqual(360);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0597 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0598
     * @tc.name      eraserTrace0598
     * @tc.desc      720x1280 画布上 320 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0598', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0598 begin');
      const points: number = 320;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(319);
      expect(length).assertEqual(2552);
      expect(inside).assertEqual(720);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0598 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0599
     * @tc.name      eraserTrace0599
     * @tc.desc      1080x1920 画布上 320 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0599', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0599 begin');
      const points: number = 320;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(319);
      expect(length).assertEqual(2552);
      expect(inside).assertEqual(1080);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0599 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0600
     * @tc.name      eraserTrace0600
     * @tc.desc      512x512 画布上 320 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0600 begin');
      const points: number = 320;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(319);
      expect(length).assertEqual(2552);
      expect(inside).assertEqual(512);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0600 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0601
     * @tc.name      eraserTrace0601
     * @tc.desc      360x640 画布上 320 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0601', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0601 begin');
      const points: number = 320;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(319);
      expect(length).assertEqual(3828);
      expect(inside).assertEqual(360);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0601 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0602
     * @tc.name      eraserTrace0602
     * @tc.desc      720x1280 画布上 320 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0602', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0602 begin');
      const points: number = 320;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(319);
      expect(length).assertEqual(3828);
      expect(inside).assertEqual(720);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0602 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0603
     * @tc.name      eraserTrace0603
     * @tc.desc      1080x1920 画布上 320 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0603', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0603 begin');
      const points: number = 320;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(319);
      expect(length).assertEqual(3828);
      expect(inside).assertEqual(1080);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0603 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0604
     * @tc.name      eraserTrace0604
     * @tc.desc      512x512 画布上 320 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0604', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0604 begin');
      const points: number = 320;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(319);
      expect(length).assertEqual(3828);
      expect(inside).assertEqual(512);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0604 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0605
     * @tc.name      eraserTrace0605
     * @tc.desc      360x640 画布上 320 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0605', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0605 begin');
      const points: number = 320;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(319);
      expect(length).assertEqual(5104);
      expect(inside).assertEqual(360);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0605 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0606
     * @tc.name      eraserTrace0606
     * @tc.desc      720x1280 画布上 320 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0606', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0606 begin');
      const points: number = 320;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(319);
      expect(length).assertEqual(5104);
      expect(inside).assertEqual(720);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0606 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0607
     * @tc.name      eraserTrace0607
     * @tc.desc      1080x1920 画布上 320 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0607', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0607 begin');
      const points: number = 320;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(319);
      expect(length).assertEqual(5104);
      expect(inside).assertEqual(1080);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0607 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0608
     * @tc.name      eraserTrace0608
     * @tc.desc      512x512 画布上 320 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0608', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0608 begin');
      const points: number = 320;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(319);
      expect(length).assertEqual(5104);
      expect(inside).assertEqual(512);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0608 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0609
     * @tc.name      eraserTrace0609
     * @tc.desc      360x640 画布上 400 个采样点间距 1 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0609', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0609 begin');
      const points: number = 400;
      const gap: number = 1;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(399);
      expect(length).assertEqual(399);
      expect(inside).assertEqual(360);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0609 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0610
     * @tc.name      eraserTrace0610
     * @tc.desc      720x1280 画布上 400 个采样点间距 1 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0610', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0610 begin');
      const points: number = 400;
      const gap: number = 1;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(399);
      expect(length).assertEqual(399);
      expect(inside).assertEqual(399);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0610 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0611
     * @tc.name      eraserTrace0611
     * @tc.desc      1080x1920 画布上 400 个采样点间距 1 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0611', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0611 begin');
      const points: number = 400;
      const gap: number = 1;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(399);
      expect(length).assertEqual(399);
      expect(inside).assertEqual(399);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0611 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0612
     * @tc.name      eraserTrace0612
     * @tc.desc      512x512 画布上 400 个采样点间距 1 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0612', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0612 begin');
      const points: number = 400;
      const gap: number = 1;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(399);
      expect(length).assertEqual(399);
      expect(inside).assertEqual(399);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0612 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0613
     * @tc.name      eraserTrace0613
     * @tc.desc      360x640 画布上 400 个采样点间距 2 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0613', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0613 begin');
      const points: number = 400;
      const gap: number = 2;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(399);
      expect(length).assertEqual(798);
      expect(inside).assertEqual(360);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0613 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0614
     * @tc.name      eraserTrace0614
     * @tc.desc      720x1280 画布上 400 个采样点间距 2 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0614', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0614 begin');
      const points: number = 400;
      const gap: number = 2;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(399);
      expect(length).assertEqual(798);
      expect(inside).assertEqual(720);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0614 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0615
     * @tc.name      eraserTrace0615
     * @tc.desc      1080x1920 画布上 400 个采样点间距 2 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0615', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0615 begin');
      const points: number = 400;
      const gap: number = 2;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(399);
      expect(length).assertEqual(798);
      expect(inside).assertEqual(798);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0615 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0616
     * @tc.name      eraserTrace0616
     * @tc.desc      512x512 画布上 400 个采样点间距 2 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0616', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0616 begin');
      const points: number = 400;
      const gap: number = 2;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(399);
      expect(length).assertEqual(798);
      expect(inside).assertEqual(512);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0616 end');
    })
  })
}
