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

import { describe, beforeAll, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import audioPlayer from 'libentry.so';
import { MediaControlCenterHandle } from '../../../main/ets/common/utils/mediautils/MediaControlCenterHandle';
import { paceTurn } from './TestPace';

const TAG: string = 'Sample_AudioMusicPlayer';
const DOMAIN: number = 0xF811;
const BUNDLE: string = 'AudioMusicPlayer_';

const HANDLE: MediaControlCenterHandle = MediaControlCenterHandle.getInstance();

interface Probe {
  threw: boolean;
  value: number;
}

function probe(read: () => number): Probe {
  try {
    return { threw: false, value: read() };
  } catch (error) {
    return { threw: true, value: -1 };
  }
}

function readAll(): number[] {
  return [audioPlayer.getProgress(), audioPlayer.getSongDuration(), audioPlayer.getRemainingTime()];
}

export default function NativeTimeoutsSuite() {
  describe('NativeTimeoutsSuite', () => {
    beforeAll(async () => {
      await HANDLE.init();
    });

    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_NATIVE_TIMING_0600
     * @tc.name      testNativeTimeouts0006
     * @tc.desc      验证暂停与停止接口默认失败次数为零，且在无音频加载时反复停止后读取总时长仍为零
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testNativeTimeouts0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Native_StopRepeat_0006 begin');
      let failures: number = 0;
      for (let round = 0; round < 5; round++) {
        try {
          await HANDLE.stop();
        } catch (error) {
          failures++;
        }
      }
      let durations: number[] = [];
      durations.push(HANDLE.getSongDuration());
      await paceTurn();
      durations.push(HANDLE.getSongDuration());
      hilog.info(DOMAIN, TAG, '%{public}s', `停止失败=${failures}, 时长=${durations.join('/')}`);
      expect(failures).assertEqual(0);
      expect(durations[0]).assertEqual(0);
      expect(durations[1]).assertEqual(durations[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Native_StopRepeat_0006 end');
    });
    
  });
}
