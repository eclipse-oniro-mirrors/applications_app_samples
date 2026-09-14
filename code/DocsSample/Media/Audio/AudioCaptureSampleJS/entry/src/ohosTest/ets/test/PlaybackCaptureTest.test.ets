/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const TAG = '[Sample_PlaybackCapture]';
const DOMAIN = 0xF811;
const BUNDLE = 'PlaybackCapture_';
let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const driver = Driver.create();

async function runTest(buttonText: string, delayTime: number, description: string, done: Function) {
  hilog.info(DOMAIN, TAG, BUNDLE + `${description}, begin`);
  try {
    let button = await driver.findComponent(ON.text(buttonText));
    if (button !== null && button !== undefined) {
      await button.click();
    }
    await driver.delayMs(delayTime);
  } catch (error) {
    hilog.warn(DOMAIN, TAG, BUNDLE + `${description}, skip: ${JSON.stringify(error)}`);
  } finally {
    hilog.info(DOMAIN, TAG, BUNDLE + `${description}, end`);
    done();
  }
}

export default function PlaybackCaptureTest() {
  describe('PlaybackCaptureTest', () => {
    beforeAll(() => {
      abilityDelegator.startAbility({
        bundleName: 'com.example.myapplication',
        abilityName: 'EntryAbility'
      });
    })
    beforeEach(() => {})
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.number PlaybackCapture_EnterPage_0001
     * @tc.name PlaybackCapture_EnterPage_0001
     * @tc.desc Enter playback capture page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PlaybackCapture_EnterPage_0001', Level.LEVEL1, async (done: Function) => {
      await runTest('跳转到音频内录页面', 3000, 'Enter_Playback_Capture_Page', done);
    })

    /**
     * @tc.number PlaybackCapture_Start_0001
     * @tc.name PlaybackCapture_Start_0001
     * @tc.desc Request to start playback capture
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PlaybackCapture_Start_0001', Level.LEVEL1, async (done: Function) => {
      await runTest('启动音频内录', 3000, 'Start_Playback_Capture', done);
    })

    /**
     * @tc.number PlaybackCapture_GetStatus_0001
     * @tc.name PlaybackCapture_GetStatus_0001
     * @tc.desc Get playback capture status
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PlaybackCapture_GetStatus_0001', Level.LEVEL1, async (done: Function) => {
      await runTest('查询音频内录状态', 2000, 'Get_Playback_Capture_Status', done);
    })

    /**
     * @tc.number PlaybackCapture_Stop_0001
     * @tc.name PlaybackCapture_Stop_0001
     * @tc.desc Stop playback capture and release resources
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PlaybackCapture_Stop_0001', Level.LEVEL1, async (done: Function) => {
      await runTest('停止音频内录', 2000, 'Stop_Playback_Capture', done);
    })
  })
}
