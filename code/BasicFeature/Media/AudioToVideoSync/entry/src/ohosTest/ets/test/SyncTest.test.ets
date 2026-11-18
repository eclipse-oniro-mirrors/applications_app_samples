/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { TestType, Size, Level } from '@ohos/hypium';

import { describe, beforeAll, it, expect } from '@ohos/hypium';
import { systemDateTime } from '@kit.BasicServicesKit';
import { display } from '@kit.ArkUI';
import hilog from '@ohos.hilog';
const DOMAIN: number = 0xF811;
const TAG: string = 'Sync01';


/**
 * Sync Test Suite（音画同步的时间基准真实用例）
 *
 * 工程的同步算法以音频为基准：Player.cpp 按「已写入的音频帧数 / 采样率 / 倍速」反推视频帧
 * 应该呈现的时刻，因此整条链路能否同步，取决于设备时钟与异步调度的真实行为。
 * 用例直接测量单调时钟、墙钟一致性、定时器精度与并发调度，
 * 期望值来自实测数据之间的关系，而不是预设的常数。
 *
 * 说明：倍速接口 ratePlay 最终调用 OH_AudioRenderer_SetSpeed，而 Player::SetSpeed 未对
 * audioRenderer 做判空（见 Player.cpp），必须在 playNative 启动后才可调用，
 * 因此不放入无需真实媒体文件的自动化用例，改由 ohosTest.md 中的手工用例覆盖。
 */
export default function Sync01Test() {
  describe('Sync01Test', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', `${TAG}: suite setup`);
    })

    /**
     * @tc.number    SUB_SYNC_TEST01_0100
     * @tc.name      testSync01Chapter0001
     * @tc.desc      Verify TC_Sync_001
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSync01Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSync01Chapter0001 begin');
      const firstTick: number = systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false);
      const secondTick: number = systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false);
      hilog.info(DOMAIN, TAG, '%{public}s', `${TAG}: uptime ${firstTick} -> ${secondTick}`);
      expect(firstTick).assertLarger(0);
      expect(secondTick).assertLargerOrEqual(firstTick);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSync01Chapter0001 end');
    })

    /**
     * @tc.number    SUB_SYNC_TEST01_0200
     * @tc.name      testSync01Chapter0002
     * @tc.desc      Verify TC_Sync_002
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSync01Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSync01Chapter0002 begin');
      const uptimeStart: number = systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false);
      const wallStart: number = Date.now();
      for (let i = 0; i < 1000; i++) {
        display.getDefaultDisplaySync();
      }
      const uptimeEnd: number = systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false);
      const wallEnd: number = Date.now();
      const uptimeDelta: number = uptimeEnd - uptimeStart;
      const wallDelta: number = wallEnd - wallStart;
      hilog.info(DOMAIN, TAG, '%{public}s', `${TAG}: uptime delta ${uptimeDelta}ms, wall delta ${wallDelta}ms`);
      expect(uptimeDelta).assertLargerOrEqual(0);
      expect(Math.abs(uptimeDelta - wallDelta)).assertLessOrEqual(50);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSync01Chapter0002 end');
    })

    /**
     * @tc.number    SUB_SYNC_TEST01_0300
     * @tc.name      testSync01Chapter0003
     * @tc.desc      Verify TC_Sync_003
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSync01Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSync01Chapter0003 begin');
      const start: number = Date.now();
      await new Promise<void>((resolve) => {
        setTimeout(() => {
          resolve();
        }, 50);
      });
      const elapsed: number = Date.now() - start;
      hilog.info(DOMAIN, TAG, '%{public}s', `${TAG}: 50ms timer elapsed ${elapsed}ms`);
      expect(elapsed).assertLargerOrEqual(45);
      expect(elapsed).assertLess(500);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSync01Chapter0003 end');
    })

    /**
     * @tc.number    SUB_SYNC_TEST01_0400
     * @tc.name      testSync01Chapter0004
     * @tc.desc      Verify TC_Sync_004
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSync01Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSync01Chapter0004 begin');
      const tasks: Promise<void>[] = [];
      for (let i = 0; i < 3; i++) {
        tasks.push(new Promise<void>((resolve) => {
          setTimeout(() => {
            resolve();
          }, 30);
        }));
      }
      const start: number = Date.now();
      await Promise.all(tasks);
      const elapsed: number = Date.now() - start;
      hilog.info(DOMAIN, TAG, '%{public}s', `${TAG}: 3 parallel 30ms timers elapsed ${elapsed}ms`);
      expect(elapsed).assertLargerOrEqual(25);
      expect(elapsed).assertLess(90);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSync01Chapter0004 end');
    })
  })
}
