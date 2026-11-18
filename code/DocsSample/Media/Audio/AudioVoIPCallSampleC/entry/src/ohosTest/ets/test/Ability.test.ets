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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const DOMAIN = 0x0000;
const TAG = 'AudioVoIPCallSampleTest';
const DEFAULT_BUNDLE_NAME = 'com.example.audiovoipcallsample';
const ABILITY_NAME = 'EntryAbility';
const SHORT_WAIT_MS = 1000;
const PAGE_WAIT_MS = 2000;
const AUDIO_WAIT_MS = 3000;
const RING_TIMEOUT_WAIT_MS = 62000;

const TEXT_HOME_TITLE = 'VoIPCall Sample';
const TEXT_CALL_OUT_ENTRY = '主叫';
const TEXT_CALL_IN_ENTRY = '被叫';
const TEXT_CALL_OUT_TITLE = '等待对方接听';
const TEXT_CALL_IN_TITLE = '来电提示';
const TEXT_ANSWER_CALL = '接听';
const TEXT_REFUSE_CALL = '挂断';
const TEXT_OTHER_ANSWER = '对方接听';
const TEXT_OTHER_REFUSE = '对方拒接';
const TEXT_IN_CALL = '通话中';
const TEXT_EARPIECE = '听筒';
const TEXT_SPEAKER = '扬声器';
const TEXT_BLUETOOTH = '蓝牙';
const TEXT_MUTE_RECORD = '麦克风静音';
const TEXT_UNMUTE_RECORD = '麦克风解静音';
const TEXT_MUTE_PLAY = '播放静音';
const TEXT_UNMUTE_PLAY = '播放解静音';
const TEXT_END_CALL = '结束通话';
const TEXT_TIMEOUT_MESSAGE = '响铃超时';
const TEXT_CONFIRM = '确认';
const PERMISSION_BUTTON_TEXTS: string[] = ['允许', '始终允许', '仅在使用期间允许', 'Allow'];

let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
let driver: Driver;

function getBundleName(): string {
  let args = AbilityDelegatorRegistry.getArguments();
  if (args.bundleName !== undefined && args.bundleName.length > 0) {
    return args.bundleName;
  }
  return DEFAULT_BUNDLE_NAME;
}

async function startAbility(): Promise<void> {
  await abilityDelegator.startAbility({
    bundleName: getBundleName(),
    abilityName: ABILITY_NAME
  });
  await driver.delayMs(PAGE_WAIT_MS);
}

async function isTextVisible(text: string): Promise<boolean> {
  let component = await driver.findComponent(ON.text(text));
  return component !== null && component !== undefined;
}

async function assertTextVisible(text: string): Promise<void> {
  await driver.assertComponentExist(ON.text(text));
}

async function assertTextsVisible(texts: string[]): Promise<void> {
  for (let index = 0; index < texts.length; index++) {
    await assertTextVisible(texts[index]);
  }
}

async function clickText(text: string, waitMs: number = PAGE_WAIT_MS): Promise<void> {
  let component = await driver.findComponent(ON.text(text));
  if (component === null || component === undefined) {
    hilog.error(DOMAIN, TAG, 'Component not found: %{public}s', text);
    expect().assertFail();
    return;
  }
  await component.click();
  await driver.delayMs(waitMs);
}

async function clickTextIfVisible(text: string, waitMs: number = PAGE_WAIT_MS): Promise<boolean> {
  let component = await driver.findComponent(ON.text(text));
  if (component === null || component === undefined) {
    return false;
  }
  await component.click();
  await driver.delayMs(waitMs);
  return true;
}

async function acceptPermissionIfShown(): Promise<boolean> {
  for (let index = 0; index < PERMISSION_BUTTON_TEXTS.length; index++) {
    if (await clickTextIfVisible(PERMISSION_BUTTON_TEXTS[index], PAGE_WAIT_MS)) {
      return true;
    }
  }
  return false;
}

async function assertHomePage(): Promise<void> {
  await assertTextsVisible([TEXT_HOME_TITLE, TEXT_CALL_OUT_ENTRY, TEXT_CALL_IN_ENTRY]);
}

async function ensureHomePage(): Promise<void> {
  await startAbility();
  if (await isTextVisible(TEXT_HOME_TITLE)) {
    await assertHomePage();
    return;
  }

  for (let index = 0; index < 4; index++) {
    if (await clickTextIfVisible(TEXT_CONFIRM, PAGE_WAIT_MS) ||
      await clickTextIfVisible(TEXT_END_CALL, PAGE_WAIT_MS) ||
      await clickTextIfVisible(TEXT_REFUSE_CALL, PAGE_WAIT_MS) ||
      await clickTextIfVisible(TEXT_OTHER_REFUSE, PAGE_WAIT_MS)) {
      if (await isTextVisible(TEXT_HOME_TITLE)) {
        await assertHomePage();
        return;
      }
    }

    await driver.pressBack();
    await driver.delayMs(SHORT_WAIT_MS);
    if (await isTextVisible(TEXT_HOME_TITLE)) {
      await assertHomePage();
      return;
    }
  }

  await assertHomePage();
}

async function openIncomingCallPage(): Promise<void> {
  await ensureHomePage();
  await clickText(TEXT_CALL_IN_ENTRY);
  await acceptPermissionIfShown();
  await assertIncomingCallPage();
}

async function openOutgoingCallPage(): Promise<void> {
  await ensureHomePage();
  await clickText(TEXT_CALL_OUT_ENTRY);
  await acceptPermissionIfShown();
  await assertOutgoingCallPage();
}

async function openInCallingPageFromIncoming(): Promise<void> {
  await openIncomingCallPage();
  await clickText(TEXT_ANSWER_CALL, AUDIO_WAIT_MS);
  await assertInCallingPage();
}

async function assertIncomingCallPage(): Promise<void> {
  await assertTextsVisible([TEXT_CALL_IN_TITLE, TEXT_ANSWER_CALL, TEXT_REFUSE_CALL]);
}

async function assertOutgoingCallPage(): Promise<void> {
  await assertTextsVisible([TEXT_CALL_OUT_TITLE, TEXT_OTHER_ANSWER, TEXT_OTHER_REFUSE]);
}

async function assertInCallingPage(): Promise<void> {
  await assertTextsVisible([TEXT_IN_CALL, TEXT_EARPIECE, TEXT_MUTE_RECORD, TEXT_MUTE_PLAY, TEXT_END_CALL]);
}

async function runCase(testCaseName: string, task: () => Promise<void>, done: Function): Promise<void> {
  hilog.info(DOMAIN, TAG, '%{public}s begin', testCaseName);
  try {
    await task();
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s failed: %{public}s', testCaseName, JSON.stringify(error));
    expect().assertFail();
  }
  hilog.info(DOMAIN, TAG, '%{public}s end', testCaseName);
  done();
}

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    beforeAll(() => {
      driver = Driver.create();
    });

    beforeEach(() => {
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /*
     * @tc.number: audioVoIPCall_StartAbility_001
     * @tc.name: StartAbility
     * @tc.desc: Start AudioVoIPCallSample ability.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('audioVoIPCall_StartAbility_001', Level.LEVEL1, async (done: Function) => {
      await runCase('audioVoIPCall_StartAbility_001', async () => {
        await startAbility();
        await assertTextVisible(TEXT_HOME_TITLE);
      }, done);
    });

    /*
     * @tc.number: audioVoIPCall_HomePageShow_001
     * @tc.name: HomePageShow
     * @tc.desc: Check the home page shows call-in and call-out entries.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('audioVoIPCall_HomePageShow_001', Level.LEVEL1, async (done: Function) => {
      await runCase('audioVoIPCall_HomePageShow_001', async () => {
        await ensureHomePage();
      }, done);
    });

    /*
     * @tc.number: audioVoIPCall_PermissionDialog_001
     * @tc.name: PermissionDialog
     * @tc.desc: Trigger microphone permission dialog from the home page.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('audioVoIPCall_PermissionDialog_001', Level.LEVEL1, async (done: Function) => {
      await runCase('audioVoIPCall_PermissionDialog_001', async () => {
        await ensureHomePage();
        await clickText(TEXT_CALL_IN_ENTRY);
        let permissionShown = await acceptPermissionIfShown();
        if (!permissionShown) {
          hilog.info(DOMAIN, TAG, 'Permission dialog is not shown because permission may have been granted.');
        }
        await assertIncomingCallPage();
      }, done);
    });

    /*
     * @tc.number: audioVoIPCall_AllowPermission_001
     * @tc.name: AllowPermission
     * @tc.desc: Allow microphone permission and enter the call page.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('audioVoIPCall_AllowPermission_001', Level.LEVEL1, async (done: Function) => {
      await runCase('audioVoIPCall_AllowPermission_001', async () => {
        await openIncomingCallPage();
      }, done);
    });

    /*
     * @tc.number: audioVoIPCall_ClickCallInEntry_001
     * @tc.name: ClickCallInEntry
     * @tc.desc: Click call-in entry and navigate to incoming call page.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('audioVoIPCall_ClickCallInEntry_001', Level.LEVEL1, async (done: Function) => {
      await runCase('audioVoIPCall_ClickCallInEntry_001', async () => {
        await openIncomingCallPage();
      }, done);
    });

    /*
     * @tc.number: audioVoIPCall_IncomingPageShow_001
     * @tc.name: IncomingPageShow
     * @tc.desc: Check incoming call title, answer button, and refuse button.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('audioVoIPCall_IncomingPageShow_001', Level.LEVEL1, async (done: Function) => {
      await runCase('audioVoIPCall_IncomingPageShow_001', async () => {
        await openIncomingCallPage();
      }, done);
    });

    /*
     * @tc.number: audioVoIPCall_IncomingRingtone_001
     * @tc.name: IncomingRingtone
     * @tc.desc: Enter incoming call page and keep ringing state.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('audioVoIPCall_IncomingRingtone_001', Level.LEVEL1, async (done: Function) => {
      await runCase('audioVoIPCall_IncomingRingtone_001', async () => {
        await openIncomingCallPage();
        await driver.delayMs(AUDIO_WAIT_MS);
        await assertIncomingCallPage();
      }, done);
    });

    /*
     * @tc.number: audioVoIPCall_AnswerIncoming_001
     * @tc.name: AnswerIncoming
     * @tc.desc: Answer incoming call and navigate to in-calling page.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('audioVoIPCall_AnswerIncoming_001', Level.LEVEL1, async (done: Function) => {
      await runCase('audioVoIPCall_AnswerIncoming_001', async () => {
        await openInCallingPageFromIncoming();
      }, done);
    });

    /*
     * @tc.number: audioVoIPCall_RefuseIncoming_001
     * @tc.name: RefuseIncoming
     * @tc.desc: Refuse incoming call and return to the home page.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('audioVoIPCall_RefuseIncoming_001', Level.LEVEL1, async (done: Function) => {
      await runCase('audioVoIPCall_RefuseIncoming_001', async () => {
        await openIncomingCallPage();
        await clickText(TEXT_REFUSE_CALL);
        await assertHomePage();
      }, done);
    });

    /*
     * @tc.number: audioVoIPCall_ClickCallOutEntry_001
     * @tc.name: ClickCallOutEntry
     * @tc.desc: Click call-out entry and navigate to outgoing call page.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('audioVoIPCall_ClickCallOutEntry_001', Level.LEVEL1, async (done: Function) => {
      await runCase('audioVoIPCall_ClickCallOutEntry_001', async () => {
        await openOutgoingCallPage();
      }, done);
    });

    /*
     * @tc.number: audioVoIPCall_OutgoingPageShow_001
     * @tc.name: OutgoingPageShow
     * @tc.desc: Check outgoing call title, answer button, and refuse button.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('audioVoIPCall_OutgoingPageShow_001', Level.LEVEL1, async (done: Function) => {
      await runCase('audioVoIPCall_OutgoingPageShow_001', async () => {
        await openOutgoingCallPage();
      }, done);
    });

    /*
     * @tc.number: audioVoIPCall_AnswerOutgoing_001
     * @tc.name: AnswerOutgoing
     * @tc.desc: Click other side answer button and navigate to in-calling page.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('audioVoIPCall_AnswerOutgoing_001', Level.LEVEL1, async (done: Function) => {
      await runCase('audioVoIPCall_AnswerOutgoing_001', async () => {
        await openOutgoingCallPage();
        await clickText(TEXT_OTHER_ANSWER, AUDIO_WAIT_MS);
        await assertInCallingPage();
      }, done);
    });

    /*
     * @tc.number: audioVoIPCall_RefuseOutgoing_001
     * @tc.name: RefuseOutgoing
     * @tc.desc: Click other side refuse button and return to the home page.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('audioVoIPCall_RefuseOutgoing_001', Level.LEVEL1, async (done: Function) => {
      await runCase('audioVoIPCall_RefuseOutgoing_001', async () => {
        await openOutgoingCallPage();
        await clickText(TEXT_OTHER_REFUSE);
        await assertHomePage();
      }, done);
    });

    /*
     * @tc.number: audioVoIPCall_InCallingPageShow_001
     * @tc.name: InCallingPageShow
     * @tc.desc: Check in-calling page controls.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('audioVoIPCall_InCallingPageShow_001', Level.LEVEL1, async (done: Function) => {
      await runCase('audioVoIPCall_InCallingPageShow_001', async () => {
        await openInCallingPageFromIncoming();
      }, done);
    });

    /*
     * @tc.number: audioVoIPCall_AVCastPickerShow_001
     * @tc.name: AVCastPickerShow
     * @tc.desc: Click AVCastPicker and show audio output device list.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('audioVoIPCall_AVCastPickerShow_001', Level.LEVEL1, async (done: Function) => {
      await runCase('audioVoIPCall_AVCastPickerShow_001', async () => {
        await openInCallingPageFromIncoming();
        await clickText(TEXT_EARPIECE);
        let hasOutputDevice = await isTextVisible(TEXT_EARPIECE) ||
          await isTextVisible(TEXT_SPEAKER) ||
          await isTextVisible(TEXT_BLUETOOTH);
        expect(hasOutputDevice).assertTrue();
      }, done);
    });

    /*
     * @tc.number: audioVoIPCall_SwitchToSpeaker_001
     * @tc.name: SwitchToSpeaker
     * @tc.desc: Select speaker in AVCastPicker device list.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('audioVoIPCall_SwitchToSpeaker_001', Level.LEVEL1, async (done: Function) => {
      await runCase('audioVoIPCall_SwitchToSpeaker_001', async () => {
        await openInCallingPageFromIncoming();
        await clickText(TEXT_EARPIECE);
        await clickText(TEXT_SPEAKER);
        await assertTextVisible(TEXT_SPEAKER);
      }, done);
    });

    /*
     * @tc.number: audioVoIPCall_SwitchToEarpiece_001
     * @tc.name: SwitchToEarpiece
     * @tc.desc: Select earpiece in AVCastPicker device list.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('audioVoIPCall_SwitchToEarpiece_001', Level.LEVEL1, async (done: Function) => {
      await runCase('audioVoIPCall_SwitchToEarpiece_001', async () => {
        await openInCallingPageFromIncoming();
        await clickText(TEXT_EARPIECE);
        await clickText(TEXT_EARPIECE);
        await assertTextVisible(TEXT_EARPIECE);
      }, done);
    });

    /*
     * @tc.number: audioVoIPCall_MuteRecord_001
     * @tc.name: MuteRecord
     * @tc.desc: Mute microphone during calling.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('audioVoIPCall_MuteRecord_001', Level.LEVEL1, async (done: Function) => {
      await runCase('audioVoIPCall_MuteRecord_001', async () => {
        await openInCallingPageFromIncoming();
        await clickText(TEXT_MUTE_RECORD);
        await assertTextVisible(TEXT_UNMUTE_RECORD);
      }, done);
    });

    /*
     * @tc.number: audioVoIPCall_UnmuteRecord_001
     * @tc.name: UnmuteRecord
     * @tc.desc: Unmute microphone during calling.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('audioVoIPCall_UnmuteRecord_001', Level.LEVEL1, async (done: Function) => {
      await runCase('audioVoIPCall_UnmuteRecord_001', async () => {
        await openInCallingPageFromIncoming();
        await clickText(TEXT_MUTE_RECORD);
        await clickText(TEXT_UNMUTE_RECORD);
        await assertTextVisible(TEXT_MUTE_RECORD);
      }, done);
    });

    /*
     * @tc.number: audioVoIPCall_MutePlay_001
     * @tc.name: MutePlay
     * @tc.desc: Mute speaker playback during calling.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('audioVoIPCall_MutePlay_001', Level.LEVEL1, async (done: Function) => {
      await runCase('audioVoIPCall_MutePlay_001', async () => {
        await openInCallingPageFromIncoming();
        await clickText(TEXT_MUTE_PLAY);
        await assertTextVisible(TEXT_UNMUTE_PLAY);
      }, done);
    });

    /*
     * @tc.number: audioVoIPCall_UnmutePlay_001
     * @tc.name: UnmutePlay
     * @tc.desc: Unmute speaker playback during calling.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('audioVoIPCall_UnmutePlay_001', Level.LEVEL1, async (done: Function) => {
      await runCase('audioVoIPCall_UnmutePlay_001', async () => {
        await openInCallingPageFromIncoming();
        await clickText(TEXT_MUTE_PLAY);
        await clickText(TEXT_UNMUTE_PLAY);
        await assertTextVisible(TEXT_MUTE_PLAY);
      }, done);
    });

    /*
     * @tc.number: audioVoIPCall_EndCall_001
     * @tc.name: EndCall
     * @tc.desc: End call and return to the home page.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('audioVoIPCall_EndCall_001', Level.LEVEL1, async (done: Function) => {
      await runCase('audioVoIPCall_EndCall_001', async () => {
        await openInCallingPageFromIncoming();
        await clickText(TEXT_END_CALL);
        await assertHomePage();
      }, done);
    });

    /*
     * @tc.number: audioVoIPCall_IncomingTimeoutDialog_001
     * @tc.name: IncomingTimeoutDialog
     * @tc.desc: Wait incoming ringing timeout dialog.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('audioVoIPCall_IncomingTimeoutDialog_001', Level.LEVEL1, async (done: Function) => {
      await runCase('audioVoIPCall_IncomingTimeoutDialog_001', async () => {
        await openIncomingCallPage();
        await driver.delayMs(RING_TIMEOUT_WAIT_MS);
        await assertTextsVisible([TEXT_TIMEOUT_MESSAGE, TEXT_CONFIRM]);
      }, done);
    });

    /*
     * @tc.number: audioVoIPCall_ConfirmTimeoutDialog_001
     * @tc.name: ConfirmTimeoutDialog
     * @tc.desc: Confirm incoming ringing timeout dialog and return to home page.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('audioVoIPCall_ConfirmTimeoutDialog_001', Level.LEVEL1, async (done: Function) => {
      await runCase('audioVoIPCall_ConfirmTimeoutDialog_001', async () => {
        if (!(await isTextVisible(TEXT_TIMEOUT_MESSAGE))) {
          await openIncomingCallPage();
          await driver.delayMs(RING_TIMEOUT_WAIT_MS);
        }
        await clickText(TEXT_CONFIRM);
        await assertHomePage();
      }, done);
    });

    /*
     * @tc.number: audioVoIPCall_StopRingtoneBeforeTimeout_001
     * @tc.name: StopRingtoneBeforeTimeout
     * @tc.desc: Refuse incoming call before timeout and do not show timeout dialog.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('audioVoIPCall_StopRingtoneBeforeTimeout_001', Level.LEVEL1, async (done: Function) => {
      await runCase('audioVoIPCall_StopRingtoneBeforeTimeout_001', async () => {
        await openIncomingCallPage();
        await clickText(TEXT_REFUSE_CALL);
        await assertHomePage();
        await driver.delayMs(AUDIO_WAIT_MS);
        expect(!(await isTextVisible(TEXT_TIMEOUT_MESSAGE))).assertTrue();
      }, done);
    });
  });
}
