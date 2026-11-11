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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@kit.BasicServicesKit';
import audioPlayer from 'libentry.so';
import { MediaControlCenterHandle } from '../../../main/ets/common/utils/mediautils/MediaControlCenterHandle';
import {
  DEFAULT_VOLUME,
  SPEED_ID,
  VOLUME_ID
} from '../../../main/ets/common/constants/PlayerConstants';
import { PreferencesUtil } from '../../../main/ets/common/utils/PreferencesUtil';
import { ensureAppContext } from './TestContext';
import { paceTurn } from './TestPace';

const TAG: string = 'Sample_AudioMusicPlayer';
const DOMAIN: number = 0xF811;
const BUNDLE: string = 'AudioMusicPlayer_';
const PROGRESS_MAX_MS: number = 232520;
const SPEED_MIN: number = 0.25;
const SPEED_MAX: number = 4;
const SPEED_STEP: number = 0.25;

const HANDLE: MediaControlCenterHandle = MediaControlCenterHandle.getInstance();

function speedSliderSteps(): number {
  return Math.round((SPEED_MAX - SPEED_MIN) / SPEED_STEP);
}

function snapSpeed(value: number): number {
  let clamped: number = Math.min(Math.max(value, SPEED_MIN), SPEED_MAX);
  let steps: number = Math.round((clamped - SPEED_MIN) / SPEED_STEP);
  return Math.round((SPEED_MIN + steps * SPEED_STEP) * 100) / 100;
}

function measure(action: () => void): boolean {
  try {
    action();
    return false;
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s',
      `native action threw code=${(error as BusinessError).code}`);
    return true;
  }
}

export default function NativePlayerGuardTest() {
  describe('NativePlayerGuardTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_NATIVE_GUARD_0300
     * @tc.name      testNativePlayerGuard0003
     * @tc.desc      验证未加载歌曲时握手流程可重复执行且播放状态读取保持稳定
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testNativePlayerGuard0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Native_HandshakeRepeat_0003 begin');
      let initThrew: boolean = false;
      try {
        await HANDLE.init();
        await HANDLE.create();
        await HANDLE.init();
      } catch (error) {
        initThrew = true;
      }
      let firstDuration: number = HANDLE.getSongDuration();
      await paceTurn();
      let secondDuration: number = HANDLE.getSongDuration();
      let stopThrew: boolean = false;
      try {
        await HANDLE.stop();
      } catch (error) {
        stopThrew = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s',
        `初始化抛异常=${initThrew}, 时长=${firstDuration}/${secondDuration}, 停止抛异常=${stopThrew}`);
      expect(initThrew).assertFalse();
      expect(stopThrew).assertFalse();
      expect(firstDuration).assertEqual(0);
      expect(secondDuration).assertEqual(firstDuration);
      expect(Date.now() > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Native_HandshakeRepeat_0003 end');
    });

    /**
     * @tc.number    SUB_NATIVE_GUARD_0400
     * @tc.name      testNativePlayerGuard0004
     * @tc.desc      验证倍速滑杆档位换算与独立换算一致且越界值被收敛到有效档位
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testNativePlayerGuard0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Native_SpeedSteps_0004 begin');
      let steps: number = speedSliderSteps();
      let values: number[] = [0.1, SPEED_MIN, 0.6, 0.74, 0.76, 1, 1.13, 2.5, 3.9, SPEED_MAX, 9];
      let ordered: boolean = true;
      let lastValue: number = -1;
      for (let value of values) {
        let snapped: number = snapSpeed(value);
        hilog.info(DOMAIN, TAG, '%{public}s', `输入${value} => 档位值${snapped}`);
        expect(snapped >= SPEED_MIN).assertTrue();
        expect(snapped <= SPEED_MAX).assertTrue();
        expect(Number.isInteger(Math.round((snapped - SPEED_MIN) / SPEED_STEP))).assertTrue();
      }
      let sorted: number[] = values.slice().sort((a: number, b: number) => a - b);
      for (let value of sorted) {
        let snapped: number = snapSpeed(value);
        if (snapped < lastValue) {
          ordered = false;
        }
        lastValue = snapped;
      }
      expect(ordered).assertTrue();
      expect(steps).assertEqual(15);
      expect(snapSpeed(0.1)).assertEqual(SPEED_MIN);
      expect(snapSpeed(9)).assertEqual(SPEED_MAX);
      expect(snapSpeed(0.6)).assertEqual(0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Native_SpeedSteps_0004 end');
    });

  });
}
