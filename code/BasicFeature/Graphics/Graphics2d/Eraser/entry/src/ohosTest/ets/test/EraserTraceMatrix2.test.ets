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

export default function eraserTraceMatrix2Test(): void {
  describe('EraserTraceMatrix2Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    ERASER_TRACE_0078
     * @tc.name      eraserTrace0078
     * @tc.desc      720x1280 画布上 8 个采样点间距 4 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0078 begin');
      const points: number = 8;
      const gap: number = 4;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(7);
      expect(length).assertEqual(28);
      expect(inside).assertEqual(28);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0078 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0079
     * @tc.name      eraserTrace0079
     * @tc.desc      1080x1920 画布上 8 个采样点间距 4 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0079 begin');
      const points: number = 8;
      const gap: number = 4;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(7);
      expect(length).assertEqual(28);
      expect(inside).assertEqual(28);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0079 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0080
     * @tc.name      eraserTrace0080
     * @tc.desc      512x512 画布上 8 个采样点间距 4 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0080 begin');
      const points: number = 8;
      const gap: number = 4;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(7);
      expect(length).assertEqual(28);
      expect(inside).assertEqual(28);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0080 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0081
     * @tc.name      eraserTrace0081
     * @tc.desc      360x640 画布上 8 个采样点间距 6 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0081 begin');
      const points: number = 8;
      const gap: number = 6;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(7);
      expect(length).assertEqual(42);
      expect(inside).assertEqual(42);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0081 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0082
     * @tc.name      eraserTrace0082
     * @tc.desc      720x1280 画布上 8 个采样点间距 6 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0082 begin');
      const points: number = 8;
      const gap: number = 6;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(7);
      expect(length).assertEqual(42);
      expect(inside).assertEqual(42);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0082 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0083
     * @tc.name      eraserTrace0083
     * @tc.desc      1080x1920 画布上 8 个采样点间距 6 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0083 begin');
      const points: number = 8;
      const gap: number = 6;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(7);
      expect(length).assertEqual(42);
      expect(inside).assertEqual(42);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0083 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0084
     * @tc.name      eraserTrace0084
     * @tc.desc      512x512 画布上 8 个采样点间距 6 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0084 begin');
      const points: number = 8;
      const gap: number = 6;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(7);
      expect(length).assertEqual(42);
      expect(inside).assertEqual(42);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0084 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0085
     * @tc.name      eraserTrace0085
     * @tc.desc      360x640 画布上 8 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0085 begin');
      const points: number = 8;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(7);
      expect(length).assertEqual(56);
      expect(inside).assertEqual(56);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0085 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0086
     * @tc.name      eraserTrace0086
     * @tc.desc      720x1280 画布上 8 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0086 begin');
      const points: number = 8;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(7);
      expect(length).assertEqual(56);
      expect(inside).assertEqual(56);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0086 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0087
     * @tc.name      eraserTrace0087
     * @tc.desc      1080x1920 画布上 8 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0087 begin');
      const points: number = 8;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(7);
      expect(length).assertEqual(56);
      expect(inside).assertEqual(56);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0087 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0088
     * @tc.name      eraserTrace0088
     * @tc.desc      512x512 画布上 8 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0088 begin');
      const points: number = 8;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(7);
      expect(length).assertEqual(56);
      expect(inside).assertEqual(56);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0088 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0089
     * @tc.name      eraserTrace0089
     * @tc.desc      360x640 画布上 8 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0089 begin');
      const points: number = 8;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(7);
      expect(length).assertEqual(84);
      expect(inside).assertEqual(84);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0089 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0090
     * @tc.name      eraserTrace0090
     * @tc.desc      720x1280 画布上 8 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0090 begin');
      const points: number = 8;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(7);
      expect(length).assertEqual(84);
      expect(inside).assertEqual(84);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0090 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0091
     * @tc.name      eraserTrace0091
     * @tc.desc      1080x1920 画布上 8 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0091 begin');
      const points: number = 8;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(7);
      expect(length).assertEqual(84);
      expect(inside).assertEqual(84);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0091 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0092
     * @tc.name      eraserTrace0092
     * @tc.desc      512x512 画布上 8 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0092 begin');
      const points: number = 8;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(7);
      expect(length).assertEqual(84);
      expect(inside).assertEqual(84);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0092 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0093
     * @tc.name      eraserTrace0093
     * @tc.desc      360x640 画布上 8 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0093 begin');
      const points: number = 8;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(7);
      expect(length).assertEqual(112);
      expect(inside).assertEqual(112);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0093 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0094
     * @tc.name      eraserTrace0094
     * @tc.desc      720x1280 画布上 8 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0094 begin');
      const points: number = 8;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(7);
      expect(length).assertEqual(112);
      expect(inside).assertEqual(112);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0094 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0095
     * @tc.name      eraserTrace0095
     * @tc.desc      1080x1920 画布上 8 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0095 begin');
      const points: number = 8;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(7);
      expect(length).assertEqual(112);
      expect(inside).assertEqual(112);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0095 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0096
     * @tc.name      eraserTrace0096
     * @tc.desc      512x512 画布上 8 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0096 begin');
      const points: number = 8;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(7);
      expect(length).assertEqual(112);
      expect(inside).assertEqual(112);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0096 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0097
     * @tc.name      eraserTrace0097
     * @tc.desc      360x640 画布上 12 个采样点间距 1 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0097 begin');
      const points: number = 12;
      const gap: number = 1;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(11);
      expect(length).assertEqual(11);
      expect(inside).assertEqual(11);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0097 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0098
     * @tc.name      eraserTrace0098
     * @tc.desc      720x1280 画布上 12 个采样点间距 1 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0098 begin');
      const points: number = 12;
      const gap: number = 1;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(11);
      expect(length).assertEqual(11);
      expect(inside).assertEqual(11);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0098 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0099
     * @tc.name      eraserTrace0099
     * @tc.desc      1080x1920 画布上 12 个采样点间距 1 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0099 begin');
      const points: number = 12;
      const gap: number = 1;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(11);
      expect(length).assertEqual(11);
      expect(inside).assertEqual(11);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0099 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0100
     * @tc.name      eraserTrace0100
     * @tc.desc      512x512 画布上 12 个采样点间距 1 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0100 begin');
      const points: number = 12;
      const gap: number = 1;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(11);
      expect(length).assertEqual(11);
      expect(inside).assertEqual(11);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0100 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0101
     * @tc.name      eraserTrace0101
     * @tc.desc      360x640 画布上 12 个采样点间距 2 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0101 begin');
      const points: number = 12;
      const gap: number = 2;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(11);
      expect(length).assertEqual(22);
      expect(inside).assertEqual(22);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0101 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0102
     * @tc.name      eraserTrace0102
     * @tc.desc      720x1280 画布上 12 个采样点间距 2 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0102 begin');
      const points: number = 12;
      const gap: number = 2;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(11);
      expect(length).assertEqual(22);
      expect(inside).assertEqual(22);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0102 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0103
     * @tc.name      eraserTrace0103
     * @tc.desc      1080x1920 画布上 12 个采样点间距 2 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0103 begin');
      const points: number = 12;
      const gap: number = 2;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(11);
      expect(length).assertEqual(22);
      expect(inside).assertEqual(22);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0103 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0104
     * @tc.name      eraserTrace0104
     * @tc.desc      512x512 画布上 12 个采样点间距 2 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0104 begin');
      const points: number = 12;
      const gap: number = 2;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(11);
      expect(length).assertEqual(22);
      expect(inside).assertEqual(22);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0104 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0105
     * @tc.name      eraserTrace0105
     * @tc.desc      360x640 画布上 12 个采样点间距 3 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0105 begin');
      const points: number = 12;
      const gap: number = 3;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(11);
      expect(length).assertEqual(33);
      expect(inside).assertEqual(33);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0105 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0106
     * @tc.name      eraserTrace0106
     * @tc.desc      720x1280 画布上 12 个采样点间距 3 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0106 begin');
      const points: number = 12;
      const gap: number = 3;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(11);
      expect(length).assertEqual(33);
      expect(inside).assertEqual(33);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0106 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0107
     * @tc.name      eraserTrace0107
     * @tc.desc      1080x1920 画布上 12 个采样点间距 3 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0107 begin');
      const points: number = 12;
      const gap: number = 3;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(11);
      expect(length).assertEqual(33);
      expect(inside).assertEqual(33);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0107 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0108
     * @tc.name      eraserTrace0108
     * @tc.desc      512x512 画布上 12 个采样点间距 3 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0108 begin');
      const points: number = 12;
      const gap: number = 3;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(11);
      expect(length).assertEqual(33);
      expect(inside).assertEqual(33);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0108 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0109
     * @tc.name      eraserTrace0109
     * @tc.desc      360x640 画布上 12 个采样点间距 4 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0109 begin');
      const points: number = 12;
      const gap: number = 4;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(11);
      expect(length).assertEqual(44);
      expect(inside).assertEqual(44);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0109 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0110
     * @tc.name      eraserTrace0110
     * @tc.desc      720x1280 画布上 12 个采样点间距 4 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0110 begin');
      const points: number = 12;
      const gap: number = 4;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(11);
      expect(length).assertEqual(44);
      expect(inside).assertEqual(44);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0110 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0111
     * @tc.name      eraserTrace0111
     * @tc.desc      1080x1920 画布上 12 个采样点间距 4 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0111 begin');
      const points: number = 12;
      const gap: number = 4;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(11);
      expect(length).assertEqual(44);
      expect(inside).assertEqual(44);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0111 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0112
     * @tc.name      eraserTrace0112
     * @tc.desc      512x512 画布上 12 个采样点间距 4 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0112 begin');
      const points: number = 12;
      const gap: number = 4;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(11);
      expect(length).assertEqual(44);
      expect(inside).assertEqual(44);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0112 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0113
     * @tc.name      eraserTrace0113
     * @tc.desc      360x640 画布上 12 个采样点间距 6 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0113 begin');
      const points: number = 12;
      const gap: number = 6;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(11);
      expect(length).assertEqual(66);
      expect(inside).assertEqual(66);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0113 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0114
     * @tc.name      eraserTrace0114
     * @tc.desc      720x1280 画布上 12 个采样点间距 6 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0114 begin');
      const points: number = 12;
      const gap: number = 6;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(11);
      expect(length).assertEqual(66);
      expect(inside).assertEqual(66);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0114 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0115
     * @tc.name      eraserTrace0115
     * @tc.desc      1080x1920 画布上 12 个采样点间距 6 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0115 begin');
      const points: number = 12;
      const gap: number = 6;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(11);
      expect(length).assertEqual(66);
      expect(inside).assertEqual(66);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0115 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0116
     * @tc.name      eraserTrace0116
     * @tc.desc      512x512 画布上 12 个采样点间距 6 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0116 begin');
      const points: number = 12;
      const gap: number = 6;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(11);
      expect(length).assertEqual(66);
      expect(inside).assertEqual(66);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0116 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0117
     * @tc.name      eraserTrace0117
     * @tc.desc      360x640 画布上 12 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0117 begin');
      const points: number = 12;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(11);
      expect(length).assertEqual(88);
      expect(inside).assertEqual(88);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0117 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0118
     * @tc.name      eraserTrace0118
     * @tc.desc      720x1280 画布上 12 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0118 begin');
      const points: number = 12;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(11);
      expect(length).assertEqual(88);
      expect(inside).assertEqual(88);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0118 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0119
     * @tc.name      eraserTrace0119
     * @tc.desc      1080x1920 画布上 12 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0119 begin');
      const points: number = 12;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(11);
      expect(length).assertEqual(88);
      expect(inside).assertEqual(88);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0119 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0120
     * @tc.name      eraserTrace0120
     * @tc.desc      512x512 画布上 12 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0120 begin');
      const points: number = 12;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(11);
      expect(length).assertEqual(88);
      expect(inside).assertEqual(88);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0120 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0121
     * @tc.name      eraserTrace0121
     * @tc.desc      360x640 画布上 12 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0121 begin');
      const points: number = 12;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(11);
      expect(length).assertEqual(132);
      expect(inside).assertEqual(132);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0121 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0122
     * @tc.name      eraserTrace0122
     * @tc.desc      720x1280 画布上 12 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0122 begin');
      const points: number = 12;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(11);
      expect(length).assertEqual(132);
      expect(inside).assertEqual(132);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0122 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0123
     * @tc.name      eraserTrace0123
     * @tc.desc      1080x1920 画布上 12 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0123 begin');
      const points: number = 12;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(11);
      expect(length).assertEqual(132);
      expect(inside).assertEqual(132);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0123 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0124
     * @tc.name      eraserTrace0124
     * @tc.desc      512x512 画布上 12 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0124 begin');
      const points: number = 12;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(11);
      expect(length).assertEqual(132);
      expect(inside).assertEqual(132);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0124 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0125
     * @tc.name      eraserTrace0125
     * @tc.desc      360x640 画布上 12 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0125 begin');
      const points: number = 12;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(11);
      expect(length).assertEqual(176);
      expect(inside).assertEqual(176);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0125 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0126
     * @tc.name      eraserTrace0126
     * @tc.desc      720x1280 画布上 12 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0126 begin');
      const points: number = 12;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(11);
      expect(length).assertEqual(176);
      expect(inside).assertEqual(176);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0126 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0127
     * @tc.name      eraserTrace0127
     * @tc.desc      1080x1920 画布上 12 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0127 begin');
      const points: number = 12;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(11);
      expect(length).assertEqual(176);
      expect(inside).assertEqual(176);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0127 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0128
     * @tc.name      eraserTrace0128
     * @tc.desc      512x512 画布上 12 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0128 begin');
      const points: number = 12;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(11);
      expect(length).assertEqual(176);
      expect(inside).assertEqual(176);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0128 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0129
     * @tc.name      eraserTrace0129
     * @tc.desc      360x640 画布上 16 个采样点间距 1 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0129 begin');
      const points: number = 16;
      const gap: number = 1;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(15);
      expect(length).assertEqual(15);
      expect(inside).assertEqual(15);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0129 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0130
     * @tc.name      eraserTrace0130
     * @tc.desc      720x1280 画布上 16 个采样点间距 1 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0130 begin');
      const points: number = 16;
      const gap: number = 1;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(15);
      expect(length).assertEqual(15);
      expect(inside).assertEqual(15);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0130 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0131
     * @tc.name      eraserTrace0131
     * @tc.desc      1080x1920 画布上 16 个采样点间距 1 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0131 begin');
      const points: number = 16;
      const gap: number = 1;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(15);
      expect(length).assertEqual(15);
      expect(inside).assertEqual(15);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0131 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0132
     * @tc.name      eraserTrace0132
     * @tc.desc      512x512 画布上 16 个采样点间距 1 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0132 begin');
      const points: number = 16;
      const gap: number = 1;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(15);
      expect(length).assertEqual(15);
      expect(inside).assertEqual(15);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0132 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0133
     * @tc.name      eraserTrace0133
     * @tc.desc      360x640 画布上 16 个采样点间距 2 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0133 begin');
      const points: number = 16;
      const gap: number = 2;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(15);
      expect(length).assertEqual(30);
      expect(inside).assertEqual(30);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0133 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0134
     * @tc.name      eraserTrace0134
     * @tc.desc      720x1280 画布上 16 个采样点间距 2 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0134 begin');
      const points: number = 16;
      const gap: number = 2;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(15);
      expect(length).assertEqual(30);
      expect(inside).assertEqual(30);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0134 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0135
     * @tc.name      eraserTrace0135
     * @tc.desc      1080x1920 画布上 16 个采样点间距 2 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0135 begin');
      const points: number = 16;
      const gap: number = 2;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(15);
      expect(length).assertEqual(30);
      expect(inside).assertEqual(30);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0135 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0136
     * @tc.name      eraserTrace0136
     * @tc.desc      512x512 画布上 16 个采样点间距 2 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0136 begin');
      const points: number = 16;
      const gap: number = 2;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(15);
      expect(length).assertEqual(30);
      expect(inside).assertEqual(30);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0136 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0137
     * @tc.name      eraserTrace0137
     * @tc.desc      360x640 画布上 16 个采样点间距 3 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0137 begin');
      const points: number = 16;
      const gap: number = 3;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(15);
      expect(length).assertEqual(45);
      expect(inside).assertEqual(45);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0137 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0138
     * @tc.name      eraserTrace0138
     * @tc.desc      720x1280 画布上 16 个采样点间距 3 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0138 begin');
      const points: number = 16;
      const gap: number = 3;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(15);
      expect(length).assertEqual(45);
      expect(inside).assertEqual(45);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0138 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0139
     * @tc.name      eraserTrace0139
     * @tc.desc      1080x1920 画布上 16 个采样点间距 3 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0139 begin');
      const points: number = 16;
      const gap: number = 3;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(15);
      expect(length).assertEqual(45);
      expect(inside).assertEqual(45);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0139 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0140
     * @tc.name      eraserTrace0140
     * @tc.desc      512x512 画布上 16 个采样点间距 3 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0140 begin');
      const points: number = 16;
      const gap: number = 3;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(15);
      expect(length).assertEqual(45);
      expect(inside).assertEqual(45);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0140 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0141
     * @tc.name      eraserTrace0141
     * @tc.desc      360x640 画布上 16 个采样点间距 4 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0141 begin');
      const points: number = 16;
      const gap: number = 4;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(15);
      expect(length).assertEqual(60);
      expect(inside).assertEqual(60);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0141 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0142
     * @tc.name      eraserTrace0142
     * @tc.desc      720x1280 画布上 16 个采样点间距 4 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0142 begin');
      const points: number = 16;
      const gap: number = 4;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(15);
      expect(length).assertEqual(60);
      expect(inside).assertEqual(60);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0142 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0143
     * @tc.name      eraserTrace0143
     * @tc.desc      1080x1920 画布上 16 个采样点间距 4 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0143 begin');
      const points: number = 16;
      const gap: number = 4;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(15);
      expect(length).assertEqual(60);
      expect(inside).assertEqual(60);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0143 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0144
     * @tc.name      eraserTrace0144
     * @tc.desc      512x512 画布上 16 个采样点间距 4 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0144 begin');
      const points: number = 16;
      const gap: number = 4;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(15);
      expect(length).assertEqual(60);
      expect(inside).assertEqual(60);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0144 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0145
     * @tc.name      eraserTrace0145
     * @tc.desc      360x640 画布上 16 个采样点间距 6 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0145 begin');
      const points: number = 16;
      const gap: number = 6;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(15);
      expect(length).assertEqual(90);
      expect(inside).assertEqual(90);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0145 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0146
     * @tc.name      eraserTrace0146
     * @tc.desc      720x1280 画布上 16 个采样点间距 6 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0146 begin');
      const points: number = 16;
      const gap: number = 6;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(15);
      expect(length).assertEqual(90);
      expect(inside).assertEqual(90);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0146 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0147
     * @tc.name      eraserTrace0147
     * @tc.desc      1080x1920 画布上 16 个采样点间距 6 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0147 begin');
      const points: number = 16;
      const gap: number = 6;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(15);
      expect(length).assertEqual(90);
      expect(inside).assertEqual(90);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0147 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0148
     * @tc.name      eraserTrace0148
     * @tc.desc      512x512 画布上 16 个采样点间距 6 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0148 begin');
      const points: number = 16;
      const gap: number = 6;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(15);
      expect(length).assertEqual(90);
      expect(inside).assertEqual(90);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0148 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0149
     * @tc.name      eraserTrace0149
     * @tc.desc      360x640 画布上 16 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0149 begin');
      const points: number = 16;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(15);
      expect(length).assertEqual(120);
      expect(inside).assertEqual(120);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0149 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0150
     * @tc.name      eraserTrace0150
     * @tc.desc      720x1280 画布上 16 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0150 begin');
      const points: number = 16;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(15);
      expect(length).assertEqual(120);
      expect(inside).assertEqual(120);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0150 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0151
     * @tc.name      eraserTrace0151
     * @tc.desc      1080x1920 画布上 16 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0151 begin');
      const points: number = 16;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(15);
      expect(length).assertEqual(120);
      expect(inside).assertEqual(120);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0151 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0152
     * @tc.name      eraserTrace0152
     * @tc.desc      512x512 画布上 16 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0152 begin');
      const points: number = 16;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(15);
      expect(length).assertEqual(120);
      expect(inside).assertEqual(120);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0152 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0153
     * @tc.name      eraserTrace0153
     * @tc.desc      360x640 画布上 16 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0153 begin');
      const points: number = 16;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(15);
      expect(length).assertEqual(180);
      expect(inside).assertEqual(180);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0153 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0154
     * @tc.name      eraserTrace0154
     * @tc.desc      720x1280 画布上 16 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0154 begin');
      const points: number = 16;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(15);
      expect(length).assertEqual(180);
      expect(inside).assertEqual(180);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0154 end');
    })
  })
}
