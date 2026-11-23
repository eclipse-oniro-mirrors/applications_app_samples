/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { hilog } from '@kit.PerformanceAnalysisKit';
import { Driver, ON, abilityDelegatorRegistry } from '@kit.TestKit';
import { describe, it } from '@ohos/hypium';

const DOMAIN: number = 0xF811;
const BUNDLE: string = 'com.samples.avcodecsample_videoplayer';
const TAG: string = '[Sample_AVCodecSample_VideoPlayer]';
const CASE_NAME: string = 'AVCodecSample_VideoPlayer_HomeControls_001';
const WAIT_MS: number = 5000;
const MODE_BUTTON: string = 'playbackMode';
const PLAY_BUTTON: string = 'play';

export default function abilityTest(): void {
  describe('VideoPlayerHomeTest', (): void => {
    // 启动首页并确认两个播放入口可用。
    it(CASE_NAME, 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s begin', CASE_NAME);
      try {
        await abilityDelegatorRegistry.getAbilityDelegator().startAbility({
          bundleName: BUNDLE, abilityName: 'EntryAbility'
        });
        const driver: Driver = Driver.create();
        await driver.waitForComponent(ON.id(MODE_BUTTON), WAIT_MS);
        for (const id of [MODE_BUTTON, PLAY_BUTTON]) {
          hilog.info(DOMAIN, TAG, '%{public}s expected component: %{public}s', CASE_NAME, id);
          await driver.assertComponentExist(ON.id(id));
        }
      } finally {
        hilog.info(DOMAIN, TAG, '%{public}s end', CASE_NAME);
      }
    });
  });
}
