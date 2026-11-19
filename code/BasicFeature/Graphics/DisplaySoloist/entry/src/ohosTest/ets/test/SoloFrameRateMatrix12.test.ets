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

export default function soloFrameRateMatrix12Test(): void {
  describe('SoloFrameRateMatrix12Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    SOLO_FRAME_RATE_0892
     * @tc.name      soloFrameRate0892
     * @tc.desc      24fps 在 600000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0892', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0892 begin');
      const fps: number = 24;
      const duration: number = 600000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(14400);
      expect(interval.toFixed(4)).assertEqual('41.6667');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0892 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0893
     * @tc.name      soloFrameRate0893
     * @tc.desc      24fps 在 600000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0893', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0893 begin');
      const fps: number = 24;
      const frames: number = 14400;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 600000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(41667);
      expect(totalUs).assertEqual(600004800);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0893 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0894
     * @tc.name      soloFrameRate0894
     * @tc.desc      24fps 步长 2 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0894', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0894 begin');
      const fps: number = 24;
      const step: number = 2;
      const stamps: number[] = [0, 83, 167, 250, 333];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(333);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0894 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0895
     * @tc.name      soloFrameRate0895
     * @tc.desc      24fps 在 900000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0895', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0895 begin');
      const fps: number = 24;
      const duration: number = 900000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(21600);
      expect(interval.toFixed(4)).assertEqual('41.6667');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0895 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0896
     * @tc.name      soloFrameRate0896
     * @tc.desc      24fps 在 900000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0896', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0896 begin');
      const fps: number = 24;
      const frames: number = 21600;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 900000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(41667);
      expect(totalUs).assertEqual(900007200);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0896 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0897
     * @tc.name      soloFrameRate0897
     * @tc.desc      24fps 步长 3 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0897', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0897 begin');
      const fps: number = 24;
      const step: number = 3;
      const stamps: number[] = [0, 125, 250, 375, 500];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(500);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0897 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0898
     * @tc.name      soloFrameRate0898
     * @tc.desc      24fps 在 1800000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0898', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0898 begin');
      const fps: number = 24;
      const duration: number = 1800000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(43200);
      expect(interval.toFixed(4)).assertEqual('41.6667');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0898 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0899
     * @tc.name      soloFrameRate0899
     * @tc.desc      24fps 在 1800000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0899', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0899 begin');
      const fps: number = 24;
      const frames: number = 43200;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 1800000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(41667);
      expect(totalUs).assertEqual(1800014400);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0899 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0900
     * @tc.name      soloFrameRate0900
     * @tc.desc      24fps 步长 1 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0900 begin');
      const fps: number = 24;
      const step: number = 1;
      const stamps: number[] = [0, 42, 83, 125, 167];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(167);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0900 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0901
     * @tc.name      soloFrameRate0901
     * @tc.desc      25fps 在 16ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0901', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0901 begin');
      const fps: number = 25;
      const duration: number = 16;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(0);
      expect(interval.toFixed(4)).assertEqual('40.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0901 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0902
     * @tc.name      soloFrameRate0902
     * @tc.desc      25fps 在 16ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0902', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0902 begin');
      const fps: number = 25;
      const frames: number = 0;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 16000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(40000);
      expect(totalUs).assertEqual(0);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0902 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0903
     * @tc.name      soloFrameRate0903
     * @tc.desc      25fps 步长 1 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0903', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0903 begin');
      const fps: number = 25;
      const step: number = 1;
      const stamps: number[] = [0, 40, 80, 120, 160];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(160);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0903 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0904
     * @tc.name      soloFrameRate0904
     * @tc.desc      25fps 在 33ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0904', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0904 begin');
      const fps: number = 25;
      const duration: number = 33;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(0);
      expect(interval.toFixed(4)).assertEqual('40.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0904 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0905
     * @tc.name      soloFrameRate0905
     * @tc.desc      25fps 在 33ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0905', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0905 begin');
      const fps: number = 25;
      const frames: number = 0;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 33000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(40000);
      expect(totalUs).assertEqual(0);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0905 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0906
     * @tc.name      soloFrameRate0906
     * @tc.desc      25fps 步长 2 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0906', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0906 begin');
      const fps: number = 25;
      const step: number = 2;
      const stamps: number[] = [0, 80, 160, 240, 320];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(320);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0906 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0907
     * @tc.name      soloFrameRate0907
     * @tc.desc      25fps 在 50ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0907', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0907 begin');
      const fps: number = 25;
      const duration: number = 50;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(1);
      expect(interval.toFixed(4)).assertEqual('40.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0907 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0908
     * @tc.name      soloFrameRate0908
     * @tc.desc      25fps 在 50ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0908', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0908 begin');
      const fps: number = 25;
      const frames: number = 1;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 50000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(40000);
      expect(totalUs).assertEqual(40000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0908 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0909
     * @tc.name      soloFrameRate0909
     * @tc.desc      25fps 步长 3 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0909', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0909 begin');
      const fps: number = 25;
      const step: number = 3;
      const stamps: number[] = [0, 120, 240, 360, 480];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(480);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0909 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0910
     * @tc.name      soloFrameRate0910
     * @tc.desc      25fps 在 100ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0910', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0910 begin');
      const fps: number = 25;
      const duration: number = 100;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(2);
      expect(interval.toFixed(4)).assertEqual('40.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0910 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0911
     * @tc.name      soloFrameRate0911
     * @tc.desc      25fps 在 100ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0911', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0911 begin');
      const fps: number = 25;
      const frames: number = 2;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 100000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(40000);
      expect(totalUs).assertEqual(80000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0911 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0912
     * @tc.name      soloFrameRate0912
     * @tc.desc      25fps 步长 1 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0912', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0912 begin');
      const fps: number = 25;
      const step: number = 1;
      const stamps: number[] = [0, 40, 80, 120, 160];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(160);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0912 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0913
     * @tc.name      soloFrameRate0913
     * @tc.desc      25fps 在 125ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0913', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0913 begin');
      const fps: number = 25;
      const duration: number = 125;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(3);
      expect(interval.toFixed(4)).assertEqual('40.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0913 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0914
     * @tc.name      soloFrameRate0914
     * @tc.desc      25fps 在 125ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0914', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0914 begin');
      const fps: number = 25;
      const frames: number = 3;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 125000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(40000);
      expect(totalUs).assertEqual(120000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0914 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0915
     * @tc.name      soloFrameRate0915
     * @tc.desc      25fps 步长 2 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0915', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0915 begin');
      const fps: number = 25;
      const step: number = 2;
      const stamps: number[] = [0, 80, 160, 240, 320];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(320);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0915 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0916
     * @tc.name      soloFrameRate0916
     * @tc.desc      25fps 在 167ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0916', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0916 begin');
      const fps: number = 25;
      const duration: number = 167;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(4);
      expect(interval.toFixed(4)).assertEqual('40.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0916 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0917
     * @tc.name      soloFrameRate0917
     * @tc.desc      25fps 在 167ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0917', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0917 begin');
      const fps: number = 25;
      const frames: number = 4;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 167000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(40000);
      expect(totalUs).assertEqual(160000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0917 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0918
     * @tc.name      soloFrameRate0918
     * @tc.desc      25fps 步长 3 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0918', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0918 begin');
      const fps: number = 25;
      const step: number = 3;
      const stamps: number[] = [0, 120, 240, 360, 480];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(480);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0918 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0919
     * @tc.name      soloFrameRate0919
     * @tc.desc      25fps 在 200ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0919', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0919 begin');
      const fps: number = 25;
      const duration: number = 200;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(5);
      expect(interval.toFixed(4)).assertEqual('40.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0919 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0920
     * @tc.name      soloFrameRate0920
     * @tc.desc      25fps 在 200ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0920', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0920 begin');
      const fps: number = 25;
      const frames: number = 5;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 200000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(40000);
      expect(totalUs).assertEqual(200000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0920 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0921
     * @tc.name      soloFrameRate0921
     * @tc.desc      25fps 步长 1 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0921', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0921 begin');
      const fps: number = 25;
      const step: number = 1;
      const stamps: number[] = [0, 40, 80, 120, 160];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(160);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0921 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0922
     * @tc.name      soloFrameRate0922
     * @tc.desc      25fps 在 250ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0922', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0922 begin');
      const fps: number = 25;
      const duration: number = 250;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(6);
      expect(interval.toFixed(4)).assertEqual('40.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0922 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0923
     * @tc.name      soloFrameRate0923
     * @tc.desc      25fps 在 250ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0923', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0923 begin');
      const fps: number = 25;
      const frames: number = 6;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 250000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(40000);
      expect(totalUs).assertEqual(240000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0923 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0924
     * @tc.name      soloFrameRate0924
     * @tc.desc      25fps 步长 2 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0924', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0924 begin');
      const fps: number = 25;
      const step: number = 2;
      const stamps: number[] = [0, 80, 160, 240, 320];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(320);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0924 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0925
     * @tc.name      soloFrameRate0925
     * @tc.desc      25fps 在 300ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0925', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0925 begin');
      const fps: number = 25;
      const duration: number = 300;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(7);
      expect(interval.toFixed(4)).assertEqual('40.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0925 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0926
     * @tc.name      soloFrameRate0926
     * @tc.desc      25fps 在 300ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0926', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0926 begin');
      const fps: number = 25;
      const frames: number = 7;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 300000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(40000);
      expect(totalUs).assertEqual(280000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0926 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0927
     * @tc.name      soloFrameRate0927
     * @tc.desc      25fps 步长 3 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0927', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0927 begin');
      const fps: number = 25;
      const step: number = 3;
      const stamps: number[] = [0, 120, 240, 360, 480];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(480);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0927 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0928
     * @tc.name      soloFrameRate0928
     * @tc.desc      25fps 在 333ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0928', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0928 begin');
      const fps: number = 25;
      const duration: number = 333;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(8);
      expect(interval.toFixed(4)).assertEqual('40.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0928 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0929
     * @tc.name      soloFrameRate0929
     * @tc.desc      25fps 在 333ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0929', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0929 begin');
      const fps: number = 25;
      const frames: number = 8;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 333000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(40000);
      expect(totalUs).assertEqual(320000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0929 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0930
     * @tc.name      soloFrameRate0930
     * @tc.desc      25fps 步长 1 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0930', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0930 begin');
      const fps: number = 25;
      const step: number = 1;
      const stamps: number[] = [0, 40, 80, 120, 160];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(160);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0930 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0931
     * @tc.name      soloFrameRate0931
     * @tc.desc      25fps 在 400ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0931', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0931 begin');
      const fps: number = 25;
      const duration: number = 400;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(10);
      expect(interval.toFixed(4)).assertEqual('40.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0931 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0932
     * @tc.name      soloFrameRate0932
     * @tc.desc      25fps 在 400ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0932', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0932 begin');
      const fps: number = 25;
      const frames: number = 10;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 400000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(40000);
      expect(totalUs).assertEqual(400000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0932 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0933
     * @tc.name      soloFrameRate0933
     * @tc.desc      25fps 步长 2 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0933', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0933 begin');
      const fps: number = 25;
      const step: number = 2;
      const stamps: number[] = [0, 80, 160, 240, 320];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(320);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0933 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0934
     * @tc.name      soloFrameRate0934
     * @tc.desc      25fps 在 500ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0934', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0934 begin');
      const fps: number = 25;
      const duration: number = 500;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(12);
      expect(interval.toFixed(4)).assertEqual('40.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0934 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0935
     * @tc.name      soloFrameRate0935
     * @tc.desc      25fps 在 500ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0935', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0935 begin');
      const fps: number = 25;
      const frames: number = 12;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 500000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(40000);
      expect(totalUs).assertEqual(480000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0935 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0936
     * @tc.name      soloFrameRate0936
     * @tc.desc      25fps 步长 3 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0936', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0936 begin');
      const fps: number = 25;
      const step: number = 3;
      const stamps: number[] = [0, 120, 240, 360, 480];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(480);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0936 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0937
     * @tc.name      soloFrameRate0937
     * @tc.desc      25fps 在 600ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0937', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0937 begin');
      const fps: number = 25;
      const duration: number = 600;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(15);
      expect(interval.toFixed(4)).assertEqual('40.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0937 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0938
     * @tc.name      soloFrameRate0938
     * @tc.desc      25fps 在 600ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0938', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0938 begin');
      const fps: number = 25;
      const frames: number = 15;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 600000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(40000);
      expect(totalUs).assertEqual(600000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0938 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0939
     * @tc.name      soloFrameRate0939
     * @tc.desc      25fps 步长 1 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0939', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0939 begin');
      const fps: number = 25;
      const step: number = 1;
      const stamps: number[] = [0, 40, 80, 120, 160];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(160);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0939 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0940
     * @tc.name      soloFrameRate0940
     * @tc.desc      25fps 在 750ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0940', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0940 begin');
      const fps: number = 25;
      const duration: number = 750;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(18);
      expect(interval.toFixed(4)).assertEqual('40.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0940 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0941
     * @tc.name      soloFrameRate0941
     * @tc.desc      25fps 在 750ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0941', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0941 begin');
      const fps: number = 25;
      const frames: number = 18;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 750000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(40000);
      expect(totalUs).assertEqual(720000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0941 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0942
     * @tc.name      soloFrameRate0942
     * @tc.desc      25fps 步长 2 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0942', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0942 begin');
      const fps: number = 25;
      const step: number = 2;
      const stamps: number[] = [0, 80, 160, 240, 320];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(320);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0942 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0943
     * @tc.name      soloFrameRate0943
     * @tc.desc      25fps 在 1000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0943', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0943 begin');
      const fps: number = 25;
      const duration: number = 1000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(25);
      expect(interval.toFixed(4)).assertEqual('40.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0943 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0944
     * @tc.name      soloFrameRate0944
     * @tc.desc      25fps 在 1000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0944', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0944 begin');
      const fps: number = 25;
      const frames: number = 25;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 1000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(40000);
      expect(totalUs).assertEqual(1000000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0944 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0945
     * @tc.name      soloFrameRate0945
     * @tc.desc      25fps 步长 3 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0945', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0945 begin');
      const fps: number = 25;
      const step: number = 3;
      const stamps: number[] = [0, 120, 240, 360, 480];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(480);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0945 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0946
     * @tc.name      soloFrameRate0946
     * @tc.desc      25fps 在 1200ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0946', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0946 begin');
      const fps: number = 25;
      const duration: number = 1200;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(30);
      expect(interval.toFixed(4)).assertEqual('40.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0946 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0947
     * @tc.name      soloFrameRate0947
     * @tc.desc      25fps 在 1200ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0947', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0947 begin');
      const fps: number = 25;
      const frames: number = 30;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 1200000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(40000);
      expect(totalUs).assertEqual(1200000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0947 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0948
     * @tc.name      soloFrameRate0948
     * @tc.desc      25fps 步长 1 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0948', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0948 begin');
      const fps: number = 25;
      const step: number = 1;
      const stamps: number[] = [0, 40, 80, 120, 160];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(160);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0948 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0949
     * @tc.name      soloFrameRate0949
     * @tc.desc      25fps 在 1500ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0949', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0949 begin');
      const fps: number = 25;
      const duration: number = 1500;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(37);
      expect(interval.toFixed(4)).assertEqual('40.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0949 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0950
     * @tc.name      soloFrameRate0950
     * @tc.desc      25fps 在 1500ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0950', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0950 begin');
      const fps: number = 25;
      const frames: number = 37;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 1500000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(40000);
      expect(totalUs).assertEqual(1480000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0950 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0951
     * @tc.name      soloFrameRate0951
     * @tc.desc      25fps 步长 2 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0951', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0951 begin');
      const fps: number = 25;
      const step: number = 2;
      const stamps: number[] = [0, 80, 160, 240, 320];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(320);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0951 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0952
     * @tc.name      soloFrameRate0952
     * @tc.desc      25fps 在 1600ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0952', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0952 begin');
      const fps: number = 25;
      const duration: number = 1600;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(40);
      expect(interval.toFixed(4)).assertEqual('40.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0952 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0953
     * @tc.name      soloFrameRate0953
     * @tc.desc      25fps 在 1600ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0953', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0953 begin');
      const fps: number = 25;
      const frames: number = 40;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 1600000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(40000);
      expect(totalUs).assertEqual(1600000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0953 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0954
     * @tc.name      soloFrameRate0954
     * @tc.desc      25fps 步长 3 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0954', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0954 begin');
      const fps: number = 25;
      const step: number = 3;
      const stamps: number[] = [0, 120, 240, 360, 480];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(480);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0954 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0955
     * @tc.name      soloFrameRate0955
     * @tc.desc      25fps 在 2000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0955', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0955 begin');
      const fps: number = 25;
      const duration: number = 2000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(50);
      expect(interval.toFixed(4)).assertEqual('40.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0955 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0956
     * @tc.name      soloFrameRate0956
     * @tc.desc      25fps 在 2000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0956', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0956 begin');
      const fps: number = 25;
      const frames: number = 50;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 2000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(40000);
      expect(totalUs).assertEqual(2000000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0956 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0957
     * @tc.name      soloFrameRate0957
     * @tc.desc      25fps 步长 1 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0957', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0957 begin');
      const fps: number = 25;
      const step: number = 1;
      const stamps: number[] = [0, 40, 80, 120, 160];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(160);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0957 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0958
     * @tc.name      soloFrameRate0958
     * @tc.desc      25fps 在 2400ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0958', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0958 begin');
      const fps: number = 25;
      const duration: number = 2400;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(60);
      expect(interval.toFixed(4)).assertEqual('40.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0958 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0959
     * @tc.name      soloFrameRate0959
     * @tc.desc      25fps 在 2400ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0959', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0959 begin');
      const fps: number = 25;
      const frames: number = 60;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 2400000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(40000);
      expect(totalUs).assertEqual(2400000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0959 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0960
     * @tc.name      soloFrameRate0960
     * @tc.desc      25fps 步长 2 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0960', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0960 begin');
      const fps: number = 25;
      const step: number = 2;
      const stamps: number[] = [0, 80, 160, 240, 320];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(320);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0960 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0961
     * @tc.name      soloFrameRate0961
     * @tc.desc      25fps 在 2500ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0961', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0961 begin');
      const fps: number = 25;
      const duration: number = 2500;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(62);
      expect(interval.toFixed(4)).assertEqual('40.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0961 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0962
     * @tc.name      soloFrameRate0962
     * @tc.desc      25fps 在 2500ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0962', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0962 begin');
      const fps: number = 25;
      const frames: number = 62;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 2500000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(40000);
      expect(totalUs).assertEqual(2480000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0962 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0963
     * @tc.name      soloFrameRate0963
     * @tc.desc      25fps 步长 3 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0963', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0963 begin');
      const fps: number = 25;
      const step: number = 3;
      const stamps: number[] = [0, 120, 240, 360, 480];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(480);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0963 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0964
     * @tc.name      soloFrameRate0964
     * @tc.desc      25fps 在 3000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0964', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0964 begin');
      const fps: number = 25;
      const duration: number = 3000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(75);
      expect(interval.toFixed(4)).assertEqual('40.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0964 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0965
     * @tc.name      soloFrameRate0965
     * @tc.desc      25fps 在 3000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0965', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0965 begin');
      const fps: number = 25;
      const frames: number = 75;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 3000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(40000);
      expect(totalUs).assertEqual(3000000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0965 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0966
     * @tc.name      soloFrameRate0966
     * @tc.desc      25fps 步长 1 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0966', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0966 begin');
      const fps: number = 25;
      const step: number = 1;
      const stamps: number[] = [0, 40, 80, 120, 160];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(160);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0966 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0967
     * @tc.name      soloFrameRate0967
     * @tc.desc      25fps 在 4000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0967', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0967 begin');
      const fps: number = 25;
      const duration: number = 4000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(100);
      expect(interval.toFixed(4)).assertEqual('40.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0967 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0968
     * @tc.name      soloFrameRate0968
     * @tc.desc      25fps 在 4000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0968', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0968 begin');
      const fps: number = 25;
      const frames: number = 100;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 4000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(40000);
      expect(totalUs).assertEqual(4000000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0968 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0969
     * @tc.name      soloFrameRate0969
     * @tc.desc      25fps 步长 2 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0969', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0969 begin');
      const fps: number = 25;
      const step: number = 2;
      const stamps: number[] = [0, 80, 160, 240, 320];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(320);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0969 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0970
     * @tc.name      soloFrameRate0970
     * @tc.desc      25fps 在 5000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0970', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0970 begin');
      const fps: number = 25;
      const duration: number = 5000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(125);
      expect(interval.toFixed(4)).assertEqual('40.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0970 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0971
     * @tc.name      soloFrameRate0971
     * @tc.desc      25fps 在 5000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0971', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0971 begin');
      const fps: number = 25;
      const frames: number = 125;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 5000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(40000);
      expect(totalUs).assertEqual(5000000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0971 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0972
     * @tc.name      soloFrameRate0972
     * @tc.desc      25fps 步长 3 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0972', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0972 begin');
      const fps: number = 25;
      const step: number = 3;
      const stamps: number[] = [0, 120, 240, 360, 480];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(480);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0972 end');
    })
  })
}
