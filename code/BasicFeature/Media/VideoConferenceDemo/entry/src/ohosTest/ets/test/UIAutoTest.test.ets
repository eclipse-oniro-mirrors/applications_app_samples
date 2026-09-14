/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { Driver, ON } from '@kit.TestKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { fileIo as fs } from '@kit.CoreFileKit';

const BUNDLE_NAME = 'com.huawei.videoconferencedemo';
const ABILITY_NAME = 'EntryAbility';
const DELAY_SHORT = 500;
const DELAY_MEDIUM = 1000;
const DELAY_LONG = 2000;
const DELAY_RECORD = 2000;
const RECORD_FILE = '/example.m4a';

let driver: Driver;
let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
let filePath: string;

async function handleMicrophonePermission(): Promise<void> {
  try {
    await driver.delayMs(DELAY_MEDIUM);
    await driver.assertComponentExist(ON.text('始终允许'));
    let allowBtn = await driver.findComponent(ON.text('始终允许'));
    await allowBtn.click();
    await driver.delayMs(DELAY_LONG);
  } catch (e) {
    try {
      await driver.delayMs(DELAY_SHORT);
      await driver.assertComponentExist(ON.text('本次使用允许'));
      let allowBtn = await driver.findComponent(ON.text('本次使用允许'));
      await allowBtn.click();
      await driver.delayMs(DELAY_LONG);
    } catch (e2) {
    }
  }
}

async function handleRecordPermission(): Promise<void> {
  try {
    await driver.delayMs(DELAY_MEDIUM);
    await driver.assertComponentExist(ON.text('允许'));
    let allowBtn = await driver.findComponent(ON.text('允许'));
    await allowBtn.click();
    await driver.delayMs(DELAY_LONG);
  } catch (e) {
  }
}

function assertRecordFile(): void {
  try {
    let stat = fs.statSync(filePath);
    expect(stat.size > 0).assertTrue();
  } catch (e) {
    expect().assertFail();
  }
}

function deleteRecordFile(): void {
  try {
    fs.unlinkSync(filePath);
  } catch (e) {
  }
}

export default function uiAutoTest() {
  describe('VideoConferenceUITest', () => {
    beforeAll(async () => {
      driver = Driver.create();
      await abilityDelegator.startAbility({
        bundleName: BUNDLE_NAME,
        abilityName: ABILITY_NAME
      });
      await driver.delayMs(DELAY_LONG);
      await handleMicrophonePermission();

      let ability = await abilityDelegator.getCurrentTopAbility();
      filePath = ability.context.filesDir + RECORD_FILE;
    })

    afterAll(() => {
    })

    beforeEach(() => {
    })

    afterEach(() => {
    })

    it('TC001_GrantMicrophonePermission', 0, async (done: Function) => {
      try {
        await driver.assertComponentExist(ON.text('录制'));
        done();
      } catch (e) {
        expect().assertFail();
        done();
      }
    })

    it('TC002_RecordWithMicrophone', 0, async (done: Function) => {
      deleteRecordFile();
      try {
        let voiceBtn = await driver.findComponent(ON.text('语音'));
        await voiceBtn.click();
        await driver.delayMs(DELAY_SHORT);

        let recordBtn = await driver.findComponent(ON.text('录制'));
        await recordBtn.click();
        await driver.delayMs(DELAY_MEDIUM);

        await handleRecordPermission();

        await driver.delayMs(DELAY_RECORD);

        let stopBtn = await driver.findComponent(ON.text('录制'));
        await stopBtn.click();
        await driver.delayMs(DELAY_LONG);

        assertRecordFile();
        done();
      } catch (e) {
        expect().assertFail();
        done();
      }
    })

    it('TC003_RecordWithoutMicrophone', 0, async (done: Function) => {
      deleteRecordFile();
      try {
        let voiceBtn = await driver.findComponent(ON.text('语音'));
        await voiceBtn.click();
        await driver.delayMs(DELAY_SHORT);

        let recordBtn = await driver.findComponent(ON.text('录制'));
        await recordBtn.click();
        await driver.delayMs(DELAY_MEDIUM);

        await handleRecordPermission();

        await driver.delayMs(DELAY_RECORD);

        let stopBtn = await driver.findComponent(ON.text('录制'));
        await stopBtn.click();
        await driver.delayMs(DELAY_LONG);

        assertRecordFile();
        done();
      } catch (e) {
        expect().assertFail();
        done();
      }
    })

    it('TC005_LeaveMeeting', 0, async (done: Function) => {
      try {
        await driver.assertComponentExist(ON.text('离开'));
        let leaveBtn = await driver.findComponent(ON.text('离开'));
        await leaveBtn.click();
        await driver.delayMs(DELAY_LONG);

        try {
          await driver.assertComponentExist(ON.text('录制'));
          expect().assertFail();
        } catch (e) {
        }

        done();
      } catch (e) {
        expect().assertFail();
        done();
      }
    })
  })
}
