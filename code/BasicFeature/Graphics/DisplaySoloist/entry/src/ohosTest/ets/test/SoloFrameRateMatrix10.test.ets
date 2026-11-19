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

export default function soloFrameRateMatrix10Test(): void {
  describe('SoloFrameRateMatrix10Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    SOLO_FRAME_RATE_0730
     * @tc.name      soloFrameRate0730
     * @tc.desc      20fps 在 160000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0730', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0730 begin');
      const fps: number = 20;
      const duration: number = 160000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(3200);
      expect(interval.toFixed(4)).assertEqual('50.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0730 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0731
     * @tc.name      soloFrameRate0731
     * @tc.desc      20fps 在 160000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0731', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0731 begin');
      const fps: number = 20;
      const frames: number = 3200;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 160000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(50000);
      expect(totalUs).assertEqual(160000000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0731 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0732
     * @tc.name      soloFrameRate0732
     * @tc.desc      20fps 步长 3 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0732', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0732 begin');
      const fps: number = 20;
      const step: number = 3;
      const stamps: number[] = [0, 150, 300, 450, 600];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(600);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0732 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0733
     * @tc.name      soloFrameRate0733
     * @tc.desc      20fps 在 240000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0733', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0733 begin');
      const fps: number = 20;
      const duration: number = 240000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(4800);
      expect(interval.toFixed(4)).assertEqual('50.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0733 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0734
     * @tc.name      soloFrameRate0734
     * @tc.desc      20fps 在 240000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0734', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0734 begin');
      const fps: number = 20;
      const frames: number = 4800;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 240000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(50000);
      expect(totalUs).assertEqual(240000000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0734 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0735
     * @tc.name      soloFrameRate0735
     * @tc.desc      20fps 步长 1 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0735', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0735 begin');
      const fps: number = 20;
      const step: number = 1;
      const stamps: number[] = [0, 50, 100, 150, 200];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(200);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0735 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0736
     * @tc.name      soloFrameRate0736
     * @tc.desc      20fps 在 300000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0736', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0736 begin');
      const fps: number = 20;
      const duration: number = 300000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(6000);
      expect(interval.toFixed(4)).assertEqual('50.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0736 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0737
     * @tc.name      soloFrameRate0737
     * @tc.desc      20fps 在 300000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0737', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0737 begin');
      const fps: number = 20;
      const frames: number = 6000;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 300000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(50000);
      expect(totalUs).assertEqual(300000000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0737 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0738
     * @tc.name      soloFrameRate0738
     * @tc.desc      20fps 步长 2 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0738', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0738 begin');
      const fps: number = 20;
      const step: number = 2;
      const stamps: number[] = [0, 100, 200, 300, 400];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(400);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0738 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0739
     * @tc.name      soloFrameRate0739
     * @tc.desc      20fps 在 360000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0739', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0739 begin');
      const fps: number = 20;
      const duration: number = 360000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(7200);
      expect(interval.toFixed(4)).assertEqual('50.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0739 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0740
     * @tc.name      soloFrameRate0740
     * @tc.desc      20fps 在 360000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0740', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0740 begin');
      const fps: number = 20;
      const frames: number = 7200;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 360000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(50000);
      expect(totalUs).assertEqual(360000000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0740 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0741
     * @tc.name      soloFrameRate0741
     * @tc.desc      20fps 步长 3 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0741', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0741 begin');
      const fps: number = 20;
      const step: number = 3;
      const stamps: number[] = [0, 150, 300, 450, 600];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(600);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0741 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0742
     * @tc.name      soloFrameRate0742
     * @tc.desc      20fps 在 600000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0742', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0742 begin');
      const fps: number = 20;
      const duration: number = 600000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(12000);
      expect(interval.toFixed(4)).assertEqual('50.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0742 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0743
     * @tc.name      soloFrameRate0743
     * @tc.desc      20fps 在 600000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0743', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0743 begin');
      const fps: number = 20;
      const frames: number = 12000;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 600000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(50000);
      expect(totalUs).assertEqual(600000000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0743 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0744
     * @tc.name      soloFrameRate0744
     * @tc.desc      20fps 步长 1 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0744', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0744 begin');
      const fps: number = 20;
      const step: number = 1;
      const stamps: number[] = [0, 50, 100, 150, 200];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(200);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0744 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0745
     * @tc.name      soloFrameRate0745
     * @tc.desc      20fps 在 900000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0745', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0745 begin');
      const fps: number = 20;
      const duration: number = 900000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(18000);
      expect(interval.toFixed(4)).assertEqual('50.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0745 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0746
     * @tc.name      soloFrameRate0746
     * @tc.desc      20fps 在 900000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0746', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0746 begin');
      const fps: number = 20;
      const frames: number = 18000;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 900000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(50000);
      expect(totalUs).assertEqual(900000000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0746 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0747
     * @tc.name      soloFrameRate0747
     * @tc.desc      20fps 步长 2 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0747', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0747 begin');
      const fps: number = 20;
      const step: number = 2;
      const stamps: number[] = [0, 100, 200, 300, 400];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(400);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0747 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0748
     * @tc.name      soloFrameRate0748
     * @tc.desc      20fps 在 1800000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0748', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0748 begin');
      const fps: number = 20;
      const duration: number = 1800000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(36000);
      expect(interval.toFixed(4)).assertEqual('50.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0748 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0749
     * @tc.name      soloFrameRate0749
     * @tc.desc      20fps 在 1800000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0749', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0749 begin');
      const fps: number = 20;
      const frames: number = 36000;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 1800000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(50000);
      expect(totalUs).assertEqual(1800000000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0749 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0750
     * @tc.name      soloFrameRate0750
     * @tc.desc      20fps 步长 3 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0750', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0750 begin');
      const fps: number = 20;
      const step: number = 3;
      const stamps: number[] = [0, 150, 300, 450, 600];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(600);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0750 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0751
     * @tc.name      soloFrameRate0751
     * @tc.desc      24fps 在 16ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0751', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0751 begin');
      const fps: number = 24;
      const duration: number = 16;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(0);
      expect(interval.toFixed(4)).assertEqual('41.6667');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0751 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0752
     * @tc.name      soloFrameRate0752
     * @tc.desc      24fps 在 16ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0752', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0752 begin');
      const fps: number = 24;
      const frames: number = 0;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 16000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(41667);
      expect(totalUs).assertEqual(0);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0752 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0753
     * @tc.name      soloFrameRate0753
     * @tc.desc      24fps 步长 3 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0753', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0753 begin');
      const fps: number = 24;
      const step: number = 3;
      const stamps: number[] = [0, 125, 250, 375, 500];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(500);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0753 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0754
     * @tc.name      soloFrameRate0754
     * @tc.desc      24fps 在 33ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0754', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0754 begin');
      const fps: number = 24;
      const duration: number = 33;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(0);
      expect(interval.toFixed(4)).assertEqual('41.6667');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0754 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0755
     * @tc.name      soloFrameRate0755
     * @tc.desc      24fps 在 33ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0755', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0755 begin');
      const fps: number = 24;
      const frames: number = 0;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 33000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(41667);
      expect(totalUs).assertEqual(0);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0755 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0756
     * @tc.name      soloFrameRate0756
     * @tc.desc      24fps 步长 1 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0756', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0756 begin');
      const fps: number = 24;
      const step: number = 1;
      const stamps: number[] = [0, 42, 83, 125, 167];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(167);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0756 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0757
     * @tc.name      soloFrameRate0757
     * @tc.desc      24fps 在 50ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0757', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0757 begin');
      const fps: number = 24;
      const duration: number = 50;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(1);
      expect(interval.toFixed(4)).assertEqual('41.6667');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0757 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0758
     * @tc.name      soloFrameRate0758
     * @tc.desc      24fps 在 50ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0758', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0758 begin');
      const fps: number = 24;
      const frames: number = 1;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 50000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(41667);
      expect(totalUs).assertEqual(41667);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0758 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0759
     * @tc.name      soloFrameRate0759
     * @tc.desc      24fps 步长 2 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0759', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0759 begin');
      const fps: number = 24;
      const step: number = 2;
      const stamps: number[] = [0, 83, 167, 250, 333];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(333);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0759 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0760
     * @tc.name      soloFrameRate0760
     * @tc.desc      24fps 在 100ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0760', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0760 begin');
      const fps: number = 24;
      const duration: number = 100;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(2);
      expect(interval.toFixed(4)).assertEqual('41.6667');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0760 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0761
     * @tc.name      soloFrameRate0761
     * @tc.desc      24fps 在 100ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0761', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0761 begin');
      const fps: number = 24;
      const frames: number = 2;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 100000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(41667);
      expect(totalUs).assertEqual(83334);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0761 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0762
     * @tc.name      soloFrameRate0762
     * @tc.desc      24fps 步长 3 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0762', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0762 begin');
      const fps: number = 24;
      const step: number = 3;
      const stamps: number[] = [0, 125, 250, 375, 500];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(500);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0762 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0763
     * @tc.name      soloFrameRate0763
     * @tc.desc      24fps 在 125ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0763', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0763 begin');
      const fps: number = 24;
      const duration: number = 125;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(3);
      expect(interval.toFixed(4)).assertEqual('41.6667');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0763 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0764
     * @tc.name      soloFrameRate0764
     * @tc.desc      24fps 在 125ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0764', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0764 begin');
      const fps: number = 24;
      const frames: number = 3;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 125000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(41667);
      expect(totalUs).assertEqual(125001);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0764 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0765
     * @tc.name      soloFrameRate0765
     * @tc.desc      24fps 步长 1 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0765', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0765 begin');
      const fps: number = 24;
      const step: number = 1;
      const stamps: number[] = [0, 42, 83, 125, 167];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(167);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0765 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0766
     * @tc.name      soloFrameRate0766
     * @tc.desc      24fps 在 167ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0766', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0766 begin');
      const fps: number = 24;
      const duration: number = 167;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(4);
      expect(interval.toFixed(4)).assertEqual('41.6667');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0766 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0767
     * @tc.name      soloFrameRate0767
     * @tc.desc      24fps 在 167ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0767', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0767 begin');
      const fps: number = 24;
      const frames: number = 4;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 167000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(41667);
      expect(totalUs).assertEqual(166668);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0767 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0768
     * @tc.name      soloFrameRate0768
     * @tc.desc      24fps 步长 2 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0768', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0768 begin');
      const fps: number = 24;
      const step: number = 2;
      const stamps: number[] = [0, 83, 167, 250, 333];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(333);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0768 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0769
     * @tc.name      soloFrameRate0769
     * @tc.desc      24fps 在 200ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0769', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0769 begin');
      const fps: number = 24;
      const duration: number = 200;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(4);
      expect(interval.toFixed(4)).assertEqual('41.6667');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0769 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0770
     * @tc.name      soloFrameRate0770
     * @tc.desc      24fps 在 200ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0770', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0770 begin');
      const fps: number = 24;
      const frames: number = 4;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 200000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(41667);
      expect(totalUs).assertEqual(166668);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0770 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0771
     * @tc.name      soloFrameRate0771
     * @tc.desc      24fps 步长 3 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0771', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0771 begin');
      const fps: number = 24;
      const step: number = 3;
      const stamps: number[] = [0, 125, 250, 375, 500];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(500);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0771 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0772
     * @tc.name      soloFrameRate0772
     * @tc.desc      24fps 在 250ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0772', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0772 begin');
      const fps: number = 24;
      const duration: number = 250;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(6);
      expect(interval.toFixed(4)).assertEqual('41.6667');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0772 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0773
     * @tc.name      soloFrameRate0773
     * @tc.desc      24fps 在 250ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0773', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0773 begin');
      const fps: number = 24;
      const frames: number = 6;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 250000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(41667);
      expect(totalUs).assertEqual(250002);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0773 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0774
     * @tc.name      soloFrameRate0774
     * @tc.desc      24fps 步长 1 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0774', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0774 begin');
      const fps: number = 24;
      const step: number = 1;
      const stamps: number[] = [0, 42, 83, 125, 167];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(167);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0774 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0775
     * @tc.name      soloFrameRate0775
     * @tc.desc      24fps 在 300ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0775', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0775 begin');
      const fps: number = 24;
      const duration: number = 300;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(7);
      expect(interval.toFixed(4)).assertEqual('41.6667');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0775 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0776
     * @tc.name      soloFrameRate0776
     * @tc.desc      24fps 在 300ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0776', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0776 begin');
      const fps: number = 24;
      const frames: number = 7;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 300000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(41667);
      expect(totalUs).assertEqual(291669);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0776 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0777
     * @tc.name      soloFrameRate0777
     * @tc.desc      24fps 步长 2 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0777', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0777 begin');
      const fps: number = 24;
      const step: number = 2;
      const stamps: number[] = [0, 83, 167, 250, 333];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(333);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0777 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0778
     * @tc.name      soloFrameRate0778
     * @tc.desc      24fps 在 333ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0778', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0778 begin');
      const fps: number = 24;
      const duration: number = 333;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(7);
      expect(interval.toFixed(4)).assertEqual('41.6667');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0778 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0779
     * @tc.name      soloFrameRate0779
     * @tc.desc      24fps 在 333ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0779', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0779 begin');
      const fps: number = 24;
      const frames: number = 7;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 333000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(41667);
      expect(totalUs).assertEqual(291669);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0779 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0780
     * @tc.name      soloFrameRate0780
     * @tc.desc      24fps 步长 3 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0780', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0780 begin');
      const fps: number = 24;
      const step: number = 3;
      const stamps: number[] = [0, 125, 250, 375, 500];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(500);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0780 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0781
     * @tc.name      soloFrameRate0781
     * @tc.desc      24fps 在 400ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0781', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0781 begin');
      const fps: number = 24;
      const duration: number = 400;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(9);
      expect(interval.toFixed(4)).assertEqual('41.6667');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0781 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0782
     * @tc.name      soloFrameRate0782
     * @tc.desc      24fps 在 400ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0782', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0782 begin');
      const fps: number = 24;
      const frames: number = 9;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 400000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(41667);
      expect(totalUs).assertEqual(375003);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0782 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0783
     * @tc.name      soloFrameRate0783
     * @tc.desc      24fps 步长 1 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0783', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0783 begin');
      const fps: number = 24;
      const step: number = 1;
      const stamps: number[] = [0, 42, 83, 125, 167];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(167);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0783 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0784
     * @tc.name      soloFrameRate0784
     * @tc.desc      24fps 在 500ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0784', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0784 begin');
      const fps: number = 24;
      const duration: number = 500;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(12);
      expect(interval.toFixed(4)).assertEqual('41.6667');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0784 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0785
     * @tc.name      soloFrameRate0785
     * @tc.desc      24fps 在 500ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0785', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0785 begin');
      const fps: number = 24;
      const frames: number = 12;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 500000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(41667);
      expect(totalUs).assertEqual(500004);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0785 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0786
     * @tc.name      soloFrameRate0786
     * @tc.desc      24fps 步长 2 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0786', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0786 begin');
      const fps: number = 24;
      const step: number = 2;
      const stamps: number[] = [0, 83, 167, 250, 333];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(333);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0786 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0787
     * @tc.name      soloFrameRate0787
     * @tc.desc      24fps 在 600ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0787', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0787 begin');
      const fps: number = 24;
      const duration: number = 600;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(14);
      expect(interval.toFixed(4)).assertEqual('41.6667');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0787 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0788
     * @tc.name      soloFrameRate0788
     * @tc.desc      24fps 在 600ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0788', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0788 begin');
      const fps: number = 24;
      const frames: number = 14;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 600000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(41667);
      expect(totalUs).assertEqual(583338);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0788 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0789
     * @tc.name      soloFrameRate0789
     * @tc.desc      24fps 步长 3 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0789', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0789 begin');
      const fps: number = 24;
      const step: number = 3;
      const stamps: number[] = [0, 125, 250, 375, 500];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(500);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0789 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0790
     * @tc.name      soloFrameRate0790
     * @tc.desc      24fps 在 750ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0790', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0790 begin');
      const fps: number = 24;
      const duration: number = 750;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(18);
      expect(interval.toFixed(4)).assertEqual('41.6667');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0790 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0791
     * @tc.name      soloFrameRate0791
     * @tc.desc      24fps 在 750ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0791', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0791 begin');
      const fps: number = 24;
      const frames: number = 18;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 750000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(41667);
      expect(totalUs).assertEqual(750006);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0791 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0792
     * @tc.name      soloFrameRate0792
     * @tc.desc      24fps 步长 1 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0792', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0792 begin');
      const fps: number = 24;
      const step: number = 1;
      const stamps: number[] = [0, 42, 83, 125, 167];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(167);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0792 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0793
     * @tc.name      soloFrameRate0793
     * @tc.desc      24fps 在 1000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0793', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0793 begin');
      const fps: number = 24;
      const duration: number = 1000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(24);
      expect(interval.toFixed(4)).assertEqual('41.6667');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0793 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0794
     * @tc.name      soloFrameRate0794
     * @tc.desc      24fps 在 1000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0794', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0794 begin');
      const fps: number = 24;
      const frames: number = 24;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 1000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(41667);
      expect(totalUs).assertEqual(1000008);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0794 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0795
     * @tc.name      soloFrameRate0795
     * @tc.desc      24fps 步长 2 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0795', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0795 begin');
      const fps: number = 24;
      const step: number = 2;
      const stamps: number[] = [0, 83, 167, 250, 333];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(333);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0795 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0796
     * @tc.name      soloFrameRate0796
     * @tc.desc      24fps 在 1200ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0796', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0796 begin');
      const fps: number = 24;
      const duration: number = 1200;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(28);
      expect(interval.toFixed(4)).assertEqual('41.6667');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0796 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0797
     * @tc.name      soloFrameRate0797
     * @tc.desc      24fps 在 1200ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0797', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0797 begin');
      const fps: number = 24;
      const frames: number = 28;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 1200000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(41667);
      expect(totalUs).assertEqual(1166676);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0797 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0798
     * @tc.name      soloFrameRate0798
     * @tc.desc      24fps 步长 3 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0798', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0798 begin');
      const fps: number = 24;
      const step: number = 3;
      const stamps: number[] = [0, 125, 250, 375, 500];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(500);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0798 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0799
     * @tc.name      soloFrameRate0799
     * @tc.desc      24fps 在 1500ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0799', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0799 begin');
      const fps: number = 24;
      const duration: number = 1500;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(36);
      expect(interval.toFixed(4)).assertEqual('41.6667');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0799 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0800
     * @tc.name      soloFrameRate0800
     * @tc.desc      24fps 在 1500ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0800 begin');
      const fps: number = 24;
      const frames: number = 36;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 1500000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(41667);
      expect(totalUs).assertEqual(1500012);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0800 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0801
     * @tc.name      soloFrameRate0801
     * @tc.desc      24fps 步长 1 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0801', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0801 begin');
      const fps: number = 24;
      const step: number = 1;
      const stamps: number[] = [0, 42, 83, 125, 167];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(167);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0801 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0802
     * @tc.name      soloFrameRate0802
     * @tc.desc      24fps 在 1600ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0802', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0802 begin');
      const fps: number = 24;
      const duration: number = 1600;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(38);
      expect(interval.toFixed(4)).assertEqual('41.6667');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0802 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0803
     * @tc.name      soloFrameRate0803
     * @tc.desc      24fps 在 1600ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0803', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0803 begin');
      const fps: number = 24;
      const frames: number = 38;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 1600000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(41667);
      expect(totalUs).assertEqual(1583346);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0803 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0804
     * @tc.name      soloFrameRate0804
     * @tc.desc      24fps 步长 2 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0804', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0804 begin');
      const fps: number = 24;
      const step: number = 2;
      const stamps: number[] = [0, 83, 167, 250, 333];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(333);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0804 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0805
     * @tc.name      soloFrameRate0805
     * @tc.desc      24fps 在 2000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0805', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0805 begin');
      const fps: number = 24;
      const duration: number = 2000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(48);
      expect(interval.toFixed(4)).assertEqual('41.6667');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0805 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0806
     * @tc.name      soloFrameRate0806
     * @tc.desc      24fps 在 2000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0806', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0806 begin');
      const fps: number = 24;
      const frames: number = 48;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 2000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(41667);
      expect(totalUs).assertEqual(2000016);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0806 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0807
     * @tc.name      soloFrameRate0807
     * @tc.desc      24fps 步长 3 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0807', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0807 begin');
      const fps: number = 24;
      const step: number = 3;
      const stamps: number[] = [0, 125, 250, 375, 500];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(500);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0807 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0808
     * @tc.name      soloFrameRate0808
     * @tc.desc      24fps 在 2400ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0808', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0808 begin');
      const fps: number = 24;
      const duration: number = 2400;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(57);
      expect(interval.toFixed(4)).assertEqual('41.6667');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0808 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0809
     * @tc.name      soloFrameRate0809
     * @tc.desc      24fps 在 2400ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0809', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0809 begin');
      const fps: number = 24;
      const frames: number = 57;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 2400000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(41667);
      expect(totalUs).assertEqual(2375019);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0809 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_0810
     * @tc.name      soloFrameRate0810
     * @tc.desc      24fps 步长 1 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate0810', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0810 begin');
      const fps: number = 24;
      const step: number = 1;
      const stamps: number[] = [0, 42, 83, 125, 167];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(167);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate0810 end');
    })
  })
}
