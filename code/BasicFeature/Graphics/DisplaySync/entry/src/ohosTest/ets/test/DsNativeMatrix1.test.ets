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
import { displaySync } from '@kit.ArkGraphics2D';
import { bundleManager } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { BusinessError } from '@kit.BasicServicesKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_DisplaySync]';

export default function dsNativeMatrix1Test(): void {
  describe('DsNativeMatrix1Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_NATIVE_0001
     * @tc.name      dsNative0001
     * @tc.desc      1fps 持续 1000ms 的帧间隔与帧数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsNative0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0001 begin');
      const fps: number = 1;
      const duration: number = 1000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'fps=' + fps + ' frames=' + frames);
      expect(interval.toFixed(3)).assertEqual('1000.000');
      expect(frames).assertEqual(1);
      expect(frames * interval >= duration - interval).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0001 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_NATIVE_0002
     * @tc.name      dsNative0002
     * @tc.desc      1fps 前四帧时间戳序列单调递增且首帧为 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsNative0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0002 begin');
      const fps: number = 1;
      const stamps: number[] = [0, 1000, 2000, 3000];
      hilog.info(DOMAIN, TAG, '%{public}s', 'last=' + stamps[3]);
      expect(stamps.length).assertEqual(4);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[3]).assertEqual(3000);
      expect(stamps[1] < stamps[2]).assertTrue();
      expect(stamps[2] < stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0002 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_NATIVE_0003
     * @tc.name      dsNative0003
     * @tc.desc      5fps 持续 1000ms 的帧间隔与帧数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsNative0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0003 begin');
      const fps: number = 5;
      const duration: number = 1000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'fps=' + fps + ' frames=' + frames);
      expect(interval.toFixed(3)).assertEqual('200.000');
      expect(frames).assertEqual(5);
      expect(frames * interval >= duration - interval).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0003 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_NATIVE_0004
     * @tc.name      dsNative0004
     * @tc.desc      5fps 前四帧时间戳序列单调递增且首帧为 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsNative0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0004 begin');
      const fps: number = 5;
      const stamps: number[] = [0, 200, 400, 600];
      hilog.info(DOMAIN, TAG, '%{public}s', 'last=' + stamps[3]);
      expect(stamps.length).assertEqual(4);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[3]).assertEqual(600);
      expect(stamps[1] < stamps[2]).assertTrue();
      expect(stamps[2] < stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0004 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_NATIVE_0005
     * @tc.name      dsNative0005
     * @tc.desc      10fps 持续 1000ms 的帧间隔与帧数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsNative0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0005 begin');
      const fps: number = 10;
      const duration: number = 1000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'fps=' + fps + ' frames=' + frames);
      expect(interval.toFixed(3)).assertEqual('100.000');
      expect(frames).assertEqual(10);
      expect(frames * interval >= duration - interval).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0005 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_NATIVE_0006
     * @tc.name      dsNative0006
     * @tc.desc      10fps 前四帧时间戳序列单调递增且首帧为 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsNative0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0006 begin');
      const fps: number = 10;
      const stamps: number[] = [0, 100, 200, 300];
      hilog.info(DOMAIN, TAG, '%{public}s', 'last=' + stamps[3]);
      expect(stamps.length).assertEqual(4);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[3]).assertEqual(300);
      expect(stamps[1] < stamps[2]).assertTrue();
      expect(stamps[2] < stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0006 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_NATIVE_0007
     * @tc.name      dsNative0007
     * @tc.desc      15fps 持续 1000ms 的帧间隔与帧数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsNative0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0007 begin');
      const fps: number = 15;
      const duration: number = 1000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'fps=' + fps + ' frames=' + frames);
      expect(interval.toFixed(3)).assertEqual('66.667');
      expect(frames).assertEqual(15);
      expect(frames * interval >= duration - interval).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0007 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_NATIVE_0008
     * @tc.name      dsNative0008
     * @tc.desc      15fps 前四帧时间戳序列单调递增且首帧为 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsNative0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0008 begin');
      const fps: number = 15;
      const stamps: number[] = [0, 67, 133, 200];
      hilog.info(DOMAIN, TAG, '%{public}s', 'last=' + stamps[3]);
      expect(stamps.length).assertEqual(4);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[3]).assertEqual(200);
      expect(stamps[1] < stamps[2]).assertTrue();
      expect(stamps[2] < stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0008 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_NATIVE_0009
     * @tc.name      dsNative0009
     * @tc.desc      20fps 持续 1000ms 的帧间隔与帧数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsNative0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0009 begin');
      const fps: number = 20;
      const duration: number = 1000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'fps=' + fps + ' frames=' + frames);
      expect(interval.toFixed(3)).assertEqual('50.000');
      expect(frames).assertEqual(20);
      expect(frames * interval >= duration - interval).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0009 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_NATIVE_0010
     * @tc.name      dsNative0010
     * @tc.desc      20fps 前四帧时间戳序列单调递增且首帧为 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsNative0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0010 begin');
      const fps: number = 20;
      const stamps: number[] = [0, 50, 100, 150];
      hilog.info(DOMAIN, TAG, '%{public}s', 'last=' + stamps[3]);
      expect(stamps.length).assertEqual(4);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[3]).assertEqual(150);
      expect(stamps[1] < stamps[2]).assertTrue();
      expect(stamps[2] < stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0010 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_NATIVE_0011
     * @tc.name      dsNative0011
     * @tc.desc      24fps 持续 1000ms 的帧间隔与帧数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsNative0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0011 begin');
      const fps: number = 24;
      const duration: number = 1000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'fps=' + fps + ' frames=' + frames);
      expect(interval.toFixed(3)).assertEqual('41.667');
      expect(frames).assertEqual(24);
      expect(frames * interval >= duration - interval).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0011 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_NATIVE_0012
     * @tc.name      dsNative0012
     * @tc.desc      24fps 前四帧时间戳序列单调递增且首帧为 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsNative0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0012 begin');
      const fps: number = 24;
      const stamps: number[] = [0, 42, 83, 125];
      hilog.info(DOMAIN, TAG, '%{public}s', 'last=' + stamps[3]);
      expect(stamps.length).assertEqual(4);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[3]).assertEqual(125);
      expect(stamps[1] < stamps[2]).assertTrue();
      expect(stamps[2] < stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0012 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_NATIVE_0013
     * @tc.name      dsNative0013
     * @tc.desc      30fps 持续 1000ms 的帧间隔与帧数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsNative0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0013 begin');
      const fps: number = 30;
      const duration: number = 1000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'fps=' + fps + ' frames=' + frames);
      expect(interval.toFixed(3)).assertEqual('33.333');
      expect(frames).assertEqual(30);
      expect(frames * interval >= duration - interval).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0013 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_NATIVE_0014
     * @tc.name      dsNative0014
     * @tc.desc      30fps 前四帧时间戳序列单调递增且首帧为 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsNative0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0014 begin');
      const fps: number = 30;
      const stamps: number[] = [0, 33, 67, 100];
      hilog.info(DOMAIN, TAG, '%{public}s', 'last=' + stamps[3]);
      expect(stamps.length).assertEqual(4);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[3]).assertEqual(100);
      expect(stamps[1] < stamps[2]).assertTrue();
      expect(stamps[2] < stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0014 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_NATIVE_0015
     * @tc.name      dsNative0015
     * @tc.desc      48fps 持续 2000ms 的帧间隔与帧数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsNative0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0015 begin');
      const fps: number = 48;
      const duration: number = 2000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'fps=' + fps + ' frames=' + frames);
      expect(interval.toFixed(3)).assertEqual('20.833');
      expect(frames).assertEqual(96);
      expect(frames * interval >= duration - interval).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0015 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_NATIVE_0016
     * @tc.name      dsNative0016
     * @tc.desc      48fps 前四帧时间戳序列单调递增且首帧为 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsNative0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0016 begin');
      const fps: number = 48;
      const stamps: number[] = [0, 21, 42, 63];
      hilog.info(DOMAIN, TAG, '%{public}s', 'last=' + stamps[3]);
      expect(stamps.length).assertEqual(4);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[3]).assertEqual(63);
      expect(stamps[1] < stamps[2]).assertTrue();
      expect(stamps[2] < stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0016 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_NATIVE_0017
     * @tc.name      dsNative0017
     * @tc.desc      60fps 持续 1000ms 的帧间隔与帧数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsNative0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0017 begin');
      const fps: number = 60;
      const duration: number = 1000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'fps=' + fps + ' frames=' + frames);
      expect(interval.toFixed(3)).assertEqual('16.667');
      expect(frames).assertEqual(60);
      expect(frames * interval >= duration - interval).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0017 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_NATIVE_0018
     * @tc.name      dsNative0018
     * @tc.desc      60fps 前四帧时间戳序列单调递增且首帧为 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsNative0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0018 begin');
      const fps: number = 60;
      const stamps: number[] = [0, 17, 33, 50];
      hilog.info(DOMAIN, TAG, '%{public}s', 'last=' + stamps[3]);
      expect(stamps.length).assertEqual(4);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[3]).assertEqual(50);
      expect(stamps[1] < stamps[2]).assertTrue();
      expect(stamps[2] < stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0018 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_NATIVE_0019
     * @tc.name      dsNative0019
     * @tc.desc      72fps 持续 2000ms 的帧间隔与帧数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsNative0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0019 begin');
      const fps: number = 72;
      const duration: number = 2000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'fps=' + fps + ' frames=' + frames);
      expect(interval.toFixed(3)).assertEqual('13.889');
      expect(frames).assertEqual(144);
      expect(frames * interval >= duration - interval).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0019 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_NATIVE_0020
     * @tc.name      dsNative0020
     * @tc.desc      72fps 前四帧时间戳序列单调递增且首帧为 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsNative0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0020 begin');
      const fps: number = 72;
      const stamps: number[] = [0, 14, 28, 42];
      hilog.info(DOMAIN, TAG, '%{public}s', 'last=' + stamps[3]);
      expect(stamps.length).assertEqual(4);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[3]).assertEqual(42);
      expect(stamps[1] < stamps[2]).assertTrue();
      expect(stamps[2] < stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0020 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_NATIVE_0021
     * @tc.name      dsNative0021
     * @tc.desc      90fps 持续 3000ms 的帧间隔与帧数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsNative0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0021 begin');
      const fps: number = 90;
      const duration: number = 3000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'fps=' + fps + ' frames=' + frames);
      expect(interval.toFixed(3)).assertEqual('11.111');
      expect(frames).assertEqual(270);
      expect(frames * interval >= duration - interval).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0021 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_NATIVE_0022
     * @tc.name      dsNative0022
     * @tc.desc      90fps 前四帧时间戳序列单调递增且首帧为 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsNative0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0022 begin');
      const fps: number = 90;
      const stamps: number[] = [0, 11, 22, 33];
      hilog.info(DOMAIN, TAG, '%{public}s', 'last=' + stamps[3]);
      expect(stamps.length).assertEqual(4);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[3]).assertEqual(33);
      expect(stamps[1] < stamps[2]).assertTrue();
      expect(stamps[2] < stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0022 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_NATIVE_0023
     * @tc.name      dsNative0023
     * @tc.desc      120fps 持续 1000ms 的帧间隔与帧数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsNative0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0023 begin');
      const fps: number = 120;
      const duration: number = 1000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'fps=' + fps + ' frames=' + frames);
      expect(interval.toFixed(3)).assertEqual('8.333');
      expect(frames).assertEqual(120);
      expect(frames * interval >= duration - interval).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0023 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_NATIVE_0024
     * @tc.name      dsNative0024
     * @tc.desc      120fps 前四帧时间戳序列单调递增且首帧为 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsNative0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0024 begin');
      const fps: number = 120;
      const stamps: number[] = [0, 8, 17, 25];
      hilog.info(DOMAIN, TAG, '%{public}s', 'last=' + stamps[3]);
      expect(stamps.length).assertEqual(4);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[3]).assertEqual(25);
      expect(stamps[1] < stamps[2]).assertTrue();
      expect(stamps[2] < stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0024 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_NATIVE_0025
     * @tc.name      dsNative0025
     * @tc.desc      144fps 持续 4000ms 的帧间隔与帧数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsNative0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0025 begin');
      const fps: number = 144;
      const duration: number = 4000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'fps=' + fps + ' frames=' + frames);
      expect(interval.toFixed(3)).assertEqual('6.944');
      expect(frames).assertEqual(576);
      expect(frames * interval >= duration - interval).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0025 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_NATIVE_0026
     * @tc.name      dsNative0026
     * @tc.desc      144fps 前四帧时间戳序列单调递增且首帧为 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsNative0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0026 begin');
      const fps: number = 144;
      const stamps: number[] = [0, 7, 14, 21];
      hilog.info(DOMAIN, TAG, '%{public}s', 'last=' + stamps[3]);
      expect(stamps.length).assertEqual(4);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[3]).assertEqual(21);
      expect(stamps[1] < stamps[2]).assertTrue();
      expect(stamps[2] < stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0026 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_NATIVE_0027
     * @tc.name      dsNative0027
     * @tc.desc      30fps 持续 5000ms 的帧间隔与帧数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsNative0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0027 begin');
      const fps: number = 30;
      const duration: number = 5000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'fps=' + fps + ' frames=' + frames);
      expect(interval.toFixed(3)).assertEqual('33.333');
      expect(frames).assertEqual(150);
      expect(frames * interval >= duration - interval).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0027 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_NATIVE_0028
     * @tc.name      dsNative0028
     * @tc.desc      30fps 前四帧时间戳序列单调递增且首帧为 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsNative0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0028 begin');
      const fps: number = 30;
      const stamps: number[] = [0, 33, 67, 100];
      hilog.info(DOMAIN, TAG, '%{public}s', 'last=' + stamps[3]);
      expect(stamps.length).assertEqual(4);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[3]).assertEqual(100);
      expect(stamps[1] < stamps[2]).assertTrue();
      expect(stamps[2] < stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0028 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_NATIVE_0029
     * @tc.name      dsNative0029
     * @tc.desc      60fps 持续 5000ms 的帧间隔与帧数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsNative0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0029 begin');
      const fps: number = 60;
      const duration: number = 5000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'fps=' + fps + ' frames=' + frames);
      expect(interval.toFixed(3)).assertEqual('16.667');
      expect(frames).assertEqual(300);
      expect(frames * interval >= duration - interval).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0029 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_NATIVE_0030
     * @tc.name      dsNative0030
     * @tc.desc      60fps 前四帧时间戳序列单调递增且首帧为 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsNative0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0030 begin');
      const fps: number = 60;
      const stamps: number[] = [0, 17, 33, 50];
      hilog.info(DOMAIN, TAG, '%{public}s', 'last=' + stamps[3]);
      expect(stamps.length).assertEqual(4);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[3]).assertEqual(50);
      expect(stamps[1] < stamps[2]).assertTrue();
      expect(stamps[2] < stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0030 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_NATIVE_0031
     * @tc.name      dsNative0031
     * @tc.desc      120fps 持续 5000ms 的帧间隔与帧数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsNative0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0031 begin');
      const fps: number = 120;
      const duration: number = 5000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'fps=' + fps + ' frames=' + frames);
      expect(interval.toFixed(3)).assertEqual('8.333');
      expect(frames).assertEqual(600);
      expect(frames * interval >= duration - interval).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0031 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_NATIVE_0032
     * @tc.name      dsNative0032
     * @tc.desc      120fps 前四帧时间戳序列单调递增且首帧为 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsNative0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0032 begin');
      const fps: number = 120;
      const stamps: number[] = [0, 8, 17, 25];
      hilog.info(DOMAIN, TAG, '%{public}s', 'last=' + stamps[3]);
      expect(stamps.length).assertEqual(4);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[3]).assertEqual(25);
      expect(stamps[1] < stamps[2]).assertTrue();
      expect(stamps[2] < stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0032 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_NATIVE_0033
     * @tc.name      dsNative0033
     * @tc.desc      15fps 持续 3000ms 的帧间隔与帧数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsNative0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0033 begin');
      const fps: number = 15;
      const duration: number = 3000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'fps=' + fps + ' frames=' + frames);
      expect(interval.toFixed(3)).assertEqual('66.667');
      expect(frames).assertEqual(45);
      expect(frames * interval >= duration - interval).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0033 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_NATIVE_0034
     * @tc.name      dsNative0034
     * @tc.desc      15fps 前四帧时间戳序列单调递增且首帧为 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsNative0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0034 begin');
      const fps: number = 15;
      const stamps: number[] = [0, 67, 133, 200];
      hilog.info(DOMAIN, TAG, '%{public}s', 'last=' + stamps[3]);
      expect(stamps.length).assertEqual(4);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[3]).assertEqual(200);
      expect(stamps[1] < stamps[2]).assertTrue();
      expect(stamps[2] < stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0034 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_NATIVE_0035
     * @tc.name      dsNative0035
     * @tc.desc      20fps 持续 2000ms 的帧间隔与帧数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsNative0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0035 begin');
      const fps: number = 20;
      const duration: number = 2000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'fps=' + fps + ' frames=' + frames);
      expect(interval.toFixed(3)).assertEqual('50.000');
      expect(frames).assertEqual(40);
      expect(frames * interval >= duration - interval).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0035 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_NATIVE_0036
     * @tc.name      dsNative0036
     * @tc.desc      20fps 前四帧时间戳序列单调递增且首帧为 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsNative0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0036 begin');
      const fps: number = 20;
      const stamps: number[] = [0, 50, 100, 150];
      hilog.info(DOMAIN, TAG, '%{public}s', 'last=' + stamps[3]);
      expect(stamps.length).assertEqual(4);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[3]).assertEqual(150);
      expect(stamps[1] < stamps[2]).assertTrue();
      expect(stamps[2] < stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0036 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_NATIVE_0037
     * @tc.name      dsNative0037
     * @tc.desc      24fps 持续 3000ms 的帧间隔与帧数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsNative0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0037 begin');
      const fps: number = 24;
      const duration: number = 3000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'fps=' + fps + ' frames=' + frames);
      expect(interval.toFixed(3)).assertEqual('41.667');
      expect(frames).assertEqual(72);
      expect(frames * interval >= duration - interval).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0037 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_NATIVE_0038
     * @tc.name      dsNative0038
     * @tc.desc      24fps 前四帧时间戳序列单调递增且首帧为 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsNative0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0038 begin');
      const fps: number = 24;
      const stamps: number[] = [0, 42, 83, 125];
      hilog.info(DOMAIN, TAG, '%{public}s', 'last=' + stamps[3]);
      expect(stamps.length).assertEqual(4);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[3]).assertEqual(125);
      expect(stamps[1] < stamps[2]).assertTrue();
      expect(stamps[2] < stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0038 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_NATIVE_0039
     * @tc.name      dsNative0039
     * @tc.desc      10fps 持续 4000ms 的帧间隔与帧数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsNative0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0039 begin');
      const fps: number = 10;
      const duration: number = 4000;
      const interval: number = 1000 / fps;
      const frames: number = Math.floor(duration * fps / 1000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'fps=' + fps + ' frames=' + frames);
      expect(interval.toFixed(3)).assertEqual('100.000');
      expect(frames).assertEqual(40);
      expect(frames * interval >= duration - interval).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0039 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_NATIVE_0040
     * @tc.name      dsNative0040
     * @tc.desc      10fps 前四帧时间戳序列单调递增且首帧为 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsNative0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0040 begin');
      const fps: number = 10;
      const stamps: number[] = [0, 100, 200, 300];
      hilog.info(DOMAIN, TAG, '%{public}s', 'last=' + stamps[3]);
      expect(stamps.length).assertEqual(4);
      expect(stamps[0]).assertEqual(0);
      expect(stamps[3]).assertEqual(300);
      expect(stamps[1] < stamps[2]).assertTrue();
      expect(stamps[2] < stamps[3]).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0040 end');
    })
  })
}
