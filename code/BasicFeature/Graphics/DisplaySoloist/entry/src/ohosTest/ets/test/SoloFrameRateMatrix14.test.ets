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

export default function soloFrameRateMatrix14Test(): void {
  describe('SoloFrameRateMatrix14Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    SOLO_FRAME_RATE_1054
     * @tc.name      soloFrameRate1054
     * @tc.desc      30fps 在 33ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1054 begin');
      const fps: number = 30;
      const duration: number = 33;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(0);
      expect(interval.toFixed(4)).assertEqual('33.3333');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1054 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1055
     * @tc.name      soloFrameRate1055
     * @tc.desc      30fps 在 33ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1055 begin');
      const fps: number = 30;
      const frames: number = 0;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 33000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(33333);
      expect(totalUs).assertEqual(0);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1055 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1056
     * @tc.name      soloFrameRate1056
     * @tc.desc      30fps 步长 3 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1056 begin');
      const fps: number = 30;
      const step: number = 3;
      const stamps: number[] = [0, 100, 200, 300, 400];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(400);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1056 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1057
     * @tc.name      soloFrameRate1057
     * @tc.desc      30fps 在 50ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1057 begin');
      const fps: number = 30;
      const duration: number = 50;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(1);
      expect(interval.toFixed(4)).assertEqual('33.3333');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1057 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1058
     * @tc.name      soloFrameRate1058
     * @tc.desc      30fps 在 50ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1058 begin');
      const fps: number = 30;
      const frames: number = 1;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 50000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(33333);
      expect(totalUs).assertEqual(33333);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1058 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1059
     * @tc.name      soloFrameRate1059
     * @tc.desc      30fps 步长 1 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1059 begin');
      const fps: number = 30;
      const step: number = 1;
      const stamps: number[] = [0, 33, 67, 100, 133];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(133);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1059 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1060
     * @tc.name      soloFrameRate1060
     * @tc.desc      30fps 在 100ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1060 begin');
      const fps: number = 30;
      const duration: number = 100;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(3);
      expect(interval.toFixed(4)).assertEqual('33.3333');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1060 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1061
     * @tc.name      soloFrameRate1061
     * @tc.desc      30fps 在 100ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1061 begin');
      const fps: number = 30;
      const frames: number = 3;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 100000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(33333);
      expect(totalUs).assertEqual(99999);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1061 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1062
     * @tc.name      soloFrameRate1062
     * @tc.desc      30fps 步长 2 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1062 begin');
      const fps: number = 30;
      const step: number = 2;
      const stamps: number[] = [0, 67, 133, 200, 267];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(267);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1062 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1063
     * @tc.name      soloFrameRate1063
     * @tc.desc      30fps 在 125ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1063 begin');
      const fps: number = 30;
      const duration: number = 125;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(3);
      expect(interval.toFixed(4)).assertEqual('33.3333');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1063 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1064
     * @tc.name      soloFrameRate1064
     * @tc.desc      30fps 在 125ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1064 begin');
      const fps: number = 30;
      const frames: number = 3;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 125000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(33333);
      expect(totalUs).assertEqual(99999);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1064 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1065
     * @tc.name      soloFrameRate1065
     * @tc.desc      30fps 步长 3 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1065 begin');
      const fps: number = 30;
      const step: number = 3;
      const stamps: number[] = [0, 100, 200, 300, 400];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(400);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1065 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1066
     * @tc.name      soloFrameRate1066
     * @tc.desc      30fps 在 167ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1066 begin');
      const fps: number = 30;
      const duration: number = 167;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(5);
      expect(interval.toFixed(4)).assertEqual('33.3333');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1066 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1067
     * @tc.name      soloFrameRate1067
     * @tc.desc      30fps 在 167ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1067 begin');
      const fps: number = 30;
      const frames: number = 5;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 167000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(33333);
      expect(totalUs).assertEqual(166665);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1067 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1068
     * @tc.name      soloFrameRate1068
     * @tc.desc      30fps 步长 1 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1068 begin');
      const fps: number = 30;
      const step: number = 1;
      const stamps: number[] = [0, 33, 67, 100, 133];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(133);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1068 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1069
     * @tc.name      soloFrameRate1069
     * @tc.desc      30fps 在 200ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1069 begin');
      const fps: number = 30;
      const duration: number = 200;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(6);
      expect(interval.toFixed(4)).assertEqual('33.3333');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1069 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1070
     * @tc.name      soloFrameRate1070
     * @tc.desc      30fps 在 200ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1070 begin');
      const fps: number = 30;
      const frames: number = 6;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 200000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(33333);
      expect(totalUs).assertEqual(199998);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1070 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1071
     * @tc.name      soloFrameRate1071
     * @tc.desc      30fps 步长 2 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1071 begin');
      const fps: number = 30;
      const step: number = 2;
      const stamps: number[] = [0, 67, 133, 200, 267];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(267);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1071 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1072
     * @tc.name      soloFrameRate1072
     * @tc.desc      30fps 在 250ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1072 begin');
      const fps: number = 30;
      const duration: number = 250;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(7);
      expect(interval.toFixed(4)).assertEqual('33.3333');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1072 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1073
     * @tc.name      soloFrameRate1073
     * @tc.desc      30fps 在 250ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1073 begin');
      const fps: number = 30;
      const frames: number = 7;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 250000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(33333);
      expect(totalUs).assertEqual(233331);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1073 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1074
     * @tc.name      soloFrameRate1074
     * @tc.desc      30fps 步长 3 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1074 begin');
      const fps: number = 30;
      const step: number = 3;
      const stamps: number[] = [0, 100, 200, 300, 400];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(400);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1074 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1075
     * @tc.name      soloFrameRate1075
     * @tc.desc      30fps 在 300ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1075 begin');
      const fps: number = 30;
      const duration: number = 300;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(9);
      expect(interval.toFixed(4)).assertEqual('33.3333');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1075 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1076
     * @tc.name      soloFrameRate1076
     * @tc.desc      30fps 在 300ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1076 begin');
      const fps: number = 30;
      const frames: number = 9;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 300000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(33333);
      expect(totalUs).assertEqual(299997);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1076 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1077
     * @tc.name      soloFrameRate1077
     * @tc.desc      30fps 步长 1 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1077 begin');
      const fps: number = 30;
      const step: number = 1;
      const stamps: number[] = [0, 33, 67, 100, 133];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(133);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1077 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1078
     * @tc.name      soloFrameRate1078
     * @tc.desc      30fps 在 333ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1078 begin');
      const fps: number = 30;
      const duration: number = 333;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(9);
      expect(interval.toFixed(4)).assertEqual('33.3333');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1078 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1079
     * @tc.name      soloFrameRate1079
     * @tc.desc      30fps 在 333ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1079 begin');
      const fps: number = 30;
      const frames: number = 9;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 333000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(33333);
      expect(totalUs).assertEqual(299997);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1079 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1080
     * @tc.name      soloFrameRate1080
     * @tc.desc      30fps 步长 2 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1080 begin');
      const fps: number = 30;
      const step: number = 2;
      const stamps: number[] = [0, 67, 133, 200, 267];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(267);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1080 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1081
     * @tc.name      soloFrameRate1081
     * @tc.desc      30fps 在 400ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1081 begin');
      const fps: number = 30;
      const duration: number = 400;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(12);
      expect(interval.toFixed(4)).assertEqual('33.3333');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1081 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1082
     * @tc.name      soloFrameRate1082
     * @tc.desc      30fps 在 400ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1082 begin');
      const fps: number = 30;
      const frames: number = 12;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 400000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(33333);
      expect(totalUs).assertEqual(399996);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1082 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1083
     * @tc.name      soloFrameRate1083
     * @tc.desc      30fps 步长 3 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1083 begin');
      const fps: number = 30;
      const step: number = 3;
      const stamps: number[] = [0, 100, 200, 300, 400];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(400);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1083 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1084
     * @tc.name      soloFrameRate1084
     * @tc.desc      30fps 在 500ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1084 begin');
      const fps: number = 30;
      const duration: number = 500;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(15);
      expect(interval.toFixed(4)).assertEqual('33.3333');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1084 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1085
     * @tc.name      soloFrameRate1085
     * @tc.desc      30fps 在 500ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1085 begin');
      const fps: number = 30;
      const frames: number = 15;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 500000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(33333);
      expect(totalUs).assertEqual(499995);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1085 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1086
     * @tc.name      soloFrameRate1086
     * @tc.desc      30fps 步长 1 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1086 begin');
      const fps: number = 30;
      const step: number = 1;
      const stamps: number[] = [0, 33, 67, 100, 133];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(133);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1086 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1087
     * @tc.name      soloFrameRate1087
     * @tc.desc      30fps 在 600ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1087 begin');
      const fps: number = 30;
      const duration: number = 600;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(18);
      expect(interval.toFixed(4)).assertEqual('33.3333');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1087 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1088
     * @tc.name      soloFrameRate1088
     * @tc.desc      30fps 在 600ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1088 begin');
      const fps: number = 30;
      const frames: number = 18;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 600000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(33333);
      expect(totalUs).assertEqual(599994);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1088 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1089
     * @tc.name      soloFrameRate1089
     * @tc.desc      30fps 步长 2 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1089 begin');
      const fps: number = 30;
      const step: number = 2;
      const stamps: number[] = [0, 67, 133, 200, 267];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(267);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1089 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1090
     * @tc.name      soloFrameRate1090
     * @tc.desc      30fps 在 750ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1090 begin');
      const fps: number = 30;
      const duration: number = 750;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(22);
      expect(interval.toFixed(4)).assertEqual('33.3333');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1090 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1091
     * @tc.name      soloFrameRate1091
     * @tc.desc      30fps 在 750ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1091 begin');
      const fps: number = 30;
      const frames: number = 22;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 750000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(33333);
      expect(totalUs).assertEqual(733326);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1091 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1092
     * @tc.name      soloFrameRate1092
     * @tc.desc      30fps 步长 3 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1092 begin');
      const fps: number = 30;
      const step: number = 3;
      const stamps: number[] = [0, 100, 200, 300, 400];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(400);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1092 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1093
     * @tc.name      soloFrameRate1093
     * @tc.desc      30fps 在 1000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1093 begin');
      const fps: number = 30;
      const duration: number = 1000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(30);
      expect(interval.toFixed(4)).assertEqual('33.3333');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1093 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1094
     * @tc.name      soloFrameRate1094
     * @tc.desc      30fps 在 1000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1094 begin');
      const fps: number = 30;
      const frames: number = 30;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 1000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(33333);
      expect(totalUs).assertEqual(999990);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1094 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1095
     * @tc.name      soloFrameRate1095
     * @tc.desc      30fps 步长 1 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1095 begin');
      const fps: number = 30;
      const step: number = 1;
      const stamps: number[] = [0, 33, 67, 100, 133];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(133);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1095 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1096
     * @tc.name      soloFrameRate1096
     * @tc.desc      30fps 在 1200ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1096 begin');
      const fps: number = 30;
      const duration: number = 1200;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(36);
      expect(interval.toFixed(4)).assertEqual('33.3333');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1096 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1097
     * @tc.name      soloFrameRate1097
     * @tc.desc      30fps 在 1200ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1097 begin');
      const fps: number = 30;
      const frames: number = 36;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 1200000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(33333);
      expect(totalUs).assertEqual(1199988);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1097 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1098
     * @tc.name      soloFrameRate1098
     * @tc.desc      30fps 步长 2 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1098 begin');
      const fps: number = 30;
      const step: number = 2;
      const stamps: number[] = [0, 67, 133, 200, 267];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(267);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1098 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1099
     * @tc.name      soloFrameRate1099
     * @tc.desc      30fps 在 1500ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1099 begin');
      const fps: number = 30;
      const duration: number = 1500;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(45);
      expect(interval.toFixed(4)).assertEqual('33.3333');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1099 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1100
     * @tc.name      soloFrameRate1100
     * @tc.desc      30fps 在 1500ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1100 begin');
      const fps: number = 30;
      const frames: number = 45;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 1500000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(33333);
      expect(totalUs).assertEqual(1499985);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1100 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1101
     * @tc.name      soloFrameRate1101
     * @tc.desc      30fps 步长 3 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1101 begin');
      const fps: number = 30;
      const step: number = 3;
      const stamps: number[] = [0, 100, 200, 300, 400];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(400);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1101 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1102
     * @tc.name      soloFrameRate1102
     * @tc.desc      30fps 在 1600ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1102 begin');
      const fps: number = 30;
      const duration: number = 1600;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(48);
      expect(interval.toFixed(4)).assertEqual('33.3333');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1102 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1103
     * @tc.name      soloFrameRate1103
     * @tc.desc      30fps 在 1600ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1103 begin');
      const fps: number = 30;
      const frames: number = 48;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 1600000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(33333);
      expect(totalUs).assertEqual(1599984);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1103 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1104
     * @tc.name      soloFrameRate1104
     * @tc.desc      30fps 步长 1 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1104 begin');
      const fps: number = 30;
      const step: number = 1;
      const stamps: number[] = [0, 33, 67, 100, 133];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(133);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1104 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1105
     * @tc.name      soloFrameRate1105
     * @tc.desc      30fps 在 2000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1105 begin');
      const fps: number = 30;
      const duration: number = 2000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(60);
      expect(interval.toFixed(4)).assertEqual('33.3333');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1105 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1106
     * @tc.name      soloFrameRate1106
     * @tc.desc      30fps 在 2000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1106 begin');
      const fps: number = 30;
      const frames: number = 60;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 2000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(33333);
      expect(totalUs).assertEqual(1999980);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1106 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1107
     * @tc.name      soloFrameRate1107
     * @tc.desc      30fps 步长 2 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1107 begin');
      const fps: number = 30;
      const step: number = 2;
      const stamps: number[] = [0, 67, 133, 200, 267];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(267);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1107 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1108
     * @tc.name      soloFrameRate1108
     * @tc.desc      30fps 在 2400ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1108 begin');
      const fps: number = 30;
      const duration: number = 2400;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(72);
      expect(interval.toFixed(4)).assertEqual('33.3333');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1108 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1109
     * @tc.name      soloFrameRate1109
     * @tc.desc      30fps 在 2400ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1109 begin');
      const fps: number = 30;
      const frames: number = 72;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 2400000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(33333);
      expect(totalUs).assertEqual(2399976);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1109 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1110
     * @tc.name      soloFrameRate1110
     * @tc.desc      30fps 步长 3 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1110 begin');
      const fps: number = 30;
      const step: number = 3;
      const stamps: number[] = [0, 100, 200, 300, 400];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(400);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1110 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1111
     * @tc.name      soloFrameRate1111
     * @tc.desc      30fps 在 2500ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1111 begin');
      const fps: number = 30;
      const duration: number = 2500;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(75);
      expect(interval.toFixed(4)).assertEqual('33.3333');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1111 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1112
     * @tc.name      soloFrameRate1112
     * @tc.desc      30fps 在 2500ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1112 begin');
      const fps: number = 30;
      const frames: number = 75;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 2500000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(33333);
      expect(totalUs).assertEqual(2499975);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1112 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1113
     * @tc.name      soloFrameRate1113
     * @tc.desc      30fps 步长 1 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1113 begin');
      const fps: number = 30;
      const step: number = 1;
      const stamps: number[] = [0, 33, 67, 100, 133];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(133);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1113 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1114
     * @tc.name      soloFrameRate1114
     * @tc.desc      30fps 在 3000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1114 begin');
      const fps: number = 30;
      const duration: number = 3000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(90);
      expect(interval.toFixed(4)).assertEqual('33.3333');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1114 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1115
     * @tc.name      soloFrameRate1115
     * @tc.desc      30fps 在 3000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1115 begin');
      const fps: number = 30;
      const frames: number = 90;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 3000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(33333);
      expect(totalUs).assertEqual(2999970);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1115 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1116
     * @tc.name      soloFrameRate1116
     * @tc.desc      30fps 步长 2 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1116 begin');
      const fps: number = 30;
      const step: number = 2;
      const stamps: number[] = [0, 67, 133, 200, 267];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(267);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1116 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1117
     * @tc.name      soloFrameRate1117
     * @tc.desc      30fps 在 4000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1117 begin');
      const fps: number = 30;
      const duration: number = 4000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(120);
      expect(interval.toFixed(4)).assertEqual('33.3333');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1117 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1118
     * @tc.name      soloFrameRate1118
     * @tc.desc      30fps 在 4000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1118 begin');
      const fps: number = 30;
      const frames: number = 120;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 4000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(33333);
      expect(totalUs).assertEqual(3999960);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1118 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1119
     * @tc.name      soloFrameRate1119
     * @tc.desc      30fps 步长 3 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1119 begin');
      const fps: number = 30;
      const step: number = 3;
      const stamps: number[] = [0, 100, 200, 300, 400];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(400);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1119 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1120
     * @tc.name      soloFrameRate1120
     * @tc.desc      30fps 在 5000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1120 begin');
      const fps: number = 30;
      const duration: number = 5000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(150);
      expect(interval.toFixed(4)).assertEqual('33.3333');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1120 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1121
     * @tc.name      soloFrameRate1121
     * @tc.desc      30fps 在 5000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1121 begin');
      const fps: number = 30;
      const frames: number = 150;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 5000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(33333);
      expect(totalUs).assertEqual(4999950);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1121 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1122
     * @tc.name      soloFrameRate1122
     * @tc.desc      30fps 步长 1 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1122 begin');
      const fps: number = 30;
      const step: number = 1;
      const stamps: number[] = [0, 33, 67, 100, 133];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(133);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1122 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1123
     * @tc.name      soloFrameRate1123
     * @tc.desc      30fps 在 6000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1123 begin');
      const fps: number = 30;
      const duration: number = 6000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(180);
      expect(interval.toFixed(4)).assertEqual('33.3333');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1123 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1124
     * @tc.name      soloFrameRate1124
     * @tc.desc      30fps 在 6000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1124 begin');
      const fps: number = 30;
      const frames: number = 180;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 6000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(33333);
      expect(totalUs).assertEqual(5999940);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1124 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1125
     * @tc.name      soloFrameRate1125
     * @tc.desc      30fps 步长 2 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1125 begin');
      const fps: number = 30;
      const step: number = 2;
      const stamps: number[] = [0, 67, 133, 200, 267];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(267);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1125 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1126
     * @tc.name      soloFrameRate1126
     * @tc.desc      30fps 在 7500ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1126 begin');
      const fps: number = 30;
      const duration: number = 7500;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(225);
      expect(interval.toFixed(4)).assertEqual('33.3333');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1126 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1127
     * @tc.name      soloFrameRate1127
     * @tc.desc      30fps 在 7500ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1127 begin');
      const fps: number = 30;
      const frames: number = 225;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 7500000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(33333);
      expect(totalUs).assertEqual(7499925);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1127 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1128
     * @tc.name      soloFrameRate1128
     * @tc.desc      30fps 步长 3 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1128 begin');
      const fps: number = 30;
      const step: number = 3;
      const stamps: number[] = [0, 100, 200, 300, 400];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(400);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1128 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1129
     * @tc.name      soloFrameRate1129
     * @tc.desc      30fps 在 8000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1129 begin');
      const fps: number = 30;
      const duration: number = 8000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(240);
      expect(interval.toFixed(4)).assertEqual('33.3333');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1129 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1130
     * @tc.name      soloFrameRate1130
     * @tc.desc      30fps 在 8000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1130 begin');
      const fps: number = 30;
      const frames: number = 240;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 8000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(33333);
      expect(totalUs).assertEqual(7999920);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1130 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1131
     * @tc.name      soloFrameRate1131
     * @tc.desc      30fps 步长 1 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1131 begin');
      const fps: number = 30;
      const step: number = 1;
      const stamps: number[] = [0, 33, 67, 100, 133];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(133);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1131 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1132
     * @tc.name      soloFrameRate1132
     * @tc.desc      30fps 在 10000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1132 begin');
      const fps: number = 30;
      const duration: number = 10000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(300);
      expect(interval.toFixed(4)).assertEqual('33.3333');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1132 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1133
     * @tc.name      soloFrameRate1133
     * @tc.desc      30fps 在 10000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1133 begin');
      const fps: number = 30;
      const frames: number = 300;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 10000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(33333);
      expect(totalUs).assertEqual(9999900);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1133 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1134
     * @tc.name      soloFrameRate1134
     * @tc.desc      30fps 步长 2 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1134 begin');
      const fps: number = 30;
      const step: number = 2;
      const stamps: number[] = [0, 67, 133, 200, 267];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(267);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1134 end');
    })
  })
}
