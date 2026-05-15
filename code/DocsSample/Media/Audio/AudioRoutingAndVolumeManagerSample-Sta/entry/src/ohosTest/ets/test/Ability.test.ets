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
import Want from '@ohos.app.ability.Want';

const TAG = '[AudioInputDeviceManagementTest]';
const DOMAIN = 0xF81A;
const BUNDLE = 'AudioInputDeviceManagement';
let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const driver = Driver.create();

async function runTest(
  testCaseName: string,
  buttonId: string,
  delayTime: number,
  description: string,
  done: Function
) {
  hilog.info(DOMAIN, TAG, BUNDLE + `${description}, begin`);

  let btn = await driver.findComponent(ON.id(buttonId));
  if (btn !== null) {
    await btn.click();
    await driver.delayMs(delayTime);
  } else {
    hilog.warn(DOMAIN, TAG, BUNDLE + `Button "${buttonId}" not found.`);
    await driver.delayMs(delayTime);
  }

  hilog.info(DOMAIN, TAG, BUNDLE + `${description}, end`);
  done();
}


export default function abilityTest(): void {
  describe('ActsAbilityTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * StartAbility
     */
    it('StartAbility', 0, async (done: Function) => {
      let want = new Want();
      want.bundleName = 'com.example.myapplication';
      want.abilityName = 'EntryAbility';
      await abilityDelegator.startAbility(want);
      done();
    });

    /**
     * Allow Microsoft Permission
     */
    it('Permission', 0, async () => {
      await driver.delayMs(3000);
      let ability = abilityDelegator.getAppContext();
      for (let i = 0; i < 1; i++) {
        let btnAccept = await driver.findComponent(ON.text('允许'));
        if (btnAccept !== null) {
          await btnAccept.click();
          await driver.delayMs(500);
        }
      }
    });

    //------------------------------------------AudioInputDeviceManagementTest---------------------------------------------

    /**
     * AudioInputDeviceManagementTest
     */
    it('EnterAudioInputDeviceManagementTest', 0, async (done: Function) => {
      let audioCapturerComponent = await driver.findComponent(ON.text('查询和监听音频输入设备'));
      if (audioCapturerComponent !== null) {
        await audioCapturerComponent.click();
      }
      await driver.delayMs(3000);
      done();
    });

    /**
     * @tc.number AudioInputDeviceManagement_Test_001
     * @tc.name AudioInputDeviceManagement_Test_001
     * @tc.desc Init audioCapturer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AudioInputDeviceManagement_Test_001', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'AudioInputDeviceManagement_Test_001',
        'input_management_init',
        3000,
        'Succeeded in creating audio capturer.',
        done
      );
    });

    /**
     * @tc.number AudioInputDeviceManagement_Test_002
     * @tc.name AudioInputDeviceManagement_Test_002
     * @tc.desc Start audioCapturer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AudioInputDeviceManagement_Test_002', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'AudioInputDeviceManagement_Test_002',
        'input_management_start',
        3000,
        'Succeeded in starting audio capturer.',
        done
      );
    });

    /**
     * @tc.number AudioInputDeviceManagement_Test_003
     * @tc.name AudioInputDeviceManagement_Test_003
     * @tc.desc Get devices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AudioInputDeviceManagement_Test_003', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'AudioInputDeviceManagement_Test_003',
        'input_management_getDevices',
        3000,
        'Succeeded in getting devices.',
        done
      );
    });

    /**
     * @tc.number AudioInputDeviceManagement_Test_004
     * @tc.name AudioInputDeviceManagement_Test_004
     * @tc.desc Register deviceChange
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AudioInputDeviceManagement_Test_004', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'AudioInputDeviceManagement_Test_004',
        'input_management_onDeviceChange',
        3000,
        'Register deviceChange success.',
        done
      );
    });

    /**
     * @tc.number AudioInputDeviceManagement_Test_005
     * @tc.name AudioInputDeviceManagement_Test_005
     * @tc.desc Stop audioCapturer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AudioInputDeviceManagement_Test_005', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'AudioInputDeviceManagement_Test_005',
        'input_management_stop',
        3000,
        'Succeeded in stopping audio capturer.',
        done
      );
    });

    /**
     * Back Index
     */
    it('AudioInputDeviceManagementBack', 0, async (done: Function) => {
      let audioCapturerComponent = await driver.findComponent(ON.id('input_management_back'));
      if (audioCapturerComponent !== null) {
        await audioCapturerComponent.click();
      }
      await driver.delayMs(3000);
      done();
    });

    //------------------------------------------AudioInputDeviceSwitcherTest-------------------------------------------

    /**
     * AudioInputDeviceSwitcherTest
     */
    it('EnterAudioInputDeviceSwitcherTest', 0, async (done: Function) => {
      let audioCapturerComponent = await driver.findComponent(ON.text('音频输入设备路由切换'));
      if (audioCapturerComponent !== null) {
        await audioCapturerComponent.click();
      }
      await driver.delayMs(3000);
      done();
    });

    /**
     * @tc.number AudioInputDeviceSwitcher_Test_001
     * @tc.name AudioInputDeviceSwitcher_Test_001
     * @tc.desc Init audioCapturer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AudioInputDeviceSwitcher_Test_001', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'AudioInputDeviceSwitcher_Test_001',
        'input_switcher_init',
        3000,
        'Succeeded in creating audio capturer.',
        done
      );
    });

    /**
     * @tc.number AudioInputDeviceSwitcher_Test_002
     * @tc.name AudioInputDeviceSwitcher_Test_002
     * @tc.desc Start audioCapturer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AudioInputDeviceSwitcher_Test_002', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'AudioInputDeviceSwitcher_Test_002',
        'input_switcher_start',
        3000,
        'Succeeded in starting audio capturer.',
        done
      );
    });

    /**
     * @tc.number AudioInputDeviceSwitcher_Test_003
     * @tc.name AudioInputDeviceSwitcher_Test_003
     * @tc.desc Set bluetooth and nearlink preferred record category
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AudioInputDeviceSwitcher_Test_003', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'AudioInputDeviceSwitcher_Test_003',
        'input_switcher_setBluetoothAndNearlinkPreferredRecordCategory',
        3000,
        'Succeeded in setting bluetooth and nearlink preferred record category.',
        done
      );
    });

    /**
     * @tc.number AudioInputDeviceSwitcher_Test_004
     * @tc.name AudioInputDeviceSwitcher_Test_004
     * @tc.desc Register currentInputDeviceChanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AudioInputDeviceSwitcher_Test_004', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'AudioInputDeviceSwitcher_Test_004',
        'input_switcher_onCurrentInputDeviceChanged',
        3000,
        'Register currentInputDeviceChanged success.',
        done
      );
    });

    /**
     * @tc.number AudioInputDeviceSwitcher_Test_005
     * @tc.name AudioInputDeviceSwitcher_Test_005
     * @tc.desc Register availableDeviceChange
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AudioInputDeviceSwitcher_Test_005', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'AudioInputDeviceSwitcher_Test_005',
        'input_switcher_onAvailableDeviceChange',
        3000,
        'Register availableDeviceChange success.',
        done
      );
    });

    /**
     * @tc.number AudioInputDeviceSwitcher_Test_006
     * @tc.name AudioInputDeviceSwitcher_Test_006
     * @tc.desc Select media input device
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AudioInputDeviceSwitcher_Test_006', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'AudioInputDeviceSwitcher_Test_006',
        'input_switcher_selectMediaInputDevice',
        3000,
        'Succeeded in selecting media input device.',
        done
      );
    });

    /**
     * @tc.number AudioInputDeviceSwitcher_Test_007
     * @tc.name AudioInputDeviceSwitcher_Test_007
     * @tc.desc Get selected media input device
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AudioInputDeviceSwitcher_Test_007', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'AudioInputDeviceSwitcher_Test_007',
        'input_switcher_getSelectedMediaInputDevice',
        3000,
        'Succeeded in getting selected media input device.',
        done
      );
    });

    /**
     * @tc.number AudioInputDeviceSwitcher_Test_008
     * @tc.name AudioInputDeviceSwitcher_Test_008
     * @tc.desc Clear selected media input device
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AudioInputDeviceSwitcher_Test_008', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'AudioInputDeviceSwitcher_Test_008',
        'input_switcher_clearSelectedMediaInputDevice',
        3000,
        'Succeeded in clearing selected media input device.',
        done
      );
    });

    /**
     * @tc.number AudioInputDeviceSwitcher_Test_009
     * @tc.name AudioInputDeviceSwitcher_Test_009
     * @tc.desc Stop audioCapturer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AudioInputDeviceSwitcher_Test_009', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'AudioInputDeviceSwitcher_Test_009',
        'input_switcher_stop',
        3000,
        'Succeeded in stopping audio capturer.',
        done
      );
    });

    /**
     * Back Index
     */
    it('AudioInputDeviceSwitcherBack', 0, async (done: Function) => {
      let audioCapturerComponent = await driver.findComponent(ON.id('input_switcher_back'));
      if (audioCapturerComponent !== null) {
        await audioCapturerComponent.click();
      }
      await driver.delayMs(3000);
      done();
    });

    //------------------------------------------AudioOutputDeviceChangeTest---------------------------------------------

    /**
     * AudioOutputDeviceChangeTest
     */
    it('EnterAudioOutputDeviceChangeTest', 0, async (done: Function) => {
      let audioCapturerComponent = await driver.findComponent(ON.text('响应输出设备变更时合理暂停'));
      if (audioCapturerComponent !== null) {
        await audioCapturerComponent.click();
      }
      await driver.delayMs(3000);
      done();
    });

    /**
     * @tc.number AudioOutputDeviceChange_Test_001
     * @tc.name AudioOutputDeviceChange_Test_001
     * @tc.desc Init audioRenderer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AudioOutputDeviceChange_Test_001', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'AudioOutputDeviceChange_Test_001',
        'output_change_init',
        3000,
        'Succeeded in creating audio renderer.',
        done
      );
    });

    /**
     * @tc.number AudioOutputDeviceChange_Test_002
     * @tc.name AudioOutputDeviceChange_Test_002
     * @tc.desc Start audioRenderer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AudioOutputDeviceChange_Test_002', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'AudioOutputDeviceChange_Test_002',
        'output_change_start',
        3000,
        'Succeeded in starting audio renderer.',
        done
      );
    });

    /**
     * @tc.number AudioOutputDeviceChange_Test_003
     * @tc.name AudioOutputDeviceChange_Test_003
     * @tc.desc Register outputDeviceChangeWithInfo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AudioOutputDeviceChange_Test_003', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'AudioOutputDeviceChange_Test_003',
        'output_change_onOutputDeviceChangeWithInfo',
        3000,
        'Register outputDeviceChangeWithInfo success.',
        done
      );
    });

    /**
     * @tc.number AudioOutputDeviceChange_Test_004
     * @tc.name AudioOutputDeviceChange_Test_004
     * @tc.desc Register currentOutputDeviceChanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AudioOutputDeviceChange_Test_004', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'AudioOutputDeviceChange_Test_004',
        'output_change_onCurrentOutputDeviceChanged',
        3000,
        'Register currentOutputDeviceChanged success.',
        done
      );
    });

    /**
     * @tc.number AudioOutputDeviceChange_Test_005
     * @tc.name AudioOutputDeviceChange_Test_005
     * @tc.desc Stop audioRenderer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AudioOutputDeviceChange_Test_005', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'AudioOutputDeviceChange_Test_005',
        'output_change_stop',
        3000,
        'Succeeded in stopping audio renderer.',
        done
      );
    });

    /**
     * Back Index
     */
    it('AudioOutputDeviceChangeBack', 0, async (done: Function) => {
      let audioCapturerComponent = await driver.findComponent(ON.id('output_change_back'));
      if (audioCapturerComponent !== null) {
        await audioCapturerComponent.click();
      }
      await driver.delayMs(3000);
      done();
    });

    //------------------------------------------AudioOutputDeviceManagementTest-----------------------------------------

    /**
     * AudioOutputDeviceManagementTest
     */
    it('EnterAudioOutputDeviceManagementTest', 0, async (done: Function) => {
      let audioCapturerComponent = await driver.findComponent(ON.text('查询和监听音频输出设备'));
      if (audioCapturerComponent !== null) {
        await audioCapturerComponent.click();
      }
      await driver.delayMs(3000);
      done();
    });

    /**
     * @tc.number AudioOutputDeviceManagement_Test_001
     * @tc.name AudioOutputDeviceManagement_Test_001
     * @tc.desc Init audioRenderer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AudioOutputDeviceManagement_Test_001', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'AudioOutputDeviceManagement_Test_001',
        'output_management_init',
        3000,
        'Succeeded in creating audio renderer.',
        done
      );
    });

    /**
     * @tc.number AudioOutputDeviceManagement_Test_002
     * @tc.name AudioOutputDeviceManagement_Test_002
     * @tc.desc Start audioRenderer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AudioOutputDeviceManagement_Test_002', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'AudioOutputDeviceManagement_Test_002',
        'output_management_start',
        3000,
        'Succeeded in starting audio renderer.',
        done
      );
    });

    /**
     * @tc.number AudioOutputDeviceManagement_Test_003
     * @tc.name AudioOutputDeviceManagement_Test_003
     * @tc.desc Activate audio session
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AudioOutputDeviceManagement_Test_003', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'AudioOutputDeviceManagement_Test_003',
        'output_management_activateAudioSession',
        3000,
        'Succeeded in activating audio session.',
        done
      );
    });

    /**
     * @tc.number AudioOutputDeviceManagement_Test_004
     * @tc.name AudioOutputDeviceManagement_Test_004
     * @tc.desc Get devices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AudioOutputDeviceManagement_Test_004', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'AudioOutputDeviceManagement_Test_004',
        'output_management_getDevices',
        3000,
        'Succeeded in getting devices.',
        done
      );
    });

    /**
     * @tc.number AudioOutputDeviceManagement_Test_005
     * @tc.name AudioOutputDeviceManagement_Test_005
     * @tc.desc Register deviceChange
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AudioOutputDeviceManagement_Test_005', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'AudioOutputDeviceManagement_Test_005',
        'output_management_onDeviceChange',
        3000,
        'Register deviceChange success.',
        done
      );
    });

    /**
     * @tc.number AudioOutputDeviceManagement_Test_006
     * @tc.name AudioOutputDeviceManagement_Test_006
     * @tc.desc Get prefer output device for renderer info
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AudioOutputDeviceManagement_Test_006', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'AudioOutputDeviceManagement_Test_006',
        'output_management_getPreferOutputDeviceForRendererInfo',
        3000,
        'Succeeded in getting prefer output device for renderer info.',
        done
      );
    });

    /**
     * @tc.number AudioOutputDeviceManagement_Test_007
     * @tc.name AudioOutputDeviceManagement_Test_007
     * @tc.desc Register preferOutputDeviceChangeForRendererInfo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AudioOutputDeviceManagement_Test_007', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'AudioOutputDeviceManagement_Test_007',
        'output_management_onPreferOutputDeviceChangeForRendererInfo',
        3000,
        'Register preferOutputDeviceChangeForRendererInfo success.',
        done
      );
    });

    /**
     * @tc.number AudioOutputDeviceManagement_Test_008
     * @tc.name AudioOutputDeviceManagement_Test_008
     * @tc.desc Set default output device
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AudioOutputDeviceManagement_Test_008', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'AudioOutputDeviceManagement_Test_008',
        'output_management_setSpeakerOutput',
        3000,
        'Succeeded in setting default output device.',
        done
      );
    });

    /**
     * @tc.number AudioOutputDeviceManagement_Test_009
     * @tc.name AudioOutputDeviceManagement_Test_009
     * @tc.desc Set default output device
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AudioOutputDeviceManagement_Test_009', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'AudioOutputDeviceManagement_Test_009',
        'output_management_setEarpieceOutput',
        3000,
        'Succeeded in setting default output device.',
        done
      );
    });

    /**
     * @tc.number AudioOutputDeviceManagement_Test_010
     * @tc.name AudioOutputDeviceManagement_Test_010
     * @tc.desc Get default output device
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AudioOutputDeviceManagement_Test_010', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'AudioOutputDeviceManagement_Test_010',
        'output_management_getDefaultOutputDevice',
        3000,
        'Succeeded in getting default output device.',
        done
      );
    });

    /**
     * @tc.number AudioOutputDeviceManagement_Test_011
     * @tc.name AudioOutputDeviceManagement_Test_011
     * @tc.desc Register currentOutputDeviceChanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AudioOutputDeviceManagement_Test_011', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'AudioOutputDeviceManagement_Test_011',
        'output_management_onCurrentOutputDeviceChanged',
        3000,
        'Register currentOutputDeviceChanged success.',
        done
      );
    });

    /**
     * @tc.number AudioOutputDeviceManagement_Test_012
     * @tc.name AudioOutputDeviceManagement_Test_012
     * @tc.desc Stop audioRenderer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AudioOutputDeviceManagement_Test_012', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'AudioOutputDeviceManagement_Test_012',
        'output_management_stop',
        3000,
        'Succeeded in stopping audio renderer.',
        done
      );
    });

    /**
     * Back Index
     */
    it('AudioOutputDeviceManagementBack', 0, async (done: Function) => {
      let audioCapturerComponent = await driver.findComponent(ON.id('output_management_back'));
      if (audioCapturerComponent !== null) {
        await audioCapturerComponent.click();
      }
      await driver.delayMs(3000);
      done();
    });

    //------------------------------------------AudioOutputDeviceSwitcherTest-------------------------------------------

    /**
     * AudioOutputDeviceSwitcherTest
     */
    it('EnterAudioOutputDeviceSwitcherTest', 0, async (done: Function) => {
      let audioCapturerComponent = await driver.findComponent(ON.text('音频输出设备路由切换'));
      if (audioCapturerComponent !== null) {
        await audioCapturerComponent.click();
      }
      await driver.delayMs(3000);
      done();
    });

    /**
     * @tc.number AudioOutputDeviceSwitcher_Test_001
     * @tc.name AudioOutputDeviceSwitcher_Test_001
     * @tc.desc Init audioRenderer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AudioOutputDeviceSwitcher_Test_001', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'AudioOutputDeviceSwitcher_Test_001',
        'output_switcher_init',
        3000,
        'Succeeded in creating audio renderer.',
        done
      );
    });

    /**
     * @tc.number AudioOutputDeviceSwitcher_Test_002
     * @tc.name AudioOutputDeviceSwitcher_Test_002
     * @tc.desc Start audioRenderer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AudioOutputDeviceSwitcher_Test_002', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'AudioOutputDeviceSwitcher_Test_002',
        'output_switcher_start',
        3000,
        'Succeeded in starting audio renderer.',
        done
      );
    });

    /**
     * @tc.number AudioOutputDeviceSwitcher_Test_003
     * @tc.name AudioOutputDeviceSwitcher_Test_003
     * @tc.desc Activate audio session
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AudioOutputDeviceSwitcher_Test_003', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'AudioOutputDeviceSwitcher_Test_003',
        'output_switcher_activateAudioSession',
        3000,
        'Succeeded in activating audio session.',
        done
      );
    });

    /**
     * @tc.number AudioOutputDeviceSwitcher_Test_004
     * @tc.name AudioOutputDeviceSwitcher_Test_004
     * @tc.desc Set default output device
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AudioOutputDeviceSwitcher_Test_004', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'AudioOutputDeviceSwitcher_Test_004',
        'output_switcher_audioSessionSetSpeakerOutput',
        3000,
        'Succeeded in setting default output device.',
        done
      );
    });

    /**
     * @tc.number AudioOutputDeviceSwitcher_Test_005
     * @tc.name AudioOutputDeviceSwitcher_Test_005
     * @tc.desc Set default output device
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AudioOutputDeviceSwitcher_Test_005', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'AudioOutputDeviceSwitcher_Test_005',
        'output_switcher_audioSessionSetEarpieceOutput',
        3000,
        'Succeeded in setting default output device.',
        done
      );
    });

    /**
     * @tc.number AudioOutputDeviceSwitcher_Test_006
     * @tc.name AudioOutputDeviceSwitcher_Test_006
     * @tc.desc Set default output device
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AudioOutputDeviceSwitcher_Test_006', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'AudioOutputDeviceSwitcher_Test_006',
        'output_switcher_audioRendererSetSpeakerOutput',
        3000,
        'Succeeded in setting default output device.',
        done
      );
    });

    /**
     * @tc.number AudioOutputDeviceSwitcher_Test_007
     * @tc.name AudioOutputDeviceSwitcher_Test_007
     * @tc.desc Set default output device
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AudioOutputDeviceSwitcher_Test_007', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'AudioOutputDeviceSwitcher_Test_007',
        'output_switcher_audioRendererSetEarpieceOutput',
        3000,
        'Succeeded in setting default output device.',
        done
      );
    });

    /**
     * @tc.number AudioOutputDeviceSwitcher_Test_008
     * @tc.name AudioOutputDeviceSwitcher_Test_008
     * @tc.desc Stop audioRenderer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AudioOutputDeviceSwitcher_Test_008', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'AudioOutputDeviceSwitcher_Test_008',
        'output_switcher_stop',
        3000,
        'Succeeded in stopping audio renderer.',
        done
      );
    });

    /**
     * Back Index
     */
    it('AudioOutputDeviceSwitcherBack', 0, async (done: Function) => {
      let audioCapturerComponent = await driver.findComponent(ON.id('output_switcher_back'));
      if (audioCapturerComponent !== null) {
        await audioCapturerComponent.click();
      }
      await driver.delayMs(3000);
      done();
    });

    //------------------------------------------VolumeManagementTest---------------------------------------------

    /**
     * VolumeManagementTest
     */
    it('EnterVolumeManagementTest', 0, async (done: Function) => {
      let audioCapturerComponent = await driver.findComponent(ON.text('播放音量管理'));
      if (audioCapturerComponent !== null) {
        await audioCapturerComponent.click();
      }
      await driver.delayMs(3000);
      done();
    });

    /**
     * @tc.number VolumeManagement_Test_001
     * @tc.name VolumeManagement_Test_001
     * @tc.desc Init audioRenderer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('VolumeManagement_Test_001', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'VolumeManagement_Test_001',
        'volume_init',
        3000,
        'Succeeded in creating audio renderer.',
        done
      );
    });

    /**
     * @tc.number VolumeManagement_Test_002
     * @tc.name VolumeManagement_Test_002
     * @tc.desc Start audioRenderer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('VolumeManagement_Test_002', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'VolumeManagement_Test_002',
        'volume_start',
        3000,
        'Succeeded in starting audio renderer.',
        done
      );
    });

    /**
     * @tc.number VolumeManagement_Test_003
     * @tc.name VolumeManagement_Test_003
     * @tc.desc Get volume by stream
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('VolumeManagement_Test_003', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'VolumeManagement_Test_003',
        'volume_getVolumeByStream',
        3000,
        'Succeeded in getting volume by stream.',
        done
      );
    });

    /**
     * @tc.number VolumeManagement_Test_004
     * @tc.name VolumeManagement_Test_004
     * @tc.desc Get min volume by stream
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('VolumeManagement_Test_004', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'VolumeManagement_Test_004',
        'volume_getMinVolumeByStream',
        3000,
        'Succeeded in getting min volume by stream.',
        done
      );
    });

    /**
     * @tc.number VolumeManagement_Test_005
     * @tc.name VolumeManagement_Test_005
     * @tc.desc Get max volume by stream
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('VolumeManagement_Test_005', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'VolumeManagement_Test_005',
        'volume_getMaxVolumeByStream',
        3000,
        'Succeeded in getting max volume by stream.',
        done
      );
    });

    /**
     * @tc.number VolumeManagement_Test_006
     * @tc.name VolumeManagement_Test_006
     * @tc.desc Register streamVolumeChange
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('VolumeManagement_Test_006', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'VolumeManagement_Test_006',
        'volume_onStreamVolumeChange',
        3000,
        'Register streamVolumeChange success.',
        done
      );
    });

    /**
     * @tc.number VolumeManagement_Test_007
     * @tc.name VolumeManagement_Test_007
     * @tc.desc Register appVolumeChange
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('VolumeManagement_Test_007', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'VolumeManagement_Test_007',
        'volume_onAppVolumeChange',
        3000,
        'Register appVolumeChange success.',
        done
      );
    });

    /**
     * @tc.number VolumeManagement_Test_008
     * @tc.name VolumeManagement_Test_008
     * @tc.desc Get app volume percentage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('VolumeManagement_Test_008', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'VolumeManagement_Test_008',
        'volume_getAppVolumePercentage',
        3000,
        'Succeeded in getting app volume percentage.',
        done
      );
    });

    /**
     * @tc.number VolumeManagement_Test_009
     * @tc.name VolumeManagement_Test_009
     * @tc.desc Set app volume percentage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('VolumeManagement_Test_009', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'VolumeManagement_Test_009',
        'volume_setAppVolumePercentage',
        3000,
        'Succeeded in setting app volume percentage.',
        done
      );
    });

    /**
     * @tc.number VolumeManagement_Test_010
     * @tc.name VolumeManagement_Test_010
     * @tc.desc Get volume
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('VolumeManagement_Test_010', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'VolumeManagement_Test_010',
        'volume_getVolume',
        3000,
        'Succeeded in getting volume.',
        done
      );
    });

    /**
     * @tc.number VolumeManagement_Test_011
     * @tc.name VolumeManagement_Test_011
     * @tc.desc Set volume
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('VolumeManagement_Test_011', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'VolumeManagement_Test_011',
        'volume_setVolume',
        3000,
        'Succeeded in setting volume.',
        done
      );
    });

    /**
     * @tc.number VolumeManagement_Test_012
     * @tc.name VolumeManagement_Test_012
     * @tc.desc Stop audioRenderer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('VolumeManagement_Test_012', Level.LEVEL1, async (done: Function) => {
      await runTest(
        'VolumeManagement_Test_012',
        'volume_stop',
        3000,
        'Succeeded in stopping audio renderer.',
        done
      );
    });
  })
}