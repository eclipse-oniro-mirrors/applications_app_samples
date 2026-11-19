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
const TAG: string = '[Sample_DisplaySoloist]';

export default function soloFrameRateMatrix3Test(): void {
  describe('SoloFrameRateMatrix3Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    SOLO_FRAME_RATE_0163
     * @tc.name      soloFrameRate0163
     * @tc.desc      5fps 在 125ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0163 begin');
      const fps: number = 5;
      const duration: number = 125;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(0);
      expect(interval.toFixed(4)).assertEqual('200.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0163 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0164
     * @tc.name      soloFrameRate0164
     * @tc.desc      5fps 在 125ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0164 begin');
      const fps: number = 5;
      const frames: number = 0;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 125000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(200000);
      expect(totalUs).assertEqual(0);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0164 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0165
     * @tc.name      soloFrameRate0165
     * @tc.desc      5fps 步长 3 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0165 begin');
      const fps: number = 5;
      const step: number = 3;
      const stamps: number[] = [0, 600, 1200, 1800, 2400];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(2400);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0165 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0166
     * @tc.name      soloFrameRate0166
     * @tc.desc      5fps 在 167ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0166 begin');
      const fps: number = 5;
      const duration: number = 167;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(0);
      expect(interval.toFixed(4)).assertEqual('200.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0166 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0167
     * @tc.name      soloFrameRate0167
     * @tc.desc      5fps 在 167ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0167 begin');
      const fps: number = 5;
      const frames: number = 0;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 167000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(200000);
      expect(totalUs).assertEqual(0);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0167 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0168
     * @tc.name      soloFrameRate0168
     * @tc.desc      5fps 步长 1 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0168 begin');
      const fps: number = 5;
      const step: number = 1;
      const stamps: number[] = [0, 200, 400, 600, 800];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(800);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0168 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0169
     * @tc.name      soloFrameRate0169
     * @tc.desc      5fps 在 200ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0169 begin');
      const fps: number = 5;
      const duration: number = 200;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(1);
      expect(interval.toFixed(4)).assertEqual('200.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0169 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0170
     * @tc.name      soloFrameRate0170
     * @tc.desc      5fps 在 200ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0170 begin');
      const fps: number = 5;
      const frames: number = 1;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 200000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(200000);
      expect(totalUs).assertEqual(200000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0170 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0171
     * @tc.name      soloFrameRate0171
     * @tc.desc      5fps 步长 2 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0171 begin');
      const fps: number = 5;
      const step: number = 2;
      const stamps: number[] = [0, 400, 800, 1200, 1600];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(1600);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0171 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0172
     * @tc.name      soloFrameRate0172
     * @tc.desc      5fps 在 250ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0172 begin');
      const fps: number = 5;
      const duration: number = 250;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(1);
      expect(interval.toFixed(4)).assertEqual('200.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0172 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0173
     * @tc.name      soloFrameRate0173
     * @tc.desc      5fps 在 250ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0173 begin');
      const fps: number = 5;
      const frames: number = 1;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 250000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(200000);
      expect(totalUs).assertEqual(200000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0173 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0174
     * @tc.name      soloFrameRate0174
     * @tc.desc      5fps 步长 3 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0174 begin');
      const fps: number = 5;
      const step: number = 3;
      const stamps: number[] = [0, 600, 1200, 1800, 2400];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(2400);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0174 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0175
     * @tc.name      soloFrameRate0175
     * @tc.desc      5fps 在 300ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0175 begin');
      const fps: number = 5;
      const duration: number = 300;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(1);
      expect(interval.toFixed(4)).assertEqual('200.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0175 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0176
     * @tc.name      soloFrameRate0176
     * @tc.desc      5fps 在 300ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0176 begin');
      const fps: number = 5;
      const frames: number = 1;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 300000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(200000);
      expect(totalUs).assertEqual(200000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0176 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0177
     * @tc.name      soloFrameRate0177
     * @tc.desc      5fps 步长 1 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0177 begin');
      const fps: number = 5;
      const step: number = 1;
      const stamps: number[] = [0, 200, 400, 600, 800];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(800);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0177 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0178
     * @tc.name      soloFrameRate0178
     * @tc.desc      5fps 在 333ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0178 begin');
      const fps: number = 5;
      const duration: number = 333;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(1);
      expect(interval.toFixed(4)).assertEqual('200.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0178 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0179
     * @tc.name      soloFrameRate0179
     * @tc.desc      5fps 在 333ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0179 begin');
      const fps: number = 5;
      const frames: number = 1;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 333000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(200000);
      expect(totalUs).assertEqual(200000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0179 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0180
     * @tc.name      soloFrameRate0180
     * @tc.desc      5fps 步长 2 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0180 begin');
      const fps: number = 5;
      const step: number = 2;
      const stamps: number[] = [0, 400, 800, 1200, 1600];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(1600);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0180 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0181
     * @tc.name      soloFrameRate0181
     * @tc.desc      5fps 在 400ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0181 begin');
      const fps: number = 5;
      const duration: number = 400;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(2);
      expect(interval.toFixed(4)).assertEqual('200.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0181 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0182
     * @tc.name      soloFrameRate0182
     * @tc.desc      5fps 在 400ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0182 begin');
      const fps: number = 5;
      const frames: number = 2;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 400000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(200000);
      expect(totalUs).assertEqual(400000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0182 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0183
     * @tc.name      soloFrameRate0183
     * @tc.desc      5fps 步长 3 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0183 begin');
      const fps: number = 5;
      const step: number = 3;
      const stamps: number[] = [0, 600, 1200, 1800, 2400];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(2400);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0183 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0184
     * @tc.name      soloFrameRate0184
     * @tc.desc      5fps 在 500ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0184 begin');
      const fps: number = 5;
      const duration: number = 500;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(2);
      expect(interval.toFixed(4)).assertEqual('200.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0184 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0185
     * @tc.name      soloFrameRate0185
     * @tc.desc      5fps 在 500ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0185 begin');
      const fps: number = 5;
      const frames: number = 2;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 500000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(200000);
      expect(totalUs).assertEqual(400000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0185 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0186
     * @tc.name      soloFrameRate0186
     * @tc.desc      5fps 步长 1 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0186 begin');
      const fps: number = 5;
      const step: number = 1;
      const stamps: number[] = [0, 200, 400, 600, 800];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(800);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0186 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0187
     * @tc.name      soloFrameRate0187
     * @tc.desc      5fps 在 600ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0187 begin');
      const fps: number = 5;
      const duration: number = 600;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(3);
      expect(interval.toFixed(4)).assertEqual('200.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0187 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0188
     * @tc.name      soloFrameRate0188
     * @tc.desc      5fps 在 600ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0188 begin');
      const fps: number = 5;
      const frames: number = 3;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 600000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(200000);
      expect(totalUs).assertEqual(600000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0188 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0189
     * @tc.name      soloFrameRate0189
     * @tc.desc      5fps 步长 2 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0189 begin');
      const fps: number = 5;
      const step: number = 2;
      const stamps: number[] = [0, 400, 800, 1200, 1600];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(1600);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0189 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0190
     * @tc.name      soloFrameRate0190
     * @tc.desc      5fps 在 750ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0190 begin');
      const fps: number = 5;
      const duration: number = 750;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(3);
      expect(interval.toFixed(4)).assertEqual('200.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0190 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0191
     * @tc.name      soloFrameRate0191
     * @tc.desc      5fps 在 750ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0191 begin');
      const fps: number = 5;
      const frames: number = 3;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 750000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(200000);
      expect(totalUs).assertEqual(600000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0191 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0192
     * @tc.name      soloFrameRate0192
     * @tc.desc      5fps 步长 3 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0192 begin');
      const fps: number = 5;
      const step: number = 3;
      const stamps: number[] = [0, 600, 1200, 1800, 2400];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(2400);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0192 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0193
     * @tc.name      soloFrameRate0193
     * @tc.desc      5fps 在 1000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0193 begin');
      const fps: number = 5;
      const duration: number = 1000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(5);
      expect(interval.toFixed(4)).assertEqual('200.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0193 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0194
     * @tc.name      soloFrameRate0194
     * @tc.desc      5fps 在 1000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0194 begin');
      const fps: number = 5;
      const frames: number = 5;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 1000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(200000);
      expect(totalUs).assertEqual(1000000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0194 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0195
     * @tc.name      soloFrameRate0195
     * @tc.desc      5fps 步长 1 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0195 begin');
      const fps: number = 5;
      const step: number = 1;
      const stamps: number[] = [0, 200, 400, 600, 800];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(800);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0195 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0196
     * @tc.name      soloFrameRate0196
     * @tc.desc      5fps 在 1200ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0196 begin');
      const fps: number = 5;
      const duration: number = 1200;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(6);
      expect(interval.toFixed(4)).assertEqual('200.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0196 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0197
     * @tc.name      soloFrameRate0197
     * @tc.desc      5fps 在 1200ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0197 begin');
      const fps: number = 5;
      const frames: number = 6;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 1200000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(200000);
      expect(totalUs).assertEqual(1200000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0197 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0198
     * @tc.name      soloFrameRate0198
     * @tc.desc      5fps 步长 2 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0198 begin');
      const fps: number = 5;
      const step: number = 2;
      const stamps: number[] = [0, 400, 800, 1200, 1600];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(1600);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0198 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0199
     * @tc.name      soloFrameRate0199
     * @tc.desc      5fps 在 1500ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0199 begin');
      const fps: number = 5;
      const duration: number = 1500;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(7);
      expect(interval.toFixed(4)).assertEqual('200.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0199 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0200
     * @tc.name      soloFrameRate0200
     * @tc.desc      5fps 在 1500ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0200 begin');
      const fps: number = 5;
      const frames: number = 7;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 1500000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(200000);
      expect(totalUs).assertEqual(1400000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0200 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0201
     * @tc.name      soloFrameRate0201
     * @tc.desc      5fps 步长 3 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0201 begin');
      const fps: number = 5;
      const step: number = 3;
      const stamps: number[] = [0, 600, 1200, 1800, 2400];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(2400);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0201 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0202
     * @tc.name      soloFrameRate0202
     * @tc.desc      5fps 在 1600ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0202 begin');
      const fps: number = 5;
      const duration: number = 1600;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(8);
      expect(interval.toFixed(4)).assertEqual('200.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0202 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0203
     * @tc.name      soloFrameRate0203
     * @tc.desc      5fps 在 1600ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0203 begin');
      const fps: number = 5;
      const frames: number = 8;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 1600000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(200000);
      expect(totalUs).assertEqual(1600000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0203 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0204
     * @tc.name      soloFrameRate0204
     * @tc.desc      5fps 步长 1 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0204 begin');
      const fps: number = 5;
      const step: number = 1;
      const stamps: number[] = [0, 200, 400, 600, 800];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(800);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0204 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0205
     * @tc.name      soloFrameRate0205
     * @tc.desc      5fps 在 2000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0205 begin');
      const fps: number = 5;
      const duration: number = 2000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(10);
      expect(interval.toFixed(4)).assertEqual('200.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0205 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0206
     * @tc.name      soloFrameRate0206
     * @tc.desc      5fps 在 2000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0206 begin');
      const fps: number = 5;
      const frames: number = 10;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 2000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(200000);
      expect(totalUs).assertEqual(2000000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0206 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0207
     * @tc.name      soloFrameRate0207
     * @tc.desc      5fps 步长 2 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0207 begin');
      const fps: number = 5;
      const step: number = 2;
      const stamps: number[] = [0, 400, 800, 1200, 1600];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(1600);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0207 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0208
     * @tc.name      soloFrameRate0208
     * @tc.desc      5fps 在 2400ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0208 begin');
      const fps: number = 5;
      const duration: number = 2400;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(12);
      expect(interval.toFixed(4)).assertEqual('200.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0208 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0209
     * @tc.name      soloFrameRate0209
     * @tc.desc      5fps 在 2400ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0209 begin');
      const fps: number = 5;
      const frames: number = 12;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 2400000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(200000);
      expect(totalUs).assertEqual(2400000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0209 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0210
     * @tc.name      soloFrameRate0210
     * @tc.desc      5fps 步长 3 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0210 begin');
      const fps: number = 5;
      const step: number = 3;
      const stamps: number[] = [0, 600, 1200, 1800, 2400];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(2400);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0210 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0211
     * @tc.name      soloFrameRate0211
     * @tc.desc      5fps 在 2500ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0211 begin');
      const fps: number = 5;
      const duration: number = 2500;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(12);
      expect(interval.toFixed(4)).assertEqual('200.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0211 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0212
     * @tc.name      soloFrameRate0212
     * @tc.desc      5fps 在 2500ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0212 begin');
      const fps: number = 5;
      const frames: number = 12;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 2500000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(200000);
      expect(totalUs).assertEqual(2400000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0212 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0213
     * @tc.name      soloFrameRate0213
     * @tc.desc      5fps 步长 1 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0213 begin');
      const fps: number = 5;
      const step: number = 1;
      const stamps: number[] = [0, 200, 400, 600, 800];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(800);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0213 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0214
     * @tc.name      soloFrameRate0214
     * @tc.desc      5fps 在 3000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0214 begin');
      const fps: number = 5;
      const duration: number = 3000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(15);
      expect(interval.toFixed(4)).assertEqual('200.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0214 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0215
     * @tc.name      soloFrameRate0215
     * @tc.desc      5fps 在 3000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0215 begin');
      const fps: number = 5;
      const frames: number = 15;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 3000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(200000);
      expect(totalUs).assertEqual(3000000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0215 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0216
     * @tc.name      soloFrameRate0216
     * @tc.desc      5fps 步长 2 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0216 begin');
      const fps: number = 5;
      const step: number = 2;
      const stamps: number[] = [0, 400, 800, 1200, 1600];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(1600);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0216 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0217
     * @tc.name      soloFrameRate0217
     * @tc.desc      5fps 在 4000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0217 begin');
      const fps: number = 5;
      const duration: number = 4000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(20);
      expect(interval.toFixed(4)).assertEqual('200.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0217 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0218
     * @tc.name      soloFrameRate0218
     * @tc.desc      5fps 在 4000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0218 begin');
      const fps: number = 5;
      const frames: number = 20;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 4000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(200000);
      expect(totalUs).assertEqual(4000000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0218 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0219
     * @tc.name      soloFrameRate0219
     * @tc.desc      5fps 步长 3 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0219 begin');
      const fps: number = 5;
      const step: number = 3;
      const stamps: number[] = [0, 600, 1200, 1800, 2400];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(2400);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0219 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0220
     * @tc.name      soloFrameRate0220
     * @tc.desc      5fps 在 5000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0220 begin');
      const fps: number = 5;
      const duration: number = 5000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(25);
      expect(interval.toFixed(4)).assertEqual('200.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0220 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0221
     * @tc.name      soloFrameRate0221
     * @tc.desc      5fps 在 5000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0221 begin');
      const fps: number = 5;
      const frames: number = 25;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 5000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(200000);
      expect(totalUs).assertEqual(5000000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0221 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0222
     * @tc.name      soloFrameRate0222
     * @tc.desc      5fps 步长 1 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0222 begin');
      const fps: number = 5;
      const step: number = 1;
      const stamps: number[] = [0, 200, 400, 600, 800];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(800);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0222 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0223
     * @tc.name      soloFrameRate0223
     * @tc.desc      5fps 在 6000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0223 begin');
      const fps: number = 5;
      const duration: number = 6000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(30);
      expect(interval.toFixed(4)).assertEqual('200.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0223 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0224
     * @tc.name      soloFrameRate0224
     * @tc.desc      5fps 在 6000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0224 begin');
      const fps: number = 5;
      const frames: number = 30;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 6000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(200000);
      expect(totalUs).assertEqual(6000000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0224 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0225
     * @tc.name      soloFrameRate0225
     * @tc.desc      5fps 步长 2 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0225 begin');
      const fps: number = 5;
      const step: number = 2;
      const stamps: number[] = [0, 400, 800, 1200, 1600];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(1600);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0225 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0226
     * @tc.name      soloFrameRate0226
     * @tc.desc      5fps 在 7500ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0226 begin');
      const fps: number = 5;
      const duration: number = 7500;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(37);
      expect(interval.toFixed(4)).assertEqual('200.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0226 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0227
     * @tc.name      soloFrameRate0227
     * @tc.desc      5fps 在 7500ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0227 begin');
      const fps: number = 5;
      const frames: number = 37;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 7500000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(200000);
      expect(totalUs).assertEqual(7400000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0227 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0228
     * @tc.name      soloFrameRate0228
     * @tc.desc      5fps 步长 3 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0228 begin');
      const fps: number = 5;
      const step: number = 3;
      const stamps: number[] = [0, 600, 1200, 1800, 2400];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(2400);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0228 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0229
     * @tc.name      soloFrameRate0229
     * @tc.desc      5fps 在 8000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0229 begin');
      const fps: number = 5;
      const duration: number = 8000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(40);
      expect(interval.toFixed(4)).assertEqual('200.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0229 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0230
     * @tc.name      soloFrameRate0230
     * @tc.desc      5fps 在 8000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0230 begin');
      const fps: number = 5;
      const frames: number = 40;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 8000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(200000);
      expect(totalUs).assertEqual(8000000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0230 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0231
     * @tc.name      soloFrameRate0231
     * @tc.desc      5fps 步长 1 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0231 begin');
      const fps: number = 5;
      const step: number = 1;
      const stamps: number[] = [0, 200, 400, 600, 800];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(800);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0231 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0232
     * @tc.name      soloFrameRate0232
     * @tc.desc      5fps 在 10000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0232 begin');
      const fps: number = 5;
      const duration: number = 10000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(50);
      expect(interval.toFixed(4)).assertEqual('200.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0232 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0233
     * @tc.name      soloFrameRate0233
     * @tc.desc      5fps 在 10000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0233 begin');
      const fps: number = 5;
      const frames: number = 50;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 10000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(200000);
      expect(totalUs).assertEqual(10000000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0233 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0234
     * @tc.name      soloFrameRate0234
     * @tc.desc      5fps 步长 2 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0234 begin');
      const fps: number = 5;
      const step: number = 2;
      const stamps: number[] = [0, 400, 800, 1200, 1600];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(1600);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0234 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0235
     * @tc.name      soloFrameRate0235
     * @tc.desc      5fps 在 12000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0235 begin');
      const fps: number = 5;
      const duration: number = 12000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(60);
      expect(interval.toFixed(4)).assertEqual('200.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0235 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0236
     * @tc.name      soloFrameRate0236
     * @tc.desc      5fps 在 12000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0236 begin');
      const fps: number = 5;
      const frames: number = 60;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 12000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(200000);
      expect(totalUs).assertEqual(12000000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0236 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0237
     * @tc.name      soloFrameRate0237
     * @tc.desc      5fps 步长 3 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0237 begin');
      const fps: number = 5;
      const step: number = 3;
      const stamps: number[] = [0, 600, 1200, 1800, 2400];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(2400);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0237 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0238
     * @tc.name      soloFrameRate0238
     * @tc.desc      5fps 在 15000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0238 begin');
      const fps: number = 5;
      const duration: number = 15000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(75);
      expect(interval.toFixed(4)).assertEqual('200.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0238 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0239
     * @tc.name      soloFrameRate0239
     * @tc.desc      5fps 在 15000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0239 begin');
      const fps: number = 5;
      const frames: number = 75;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 15000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(200000);
      expect(totalUs).assertEqual(15000000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0239 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0240
     * @tc.name      soloFrameRate0240
     * @tc.desc      5fps 步长 1 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0240 begin');
      const fps: number = 5;
      const step: number = 1;
      const stamps: number[] = [0, 200, 400, 600, 800];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(800);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0240 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0241
     * @tc.name      soloFrameRate0241
     * @tc.desc      5fps 在 16000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0241 begin');
      const fps: number = 5;
      const duration: number = 16000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(80);
      expect(interval.toFixed(4)).assertEqual('200.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0241 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0242
     * @tc.name      soloFrameRate0242
     * @tc.desc      5fps 在 16000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0242 begin');
      const fps: number = 5;
      const frames: number = 80;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 16000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(200000);
      expect(totalUs).assertEqual(16000000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0242 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0243
     * @tc.name      soloFrameRate0243
     * @tc.desc      5fps 步长 2 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0243 begin');
      const fps: number = 5;
      const step: number = 2;
      const stamps: number[] = [0, 400, 800, 1200, 1600];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(1600);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0243 end');
    })
  })
}
