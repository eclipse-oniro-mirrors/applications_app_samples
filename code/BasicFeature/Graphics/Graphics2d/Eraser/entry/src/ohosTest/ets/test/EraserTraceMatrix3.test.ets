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

export default function eraserTraceMatrix3Test(): void {
  describe('EraserTraceMatrix3Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    ERASER_TRACE_0155
     * @tc.name      eraserTrace0155
     * @tc.desc      1080x1920 画布上 16 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0155 begin');
      const points: number = 16;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(15);
      expect(length).assertEqual(180);
      expect(inside).assertEqual(180);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0155 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0156
     * @tc.name      eraserTrace0156
     * @tc.desc      512x512 画布上 16 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0156 begin');
      const points: number = 16;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(15);
      expect(length).assertEqual(180);
      expect(inside).assertEqual(180);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0156 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0157
     * @tc.name      eraserTrace0157
     * @tc.desc      360x640 画布上 16 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0157 begin');
      const points: number = 16;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(15);
      expect(length).assertEqual(240);
      expect(inside).assertEqual(240);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0157 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0158
     * @tc.name      eraserTrace0158
     * @tc.desc      720x1280 画布上 16 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0158 begin');
      const points: number = 16;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(15);
      expect(length).assertEqual(240);
      expect(inside).assertEqual(240);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0158 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0159
     * @tc.name      eraserTrace0159
     * @tc.desc      1080x1920 画布上 16 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0159 begin');
      const points: number = 16;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(15);
      expect(length).assertEqual(240);
      expect(inside).assertEqual(240);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0159 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0160
     * @tc.name      eraserTrace0160
     * @tc.desc      512x512 画布上 16 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0160 begin');
      const points: number = 16;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(15);
      expect(length).assertEqual(240);
      expect(inside).assertEqual(240);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0160 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0161
     * @tc.name      eraserTrace0161
     * @tc.desc      360x640 画布上 20 个采样点间距 1 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0161 begin');
      const points: number = 20;
      const gap: number = 1;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(19);
      expect(length).assertEqual(19);
      expect(inside).assertEqual(19);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0161 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0162
     * @tc.name      eraserTrace0162
     * @tc.desc      720x1280 画布上 20 个采样点间距 1 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0162 begin');
      const points: number = 20;
      const gap: number = 1;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(19);
      expect(length).assertEqual(19);
      expect(inside).assertEqual(19);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0162 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0163
     * @tc.name      eraserTrace0163
     * @tc.desc      1080x1920 画布上 20 个采样点间距 1 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0163 begin');
      const points: number = 20;
      const gap: number = 1;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(19);
      expect(length).assertEqual(19);
      expect(inside).assertEqual(19);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0163 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0164
     * @tc.name      eraserTrace0164
     * @tc.desc      512x512 画布上 20 个采样点间距 1 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0164 begin');
      const points: number = 20;
      const gap: number = 1;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(19);
      expect(length).assertEqual(19);
      expect(inside).assertEqual(19);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0164 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0165
     * @tc.name      eraserTrace0165
     * @tc.desc      360x640 画布上 20 个采样点间距 2 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0165 begin');
      const points: number = 20;
      const gap: number = 2;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(19);
      expect(length).assertEqual(38);
      expect(inside).assertEqual(38);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0165 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0166
     * @tc.name      eraserTrace0166
     * @tc.desc      720x1280 画布上 20 个采样点间距 2 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0166 begin');
      const points: number = 20;
      const gap: number = 2;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(19);
      expect(length).assertEqual(38);
      expect(inside).assertEqual(38);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0166 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0167
     * @tc.name      eraserTrace0167
     * @tc.desc      1080x1920 画布上 20 个采样点间距 2 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0167 begin');
      const points: number = 20;
      const gap: number = 2;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(19);
      expect(length).assertEqual(38);
      expect(inside).assertEqual(38);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0167 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0168
     * @tc.name      eraserTrace0168
     * @tc.desc      512x512 画布上 20 个采样点间距 2 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0168 begin');
      const points: number = 20;
      const gap: number = 2;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(19);
      expect(length).assertEqual(38);
      expect(inside).assertEqual(38);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0168 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0169
     * @tc.name      eraserTrace0169
     * @tc.desc      360x640 画布上 20 个采样点间距 3 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0169 begin');
      const points: number = 20;
      const gap: number = 3;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(19);
      expect(length).assertEqual(57);
      expect(inside).assertEqual(57);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0169 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0170
     * @tc.name      eraserTrace0170
     * @tc.desc      720x1280 画布上 20 个采样点间距 3 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0170 begin');
      const points: number = 20;
      const gap: number = 3;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(19);
      expect(length).assertEqual(57);
      expect(inside).assertEqual(57);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0170 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0171
     * @tc.name      eraserTrace0171
     * @tc.desc      1080x1920 画布上 20 个采样点间距 3 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0171 begin');
      const points: number = 20;
      const gap: number = 3;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(19);
      expect(length).assertEqual(57);
      expect(inside).assertEqual(57);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0171 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0172
     * @tc.name      eraserTrace0172
     * @tc.desc      512x512 画布上 20 个采样点间距 3 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0172 begin');
      const points: number = 20;
      const gap: number = 3;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(19);
      expect(length).assertEqual(57);
      expect(inside).assertEqual(57);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0172 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0173
     * @tc.name      eraserTrace0173
     * @tc.desc      360x640 画布上 20 个采样点间距 4 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0173 begin');
      const points: number = 20;
      const gap: number = 4;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(19);
      expect(length).assertEqual(76);
      expect(inside).assertEqual(76);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0173 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0174
     * @tc.name      eraserTrace0174
     * @tc.desc      720x1280 画布上 20 个采样点间距 4 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0174 begin');
      const points: number = 20;
      const gap: number = 4;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(19);
      expect(length).assertEqual(76);
      expect(inside).assertEqual(76);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0174 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0175
     * @tc.name      eraserTrace0175
     * @tc.desc      1080x1920 画布上 20 个采样点间距 4 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0175 begin');
      const points: number = 20;
      const gap: number = 4;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(19);
      expect(length).assertEqual(76);
      expect(inside).assertEqual(76);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0175 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0176
     * @tc.name      eraserTrace0176
     * @tc.desc      512x512 画布上 20 个采样点间距 4 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0176 begin');
      const points: number = 20;
      const gap: number = 4;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(19);
      expect(length).assertEqual(76);
      expect(inside).assertEqual(76);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0176 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0177
     * @tc.name      eraserTrace0177
     * @tc.desc      360x640 画布上 20 个采样点间距 6 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0177 begin');
      const points: number = 20;
      const gap: number = 6;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(19);
      expect(length).assertEqual(114);
      expect(inside).assertEqual(114);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0177 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0178
     * @tc.name      eraserTrace0178
     * @tc.desc      720x1280 画布上 20 个采样点间距 6 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0178 begin');
      const points: number = 20;
      const gap: number = 6;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(19);
      expect(length).assertEqual(114);
      expect(inside).assertEqual(114);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0178 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0179
     * @tc.name      eraserTrace0179
     * @tc.desc      1080x1920 画布上 20 个采样点间距 6 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0179 begin');
      const points: number = 20;
      const gap: number = 6;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(19);
      expect(length).assertEqual(114);
      expect(inside).assertEqual(114);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0179 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0180
     * @tc.name      eraserTrace0180
     * @tc.desc      512x512 画布上 20 个采样点间距 6 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0180 begin');
      const points: number = 20;
      const gap: number = 6;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(19);
      expect(length).assertEqual(114);
      expect(inside).assertEqual(114);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0180 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0181
     * @tc.name      eraserTrace0181
     * @tc.desc      360x640 画布上 20 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0181 begin');
      const points: number = 20;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(19);
      expect(length).assertEqual(152);
      expect(inside).assertEqual(152);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0181 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0182
     * @tc.name      eraserTrace0182
     * @tc.desc      720x1280 画布上 20 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0182 begin');
      const points: number = 20;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(19);
      expect(length).assertEqual(152);
      expect(inside).assertEqual(152);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0182 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0183
     * @tc.name      eraserTrace0183
     * @tc.desc      1080x1920 画布上 20 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0183 begin');
      const points: number = 20;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(19);
      expect(length).assertEqual(152);
      expect(inside).assertEqual(152);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0183 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0184
     * @tc.name      eraserTrace0184
     * @tc.desc      512x512 画布上 20 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0184 begin');
      const points: number = 20;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(19);
      expect(length).assertEqual(152);
      expect(inside).assertEqual(152);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0184 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0185
     * @tc.name      eraserTrace0185
     * @tc.desc      360x640 画布上 20 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0185 begin');
      const points: number = 20;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(19);
      expect(length).assertEqual(228);
      expect(inside).assertEqual(228);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0185 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0186
     * @tc.name      eraserTrace0186
     * @tc.desc      720x1280 画布上 20 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0186 begin');
      const points: number = 20;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(19);
      expect(length).assertEqual(228);
      expect(inside).assertEqual(228);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0186 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0187
     * @tc.name      eraserTrace0187
     * @tc.desc      1080x1920 画布上 20 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0187 begin');
      const points: number = 20;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(19);
      expect(length).assertEqual(228);
      expect(inside).assertEqual(228);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0187 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0188
     * @tc.name      eraserTrace0188
     * @tc.desc      512x512 画布上 20 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0188 begin');
      const points: number = 20;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(19);
      expect(length).assertEqual(228);
      expect(inside).assertEqual(228);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0188 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0189
     * @tc.name      eraserTrace0189
     * @tc.desc      360x640 画布上 20 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0189 begin');
      const points: number = 20;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(19);
      expect(length).assertEqual(304);
      expect(inside).assertEqual(304);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0189 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0190
     * @tc.name      eraserTrace0190
     * @tc.desc      720x1280 画布上 20 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0190 begin');
      const points: number = 20;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(19);
      expect(length).assertEqual(304);
      expect(inside).assertEqual(304);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0190 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0191
     * @tc.name      eraserTrace0191
     * @tc.desc      1080x1920 画布上 20 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0191 begin');
      const points: number = 20;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(19);
      expect(length).assertEqual(304);
      expect(inside).assertEqual(304);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0191 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0192
     * @tc.name      eraserTrace0192
     * @tc.desc      512x512 画布上 20 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0192 begin');
      const points: number = 20;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(19);
      expect(length).assertEqual(304);
      expect(inside).assertEqual(304);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0192 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0193
     * @tc.name      eraserTrace0193
     * @tc.desc      360x640 画布上 24 个采样点间距 1 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0193 begin');
      const points: number = 24;
      const gap: number = 1;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(23);
      expect(length).assertEqual(23);
      expect(inside).assertEqual(23);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0193 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0194
     * @tc.name      eraserTrace0194
     * @tc.desc      720x1280 画布上 24 个采样点间距 1 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0194 begin');
      const points: number = 24;
      const gap: number = 1;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(23);
      expect(length).assertEqual(23);
      expect(inside).assertEqual(23);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0194 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0195
     * @tc.name      eraserTrace0195
     * @tc.desc      1080x1920 画布上 24 个采样点间距 1 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0195 begin');
      const points: number = 24;
      const gap: number = 1;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(23);
      expect(length).assertEqual(23);
      expect(inside).assertEqual(23);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0195 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0196
     * @tc.name      eraserTrace0196
     * @tc.desc      512x512 画布上 24 个采样点间距 1 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0196 begin');
      const points: number = 24;
      const gap: number = 1;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(23);
      expect(length).assertEqual(23);
      expect(inside).assertEqual(23);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0196 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0197
     * @tc.name      eraserTrace0197
     * @tc.desc      360x640 画布上 24 个采样点间距 2 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0197 begin');
      const points: number = 24;
      const gap: number = 2;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(23);
      expect(length).assertEqual(46);
      expect(inside).assertEqual(46);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0197 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0198
     * @tc.name      eraserTrace0198
     * @tc.desc      720x1280 画布上 24 个采样点间距 2 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0198 begin');
      const points: number = 24;
      const gap: number = 2;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(23);
      expect(length).assertEqual(46);
      expect(inside).assertEqual(46);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0198 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0199
     * @tc.name      eraserTrace0199
     * @tc.desc      1080x1920 画布上 24 个采样点间距 2 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0199 begin');
      const points: number = 24;
      const gap: number = 2;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(23);
      expect(length).assertEqual(46);
      expect(inside).assertEqual(46);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0199 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0200
     * @tc.name      eraserTrace0200
     * @tc.desc      512x512 画布上 24 个采样点间距 2 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0200 begin');
      const points: number = 24;
      const gap: number = 2;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(23);
      expect(length).assertEqual(46);
      expect(inside).assertEqual(46);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0200 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0201
     * @tc.name      eraserTrace0201
     * @tc.desc      360x640 画布上 24 个采样点间距 3 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0201 begin');
      const points: number = 24;
      const gap: number = 3;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(23);
      expect(length).assertEqual(69);
      expect(inside).assertEqual(69);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0201 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0202
     * @tc.name      eraserTrace0202
     * @tc.desc      720x1280 画布上 24 个采样点间距 3 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0202 begin');
      const points: number = 24;
      const gap: number = 3;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(23);
      expect(length).assertEqual(69);
      expect(inside).assertEqual(69);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0202 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0203
     * @tc.name      eraserTrace0203
     * @tc.desc      1080x1920 画布上 24 个采样点间距 3 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0203 begin');
      const points: number = 24;
      const gap: number = 3;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(23);
      expect(length).assertEqual(69);
      expect(inside).assertEqual(69);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0203 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0204
     * @tc.name      eraserTrace0204
     * @tc.desc      512x512 画布上 24 个采样点间距 3 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0204 begin');
      const points: number = 24;
      const gap: number = 3;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(23);
      expect(length).assertEqual(69);
      expect(inside).assertEqual(69);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0204 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0205
     * @tc.name      eraserTrace0205
     * @tc.desc      360x640 画布上 24 个采样点间距 4 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0205 begin');
      const points: number = 24;
      const gap: number = 4;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(23);
      expect(length).assertEqual(92);
      expect(inside).assertEqual(92);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0205 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0206
     * @tc.name      eraserTrace0206
     * @tc.desc      720x1280 画布上 24 个采样点间距 4 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0206 begin');
      const points: number = 24;
      const gap: number = 4;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(23);
      expect(length).assertEqual(92);
      expect(inside).assertEqual(92);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0206 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0207
     * @tc.name      eraserTrace0207
     * @tc.desc      1080x1920 画布上 24 个采样点间距 4 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0207 begin');
      const points: number = 24;
      const gap: number = 4;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(23);
      expect(length).assertEqual(92);
      expect(inside).assertEqual(92);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0207 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0208
     * @tc.name      eraserTrace0208
     * @tc.desc      512x512 画布上 24 个采样点间距 4 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0208 begin');
      const points: number = 24;
      const gap: number = 4;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(23);
      expect(length).assertEqual(92);
      expect(inside).assertEqual(92);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0208 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0209
     * @tc.name      eraserTrace0209
     * @tc.desc      360x640 画布上 24 个采样点间距 6 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0209 begin');
      const points: number = 24;
      const gap: number = 6;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(23);
      expect(length).assertEqual(138);
      expect(inside).assertEqual(138);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0209 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0210
     * @tc.name      eraserTrace0210
     * @tc.desc      720x1280 画布上 24 个采样点间距 6 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0210 begin');
      const points: number = 24;
      const gap: number = 6;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(23);
      expect(length).assertEqual(138);
      expect(inside).assertEqual(138);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0210 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0211
     * @tc.name      eraserTrace0211
     * @tc.desc      1080x1920 画布上 24 个采样点间距 6 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0211 begin');
      const points: number = 24;
      const gap: number = 6;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(23);
      expect(length).assertEqual(138);
      expect(inside).assertEqual(138);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0211 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0212
     * @tc.name      eraserTrace0212
     * @tc.desc      512x512 画布上 24 个采样点间距 6 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0212 begin');
      const points: number = 24;
      const gap: number = 6;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(23);
      expect(length).assertEqual(138);
      expect(inside).assertEqual(138);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0212 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0213
     * @tc.name      eraserTrace0213
     * @tc.desc      360x640 画布上 24 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0213 begin');
      const points: number = 24;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(23);
      expect(length).assertEqual(184);
      expect(inside).assertEqual(184);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0213 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0214
     * @tc.name      eraserTrace0214
     * @tc.desc      720x1280 画布上 24 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0214 begin');
      const points: number = 24;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(23);
      expect(length).assertEqual(184);
      expect(inside).assertEqual(184);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0214 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0215
     * @tc.name      eraserTrace0215
     * @tc.desc      1080x1920 画布上 24 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0215 begin');
      const points: number = 24;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(23);
      expect(length).assertEqual(184);
      expect(inside).assertEqual(184);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0215 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0216
     * @tc.name      eraserTrace0216
     * @tc.desc      512x512 画布上 24 个采样点间距 8 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0216 begin');
      const points: number = 24;
      const gap: number = 8;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(23);
      expect(length).assertEqual(184);
      expect(inside).assertEqual(184);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0216 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0217
     * @tc.name      eraserTrace0217
     * @tc.desc      360x640 画布上 24 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0217 begin');
      const points: number = 24;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(23);
      expect(length).assertEqual(276);
      expect(inside).assertEqual(276);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0217 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0218
     * @tc.name      eraserTrace0218
     * @tc.desc      720x1280 画布上 24 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0218 begin');
      const points: number = 24;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(23);
      expect(length).assertEqual(276);
      expect(inside).assertEqual(276);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0218 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0219
     * @tc.name      eraserTrace0219
     * @tc.desc      1080x1920 画布上 24 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0219 begin');
      const points: number = 24;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(23);
      expect(length).assertEqual(276);
      expect(inside).assertEqual(276);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0219 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0220
     * @tc.name      eraserTrace0220
     * @tc.desc      512x512 画布上 24 个采样点间距 12 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0220 begin');
      const points: number = 24;
      const gap: number = 12;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(23);
      expect(length).assertEqual(276);
      expect(inside).assertEqual(276);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0220 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0221
     * @tc.name      eraserTrace0221
     * @tc.desc      360x640 画布上 24 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0221 begin');
      const points: number = 24;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(23);
      expect(length).assertEqual(368);
      expect(inside).assertEqual(360);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0221 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0222
     * @tc.name      eraserTrace0222
     * @tc.desc      720x1280 画布上 24 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0222 begin');
      const points: number = 24;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(23);
      expect(length).assertEqual(368);
      expect(inside).assertEqual(368);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0222 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0223
     * @tc.name      eraserTrace0223
     * @tc.desc      1080x1920 画布上 24 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0223 begin');
      const points: number = 24;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(23);
      expect(length).assertEqual(368);
      expect(inside).assertEqual(368);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0223 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0224
     * @tc.name      eraserTrace0224
     * @tc.desc      512x512 画布上 24 个采样点间距 16 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0224 begin');
      const points: number = 24;
      const gap: number = 16;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(23);
      expect(length).assertEqual(368);
      expect(inside).assertEqual(368);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0224 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0225
     * @tc.name      eraserTrace0225
     * @tc.desc      360x640 画布上 32 个采样点间距 1 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0225 begin');
      const points: number = 32;
      const gap: number = 1;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(31);
      expect(length).assertEqual(31);
      expect(inside).assertEqual(31);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0225 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0226
     * @tc.name      eraserTrace0226
     * @tc.desc      720x1280 画布上 32 个采样点间距 1 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0226 begin');
      const points: number = 32;
      const gap: number = 1;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(31);
      expect(length).assertEqual(31);
      expect(inside).assertEqual(31);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0226 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0227
     * @tc.name      eraserTrace0227
     * @tc.desc      1080x1920 画布上 32 个采样点间距 1 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0227 begin');
      const points: number = 32;
      const gap: number = 1;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(31);
      expect(length).assertEqual(31);
      expect(inside).assertEqual(31);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0227 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0228
     * @tc.name      eraserTrace0228
     * @tc.desc      512x512 画布上 32 个采样点间距 1 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0228 begin');
      const points: number = 32;
      const gap: number = 1;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 512);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(31);
      expect(length).assertEqual(31);
      expect(inside).assertEqual(31);
      expect(inside <= 512).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0228 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0229
     * @tc.name      eraserTrace0229
     * @tc.desc      360x640 画布上 32 个采样点间距 2 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0229 begin');
      const points: number = 32;
      const gap: number = 2;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 360);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(31);
      expect(length).assertEqual(62);
      expect(inside).assertEqual(62);
      expect(inside <= 360).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0229 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0230
     * @tc.name      eraserTrace0230
     * @tc.desc      720x1280 画布上 32 个采样点间距 2 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0230 begin');
      const points: number = 32;
      const gap: number = 2;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(31);
      expect(length).assertEqual(62);
      expect(inside).assertEqual(62);
      expect(inside <= 720).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0230 end');
    })

    /**
     * @tc.number    ERASER_TRACE_0231
     * @tc.name      eraserTrace0231
     * @tc.desc      1080x1920 画布上 32 个采样点间距 2 的轨迹长度与越界裁剪
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTrace0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0231 begin');
      const points: number = 32;
      const gap: number = 2;
      const segments: number = points - 1;
      const length: number = segments * gap;
      const inside: number = Math.min(length, 1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'segments=' + segments + ' len=' + length);
      expect(segments).assertEqual(31);
      expect(length).assertEqual(62);
      expect(inside).assertEqual(62);
      expect(inside <= 1080).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTrace0231 end');
    })
  })
}
