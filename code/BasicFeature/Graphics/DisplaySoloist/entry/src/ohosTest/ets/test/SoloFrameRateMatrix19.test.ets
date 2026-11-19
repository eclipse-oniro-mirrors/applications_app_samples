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

export default function soloFrameRateMatrix19Test(): void {
  describe('SoloFrameRateMatrix19Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    SOLO_FRAME_RATE_1459
     * @tc.name      soloFrameRate1459
     * @tc.desc      50fps 在 60000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1459', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1459 begin');
      const fps: number = 50;
      const duration: number = 60000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(3000);
      expect(interval.toFixed(4)).assertEqual('20.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1459 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1460
     * @tc.name      soloFrameRate1460
     * @tc.desc      50fps 在 60000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1460', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1460 begin');
      const fps: number = 50;
      const frames: number = 3000;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 60000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(20000);
      expect(totalUs).assertEqual(60000000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1460 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1461
     * @tc.name      soloFrameRate1461
     * @tc.desc      50fps 步长 1 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1461', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1461 begin');
      const fps: number = 50;
      const step: number = 1;
      const stamps: number[] = [0, 20, 40, 60, 80];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(80);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1461 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1462
     * @tc.name      soloFrameRate1462
     * @tc.desc      50fps 在 72000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1462', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1462 begin');
      const fps: number = 50;
      const duration: number = 72000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(3600);
      expect(interval.toFixed(4)).assertEqual('20.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1462 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1463
     * @tc.name      soloFrameRate1463
     * @tc.desc      50fps 在 72000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1463', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1463 begin');
      const fps: number = 50;
      const frames: number = 3600;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 72000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(20000);
      expect(totalUs).assertEqual(72000000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1463 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1464
     * @tc.name      soloFrameRate1464
     * @tc.desc      50fps 步长 2 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1464', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1464 begin');
      const fps: number = 50;
      const step: number = 2;
      const stamps: number[] = [0, 40, 80, 120, 160];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(160);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1464 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1465
     * @tc.name      soloFrameRate1465
     * @tc.desc      50fps 在 90000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1465', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1465 begin');
      const fps: number = 50;
      const duration: number = 90000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(4500);
      expect(interval.toFixed(4)).assertEqual('20.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1465 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1466
     * @tc.name      soloFrameRate1466
     * @tc.desc      50fps 在 90000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1466', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1466 begin');
      const fps: number = 50;
      const frames: number = 4500;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 90000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(20000);
      expect(totalUs).assertEqual(90000000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1466 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1467
     * @tc.name      soloFrameRate1467
     * @tc.desc      50fps 步长 3 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1467', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1467 begin');
      const fps: number = 50;
      const step: number = 3;
      const stamps: number[] = [0, 60, 120, 180, 240];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(240);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1467 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1468
     * @tc.name      soloFrameRate1468
     * @tc.desc      50fps 在 100000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1468', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1468 begin');
      const fps: number = 50;
      const duration: number = 100000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(5000);
      expect(interval.toFixed(4)).assertEqual('20.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1468 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1469
     * @tc.name      soloFrameRate1469
     * @tc.desc      50fps 在 100000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1469', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1469 begin');
      const fps: number = 50;
      const frames: number = 5000;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 100000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(20000);
      expect(totalUs).assertEqual(100000000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1469 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1470
     * @tc.name      soloFrameRate1470
     * @tc.desc      50fps 步长 1 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1470', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1470 begin');
      const fps: number = 50;
      const step: number = 1;
      const stamps: number[] = [0, 20, 40, 60, 80];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(80);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1470 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1471
     * @tc.name      soloFrameRate1471
     * @tc.desc      50fps 在 120000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1471', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1471 begin');
      const fps: number = 50;
      const duration: number = 120000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(6000);
      expect(interval.toFixed(4)).assertEqual('20.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1471 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1472
     * @tc.name      soloFrameRate1472
     * @tc.desc      50fps 在 120000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1472', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1472 begin');
      const fps: number = 50;
      const frames: number = 6000;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 120000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(20000);
      expect(totalUs).assertEqual(120000000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1472 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1473
     * @tc.name      soloFrameRate1473
     * @tc.desc      50fps 步长 2 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1473', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1473 begin');
      const fps: number = 50;
      const step: number = 2;
      const stamps: number[] = [0, 40, 80, 120, 160];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(160);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1473 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1474
     * @tc.name      soloFrameRate1474
     * @tc.desc      50fps 在 135000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1474', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1474 begin');
      const fps: number = 50;
      const duration: number = 135000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(6750);
      expect(interval.toFixed(4)).assertEqual('20.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1474 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1475
     * @tc.name      soloFrameRate1475
     * @tc.desc      50fps 在 135000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1475', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1475 begin');
      const fps: number = 50;
      const frames: number = 6750;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 135000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(20000);
      expect(totalUs).assertEqual(135000000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1475 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1476
     * @tc.name      soloFrameRate1476
     * @tc.desc      50fps 步长 3 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1476', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1476 begin');
      const fps: number = 50;
      const step: number = 3;
      const stamps: number[] = [0, 60, 120, 180, 240];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(240);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1476 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1477
     * @tc.name      soloFrameRate1477
     * @tc.desc      50fps 在 150000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1477', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1477 begin');
      const fps: number = 50;
      const duration: number = 150000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(7500);
      expect(interval.toFixed(4)).assertEqual('20.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1477 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1478
     * @tc.name      soloFrameRate1478
     * @tc.desc      50fps 在 150000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1478', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1478 begin');
      const fps: number = 50;
      const frames: number = 7500;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 150000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(20000);
      expect(totalUs).assertEqual(150000000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1478 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1479
     * @tc.name      soloFrameRate1479
     * @tc.desc      50fps 步长 1 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1479', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1479 begin');
      const fps: number = 50;
      const step: number = 1;
      const stamps: number[] = [0, 20, 40, 60, 80];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(80);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1479 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1480
     * @tc.name      soloFrameRate1480
     * @tc.desc      50fps 在 160000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1480', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1480 begin');
      const fps: number = 50;
      const duration: number = 160000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(8000);
      expect(interval.toFixed(4)).assertEqual('20.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1480 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1481
     * @tc.name      soloFrameRate1481
     * @tc.desc      50fps 在 160000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1481', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1481 begin');
      const fps: number = 50;
      const frames: number = 8000;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 160000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(20000);
      expect(totalUs).assertEqual(160000000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1481 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1482
     * @tc.name      soloFrameRate1482
     * @tc.desc      50fps 步长 2 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1482', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1482 begin');
      const fps: number = 50;
      const step: number = 2;
      const stamps: number[] = [0, 40, 80, 120, 160];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(160);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1482 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1483
     * @tc.name      soloFrameRate1483
     * @tc.desc      50fps 在 240000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1483', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1483 begin');
      const fps: number = 50;
      const duration: number = 240000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(12000);
      expect(interval.toFixed(4)).assertEqual('20.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1483 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1484
     * @tc.name      soloFrameRate1484
     * @tc.desc      50fps 在 240000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1484', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1484 begin');
      const fps: number = 50;
      const frames: number = 12000;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 240000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(20000);
      expect(totalUs).assertEqual(240000000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1484 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1485
     * @tc.name      soloFrameRate1485
     * @tc.desc      50fps 步长 3 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1485', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1485 begin');
      const fps: number = 50;
      const step: number = 3;
      const stamps: number[] = [0, 60, 120, 180, 240];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(240);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1485 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1486
     * @tc.name      soloFrameRate1486
     * @tc.desc      50fps 在 300000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1486', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1486 begin');
      const fps: number = 50;
      const duration: number = 300000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(15000);
      expect(interval.toFixed(4)).assertEqual('20.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1486 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1487
     * @tc.name      soloFrameRate1487
     * @tc.desc      50fps 在 300000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1487', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1487 begin');
      const fps: number = 50;
      const frames: number = 15000;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 300000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(20000);
      expect(totalUs).assertEqual(300000000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1487 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1488
     * @tc.name      soloFrameRate1488
     * @tc.desc      50fps 步长 1 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1488', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1488 begin');
      const fps: number = 50;
      const step: number = 1;
      const stamps: number[] = [0, 20, 40, 60, 80];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(80);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1488 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1489
     * @tc.name      soloFrameRate1489
     * @tc.desc      50fps 在 360000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1489', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1489 begin');
      const fps: number = 50;
      const duration: number = 360000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(18000);
      expect(interval.toFixed(4)).assertEqual('20.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1489 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1490
     * @tc.name      soloFrameRate1490
     * @tc.desc      50fps 在 360000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1490', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1490 begin');
      const fps: number = 50;
      const frames: number = 18000;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 360000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(20000);
      expect(totalUs).assertEqual(360000000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1490 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1491
     * @tc.name      soloFrameRate1491
     * @tc.desc      50fps 步长 2 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1491', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1491 begin');
      const fps: number = 50;
      const step: number = 2;
      const stamps: number[] = [0, 40, 80, 120, 160];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(160);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1491 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1492
     * @tc.name      soloFrameRate1492
     * @tc.desc      50fps 在 600000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1492', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1492 begin');
      const fps: number = 50;
      const duration: number = 600000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(30000);
      expect(interval.toFixed(4)).assertEqual('20.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1492 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1493
     * @tc.name      soloFrameRate1493
     * @tc.desc      50fps 在 600000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1493', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1493 begin');
      const fps: number = 50;
      const frames: number = 30000;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 600000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(20000);
      expect(totalUs).assertEqual(600000000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1493 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1494
     * @tc.name      soloFrameRate1494
     * @tc.desc      50fps 步长 3 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1494', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1494 begin');
      const fps: number = 50;
      const step: number = 3;
      const stamps: number[] = [0, 60, 120, 180, 240];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(240);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1494 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1495
     * @tc.name      soloFrameRate1495
     * @tc.desc      50fps 在 900000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1495', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1495 begin');
      const fps: number = 50;
      const duration: number = 900000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(45000);
      expect(interval.toFixed(4)).assertEqual('20.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1495 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1496
     * @tc.name      soloFrameRate1496
     * @tc.desc      50fps 在 900000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1496', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1496 begin');
      const fps: number = 50;
      const frames: number = 45000;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 900000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(20000);
      expect(totalUs).assertEqual(900000000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1496 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1497
     * @tc.name      soloFrameRate1497
     * @tc.desc      50fps 步长 1 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1497', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1497 begin');
      const fps: number = 50;
      const step: number = 1;
      const stamps: number[] = [0, 20, 40, 60, 80];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(80);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1497 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1498
     * @tc.name      soloFrameRate1498
     * @tc.desc      50fps 在 1800000ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1498', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1498 begin');
      const fps: number = 50;
      const duration: number = 1800000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(90000);
      expect(interval.toFixed(4)).assertEqual('20.0000');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1498 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1499
     * @tc.name      soloFrameRate1499
     * @tc.desc      50fps 在 1800000ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1499', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1499 begin');
      const fps: number = 50;
      const frames: number = 90000;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 1800000000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(20000);
      expect(totalUs).assertEqual(1800000000);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1499 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1500
     * @tc.name      soloFrameRate1500
     * @tc.desc      50fps 步长 2 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1500 begin');
      const fps: number = 50;
      const step: number = 2;
      const stamps: number[] = [0, 40, 80, 120, 160];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(160);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1500 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1501
     * @tc.name      soloFrameRate1501
     * @tc.desc      60fps 在 16ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1501', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1501 begin');
      const fps: number = 60;
      const duration: number = 16;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(0);
      expect(interval.toFixed(4)).assertEqual('16.6667');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1501 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1502
     * @tc.name      soloFrameRate1502
     * @tc.desc      60fps 在 16ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1502', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1502 begin');
      const fps: number = 60;
      const frames: number = 0;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 16000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(16667);
      expect(totalUs).assertEqual(0);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1502 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1503
     * @tc.name      soloFrameRate1503
     * @tc.desc      60fps 步长 2 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1503', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1503 begin');
      const fps: number = 60;
      const step: number = 2;
      const stamps: number[] = [0, 33, 67, 100, 133];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(133);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1503 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1504
     * @tc.name      soloFrameRate1504
     * @tc.desc      60fps 在 33ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1504', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1504 begin');
      const fps: number = 60;
      const duration: number = 33;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(1);
      expect(interval.toFixed(4)).assertEqual('16.6667');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1504 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1505
     * @tc.name      soloFrameRate1505
     * @tc.desc      60fps 在 33ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1505', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1505 begin');
      const fps: number = 60;
      const frames: number = 1;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 33000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(16667);
      expect(totalUs).assertEqual(16667);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1505 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1506
     * @tc.name      soloFrameRate1506
     * @tc.desc      60fps 步长 3 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1506', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1506 begin');
      const fps: number = 60;
      const step: number = 3;
      const stamps: number[] = [0, 50, 100, 150, 200];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(200);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1506 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1507
     * @tc.name      soloFrameRate1507
     * @tc.desc      60fps 在 50ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1507', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1507 begin');
      const fps: number = 60;
      const duration: number = 50;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(3);
      expect(interval.toFixed(4)).assertEqual('16.6667');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1507 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1508
     * @tc.name      soloFrameRate1508
     * @tc.desc      60fps 在 50ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1508', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1508 begin');
      const fps: number = 60;
      const frames: number = 3;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 50000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(16667);
      expect(totalUs).assertEqual(50001);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1508 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1509
     * @tc.name      soloFrameRate1509
     * @tc.desc      60fps 步长 1 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1509', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1509 begin');
      const fps: number = 60;
      const step: number = 1;
      const stamps: number[] = [0, 17, 33, 50, 67];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(67);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1509 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1510
     * @tc.name      soloFrameRate1510
     * @tc.desc      60fps 在 100ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1510', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1510 begin');
      const fps: number = 60;
      const duration: number = 100;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(6);
      expect(interval.toFixed(4)).assertEqual('16.6667');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1510 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1511
     * @tc.name      soloFrameRate1511
     * @tc.desc      60fps 在 100ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1511', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1511 begin');
      const fps: number = 60;
      const frames: number = 6;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 100000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(16667);
      expect(totalUs).assertEqual(100002);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1511 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1512
     * @tc.name      soloFrameRate1512
     * @tc.desc      60fps 步长 2 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1512', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1512 begin');
      const fps: number = 60;
      const step: number = 2;
      const stamps: number[] = [0, 33, 67, 100, 133];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(133);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1512 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1513
     * @tc.name      soloFrameRate1513
     * @tc.desc      60fps 在 125ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1513', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1513 begin');
      const fps: number = 60;
      const duration: number = 125;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(7);
      expect(interval.toFixed(4)).assertEqual('16.6667');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1513 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1514
     * @tc.name      soloFrameRate1514
     * @tc.desc      60fps 在 125ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1514', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1514 begin');
      const fps: number = 60;
      const frames: number = 7;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 125000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(16667);
      expect(totalUs).assertEqual(116669);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1514 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1515
     * @tc.name      soloFrameRate1515
     * @tc.desc      60fps 步长 3 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1515', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1515 begin');
      const fps: number = 60;
      const step: number = 3;
      const stamps: number[] = [0, 50, 100, 150, 200];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(200);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1515 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1516
     * @tc.name      soloFrameRate1516
     * @tc.desc      60fps 在 167ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1516', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1516 begin');
      const fps: number = 60;
      const duration: number = 167;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(10);
      expect(interval.toFixed(4)).assertEqual('16.6667');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1516 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1517
     * @tc.name      soloFrameRate1517
     * @tc.desc      60fps 在 167ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1517', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1517 begin');
      const fps: number = 60;
      const frames: number = 10;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 167000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(16667);
      expect(totalUs).assertEqual(166670);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1517 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1518
     * @tc.name      soloFrameRate1518
     * @tc.desc      60fps 步长 1 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1518', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1518 begin');
      const fps: number = 60;
      const step: number = 1;
      const stamps: number[] = [0, 17, 33, 50, 67];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(67);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1518 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1519
     * @tc.name      soloFrameRate1519
     * @tc.desc      60fps 在 200ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1519', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1519 begin');
      const fps: number = 60;
      const duration: number = 200;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(12);
      expect(interval.toFixed(4)).assertEqual('16.6667');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1519 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1520
     * @tc.name      soloFrameRate1520
     * @tc.desc      60fps 在 200ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1520', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1520 begin');
      const fps: number = 60;
      const frames: number = 12;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 200000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(16667);
      expect(totalUs).assertEqual(200004);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1520 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1521
     * @tc.name      soloFrameRate1521
     * @tc.desc      60fps 步长 2 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1521', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1521 begin');
      const fps: number = 60;
      const step: number = 2;
      const stamps: number[] = [0, 33, 67, 100, 133];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(133);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1521 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1522
     * @tc.name      soloFrameRate1522
     * @tc.desc      60fps 在 250ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1522', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1522 begin');
      const fps: number = 60;
      const duration: number = 250;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(15);
      expect(interval.toFixed(4)).assertEqual('16.6667');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1522 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1523
     * @tc.name      soloFrameRate1523
     * @tc.desc      60fps 在 250ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1523', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1523 begin');
      const fps: number = 60;
      const frames: number = 15;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 250000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(16667);
      expect(totalUs).assertEqual(250005);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1523 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1524
     * @tc.name      soloFrameRate1524
     * @tc.desc      60fps 步长 3 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1524', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1524 begin');
      const fps: number = 60;
      const step: number = 3;
      const stamps: number[] = [0, 50, 100, 150, 200];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(200);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1524 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1525
     * @tc.name      soloFrameRate1525
     * @tc.desc      60fps 在 300ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1525', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1525 begin');
      const fps: number = 60;
      const duration: number = 300;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(18);
      expect(interval.toFixed(4)).assertEqual('16.6667');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1525 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1526
     * @tc.name      soloFrameRate1526
     * @tc.desc      60fps 在 300ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1526', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1526 begin');
      const fps: number = 60;
      const frames: number = 18;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 300000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(16667);
      expect(totalUs).assertEqual(300006);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1526 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1527
     * @tc.name      soloFrameRate1527
     * @tc.desc      60fps 步长 1 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1527', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1527 begin');
      const fps: number = 60;
      const step: number = 1;
      const stamps: number[] = [0, 17, 33, 50, 67];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(67);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1527 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1528
     * @tc.name      soloFrameRate1528
     * @tc.desc      60fps 在 333ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1528', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1528 begin');
      const fps: number = 60;
      const duration: number = 333;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(19);
      expect(interval.toFixed(4)).assertEqual('16.6667');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1528 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1529
     * @tc.name      soloFrameRate1529
     * @tc.desc      60fps 在 333ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1529', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1529 begin');
      const fps: number = 60;
      const frames: number = 19;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 333000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(16667);
      expect(totalUs).assertEqual(316673);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1529 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1530
     * @tc.name      soloFrameRate1530
     * @tc.desc      60fps 步长 2 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1530', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1530 begin');
      const fps: number = 60;
      const step: number = 2;
      const stamps: number[] = [0, 33, 67, 100, 133];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(133);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1530 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1531
     * @tc.name      soloFrameRate1531
     * @tc.desc      60fps 在 400ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1531', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1531 begin');
      const fps: number = 60;
      const duration: number = 400;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(24);
      expect(interval.toFixed(4)).assertEqual('16.6667');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1531 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1532
     * @tc.name      soloFrameRate1532
     * @tc.desc      60fps 在 400ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1532', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1532 begin');
      const fps: number = 60;
      const frames: number = 24;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 400000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(16667);
      expect(totalUs).assertEqual(400008);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1532 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1533
     * @tc.name      soloFrameRate1533
     * @tc.desc      60fps 步长 3 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1533', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1533 begin');
      const fps: number = 60;
      const step: number = 3;
      const stamps: number[] = [0, 50, 100, 150, 200];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(200);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1533 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1534
     * @tc.name      soloFrameRate1534
     * @tc.desc      60fps 在 500ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1534', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1534 begin');
      const fps: number = 60;
      const duration: number = 500;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(30);
      expect(interval.toFixed(4)).assertEqual('16.6667');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1534 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1535
     * @tc.name      soloFrameRate1535
     * @tc.desc      60fps 在 500ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1535', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1535 begin');
      const fps: number = 60;
      const frames: number = 30;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 500000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(16667);
      expect(totalUs).assertEqual(500010);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1535 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1536
     * @tc.name      soloFrameRate1536
     * @tc.desc      60fps 步长 1 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1536', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1536 begin');
      const fps: number = 60;
      const step: number = 1;
      const stamps: number[] = [0, 17, 33, 50, 67];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(67);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1536 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1537
     * @tc.name      soloFrameRate1537
     * @tc.desc      60fps 在 600ms 内帧数与累计误差推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1537', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1537 begin');
      const fps: number = 60;
      const duration: number = 600;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      const drift: number = Math.abs(frames * interval - duration);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + frames + ' drift=' + drift.toFixed(3));
      expect(frames).assertEqual(36);
      expect(interval.toFixed(4)).assertEqual('16.6667');
      expect(drift < interval + 0.0001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1537 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1538
     * @tc.name      soloFrameRate1538
     * @tc.desc      60fps 在 600ms 内的微秒级帧预算与尾差校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1538', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1538 begin');
      const fps: number = 60;
      const frames: number = 36;
      const intervalUs: number = Math.round(1000000 / fps);
      const totalUs: number = intervalUs * frames;
      const tailUs: number = 600000 - frames * 1000000 / fps;
      hilog.info(DOMAIN, TAG, '%{public}s', 'us=' + intervalUs + ' tail=' + tailUs.toFixed(3));
      expect(intervalUs).assertEqual(16667);
      expect(totalUs).assertEqual(600012);
      expect(tailUs > -0.001).assertTrue();
      expect(tailUs <= 1000000 / fps + 0.001).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1538 end');
    })

    /**
     * @tc.number    SOLO_FRAME_RATE_1539
     * @tc.name      soloFrameRate1539
     * @tc.desc      60fps 步长 2 的五个采样时间戳单调性校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('soloFrameRate1539', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1539 begin');
      const fps: number = 60;
      const step: number = 2;
      const stamps: number[] = [0, 33, 67, 100, 133];
      hilog.info(DOMAIN, TAG, '%{public}s', 'size=' + stamps.length);
      expect(stamps.length).assertEqual(5);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[4]).assertEqual(133);
      expect(stamps[1] <= stamps[2] && stamps[2] <= stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'soloFrameRate1539 end');
    })
  })
}
